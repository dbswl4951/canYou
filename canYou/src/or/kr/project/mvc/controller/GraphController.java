package or.kr.project.mvc.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.util.JSONPObject;

import or.kr.project.dto.MemberVO;
import or.kr.project.dto.ProjectVO;
import or.kr.project.mvc.dao.GraphDaoImple;
import or.kr.project.mvc.dao.projectDaoImple;


@Controller
public class GraphController {
	@Autowired
	private GraphDaoImple dao;
	@Autowired
	private projectDaoImple dao2;
	
	/*
	@RequestMapping(value = "/graph")
	public String graphLook() {
		return "graphpage";
	}
	*/
	
	//�׷��� ��Ÿ���� �Լ� 
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/graph")
	public String ageGraph(Model m,ProjectVO vo,HttpServletRequest request) {
		// project ������ ���� ������
		ProjectVO list = dao2.projectlist(Integer.toString(vo.getProjectNo()));
		String c = dao2.caselone(list.getCategoryNo());
		String sc = dao2.subcaselone(list.getSubCategoryNo());
		m.addAttribute("list", list);
		m.addAttribute("c", c);
		m.addAttribute("sc", sc);

		// project�� ����� member ���� ��������
		MemberVO mem = dao2.memname2(list.getMemberNo());
		m.addAttribute("member", mem);

		//���̺� ī�װ� �Ŀ� �� 
		JSONArray ageArray = new JSONArray();
		Map<String,Integer> hash = new HashMap<>();
		hash.put("projectNo", vo.getProjectNo());
		
		JSONObject ageObject1 = new JSONObject();
		hash.put("startAge", 10);
		hash.put("endAge", 19);
		ageObject1.put("x", "10��");
		int count1 = dao.categorygraph(hash);
		System.out.println("count1 : "+count1);
		ageObject1.put("y", count1);
		
		JSONObject ageObject2 = new JSONObject();
		hash.put("startAge", 20);
		hash.put("endAge", 29);
		ageObject2.put("x", "20��");
		int count2 = dao.categorygraph(hash);
		ageObject2.put("y", count2);
		
		JSONObject ageObject3 = new JSONObject();
		hash.put("startAge", 30);
		hash.put("endAge", 39);
		ageObject3.put("x", "30��");
		int count3 = dao.categorygraph(hash);
		ageObject3.put("y", count3);
		
		JSONObject ageObject4 = new JSONObject();
		hash.put("startAge", 40);
		hash.put("endAge", 49);
		ageObject4.put("x", "40��");
		int count4 = dao.categorygraph(hash);
		ageObject4.put("y", count4);
		
		JSONObject ageObject5 = new JSONObject();
		hash.put("startAge", 50);
		hash.put("endAge", 89);
		ageObject5.put("x", "50�� �̻�");
		int count5 = dao.categorygraph(hash);
		ageObject5.put("y", count5);
		
		ageArray.add(ageObject1);
		ageArray.add(ageObject2);
		ageArray.add(ageObject3);
		ageArray.add(ageObject4);
		ageArray.add(ageObject5);

		request.setAttribute("ageArray", ageArray);
		
		
		//�ֱ� 3���� ��� �����ִ� �׷���
		JSONArray monthArray = new JSONArray();
		List<Integer> hashList = dao.monthGraph(vo);

		JSONObject monthObject1 = new JSONObject();
		monthObject1.put("x", "12��");
		monthObject1.put("y", hashList.get(0));
		
		JSONObject monthObject2 = new JSONObject();
		monthObject2.put("x", "11��");
		monthObject2.put("y", hashList.get(1));
		
		JSONObject monthObject3 = new JSONObject();
		monthObject3.put("x", "10��");
		monthObject3.put("y", hashList.get(2));
		
		monthArray.add(monthObject1);
		monthArray.add(monthObject2);
		monthArray.add(monthObject3);
		
		request.setAttribute("monthArray", monthArray);
		
		return "graphpage";
	}
	
}
