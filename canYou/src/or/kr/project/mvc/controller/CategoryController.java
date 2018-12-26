package or.kr.project.mvc.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import or.kr.project.dto.PageVO;
import or.kr.project.dto.ProjectVO;
import or.kr.project.dto.SearchVO;
import or.kr.project.dto.SubCategoryVO;
import or.kr.project.mvc.dao.ProjectDaoImple;

@Controller
public class CategoryController {
	@Autowired
	private ProjectDaoImple dao;
	
	@RequestMapping(value="/subcaname")
	public ResponseEntity<List<SubCategoryVO>> subcaname(int categoryNo) {
		List<SubCategoryVO> l=dao.subcasel(categoryNo);
		
		return new ResponseEntity<>(l, HttpStatus.OK);
	}
	
	//ī�װ��� ������Ʈ ����(����)
	@RequestMapping(value="/categoryproject2")
	public String categoryProject(Model m,@RequestParam("categoryNo")String categoryNo,
			@RequestParam("subcategoryNo")String subcategoryNo,
			Integer page, SearchVO svo,Principal principal) {
		
		SubCategoryVO vo=new SubCategoryVO();
		
		vo.setCategoryNo(Integer.parseInt(categoryNo));
		vo.setSubcategoryNo(Integer.parseInt(subcategoryNo));
		
		//ī�װ� �� ������
		String categoryName = dao.categoryName(Integer.parseInt(categoryNo));
		m.addAttribute("categoryName", categoryName);
		
		//����ī�װ� �� ������
		String subCategoryName = dao.subCategoryName(Integer.parseInt(subcategoryNo));
		m.addAttribute("subCategoryName", subCategoryName);
		
		// pageVO�� ȹ��
		int totalRows = dao.getCategoryCount2(vo);
		PageVO pageInfo = makePageVO(page, totalRows);
		  
		// ������ ������ ����
		svo.setBegin(String.valueOf(pageInfo.getStartRow()));
		svo.setEnd(String.valueOf(pageInfo.getEndRow()));
		
		List<String> dateList = new ArrayList<String>(); //���� ��¥ ����Ʈ
		
		//���� ī�װ����� ����
		Map<String, String> categoryList = new HashMap<>(); 
		categoryList.put("categoryNo", categoryNo);
		categoryList.put("subcategoryNo", subcategoryNo);
		categoryList.put("begin", String.valueOf(pageInfo.getStartRow()));
		categoryList.put("end", String.valueOf(pageInfo.getEndRow()));
		m.addAttribute("categoryNo", categoryNo);
		
		List<ProjectVO> list = dao.lookCategoryProject2(categoryList); //����Ʈ ����	
		m.addAttribute("list", list);
		m.addAttribute("pageInfo", pageInfo); // pageInfo ����		

		System.out.println("categoryNo : " +categoryNo);
		System.out.println("list size2 : "+list.size());

		if (principal != null) {
			m.addAttribute("principal", principal.getName());
		}
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		
		//���� ��¥ ����ؼ� list�� �־� ��
		for(ProjectVO pvo : list) {
			String sys = format.format(new Date()); //���� ��¥
			
			int idx = pvo.getProjectEndDate().indexOf(" "); 
			String end = pvo.getProjectEndDate().substring(0,idx); //������ ��¥

			Date endDate = null;
			Date sysdate = null;
			long diffDays = 0;
			
			try {
				//��¥ ����� ���� Date������ ��ȯ
				endDate = format.parse(end);
				sysdate = format.parse(sys);
				
				// �ð����̸� �ð�,��,�ʸ� ���� ������ ������ �Ϸ� ������ ����
		        long diff = endDate.getTime() - sysdate.getTime();
		        diffDays = diff / (24 * 60 * 60 * 1000);
		 
		        System.out.println("��¥����=" + diffDays);
		        
		        //dateList.add(diffDays);
			} catch (ParseException e) {
				e.printStackTrace();
			}

			dateList.add(Integer.toString((int) diffDays)); //����Ʈ�� ��¥ ���̸� ����
			
		}
		m.addAttribute("dateList", dateList);
		
		return "categoryproject";
	}
	
	// makePageVO �޼ҵ�(�������� ������ִ� �޼ҵ�)
			public PageVO makePageVO(Integer page, int totalRows) {
				  
				  PageVO pageInfo = new PageVO();
				  int rowsPerPage = 9; // ���������� ������ ��ϼ� - properties
				  int pagesPerBlock = 5; // �� ��ϴ� ������ ������ �� - properties
				  if (page == null) page = 0;
				  if(page  == 0) page = 1; //������ �ʱ�ȭ
				  int currentPage = page; // ���� ������ ��
				  int currentBlock = 0; // ���� ��� �ʱ�ȭ
				  if (currentPage % pagesPerBlock == 0) { // ���� ��� �ʱⰪ
				   currentBlock = currentPage / pagesPerBlock;
				  } else { // ���� ����̳�
				   currentBlock = currentPage / pagesPerBlock + 1;
				  }
				  int startRow = (currentPage - 1) * rowsPerPage + 1; // ���۸�ϰ�����
				  int endRow = currentPage * rowsPerPage;// ������ ��ϰ� ����

				  
				  // ��ü ������ ��
				  
				  System.out.println("totalRows:" + totalRows);
				  // ��ü ������ ���ϴ� ����
				  int totalPages = 0;
				  if (totalRows % rowsPerPage == 0) {
				   totalPages = totalRows / rowsPerPage;
				  } else {
				   totalPages = totalRows / rowsPerPage + 1;
				  }
				  // ��ü ��ϰ��� ���ϴ� ����
				  int totalBlocks = 0;
				  if (totalPages % pagesPerBlock == 0) {
				   totalBlocks = totalPages / pagesPerBlock;
				  } else {
				   totalBlocks = totalPages / pagesPerBlock + 1;
				  }
				  // ��� ����������� PageVO�� �����Ѵ�.
				  pageInfo.setCurrentPage(currentPage);
				  pageInfo.setCurrentBlock(currentBlock);
				  pageInfo.setRowsPerPage(rowsPerPage);
				  pageInfo.setPagesPerBlock(pagesPerBlock);
				  pageInfo.setStartRow(startRow);
				  pageInfo.setEndRow(endRow);
				  pageInfo.setTotalRows(totalRows);
				  pageInfo.setTotalPages(totalPages);
				  pageInfo.setTotalBlocks(totalBlocks);
				  
				  return pageInfo;
		}
}
