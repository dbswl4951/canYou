package or.kr.project.mvc.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GraphDaoImple implements GraphDao{
	@Autowired
	private SqlSessionTemplate ss;
	
	//���̺� ī�װ� �Ŀ� �� �׷���
	/*
	public Map<Object, Object> categorygraph(Map<String, Integer> hash) {
		return  ss.selectMap("graph.categorygraph",hash,"map");
	}
	*/
}
