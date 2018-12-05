package or.kosta.mvc.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import or.kosta.dto.DownDTO;
import or.kosta.mvc.dao.DownDao;

@Controller
public class UploadController {
	@Autowired
	DownDao dao;
	
	@GetMapping("/showform")
	public String upform() {
		return "showform";
	}
	
	@RequestMapping(value="/upsave2",method=RequestMethod.POST)
	public ModelAndView save2(@ModelAttribute("dvo")DownDTO vo,
			HttpServletRequest request) {
		System.out.println("vo ��ü ���� �� : "+vo);
		System.out.println("vo ��ü ���� �� : "+vo.getWriter());
		String img_path = "resources\\imgfile";
		String r_path = request.getRealPath("/");
		String oriFn = vo.getMultipartFile().getOriginalFilename();
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(img_path).append("\\");
		path.append(oriFn);
		System.out.println("Path : " + path.toString());
		File f = new File(path.toString());
		try {
			vo.getMultipartFile().transferTo(f);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		vo.setImg(vo.getMultipartFile().getOriginalFilename());
		dao.addDown(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/uplist");
		return mav;
	}
	
	private static final int BUFFER_SIZE = 4096;
	
	@RequestMapping(value = "fileDown")
	public void fileDown(@RequestParam("fileName")String fileName,
			HttpSession session, HttpServletRequest request,
			HttpServletResponse response)throws IOException{
		// applicationContext ��ü�� request�� ���� ��
		ServletContext context = request.getServletContext();
		// ���ε�� ��� ����
		String path = session.getServletContext().getRealPath("/resources/imgfile/"+fileName);
		// �� ��η� ���� ��ü�� ����
		File downloadFile = new File(path);
		System.out.println("DownloadFile : " + downloadFile.exists());
		// FileInputStream ��Ʈ������ �о��
		FileInputStream fi = new FileInputStream(downloadFile);
		// ��û ��ü�κ��� ����� �������� ���� Ÿ���� ��
		String mimeType = context.getMimeType(path);
		// ���� ����Ÿ�԰��� ������ �׳� ����Ʈ�� ��Ʈ������ ����
		if(mimeType == null) {
			mimeType = "application/octet-stream";
		}
		// ������ ����Ÿ�� ����
		response.setContentType(mimeType);
		// �ٿ�ε�� ������ ���� ����
		response.setContentLength((int)downloadFile.length());
		// �ٿ�ε� Type�� ������ 
		String headerKey = "Content-Disposition";
		String headerValue =
				String.format("attachment; filename=\"%s\"", 
								downloadFile.getName());
		//���� �ٿ�ε� Ÿ���� ������ �ش��� ����
		response.setHeader(headerKey, headerValue);
		// �������� ���� ��Ʈ���� ����
		OutputStream outStream = response.getOutputStream();
		//���۸� ������ ������ ���� ����
		byte[] buffer = new byte[BUFFER_SIZE];
		// ���� �������� ������ , �ڿ� ������ ��
		int bytesRead = -1;
		while((bytesRead = fi.read(buffer)) != -1) {
			outStream.write(buffer,0,bytesRead);
		}
		fi.close();
		outStream.close();
	}
	
	@RequestMapping(value = "/downloadExcel")
	public ModelAndView downloadExcel() {
		List<DownDTO> listBooks = dao.getList();
		return new ModelAndView("excelView","listBooks",listBooks);
	}
	
	
}
