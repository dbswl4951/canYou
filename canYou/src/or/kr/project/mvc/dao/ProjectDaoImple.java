package or.kr.project.mvc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import or.kr.project.dto.CategoryVO;
import or.kr.project.dto.MemberVO;
import or.kr.project.dto.ProductVO;
import or.kr.project.dto.ProjectDonateVO;
import or.kr.project.dto.ProjectVO;
import or.kr.project.dto.ReplyVO;
import or.kr.project.dto.SearchVO;
import or.kr.project.dto.SubCategoryVO;

/**
 * <pre>
 * <b>ProjectDaoImple Ŭ����</b>
 * </pre>
 * @author ������, ��ټ�, ������, ������
 * @version ver.1.0
 * @since jdk.1.8
 *
 */

@Repository
public class ProjectDaoImple implements ProjectDao {
	@Autowired
	private SqlSessionTemplate ss;

    /** 
     * ī�װ� �̸��� �����ɴϴ�.
     * @return List<CategoryVO>
     */  
	@Override
	public List<CategoryVO> casel() {
		return ss.selectList("project.casel"); // ī�װ� �̸� �������� sql��
	}

    /** 
     * ���� ī�װ� �̸��� �����ɴϴ�.
     * @param int i 
     * @return List<SubCategoryVO> 
     */  
	@Override
	public List<SubCategoryVO> subcasel(int i) {
		return ss.selectList("project.subcasel", i);
	}

	/** (non-Javadoc)
	 * @see or.kr.project.mvc.dao.ProjectDao#memname(java.lang.String)
	 * ȸ�� ���̵�� ȸ���� �������� �����ɴϴ�.
	 * @param String s 
	 * @return MemberVO
	 */
	@Override
	public MemberVO memname(String s) { // ȸ���� �������� �������� ���� sql��(ȸ�� ���̵�� ������)
		return ss.selectOne("project.memname", s);
	}

	/** (non-Javadoc)
	 * @see or.kr.project.mvc.dao.ProjectDao#memname2(int)
	 * ȸ�� ��ȣ�� ȸ���� �������� �����ɴϴ�.
	 * @param int i 
	 * @return MemberVO
	 */
	@Override
	public MemberVO memname2(int i) {
		return ss.selectOne("project.memname2", i); // ȸ���� �������� �������� ���� sql�� (ȸ�� ��ȣ�� ������)
	}

	/** (non-Javadoc)
	 * @see or.kr.project.mvc.dao.ProjectDao#proin(or.kr.project.dto.ProjectVO)
	 * ������Ʈ�� �����մϴ�.
	 * @param ProjectVO vo 
	 */
	@Override
	public void proin(ProjectVO vo) { // ������Ʈ insert��
		ss.insert("project.proin", vo);
	}

	/** (non-Javadoc)
	 * @see or.kr.project.mvc.dao.ProjectDao#prodin(or.kr.project.dto.ProductVO)
	 * ��ǰ�� �����մϴ�.
	 * @param ProductVO vo
	 */
	@Override
	public void prodin(ProductVO vo) { // ��ǰ insert��
		ss.insert("project.prodin", vo);
	}

	/** (non-Javadoc)
	 * @see or.kr.project.mvc.dao.ProjectDao#prodsel(java.lang.String)
	 * ��ǰ�� ����Ʈ�� ������ �մϴ�.
	 * @param String s
	 * @return List<ProductVO>
	 */
	@Override
	public List<ProductVO> prodsel(String s) { // ��ǰ select��
		return ss.selectList("project.prodsel", s);
	}

	/** (non-Javadoc)
	 * @see or.kr.project.mvc.dao.ProjectDao#modifyview(or.kr.project.dto.ProjectVO)
	 * ������Ʈ�� ������������ ������ �մϴ�.
	 * @param ProjectVO vo
	 * @return ProjectVO
	 */
	@Override
	public ProjectVO modifyview(ProjectVO vo) {
		return ss.selectOne("project.modifyview", vo);
	}

	/** (non-Javadoc)
	 * @see or.kr.project.mvc.dao.ProjectDao#modify(or.kr.project.dto.ProjectVO)
	 * ������Ʈ�� �����մϴ�.
	 * @param ProjectVO vo
	 */
	@Override
	public void modify(ProjectVO vo) {
		ss.update("project.modify", vo);
	}

	/** (non-Javadoc)
	 * @see or.kr.project.mvc.dao.ProjectDao#caselone(int)
	 * ī�װ� ��ȣ�� ���� ī�װ� �̸��� �����ɴϴ�.
	 * @param int i
	 * @return String
	 */
	@Override
	public String caselone(int i) {
		return ss.selectOne("project.caselone", i);
	}

	/** (non-Javadoc)
	 * @see or.kr.project.mvc.dao.ProjectDao#subcaselone(int)
	 * ���� ī�װ� ��ȣ�� ���� ���� ī�װ� �̸��� �����ɴϴ�.
	 * @param int i
	 * @return String
	 */
	@Override
	public String subcaselone(int i) {
		return ss.selectOne("project.subcaselone", i);
	}

	/** (non-Javadoc)
	 * @see or.kr.project.mvc.dao.ProjectDao#prodcost(int)
	 * ��ǰ ������ �ҷ��ɴϴ�.
	 * @param int i
	 * @return int
	 */
	@Override
	public int prodcost(int i) {
		return ss.selectOne("project.prodcost", i);
	}

	/** (non-Javadoc)
	 * @see or.kr.project.mvc.dao.ProjectDao#donateMoney(java.util.Map)
	 * �Ŀ��߰� - ���� �����մϴ�.
	 * @param Map<String, Integer> m
	 */
	@Override
	// ������Ʈ�� �Ŀ��ϴ� �޼ҵ� 1 (�� ����)
	public void donateMoney(Map<String, Integer> m) {
		ss.update("project.donateMoney", m);
	}

	/** (non-Javadoc)
	 * @see or.kr.project.mvc.dao.ProjectDao#donate(or.kr.project.dto.ProjectDonateVO)
	 * �Ŀ��߰� - �Ŀ��ڼ� ���� / ���� �ݾ� ������Ʈ�� ���ݴϴ�.
	 * @param ProjectDonateVO vo
	 */
	@Override
	// ������Ʈ�� �Ŀ��� �ϴ� �޼ҵ�2
	public void donate(ProjectDonateVO vo) {
		ss.insert("project.donate", vo);
		ss.update("project.prodput", vo);

		ss.update("project.projectFundCnt", vo);
		ss.update("project.projectCurCost", vo);

	}

	// ���������� - �Ŀ���Ȳ
	/** (non-Javadoc)
	 * @see or.kr.project.mvc.dao.ProjectDao#myDonateProject(or.kr.project.dto.SearchVO)
	 * �������������� �Ŀ� ��� ����Ʈ�� �����ݴϴ�.
	 * @param SearchVO vo
	 * @return List<HashMap>
	 */
	@Override
	public List<HashMap> myDonateProject(SearchVO vo) {
		return ss.selectList("paging.mydonate", vo);
	}

	// ������ ������Ʈ �� ����
	/** (non-Javadoc)
	 * @see or.kr.project.mvc.dao.ProjectDao#myDonateCount(or.kr.project.dto.SearchVO)
	 * �������������� �Ŀ� ����Ʈ �� ������ �����ݴϴ�.
	 * @param SearchVO vo
	 * @return int
	 */
	@Override
	public int myDonateCount(SearchVO vo) {
		return ss.selectOne("paging.mydonateTotal", vo);
	}

	// �Ŀ� ���1 (�� ��ȯ + ���� ��ȯ)
	/** (non-Javadoc)
	 * @see or.kr.project.mvc.dao.ProjectDao#returnMoney(or.kr.project.dto.ProjectDonateVO)
	 * �Ŀ� ��� - ����� �Ŀ� ������Ʈ�� ���� �����ɴϴ�.
	 * @param ProjectDonateVO vo
	 */
	@Override
	public void returnMoney(ProjectDonateVO vo) {
		Map<String, Integer> m = new HashMap<>();

		int total = ss.selectOne("project.mydonatelist", vo);
		vo.setDonateMoney(total);

		m.put("donateMoney", total);
		m.put("memberNo", vo.getMemberNo());
		ss.update("project.pmoneyminus", vo);
		ss.update("project.returnMoney", m);
		ss.update("project.prodout", vo);
	}

	// ������Ʈ �Ŀ��� ���� + �Ŀ��� ����
	/** (non-Javadoc)
	 * @see or.kr.project.mvc.dao.ProjectDao#returnFundCnt(or.kr.project.dto.ProjectDonateVO)
	 * �Ŀ� ��� - �Ŀ��� ���� / �Ŀ��� ������ ���ݴϴ�.
	 * @param ProjectDonateVO vo
	 */
	@Override
	public void returnFundCnt(ProjectDonateVO vo) {
		ss.update("project.returnFundCnt", vo);
	}

	// �Ŀ� ���2 (�� ����)
	/** (non-Javadoc)
	 * @see or.kr.project.mvc.dao.ProjectDao#donateCancle(or.kr.project.dto.ProjectDonateVO)
	 * �Ŀ� ��� - ���ǿ��� ������ ȸ�� ��ȣ�� �Ŀ� ��ȣ�� ��ġ�ϸ� ���� �����մϴ�.
	 * @param ProjectDonateVO vo
	 */
	@Override
	public void donateCancle(ProjectDonateVO vo) {
		ss.delete("project.cancle", vo);
	}

	@Override
	public ProjectVO projectlist(String num) {
		return ss.selectOne("project.list", num);
	}

	@Override
	public List<CategoryVO> categoryLookAround() {
		return ss.selectList("project.lookaround");
	}

	// ������Ʈ ��� ���
	@Override
	public void replyInsert(ReplyVO vo) {
		ss.insert("project.replyInsert", vo);
	}

	// ��� ����Ʈ ������
	@Override
	public List<ReplyVO> replyList(String i) {
		return ss.selectList("project.replyList", i);

	}

	// ��� ������Ʈ �ѷ����� -����¡ ó��
	@Override
	public List<ProjectVO> projectALLlist(SearchVO vo) {
		return ss.selectList("paging.AllList", vo);
	}

	// ��� ������Ʈ �� ����
	@Override
	public int getTotalCount() {
		return ss.selectOne("paging.listTotal");

	}

	// ���������� - �������� ������Ʈ ����Ʈ
	@Override
	public List<ProjectVO> myProjectlist(SearchVO vo) {
		return ss.selectList("paging.myProjectlist", vo);
	}

	// ���������� - �������� ������Ʈ ����Ʈ �Ѱ� ��
	@Override
	public int myPTotalCount(SearchVO vo) {
		return ss.selectOne("paging.myPlistTotal", vo);
	}

	// ����������-�������� ���� 1218 ����
	@Override
	public int editMyInfo(HashMap<String, String> vo) {
		return ss.update("project.editinfo", vo);
	}

	// ī�װ��� ������Ʈ�� �� ���ϱ�
	@Override
	public int getCategoryCount(int categoryNo) {
		return ss.selectOne("paging.listCategory", categoryNo);
	}

	// ī�װ��� ������Ʈ ����
	@Override
	public List<ProjectVO> lookCategoryProject(Map<String, String> categoryList) {
		List<ProjectVO> list = ss.selectList("paging.paginglist", categoryList);
		return list;
	}

	// 1214 �߰�
	// ī�װ��� ������Ʈ�� �� ���ϱ� (+���� ī�װ� 12/14 ��ټ� �߰�)
	@Override
	public int getCategoryCount2(SubCategoryVO vo) {
		return ss.selectOne("paging.listCategory2", vo);
	}

	// ī�װ��� ������Ʈ ���� + ���� ī�װ�
	@Override
	public List<ProjectVO> lookCategoryProject2(Map<String, String> categoryList) {
		List<ProjectVO> list = ss.selectList("paging.paginglist2", categoryList);
		return list;
	}

	// 1214 �߰� ��
	@Override
	public List<SubCategoryVO> subcaname(String categoryName) {
		return ss.selectList("project.subcaname", categoryName);
	}

	// �α� ������Ʈ ����
	@Override
	public List<ProjectVO> popularList() {
		return ss.selectList("project.popularList");
	}

	// ���ο� ������Ʈ ����
	@Override
	public List<ProjectVO> newList() {
		return ss.selectList("project.newList");
	}

	// �����ӹ� ������Ʈ ����
	@Override
	public List<ProjectVO> deadlineList() {
		return ss.selectList("project.deadlineList");
	}

	// ��� ������Ʈ ��ġ
	@Override
	public List<ProjectVO> getListSearch(SearchVO svo) {
		return ss.selectList("search.aplsearch", svo);
	}

	// ��� �������� ��ġ �� ����
	@Override
	public int getTotalCount(SearchVO svo) {
		return ss.selectOne("search.aplcount", svo);
	}

	// �� �Ŀ���Ȳ ��ġ
	@Override
	public List<HashMap> donateListSearch(SearchVO svo) {
		List<HashMap> list = ss.selectList("search.mdlsearch", svo);
		return list;
	}

	// �� �Ŀ���Ȳ ��ġ �� ����
	@Override
	public int donateTotalCount(SearchVO vo) {
		return ss.selectOne("search.mdlcount", vo);
	}

	// ���� ���� ������Ʈ ��ġ
	@Override
	public List<ProjectVO> myprojectListSearch(SearchVO svo) {
		return ss.selectList("search.mypsearch", svo);
	}

	// ���� ���� ������Ʈ ��ġ �� ����
	@Override
	public int mypsearchTotalCount(SearchVO vo) {
		return ss.selectOne("search.mypcount", vo);
	}

	// ȸ������
	@Override
	public void addMember(MemberVO vo) {
		ss.insert("project.addMember", vo);
	}

	// ���̺� �Ŀ� ī�װ� �׷��� ����
	@Override
	public Map<Integer, Integer> ageGraph() {
		Map<Integer, Integer> map = (Map<Integer, Integer>) ss.selectList("graph.ageGraph");
		return map;
	}

	// ȸ������ �������� 1218
	@Override
	public MemberVO viewmember(String s) {
		return ss.selectOne("project.viewmember", s);
	}

	// ����� ��û 1221
	@Override
	public void request(int i) {
		ss.update("project.request", i);
		ss.delete("project2.delreason", i);
	}

	// ����źδ��� ������Ʈ ���� 1221
	@Override
	public void prodel(int i) {
		ss.delete("project2.delreason", i); // ������Ʈ ���� ���� ����
		ss.delete("project.proddel", i); // ������Ʈ�� ���õ� ��ǰ���� ����
		ss.delete("project.prodel", i); // ������Ʈ ����
	}

	// ĳ�� ������ - ĳ�� ����
	@Override
	public void charge(MemberVO vo) {
		ss.update("project.cashcharge", vo);
	}

	// ĳ�� ������ ����Ʈ
	@Override
	public MemberVO chargeList(int memberNo) {
		return ss.selectOne("project.cashlist", memberNo);
	}

	// ���̵� �ߺ� �˻�
	@Override
	public int memberIdCheck(String memberId) {
		return ss.selectOne("project.memberIdCheck", memberId);
	}

	// ī�װ� �� ���
	@Override
	public String categoryName(int categoryNo) {
		return ss.selectOne("project.categoryName", categoryNo);
	}

	// ����ī�װ� �� ���
	@Override
	public String subCategoryName(int SubCategoryNo) {
		return ss.selectOne("project.subCategoryName", SubCategoryNo);
	}

	// ����� ������� ���� ��� (�̹���, ĳ��)
	@Override
	public MemberVO userInfo(String memberId) {
		return ss.selectOne("project.userInfo", memberId);
	}

	// �ڱ� ������Ʈ�� �Ŀ��� ��� ��� ����
	@Override
	public List<MemberVO> projectDonateList(int projectNo) {
		return ss.selectList("project.projectDonateList", projectNo);
	}

	// �ڱ� ������Ʈ�� �Ŀ��� ��� ��� ����(�����ٿ�ε�)
	@Override
	public List<MemberVO> DonateListexcel(HashMap<String, String> vo) {
		return ss.selectList("project.DonateListexcel", vo);
	}

	// ��� ����
	@Override
	public int comupdate(HashMap<String, String> vo) {
		int ret = ss.update("project.commodify", vo);
		return ret;
	}

	// ��� ���� �˾�
	@Override
	public ReplyVO compopup(HashMap<String, String> vo) {
		return ss.selectOne("project.commodi", vo);
	}

	// ��� ����
	@Override
	public void comdelete(ReplyVO vo) {
		ss.delete("project.comdelete", vo);
	}

	// �󼼺��� - ���ɺ� ����Ʈ����
	@Override
	public List<ProjectVO> projectlistByCategory(String category) {
		return ss.selectList("project.listByCategory", category);
	}

}
