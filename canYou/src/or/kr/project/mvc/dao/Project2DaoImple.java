package or.kr.project.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import or.kr.project.dto.DeniedVO;
import or.kr.project.dto.ProductVO;
import or.kr.project.dto.ProjectVO;

@Repository
public class Project2DaoImple implements Project2Dao{
	@Autowired
	private SqlSessionTemplate ss;
	
	// �ӽ����� ������Ʈ insert
	@Override
	public void tproin(ProjectVO vo) {
		ss.insert("tempproject.tproin", vo);
	}
	
	// �ӽ����� ��ǰ insert
	@Override
	public void tprodin(ProductVO vo) {
		ss.insert("tempproject.tprodin", vo);
	}
	
	// �ش� ȸ���� �ӽ� ���� ������Ʈ�� ����� ������ (i : ȸ����ȣ)
	@Override
	public int tprocnt(int i) {
		return ss.selectOne("tempproject.tprocnt", i);
	}
	
	// �ӽ� ������Ʈ ��� ������ ��
	@Override
	public List<ProjectVO> tprosel(int i) {
		return ss.selectList("tempproject.tprosel", i);
	}
	
	@Override
	public ProjectVO seltpro(int i) {				// ������ �ӽ� ������Ʈ ��������
		return ss.selectOne("tempproject.tproselOne", i);
	}
	
	@Override
	public List<ProductVO> seltprod(int i) {				// ������ �ӽ� ������Ʈ ��������
		return ss.selectList("tempproject.tprodsel", i);
	}
	
	// ������ �ӽ� ������Ʈ ����
	@Override
	public void deltpro(int i) {
		ss.delete("tempproject.tproddel", i);	
		ss.delete("tempproject.tprodel", i);
	}
	
	@Override
	public List<DeniedVO> selde(int i){
		return ss.selectList("project2.selde", i);
	}
	
	@Override
	public int upde(String s) {
		return ss.update("project2.upde", s);
	}

	@Override
	public String showreason(String projectNo) {
		return ss.selectOne("project2.showreason", projectNo);
	}
}
