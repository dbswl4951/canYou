package or.kr.project.mvc.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import or.kr.project.dto.DeniedVO;
import or.kr.project.dto.MemberVO;
import or.kr.project.dto.PageVO;
import or.kr.project.dto.ProductVO;
import or.kr.project.dto.ProjectVO;
import or.kr.project.dto.SearchVO;
import or.kr.project.mvc.dao.AdminDaoImple;
import or.kr.project.mvc.dao.ProjectDaoImple;

@Controller
public class AdminController {
	@Autowired
	private AdminDaoImple dao;

	@Autowired
	private ProjectDaoImple dao2;

	@RequestMapping(value = "/admin")
	public String amain() {
		return "amain";
	}

	// �������� ��Ȳ ����Ʈ
	@RequestMapping(value = "/admin.daegi")
	public ModelAndView daegi(Integer page, SearchVO vo, Principal principal) {
		// pageVO�� ȹ��vo
		int totalRows = dao.wproselCount(vo);
		PageVO pageInfo = makePageVO(page, totalRows);

		// ������ ������ ����
		vo.setBegin(String.valueOf(pageInfo.getStartRow()));
		vo.setEnd(String.valueOf(pageInfo.getEndRow()));

		System.out.println("day" + vo.getDay());
		ModelAndView m = new ModelAndView();
		m.setViewName("daegi");

		List<HashMap> list = dao.wprosel(vo);
		m.addObject("pageInfo", pageInfo);
		m.addObject("list", list);
		m.addObject("day", vo.getDay());

		if (principal != null)
			m.addObject("principal", principal.getName());

		return m;
	}

	@GetMapping("/admin.wstory")
	public String listView(Model m, String projectNo, HttpServletRequest req) {
		// project ������ ���� ������
		ProjectVO list = dao2.projectlist(projectNo);
		String c = dao2.caselone(list.getCategoryNo());
		String sc = dao2.subcaselone(list.getSubCategoryNo());
		m.addAttribute("list", list);
		m.addAttribute("c", c);
		m.addAttribute("sc", sc);
		// project�� ����� member ���� ��������
		MemberVO mem = dao2.memname2(list.getMemberNo());
		m.addAttribute("member", mem);

		return "storypage2";
	}

	@RequestMapping(value = "/admin.wproductDetail")
	public String getProductDetail(Model m, HttpServletRequest req, String projectNo) {
		// project ������ ���� ������
		ProjectVO list = dao2.projectlist(projectNo);
		String c = dao2.caselone(list.getCategoryNo());
		String sc = dao2.subcaselone(list.getSubCategoryNo());
		m.addAttribute("list", list);
		m.addAttribute("c", c);
		m.addAttribute("sc", sc);
		// project�� ����� member ���� ��������
		MemberVO mem = dao2.memname2(list.getMemberNo());
		m.addAttribute("member", mem);

		// project�� ����� product ��������
		List<ProductVO> list2 = dao2.prodsel(projectNo);
		m.addAttribute("prodlist", list2);

		return "wproductdetailpage";
	}

	@RequestMapping(value = "/admin.ok")
	public String ok(ProjectVO vo) {

		System.out.println(vo.getProjectStep());
		dao.ok(vo);

		return "redirect:admin.daegi";
	}

	@RequestMapping(value = "/admin.denied")
	public String prodenied(DeniedVO vo) {

		dao.denied(vo);

		return "redirect:admin.daegi";
	}

	// makePageVO �޼ҵ�(�������� ������ִ� �޼ҵ�)
	public PageVO makePageVO(Integer page, int totalRows) {

		PageVO pageInfo = new PageVO();
		int rowsPerPage = 3; // ���������� ������ ��ϼ� - properties
		int pagesPerBlock = 5; // �� ��ϴ� ������ ������ �� - properties
		if (page == null)
			page = 0;
		if (page == 0)
			page = 1; // ������ �ʱ�ȭ
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
