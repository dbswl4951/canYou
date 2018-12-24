package or.kr.project.mvc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import or.kr.project.dto.ProjectVO;

@Repository
public class GraphDaoImple implements GraphDao{
	@Autowired
	private SqlSessionTemplate ss;
	
	//���̺� ī�װ� �Ŀ� �� �׷���
	public int categorygraph(Map<String, Integer> hash) {
		return ss.selectOne("graph.categorygraph",hash);
	}
	
	//�ֱ� 3������ �ش� ī�װ� �Ŀ� ��
	public List<Integer> monthGraph(ProjectVO vo){
		return ss.selectList("graph.monthgraph",vo.getCategoryNo());
	}
}
