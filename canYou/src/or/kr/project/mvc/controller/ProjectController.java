package or.kr.project.mvc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.authentication.AuthenticationTrustResolverImpl;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import or.kr.project.dto.CategoryVO;
import or.kr.project.dto.MemberVO;
import or.kr.project.dto.PageVO;
import or.kr.project.dto.ProductVO;
import or.kr.project.dto.ProjectDonateVO;
import or.kr.project.dto.ProjectVO;
import or.kr.project.dto.ReplyVO;
import or.kr.project.dto.SearchVO;
import or.kr.project.dto.SubCategoryVO;
import or.kr.project.mvc.dao.projectDaoImple;

@Controller
public class ProjectController {
	@Autowired
	private projectDaoImple dao;

	// ���������� + �α�������Ʈ ������
	@RequestMapping(value = "/")
	public String index(HttpServletRequest request, Model model) {
		List<ProjectVO> plist = dao.popularList();
		model.addAttribute("plist", plist);

		List<ProjectVO> nlist = dao.newList();
		model.addAttribute("nlist", nlist);

		List<ProjectVO> dlist = dao.deadlineList();
		model.addAttribute("dlist", dlist);

		return "main";
	}

	@RequestMapping(value = "index")
	public String index2(HttpServletRequest request, Model model) {
		return "main";
	}

	@RequestMapping(value = "/login")
	public String login(HttpServletRequest request, Model model) {
		AuthenticationTrustResolver trustResolver = new AuthenticationTrustResolverImpl();
		if (trustResolver.isAnonymous(SecurityContextHolder.getContext().getAuthentication())) { // �͸� ���¿��� �α��� ������ �̵���
			return "login";
		} else { // �α��� ���¿��� �α��� �������� �̵��Ϸ��� �� �� index �������� �̵�
			return "main";
		}
	}

	@RequestMapping(value = "/denied")
	public String denied() {
		return "denied";
	}

	@RequestMapping(value = "/error404")
	public String error404() {
		return "error404";
	}

	@RequestMapping(value = "/error500")
	public String error500() {
		return "error500";
	}

	@RequestMapping(value = "/mypage")
	public String getDonateList() {
		return "mypage";
	}

	// �������� ���� �������� �̵� 1218
	@RequestMapping(value = "/editinfo")
	public String editInfo(Model m) {
		SecurityContext impl=SecurityContextHolder.getContext();
		String implstr=impl.getAuthentication().getName(); 
		MemberVO vo2=dao.viewmember(implstr);	// ������ ID�� ���� ȸ�� ������ ������
			
		m.addAttribute("list", vo2);
		return "editinfo";
	}

	// �������� ���� �ϱ�
		@RequestMapping(value = "/success")
		public String editSuccess(Model m, MemberVO vo, String targetPwd) {
			// ���ǿ��� �α��� �� ID�� �������� �۾�
			SecurityContext impl = SecurityContextHolder.getContext();
			String implstr = impl.getAuthentication().getName();
			// ��-------------------
			MemberVO vo2 = dao.memname(implstr); // ������ ID�� ���� ȸ�� ��ȣ, �̸��� �����´�
			vo.setMemberNo(vo2.getMemberNo());
			
			HashMap<String, String> h = new HashMap<>();
			h.put("memberNo", String.valueOf(vo.getMemberNo()));
			h.put("memberName", vo.getMemberName());
			h.put("targetPwd", targetPwd);
			h.put("memberPwd", vo.getMemberPwd());
			h.put("memberAddr", vo.getMemberAddr());
			h.put("memberPhone", vo.getMemberPhone());
			h.put("memberEmail", vo.getMemberEmail());
			h.put("memberAge", String.valueOf(vo.getMemberAge()));
			h.put("memberAccount", vo.getMemberAccount());
			
			System.out.println(h.get("targetPwd").equals(""));

			int result=dao.editMyInfo(h);
			
			if (result!=0){
				return "success";
			}else {
				return "redirect:editinfo";
			}
		}

	@RequestMapping(value = "/proupform") // ������Ʈ ���ε� �� ������
	public ModelAndView proupform(HttpServletRequest request) {
		List<CategoryVO> category = dao.casel(); // ������Ʈ ���ε忡 �ʿ��� ī�װ� ����� ������

		// ���ǿ��� �α��� �� ID�� �������� �۾�
		SecurityContext impl = SecurityContextHolder.getContext();
		String implstr = impl.getAuthentication().getName();
		// ��-------------------
		MemberVO vo = dao.memname(implstr); // ������ ID�� ���� ȸ�� ��ȣ, �̸��� �����´�
		String name = vo.getMemberName(); // �̸��� name ������ ����

		ModelAndView mav = new ModelAndView();
		mav.setViewName("proupform");
		mav.addObject("category", category); // ī�װ� ��� ����
		mav.addObject("memberName", name); // name�� object�� �ٿ��� ���� ����
		return mav;
	}

	@RequestMapping(value = "/subcasel") // ���� ī�װ� �ҷ����� ������ (json)
	public ResponseEntity<List<SubCategoryVO>> subcasel(int categoryNo) {
		List<SubCategoryVO> l = dao.subcasel(categoryNo);

		return new ResponseEntity<>(l, HttpStatus.OK);
	}

	@RequestMapping(value = "/proup") // ������Ʈ ���ε�
	public ModelAndView proup(@ModelAttribute("projvo") ProjectVO vo, MultipartFile mfile, String proname,
			String procnt, String proinfo, String procost, HttpServletRequest request) {
		ProductVO prodvo = new ProductVO();
		String[] pname = proname.split(",");
		String[] pcnt = procnt.split(",");
		String[] pinfo = proinfo.split(",");
		String[] pcost = procost.split(",");

		String img_path = "resources\\images";
		String r_path = request.getRealPath("/");
		String oriFn;

		if (mfile == null) {
			oriFn = "null.jpg";
		} else {
			oriFn = mfile.getOriginalFilename();
		}
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(img_path).append("\\");
		path.append(oriFn);

		if (mfile != null) {
			File f = new File(path.toString());
			try {
				mfile.transferTo(f);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}

		/* �α��� ������ �������� ���� */
		SecurityContext impl = SecurityContextHolder.getContext(); // ���ǿ��� spring security ������ ������
		String implstr = impl.getAuthentication().getName(); // security �������� ���ǿ� ����ִ� �α��� ���� �� ID ������
		MemberVO vo2 = dao.memname(implstr); // ID�� ���� ȸ������ ������ (ȸ�� ��ȣ, ȸ�� �̸�)
		vo.setMemberNo(vo2.getMemberNo()); // ������Ʈ ���̺� ���� ȸ�� ��ȣ�� ����

		vo.setProjectMainImage(oriFn);
		dao.proin(vo); // ������Ʈ ���ε�

		for (int i = 0; i < pname.length; i++) {

			prodvo.setProductCnt(Integer.parseInt(pcnt[i]));
			prodvo.setProductName(pname[i]);
			prodvo.setProductInfo(pinfo[i]);
			prodvo.setProductCost(Integer.parseInt(pcost[i]));
			prodvo.setProjectNo(vo.getProjectNo());

			dao.prodin(prodvo); // ��ǰ ���ε�
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/proupsuccess");
		return mav;
	}

	@RequestMapping(value = "/proupsuccess") // ������Ʈ ���ε� ������
	public ModelAndView proupsuccess() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("proupsuccess");
		return mav;
	}

	@RequestMapping(value = "/imageUpload", method = RequestMethod.POST) // �����Ϳ��� �̹��� ���ε�
	public void commUpload(HttpServletRequest request, HttpSession session, HttpServletResponse response,
			@RequestParam MultipartFile upload) {
		OutputStream out = null;
		PrintWriter printWriter = null;
		response.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html;charset=EUC-KR");
		try {
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			String path = session.getServletContext().getRealPath("/resources/images");
			String uploadPath = path + "\\" + fileName;// ������
			out = new FileOutputStream(new File(uploadPath));
			out.write(bytes);
			String callback = request.getParameter("CKEditorFuncNum");

			printWriter = response.getWriter();

			String fileUrl = "resources/images/" + fileName;// url���
			// ���� ���ε带 �񵿱������ ������ �� Callback�� �����Ѵ�.
			// printWriter.println("data:");
			printWriter.println("<script type='text/javascript'>" + "window.parent.CKEDITOR.tools.callFunction("
					+ callback + ",'" + fileUrl + "','�̹����� ���ε� �Ͽ����ϴ�.'" + ")</script>");
			printWriter.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return;
	}

	@PostMapping("/update")
	public String updateView(Model m, HttpServletRequest req, int projectNo) {
		ProjectVO vo3 = new ProjectVO();

		System.out.println("������Ʈ ��ȣ : " + projectNo);

		SecurityContext impl = SecurityContextHolder.getContext(); // ���ǿ��� spring security ������ ������
		String implstr = impl.getAuthentication().getName(); // security �������� ���ǿ� ����ִ� �α��� ���� �� ID ������
		MemberVO vo2 = dao.memname(implstr); // ID�� ���� ȸ������ ������ (ȸ�� ��ȣ, ȸ�� �̸�)
		vo3.setMemberNo(vo2.getMemberNo()); // ������Ʈ ���̺� ���� ȸ�� ��ȣ�� ����
		vo3.setProjectNo(projectNo);
		
		HttpSession s=req.getSession();
		s.setAttribute("projnum", projectNo);		// ������Ʈ ������ �߰�

		ProjectVO vo = dao.modifyview(vo3);
		m.addAttribute("project", vo);
		

		return "ProjectModify";
	}

	// ������Ʈ ����
	@PostMapping("/modify")
	public ModelAndView modifyView(@ModelAttribute("projvo") ProjectVO vo, HttpServletRequest request, HttpSession s) {
		// ������Ʈ ���� - ���Ͼ��ε�
		String img_path = "resources\\images";
		String r_path = request.getRealPath("/");
		String oriFn = vo.getMultipartFile().getOriginalFilename();
		StringBuffer projectMainImage = new StringBuffer();
		projectMainImage.append(r_path).append(img_path).append("\\");
		projectMainImage.append(oriFn);
		File f = new File(projectMainImage.toString());
		System.out.println("projectMainImage : " + projectMainImage);
		try {
			vo.getMultipartFile().transferTo(f);
			vo.setProjectMainImage(vo.getMultipartFile().getOriginalFilename());
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		int projnum = Integer.parseInt(String.valueOf(s.getAttribute("projnum"))); // ���ǿ� ����Ǿ��ִ� ������Ʈ ��ȣ�� �־���
		vo.setProjectNo(projnum);
		s.removeAttribute("projnum");

		// ������Ʈ ��μ��� - �޼ҵ� ȣ��
		dao.modify(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:story?projectNo=" + projnum);
		return mav;
	}

	// ������Ʈ �ѷ�����
	@RequestMapping("/lookaround")
	public String look(Model m) {
		List<CategoryVO> list = dao.categoryLookAround();

		m.addAttribute("list", list);

		return "lookaround";
	}

	// ��� ������Ʈ ����
	@RequestMapping(value = "/AllList")
	public ModelAndView AllList(Integer page, SearchVO vo, Principal principal) {

		// pageVO�� ȹ��
		int totalRows = dao.getTotalCount();
		PageVO pageInfo = makePageVO(page, totalRows);

		// ������ ������ ����
		vo.setBegin(String.valueOf(pageInfo.getStartRow()));
		vo.setEnd(String.valueOf(pageInfo.getEndRow()));

		List<ProjectVO> list = dao.projectALLlist(vo);

		System.out.println(list.size());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("AllList");
		mav.addObject("list", list);
		mav.addObject("pageInfo", pageInfo);
		if (principal != null)
			mav.addObject("principal", principal.getName());
		List<String> dateList = new ArrayList<String>();

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		// ���� ��¥ ����ؼ� list�� �־� ��
		for (ProjectVO pvo : list) {
			String sys = format.format(new Date()); // ���� ��¥

			int idx = pvo.getProjectEndDate().indexOf(" ");
			String end = pvo.getProjectEndDate().substring(0, idx); // ������ ��¥

			Date endDate = null;
			Date sysdate = null;
			long diffDays = 0;
			try {
				// ��¥ ����� ���� Date������ ��ȯ
				endDate = format.parse(end);
				sysdate = format.parse(sys);

				// �ð����̸� �ð�,��,�ʸ� ���� ������ ������ �Ϸ� ������ ����
				long diff = endDate.getTime() - sysdate.getTime();
				diffDays = diff / (24 * 60 * 60 * 1000);

				System.out.println("��¥����=" + diffDays);

			} catch (ParseException e) {
				e.printStackTrace();
			}

			dateList.add(Integer.toString((int) diffDays)); // ����Ʈ�� ��¥ ���̸� ����

		}
		mav.addObject("dateList", dateList);

		return mav;
	}

	// ī�װ��� ������Ʈ ����
	@RequestMapping(value = "/categoryproject")
	public String categoryProject(Model m, @RequestParam("categoryNo") String categoryNo, Integer page, SearchVO svo,
			Principal principal) {

		// pageVO�� ȹ��
		int totalRows = dao.getCategoryCount(Integer.parseInt(categoryNo));
		PageVO pageInfo = makePageVO(page, totalRows);

		// ������ ������ ����
		svo.setBegin(String.valueOf(pageInfo.getStartRow()));
		svo.setEnd(String.valueOf(pageInfo.getEndRow()));

		List<String> dateList = new ArrayList<String>(); // ���� ��¥ ����Ʈ
		
		String categoryName = dao.categoryName(Integer.parseInt(categoryNo)); //ī�װ��� ����� ����...
		m.addAttribute("categoryName", categoryName);

		// ���� ī�װ����� ����
		Map<String, String> categoryList = new HashMap<>();
		categoryList.put("categoryNo", categoryNo);
		categoryList.put("begin", String.valueOf(pageInfo.getStartRow()));
		categoryList.put("end", String.valueOf(pageInfo.getEndRow()));
		m.addAttribute("categoryNo", categoryNo);

		List<ProjectVO> list = dao.lookCategoryProject(categoryList); // ����Ʈ ����
		m.addAttribute("list", list);
		m.addAttribute("pageInfo", pageInfo); // pageInfo ����

		System.out.println("categoryNo : " + categoryNo);
		System.out.println("list size2 : " + list.size());

		if (principal != null) {
			m.addAttribute("principal", principal.getName());
		}

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		// ���� ��¥ ����ؼ� list�� �־� ��
		for (ProjectVO pvo : list) {
			String sys = format.format(new Date()); // ���� ��¥

			int idx = pvo.getProjectEndDate().indexOf(" ");
			String end = pvo.getProjectEndDate().substring(0, idx); // ������ ��¥

			Date endDate = null;
			Date sysdate = null;
			long diffDays = 0;

			try {
				// ��¥ ����� ���� Date������ ��ȯ
				endDate = format.parse(end);
				sysdate = format.parse(sys);

				// �ð����̸� �ð�,��,�ʸ� ���� ������ ������ �Ϸ� ������ ����
				long diff = endDate.getTime() - sysdate.getTime();
				diffDays = diff / (24 * 60 * 60 * 1000);

				System.out.println("��¥����=" + diffDays);

				// dateList.add(diffDays);
			} catch (ParseException e) {
				e.printStackTrace();
			}

			dateList.add(Integer.toString((int) diffDays)); // ����Ʈ�� ��¥ ���̸� ����

		}
		m.addAttribute("dateList", dateList);

		return "categoryproject";
	}

	// makePageVO �޼ҵ�(�������� ������ִ� �޼ҵ�)
	public PageVO makePageVO(Integer page, int totalRows) {

		PageVO pageInfo = new PageVO();
		int rowsPerPage = 9; // ���������� ������ ��ϼ� - properties
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

	// ��� ���
	@PostMapping("/reply1")
	public String reply1(Model m, ReplyVO vo, HttpSession s) {
		SecurityContext impl = SecurityContextHolder.getContext(); // ���ǿ��� spring security ������ ������
		String implstr = impl.getAuthentication().getName(); // security �������� ���ǿ� ����ִ� �α��� ���� �� ID ������
		MemberVO vo2 = dao.memname(implstr); // ID�� ���� ȸ������ ������ (ȸ�� ��ȣ, ȸ�� �̸�)
		vo.setMemberNo(vo2.getMemberNo()); // ������Ʈ ���̺� ���� ȸ�� ��ȣ�� ����
		vo.setProjectNo(Integer.parseInt((String) s.getAttribute("projnum"))); // ���ǿ� ����� projectNumber�� ������
		s.removeAttribute("projnum"); // ����� session �Ӽ� ����
		System.out.println("reply1 ��");
		dao.replyInsert(vo);

		return "redirect:story?projectNo=" + vo.getProjectNo();
	}

	// �Ŀ��Ҷ� ������ �޼ҵ�
	@RequestMapping(value = "/donate")
	public String donateProject(ProjectDonateVO vo) {
		SecurityContext impl = SecurityContextHolder.getContext(); // ���ǿ��� spring security ������ ������
		String implstr = impl.getAuthentication().getName(); // security �������� ���ǿ� ����ִ� �α��� ���� �� ID ������
		MemberVO vo2 = dao.memname(implstr); // ID�� ���� ȸ������ ������ (ȸ�� ��ȣ, ȸ�� �̸�)
		int memno = vo2.getMemberNo();

		vo.setMemberNo(memno);
		
		if (vo.getProductNo() != 0) {
			if (vo.getDonateMoney() != 0) {
				vo.setDonateMoney(vo.getDonateMoney() + dao.prodcost(vo.getProductNo()));
			} else {
				vo.setDonateMoney(dao.prodcost(vo.getProductNo()));
			}
		}
		
		// ������� ������ �ݾ��� ������Ʈ�� �ݾ׺��� ���� �� ���� �۾��� ���� ���� �ʰ� �������� ����
		if(vo2.getMemberCash()-vo.getDonateMoney()<0) {
			return "redirect:/productDetail?projectNo=" + vo.getProjectNo() + "&success=fail";
		}

		dao.donate(vo); // projectDonate �� �߰�

		// �� ����
		Map<String, Integer> m = new HashMap<>();
		m.put("donateMoney", vo.getDonateMoney());
		m.put("memberNo", memno);

		dao.donateMoney(m);

		return "redirect:/story?projectNo=" + vo.getProjectNo() + "&success=success";
	}

	// �Ŀ� ���
	@RequestMapping(value = "/cancle")
	public String cancle(int donateNo/* ���Ŀ� ������Ʈ �����ؼ� �� ��츦 ����ؼ� */, int productNo) {
		SecurityContext impl = SecurityContextHolder.getContext(); // ���ǿ��� spring security ������ ������
		String implstr = impl.getAuthentication().getName(); // security �������� ���ǿ� ����ִ� �α��� ���� �� ID ������
		MemberVO vo2 = dao.memname(implstr); // ID�� ���� ȸ������ ������ (ȸ�� ��ȣ, ȸ�� �̸�)
		int memno = vo2.getMemberNo();

		ProjectDonateVO vo = new ProjectDonateVO();
		vo.setDonateNo(donateNo);
		vo.setMemberNo(memno);
		vo.setProductNo(productNo);
		System.out.println("Ȯ��Ȯ��" + vo.getDonateNo());

		// ������� ���� ��ȯ + ���� ���� ������
		dao.returnMoney(vo);
		// �Ŀ��� �� ����
		dao.returnFundCnt(vo);
		// �� ���� �� �Ŀ� �� ����
		dao.donateCancle(vo);

		return "redirect:/mydonate"; // �ٽ� ����Ʈ ȭ������
	}

	// �� �Ŀ���Ȳ
	@RequestMapping("/mydonate")
	public ModelAndView mydonate(Integer page, SearchVO vo, Principal principal) {
		SecurityContext impl = SecurityContextHolder.getContext(); // ���ǿ��� spring security ������ ������
		String implstr = impl.getAuthentication().getName(); // security �������� ���ǿ� ����ִ� �α��� ���� �� ID ������
		MemberVO vo2 = dao.memname(implstr); // ID�� ���� ȸ������ ������ (ȸ�� ��ȣ, ȸ�� �̸�)
		int memno = vo2.getMemberNo();
		vo.setMemberNo(memno);
		// pageVO�� ȹ��vo
		int totalRows = dao.myDonateCount(vo);
		PageVO pageInfo = makePageVO(page, totalRows);

		// ������ ������ ����
		vo.setBegin(String.valueOf(pageInfo.getStartRow()));
		vo.setEnd(String.valueOf(pageInfo.getEndRow()));

		List<HashMap> list = dao.myDonateProject(vo);
		System.out.println(list.size());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mydonate");
		mav.addObject("list", list);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("cno", vo.getProjectStatus());
		if (principal != null)
			mav.addObject("principal", principal.getName());

		return mav;
	}

	// ���� ���� ������Ʈ
	@RequestMapping("/myProject")
	public ModelAndView moveMyProject(Integer page, SearchVO vo, Principal principal) {
		SecurityContext impl = SecurityContextHolder.getContext(); // ���ǿ��� spring security ������ ������
		String implstr = impl.getAuthentication().getName(); // security �������� ���ǿ� ����ִ� �α��� ���� �� ID ������
		MemberVO vo2 = dao.memname(implstr); // ID�� ���� ȸ������ ������ (ȸ�� ��ȣ, ȸ�� �̸�)
		System.out.println("page ���� �� : " + page);
		System.out.println("���� : " + vo.getProjectStatus());
		int memno = vo2.getMemberNo();
		vo.setMemberNo(memno);
		System.out.println("memno:" + vo.getMemberNo());

		// pageVO�� ȹ��
		int totalRows = dao.myPTotalCount(vo);
		PageVO pageInfo = makePageVO(page, totalRows);

		// ������ ������ ����
		vo.setBegin(String.valueOf(pageInfo.getStartRow()));
		vo.setEnd(String.valueOf(pageInfo.getEndRow()));

		List<ProjectVO> list = dao.myProjectlist(vo);

		System.out.println(list.size());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myProject");
		mav.addObject("list", list);
		mav.addObject("cno", vo.getProjectStatus());
		mav.addObject("pageInfo", pageInfo);
		if (principal != null)
			mav.addObject("principal", principal.getName());

		return mav;
	}

	// ������Ʈ ���� ����
	@RequestMapping("/projectlook")
	public String projectLook() {
		return "projectlook";
	}

	// ������Ʈ ���ε� ��
	@RequestMapping(value = "/ProjectUpload")
	public ModelAndView ProjectUpload() {
		List<CategoryVO> category = dao.casel(); // ������Ʈ ���ε忡 �ʿ��� ī�װ� ����� ������

		// ���ǿ��� �α��� �� ID�� �������� �۾�
		SecurityContext impl = SecurityContextHolder.getContext();
		String implstr = impl.getAuthentication().getName();
		// ��-------------------
		MemberVO vo = dao.memname(implstr); // ������ ID�� ���� ȸ�� ��ȣ, �̸��� �����´�
		String name = vo.getMemberName(); // �̸��� name ������ ����

		ModelAndView mav = new ModelAndView();
		mav.setViewName("ProjectUpload");
		mav.addObject("category", category); // ī�װ� ��� ����
		mav.addObject("memberName", name); // name�� object�� �ٿ��� ���� ����
		return mav;
	}

	// �α׾ƿ� 12/14
	@RequestMapping(value = "/logout")
	public String logout(Model m, HttpServletRequest request) {
		SecurityContextHolder.getContext().getAuthentication().setAuthenticated(false);

		return "main";
	}

	//����� ��Ϲ�ȣ ��ȸ ��
	@RequestMapping(value = "/licensee")
	public String licensee() {
		return "licensee";
	}

	// ȸ������ ����
	@RequestMapping(value = "/addMember")
	public String addMember(MemberVO vo) {
		dao.addMember(vo);

		return "main";
	}

	// ȸ������ ������
	@RequestMapping(value = "/sign")
	public String sign() {
		return "sign";
	}

	// ���̺� �Ŀ� ī�װ� �׷��� ����
	@RequestMapping(value = "/graphpage")
	public String graphPage(Model m) {
		Map<Integer, Integer> map = dao.ageGraph();
		m.addAttribute("map", map);

		return "graphpage";
	}
	
	// ĳ������ ������
	@RequestMapping(value = "/cash")
	public ModelAndView cashcharge(MemberVO vo) {
		// ���ǿ��� �α��� �� ID�� �������� �۾�
		SecurityContext impl = SecurityContextHolder.getContext();
		String implstr = impl.getAuthentication().getName();
		// ��-------------------
		MemberVO vo2 = dao.memname(implstr); // ������ ID�� ���� ȸ�� ��ȣ, �̸��� �����´�
		vo.setMemberNo(vo2.getMemberNo());

		List<MemberVO> list = dao.chargeList(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cashcharge");
		mav.addObject("list", list);
		return mav;

	}

	// ĳ�� ����
	@RequestMapping(value = "/cashcharge")
	public String cashcharge(Model m, MemberVO vo) {
		// ���ǿ��� �α��� �� ID�� �������� �۾�
		SecurityContext impl = SecurityContextHolder.getContext();
		String implstr = impl.getAuthentication().getName();
		// ��-------------------
		MemberVO vo2 = dao.memname(implstr); // ������ ID�� ���� ȸ�� ��ȣ, �̸��� �����´�
		vo.setMemberNo(vo2.getMemberNo());
		System.out.println("��" + vo.getMemberCash());
		System.out.println("�����ȣ" + vo.getMemberNo());
		dao.charge(vo);
		System.out.println("��" + vo.getMemberCash());
		System.out.println("�����ȣ" + vo.getMemberNo());

		return "redirect:/cash";

	}
	
	//���̵� �ߺ� �˻�
	@RequestMapping(value = "/idcheck")
	@ResponseBody
	public int memberIdCheck(@RequestBody String memberId) {
		memberId = memberId.substring(0, memberId.length()-1);
		int count = dao.memberIdCheck(memberId);
		System.out.println(count);
		return count;
	}
}

