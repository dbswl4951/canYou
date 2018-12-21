package or.kr.project.mvc.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.authentication.AuthenticationTrustResolverImpl;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import or.kr.project.dto.MemberVO;
import or.kr.project.dto.ProductVO;
import or.kr.project.dto.ProjectVO;
import or.kr.project.dto.ReplyVO;
import or.kr.project.mvc.dao.projectDaoImple;

@Controller
// Detail.jsp�� �����ϴ� ���� jsp�� ��Ʈ���ϱ� ���� Controller
public class DetailController {
	@Autowired
	projectDaoImple dao;
	
	// ���丮�� ���õ� �κ��� detail.jsp�� ���� ������ �޼ҵ�
	@GetMapping("/story")
	public String listView(Model m, String projectNo, HttpServletRequest req) {
		// project ������ ���� ������ 
		ProjectVO list = dao.projectlist(projectNo);
		String c=dao.caselone(list.getCategoryNo());
		String sc=dao.subcaselone(list.getSubCategoryNo());
		
		m.addAttribute("list",list);
		m.addAttribute("c", c);
		m.addAttribute("sc", sc);
		
		// project�� ����� member ���� ��������
		MemberVO mem=dao.memname2(list.getMemberNo());
		m.addAttribute("member", mem);
		
		return "storypage";
	}
	
	@RequestMapping(value="/community")
	public String getReply(Model m, HttpServletRequest req, String projectNo) {
		// project ������ ���� ������
		System.out.println("num : " + projectNo);
		ProjectVO list = dao.projectlist(projectNo);
		String c = dao.caselone(list.getCategoryNo());
		String sc = dao.subcaselone(list.getSubCategoryNo());
		m.addAttribute("list", list);
		m.addAttribute("c", c);
		m.addAttribute("sc", sc);
		// project�� ����� member ���� ��������
		MemberVO mem = dao.memname2(list.getMemberNo());
		m.addAttribute("member", mem);
		
		//��� ���� ��������
		List<ReplyVO> replylist =dao.replyList(projectNo);
		//List<ReplyVO> replylist = dao.replyList(projectNo);
		m.addAttribute("replylist", replylist);
		System.out.println("replylist ũ�� : "+ replylist.size());
				
		HttpSession s=req.getSession();
		s.setAttribute("projnum", projectNo);		// ������Ʈ ������ �߰�
		
		return "communitypage";
	}
	
	@RequestMapping(value="/productDetail")
	public String getProductDetail(Model m, HttpServletRequest req, String projectNo, String success) {
		// project ������ ���� ������
		ProjectVO list = dao.projectlist(projectNo);
		String c = dao.caselone(list.getCategoryNo());
		String sc = dao.subcaselone(list.getSubCategoryNo());
		m.addAttribute("list", list);
		m.addAttribute("c", c);
		m.addAttribute("sc", sc);
		
		// project�� ����� member ���� ��������
		MemberVO mem = dao.memname2(list.getMemberNo());
		m.addAttribute("member", mem);
		
		// project�� ����� product ��������
		List<ProductVO> list2=dao.prodsel(projectNo);
		m.addAttribute("prodlist", list2);
		m.addAttribute("success", success);
		
		return "productdetailpage";
	}
	
	//�� ������Ʈ�� �Ŀ��� ��� ��� ����
	@RequestMapping(value="/projectDonateList")
	public String projectDonateList(String projectNo,String memberNo,Model m) {
		AuthenticationTrustResolver trustResolver = new AuthenticationTrustResolverImpl();
		SecurityContext impl = SecurityContextHolder.getContext(); // ���ǿ��� spring security ������ ������
		String implstr = impl.getAuthentication().getName(); // security �������� ���ǿ� ����ִ� �α��� ���� �� ID ������
		
		// project ������ ���� ������
		ProjectVO list = dao.projectlist(projectNo);
		String c = dao.caselone(list.getCategoryNo());
		String sc = dao.subcaselone(list.getSubCategoryNo());

		m.addAttribute("list", list);
		m.addAttribute("c", c);
		m.addAttribute("sc", sc);
		
		// project�� ����� member ���� ��������
		MemberVO mem=dao.memname2(list.getMemberNo());
		m.addAttribute("member", mem);

		MemberVO vo = dao.memname(implstr); // ID�� ���� ȸ������ ������ (ȸ�� ��ȣ, ȸ�� �̸�)
		
		if(!trustResolver.isAnonymous(SecurityContextHolder.getContext().getAuthentication())) {
			if(vo.getMemberNo() == Integer.parseInt(memberNo)) { //���� ���� ȸ���� ������Ʈ �����ϴ� ����� �����ϸ�
				//�Ŀ��� ��� ���� ������
				List<MemberVO> mList = dao.projectDonateList(Integer.parseInt(projectNo));
				m.addAttribute("mList", mList);	
				
				return "mysponsor";
			}
		}
			
		return "storypage";
	}
}
