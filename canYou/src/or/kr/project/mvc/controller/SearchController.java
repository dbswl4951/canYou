package or.kr.project.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import or.kr.project.dto.PageVO;
import or.kr.project.dto.ProjectVO;
import or.kr.project.dto.SearchVO;
import or.kr.project.mvc.dao.projectDaoImple;

@Controller
public class SearchController {
	@Autowired
	private projectDaoImple dao;
	@RequestMapping(value="/search")
	public ModelAndView listSearch(int page,String searchType, String searchValue){
		System.out.println("SearchType :"+searchType);
		System.out.println("SearchValue :"+searchValue);
		//------------------------------
        PageVO pageInfo = new PageVO();

		int rowsPerPage = 9;

		int pagesPerBlock = 5;

		int currentPage = page;
	
		int currentBlock = 0;

		if(currentPage % pagesPerBlock == 0){
			currentBlock = currentPage / pagesPerBlock;
		}else{
			currentBlock = currentPage / pagesPerBlock + 1;
		}

		int startRow = (currentPage - 1) * rowsPerPage + 1;
		int endRow = currentPage * rowsPerPage;

		SearchVO svo = new SearchVO();
		svo.setBegin(String.valueOf(startRow));
		svo.setEnd(String.valueOf(endRow));
		svo.setSearchType(searchType);
		svo.setSearchValue(searchValue);
		
		// ��ü ���ڵ� �� 
		int totalRows = dao.getTotalCount(svo);
		
		System.out.println("totalRows:"+totalRows);
		int totalPages = 0;
		//��ü �������� ���ϴ� ����
		if(totalRows % rowsPerPage == 0){
			totalPages = totalRows / rowsPerPage;
		}else{
			totalPages = totalRows / rowsPerPage + 1;
		}

		// ��ü ����� ���ϴ� ����
		int totalBlocks = 0;
		if(totalPages % pagesPerBlock == 0){
			totalBlocks = totalPages / pagesPerBlock;
		}else{
			totalBlocks = totalPages / pagesPerBlock + 1;
		}
		// PageVO�� setter�� ���� ����.
		pageInfo.setCurrentPage(currentPage);
		pageInfo.setCurrentBlock(currentBlock);
		pageInfo.setRowsPerPage(rowsPerPage);
		pageInfo.setPagesPerBlock(pagesPerBlock);
		pageInfo.setStartRow(startRow);
		pageInfo.setEndRow(endRow);
		pageInfo.setTotalRows(totalRows);
		pageInfo.setTotalPages(totalPages);
		pageInfo.setTotalBlocks(totalBlocks);
	
		//-------------------------------
		ModelAndView mav = new ModelAndView();
		mav.setViewName("searchproject");
	
		
		List<ProjectVO> list = dao.getListSearch(svo);
		
		mav.addObject("pageInfo",pageInfo);
		mav.addObject("searchType", searchType);
		mav.addObject("searchValue", searchValue);
		mav.addObject("list", list);
		return mav;
	}
}
