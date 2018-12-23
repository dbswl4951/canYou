package or.kr.project.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import or.kr.project.dto.MemberVO;
import or.kr.project.dto.ProductVO;
import or.kr.project.dto.ProjectDonateVO;
import or.kr.project.dto.ProjectVO;
import or.kr.project.dto.SubCategoryVO;
import or.kr.project.mvc.dao.project2DaoImple;
import or.kr.project.mvc.dao.projectDaoImple;

@Controller
public class Project_2Controller {
	@Autowired
	private projectDaoImple dao;
	
	@Autowired
	private project2DaoImple dao2;
	
	@RequestMapping(value="/request")
	public String reqeust(int projectNo) {
		dao.request(projectNo);
		
		return "redirect:story?projectNo="+projectNo;
	}
	
	@RequestMapping(value="/prodel")
	public String prodel(int projectNo) {
		dao.prodel(projectNo);
		
		return "redirect:myProject";
	}
	
	@RequestMapping(value="/tadd")	// �ӽ� �����ϴ� ��ɾ�
	public ResponseEntity<HashMap<String, Object>> tadd(@ModelAttribute("projvo") ProjectVO vo, MultipartFile mfile, String proname,
			String procnt, String proinfo, String procost, HttpServletRequest request) throws UnsupportedEncodingException {
		
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
		
		SecurityContext impl = SecurityContextHolder.getContext();
		String implstr = impl.getAuthentication().getName();
		MemberVO vo2 = dao.memname(implstr); // ���ǿ��� ������ ID�� ���� ȸ�� ��ȣ, �̸��� �����´�
		vo.setMemberNo(vo2.getMemberNo());
		
		if(vo.getProjectName()!=null) {
			vo.setProjectName(URLDecoder.decode(vo.getProjectName(), "UTF-8"));		// ���ڵ� �ߴ� ��ҵ��� �ٽ� ���ڵ� ����
		}
		if(vo.getProjectStory()!=null) {
			vo.setProjectStory(URLDecoder.decode(vo.getProjectStory(), "UTF-8"));
		}
		
		vo.setProjectMainImage(oriFn);
		dao2.tproin(vo);
		
		if(proname!=null) {
			ProductVO prodvo = new ProductVO();
			
			proname=URLDecoder.decode(proname, "UTF-8");
			proinfo=URLDecoder.decode(proinfo, "UTF-8");
			
			String[] pname = proname.split(",");
			String[] pcnt = procnt.split(",");
			String[] pinfo = proinfo.split(",");
			String[] pcost = procost.split(",");
		
		
			for (int i = 0; i < pname.length; i++) {
				prodvo.setProductCnt(Integer.parseInt(pcnt[i]));
				prodvo.setProductName(pname[i]);
				prodvo.setProductInfo(pinfo[i]);
				prodvo.setProductCost(Integer.parseInt(pcost[i]));
				prodvo.setProjectNo(vo.getProjectNo());

				dao2.tprodin(prodvo); // ��ǰ ���ε�
			}
		}
		
		int cnt=dao2.tprocnt(vo2.getMemberNo());
		List<ProjectVO> vo3=dao2.tprosel(vo2.getMemberNo());
		
		HashMap<String, Object> h=new HashMap<>();
		h.put("cnt", cnt);
		h.put("project", vo3);
		
		return new ResponseEntity<HashMap<String, Object>>(h, HttpStatus.OK);
	}
	
	@RequestMapping(value="/seltpro")	// ������ �ӽ� ���� ������Ʈ �ҷ�����
	public ResponseEntity<HashMap<String, Object>> seltpro(int projectNo){
		ProjectVO vo=new ProjectVO();
		
		vo=dao2.seltpro(projectNo);
		List<ProductVO> vo2=dao2.seltprod(projectNo);
		
		HashMap<String, Object> h=new HashMap<>();
		h.put("project", vo);
		h.put("product", vo2);
		
		return new ResponseEntity<HashMap<String, Object>>(h, HttpStatus.OK);
	}
	
	@RequestMapping(value="/deltpro")
	public ResponseEntity<HashMap<String, Object>> deltpro(int projectNo){
		dao2.deltpro(projectNo);
		
		SecurityContext impl = SecurityContextHolder.getContext();
		String implstr = impl.getAuthentication().getName();
		MemberVO vo2 = dao.memname(implstr); // ���ǿ��� ������ ID�� ���� ȸ�� ��ȣ, �̸��� �����´�
		
		int cnt=dao2.tprocnt(vo2.getMemberNo());
		List<ProjectVO> vo3=dao2.tprosel(vo2.getMemberNo());
		
		HashMap<String, Object> h=new HashMap<>();
		h.put("cnt", cnt);
		h.put("project", vo3);
		
		return new ResponseEntity<HashMap<String, Object>>(h, HttpStatus.OK);
	}
	
	@RequestMapping(value="/cardpay")
	public String cardpay(Model m, ProjectDonateVO vo, HttpServletRequest request) {
		// �޾ƿ�  ������ ���� ���ǿ� ����
		request.getSession().setAttribute("projectNo", vo.getProjectNo());
		request.getSession().setAttribute("productNo", vo.getProductNo());
		request.getSession().setAttribute("donateMoney", vo.getDonateMoney());
		
		return "cardpay";
	}
	
	// �Ŀ��Ҷ� ������ �޼ҵ�
	@RequestMapping(value = "/donate2")
	public String donateProject2(ProjectDonateVO vo, Model model, HttpServletRequest request) {
		SecurityContext impl = SecurityContextHolder.getContext(); // ���ǿ��� spring security ������ ������
		HttpSession session = request.getSession();
		String implstr = impl.getAuthentication().getName(); // security �������� ���ǿ� ����ִ� �α��� ���� �� ID ������
		MemberVO vo2 = dao.memname(implstr); // ID�� ���� ȸ������ ������ (ȸ�� ��ȣ, ȸ�� �̸�)
		int memno = vo2.getMemberNo();
		

		vo.setPayOption("ī�����");
		vo.setProjectNo(Integer.parseInt(String.valueOf(session.getAttribute("projectNo"))));
		vo.setProductNo(Integer.parseInt(String.valueOf(session.getAttribute("productNo"))));
		vo.setDonateMoney(Integer.parseInt(String.valueOf(session.getAttribute("donateMoney"))));
		
		session.removeAttribute("projectNo");
		session.removeAttribute("productNo");
		session.removeAttribute("donateNo");

		vo.setMemberNo(memno);

		if (vo.getProductNo() != 0) {
			if (vo.getDonateMoney() != 0) {
				vo.setDonateMoney(vo.getDonateMoney() + dao.prodcost(vo.getProductNo()));
			} else {
				vo.setDonateMoney(dao.prodcost(vo.getProductNo()));
			}
		}
		
		// ������� ������ �ݾ��� ������Ʈ�� �ݾ׺��� ���� �� ���� �۾��� ���� ���� �ʰ� �������� ����
		if (vo2.getMemberCash() - vo.getDonateMoney() < 0) {
			return "0";
		}

		dao.donate(vo); // projectDonate �� �߰�

		// �� ����
		Map<String, Integer> m = new HashMap<>();
		m.put("donateMoney", vo.getDonateMoney());
		m.put("memberNo", memno);

		dao.donateMoney(m);

		session.setAttribute("memberCash", vo2.getMemberCash());
		
		return "paysuccess";

	}
}
