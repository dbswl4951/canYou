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
	@Override
	public int categorygraph(Map<String, Integer> hash) {
		return ss.selectOne("graph.categorygraph",hash);
	}
	
	//�ֱ� 3������ �ش� ī�װ� �Ŀ� ��
	@Override
	public List<Integer> monthGraph(ProjectVO vo) {
		return ss.selectList("graph.monthgraph",vo.getCategoryNo());
	}
	
	@Override
	public List<HashMap<String, Object>> countPerGender(int projectNo) {
		List<HashMap<String,Object>> list = ss.selectList("graph.count_per_gender",projectNo);
		return list;
	}
}
