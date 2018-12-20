package or.kr.project.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import or.kr.project.dto.MemberVO;
import or.kr.project.dto.ProductVO;
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
	public ResponseEntity<String> tadd(@ModelAttribute("projvo") ProjectVO vo, MultipartFile mfile, String proname,
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
		
		return new ResponseEntity<String>("ok", HttpStatus.OK);
	}
}
