package or.kr.project.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import or.kr.project.dto.DeniedVO;
import or.kr.project.dto.ProductVO;
import or.kr.project.dto.ProjectVO;

@Repository
public class Project2DaoImple {
	@Autowired
	private SqlSessionTemplate ss;
	
	public void tproin(ProjectVO vo) {		// �ӽ����� ������Ʈ insert
		ss.insert("tempproject.tproin", vo);
	}
	
	public void tprodin(ProductVO vo) { // �ӽ����� ��ǰ insert��
		ss.insert("tempproject.tprodin", vo);
	}
	
	public int tprocnt(int i) {		// �ش� ȸ���� �ӽ� ���� ������Ʈ�� ����� ������ (i : ȸ����ȣ)
		return ss.selectOne("tempproject.tprocnt", i);
	}
	
	public List<ProjectVO> tprosel(int i){				// �ӽ� ������Ʈ ��� ������ ��
		return ss.selectList("tempproject.tprosel", i);
	}
	
	public ProjectVO seltpro(int i) {				// ������ �ӽ� ������Ʈ ��������
		return ss.selectOne("tempproject.tproselOne", i);
	}
	
	public List<ProductVO> seltprod(int i) {				// ������ �ӽ� ������Ʈ ��������
		return ss.selectList("tempproject.tprodsel", i);
	}
	
	public void deltpro(int i) {	// ������ �ӽ� ������Ʈ ����
		ss.delete("tempproject.tproddel", i);	// ������ �ӽ� ������Ʈ�� ��ǰ���� ����
		ss.delete("tempproject.tprodel", i);
	}
	
	public List<DeniedVO> selde(int i){
		return ss.selectList("project2.selde", i);
	}
	
	public int upde(String s) {
		return ss.update("project2.upde", s);
	}

	public String showreason(String projectNo) {
		return ss.selectOne("project2.showreason", projectNo);
	}
}
