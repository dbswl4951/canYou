package or.kr.project.mvc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GraphDaoImple implements GraphDao{
	@Autowired
	private SqlSessionTemplate ss;
	
	//���̺� ī�װ� �Ŀ� �� �׷���
	public int categorygraph(Map<String, Integer> hash) {
		int count = ss.selectOne("graph.categorygraph",hash);
		System.out.println("count : "+count);
		return count;
	}
}
