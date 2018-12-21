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

@Repository
public class projectDaoImple implements projectDao {
	@Autowired
	private SqlSessionTemplate ss;

	public List<CategoryVO> casel() {
		return ss.selectList("project.casel"); // ī�װ� �̸� �������� sql��
	}

	public List<SubCategoryVO> subcasel(int i) {
		return ss.selectList("project.subcasel", i);
	}

	public MemberVO memname(String s) { // ȸ���� �������� �������� ���� sql��(ȸ�� ���̵�� ������)
		return ss.selectOne("project.memname", s);
	}

	public MemberVO memname2(int i) {
		return ss.selectOne("project.memname2", i); // ȸ���� �������� �������� ���� sql�� (ȸ�� ��ȣ�� ������)
	}

	public void proin(ProjectVO vo) { // ������Ʈ insert��
		ss.insert("project.proin", vo);
	}

	public void prodin(ProductVO vo) { // ��ǰ insert��
		ss.insert("project.prodin", vo);
	}

	public List<ProductVO> prodsel(String s) { // ��ǰ select��
		return ss.selectList("project.prodsel", s);
	}

	public ProjectVO modifyview(ProjectVO vo) {
		return ss.selectOne("project.modifyview", vo);
	}

	public void modify(ProjectVO vo) {
		ss.update("project.modify", vo);
	}

	public String caselone(int i) {
		return ss.selectOne("project.caselone", i);
	}

	public String subcaselone(int i) {
		return ss.selectOne("project.subcaselone", i);
	}

	public int prodcost(int i) {
		return ss.selectOne("project.prodcost", i);
	}

	// ������Ʈ�� �Ŀ��ϴ� �޼ҵ� 1 (�� ����)
	public void donateMoney(Map<String, Integer> m) {
		ss.update("project.donateMoney", m);
		// System.out.println("donateNo : "+m);
	}

	// ������Ʈ�� �Ŀ��� �ϴ� �޼ҵ�2
	public void donate(ProjectDonateVO vo) {
		ss.insert("project.donate", vo); // �Ŀ�
		ss.update("project.prodput", vo); // ��ǰ�� ����

		ss.update("project.projectFundCnt", vo); // ������Ʈ�� ī��Ʈ ���� �ϳ� �ø�
		ss.update("project.projectCurCost", vo); // ������Ʈ�� ���� �ݾ��� �ø�

	}

	// ���������� - �Ŀ���Ȳ
	public List<HashMap> myDonateProject(SearchVO vo) {
		System.out.println("���� �ѹ� ��:" + vo);
		List<HashMap> list = ss.selectList("paging.mydonate", vo);
		return list;
	}

	// ������ ������Ʈ �� ����
	public int myDonateCount(SearchVO vo) {
		return ss.selectOne("paging.mydonateTotal", vo);

	}

	// �Ŀ� ���1 (�� ��ȯ + ���� ��ȯ) 1219 ����
	public void returnMoney(ProjectDonateVO vo) {
		Map<String, Integer> m = new HashMap<>();

		// ���� ��ȯ�ϱ� ���� ����� ������Ʈ�� ������ ���� ������
		int total = ss.selectOne("project.mydonatelist", vo);
		vo.setDonateMoney(total);

		m.put("donateMoney", total);
		m.put("memberNo", vo.getMemberNo());
		System.out.println("productno : " + vo.getProductNo());
		ss.update("project.pmoneyminus", vo); // ������Ʈ�� ���� ��
		ss.update("project.returnMoney", m); // ��ȯ�ؼ� ȸ���� ������ �߰�������
		ss.update("project.prodout", vo); // ��ǰ ���� ��
	}

	// ������Ʈ �Ŀ��� ���� + �Ŀ��� ����
	public void returnFundCnt(ProjectDonateVO vo) {
		ss.update("project.returnFundCnt", vo); // ������Ʈ�� ī��Ʈ ���� �ϳ� ����
	}

	// �Ŀ� ���2 (�� ����)
	public void donateCancle(ProjectDonateVO vo) {
		ss.delete("project.cancle", vo); // �Ŀ� ���
	}

	public ProjectVO projectlist(String num) {
		return ss.selectOne("project.list", num);
	}

	public List<CategoryVO> categoryLookAround() {
		return ss.selectList("project.lookaround");
	}

	// ������Ʈ ��� ���

	public void replyInsert(ReplyVO vo) {
		ss.insert("project.replyInsert", vo);
	}

	// ��� ����Ʈ ������

	public List<ReplyVO> replyList(String i) {
		return ss.selectList("project.replyList", i);

	}

	// ��� ������Ʈ �ѷ����� -����¡ ó��
	public List<ProjectVO> projectALLlist(SearchVO vo) {
		return ss.selectList("paging.AllList", vo);
	}

	// ��� ������Ʈ �� ����
	public int getTotalCount() {
		return ss.selectOne("paging.listTotal");

	}

	// ���������� - �������� ������Ʈ ����Ʈ
	public List<ProjectVO> myProjectlist(SearchVO vo) {
		System.out.println("begin : " + vo.getBegin());
		System.out.println("End : " + vo.getEnd());
		return ss.selectList("paging.myProjectlist", vo);
	}

	// ���������� - �������� ������Ʈ ����Ʈ �Ѱ� ��
	public int myPTotalCount(SearchVO vo) {
		return ss.selectOne("paging.myPlistTotal", vo);
	}

	// ����������-�������� ���� 1218 ����
	public int editMyInfo(HashMap<String, String> vo) {
		return ss.update("project.editinfo", vo);
	}

	// ī�װ��� ������Ʈ�� �� ���ϱ�
	public int getCategoryCount(int categoryNo) {
		return ss.selectOne("paging.listCategory", categoryNo);
	}

	// ī�װ��� ������Ʈ ����
	public List<ProjectVO> lookCategoryProject(Map<String, String> categoryList) {
		System.out.println("-----------------------------");
		System.out.println(categoryList.get("categoryNo"));
		System.out.println(categoryList.get("begin"));
		System.out.println(categoryList.get("end"));
		System.out.println("-----------------------------");

		List<ProjectVO> list = ss.selectList("paging.paginglist", categoryList);
		System.out.println("list size : " + list.size());

		return list;
	}

	// 1214 �߰�
	// ī�װ��� ������Ʈ�� �� ���ϱ� (+���� ī�װ� 12/14 ��ټ� �߰�)
	public int getCategoryCount2(SubCategoryVO vo) {
		return ss.selectOne("paging.listCategory2", vo);
	}

	// ī�װ��� ������Ʈ ���� + ���� ī�װ�
	public List<ProjectVO> lookCategoryProject2(Map<String, String> categoryList) {
		System.out.println("-----------------------------");
		System.out.println(categoryList.get("categoryNo"));
		System.out.println(categoryList.get("begin"));
		System.out.println(categoryList.get("end"));
		System.out.println("-----------------------------");

		List<ProjectVO> list = ss.selectList("paging.paginglist2", categoryList);
		System.out.println("list size : " + list.size());

		return list;
	}

	// 1214 �߰� ��
	public List<SubCategoryVO> subcaname(String categoryName) {
		return ss.selectList("project.subcaname", categoryName);
	}

	// �α� ������Ʈ ����
	public List<ProjectVO> popularList() {
		return ss.selectList("project.popularList");
	}

	// ���ο� ������Ʈ ����
	public List<ProjectVO> newList() {
		return ss.selectList("project.newList");
	}

	// �����ӹ� ������Ʈ ����
	public List<ProjectVO> deadlineList() {
		return ss.selectList("project.deadlineList");
	}

	// ��� ������Ʈ ��ġ
	public List<ProjectVO> getListSearch(SearchVO svo) {
		return ss.selectList("search.aplsearch", svo);
	}

	// ��� �������� ��ġ �� ����
	public int getTotalCount(SearchVO svo) {
		return ss.selectOne("search.aplcount", svo);
	}

	// �� �Ŀ���Ȳ ��ġ
	public List<HashMap> donateListSearch(SearchVO svo) {
		List<HashMap> list = ss.selectList("search.mdlsearch", svo);
		return list;
	}

	// �� �Ŀ���Ȳ ��ġ �� ����
	public int donateTotalCount(SearchVO vo) {
		return ss.selectOne("search.mdlcount", vo);
	}

	// ���� ���� ������Ʈ ��ġ
	public List<ProjectVO> myprojectListSearch(SearchVO svo) {
		return ss.selectList("search.mypsearch", svo);
	}

	// ���� ���� ������Ʈ ��ġ �� ����
	public int mypsearchTotalCount(SearchVO vo) {
		return ss.selectOne("search.mypcount", vo);
	}

	// ȸ������
	public void addMember(MemberVO vo) {
		ss.insert("project.addMember", vo);
	}

	// ���̺� �Ŀ� ī�װ� �׷��� ����
	public Map<Integer, Integer> ageGraph() {
		Map<Integer, Integer> map = (Map<Integer, Integer>) ss.selectList("graph.ageGraph");

		return map;
	}

	// ȸ������ �������� 1218
	public MemberVO viewmember(String s) {
		return ss.selectOne("project.viewmember", s);
	}


	// ����� ��û 1221
	public void request(int i) {
		ss.update("project.request", i);
		ss.delete("project2.delreason", i);
	}

	// ����źδ��� ������Ʈ ���� 1221
	public void prodel(int i) {
		ss.delete("project2.delreason", i); // ������Ʈ ���� ���� ����
		ss.delete("project.proddel", i); // ������Ʈ�� ���õ� ��ǰ���� ����
		ss.delete("project.prodel", i); // ������Ʈ ����
	}

	// ĳ�� ������ - ĳ�� ����
	public void charge(MemberVO vo) {
		ss.update("project.cashcharge", vo);
	}

	// ĳ�� ������ ����Ʈ
	public List<MemberVO> chargeList(MemberVO vo) {
		return ss.selectList("project.cashlist", vo);
	}

	// ���̵� �ߺ� �˻�
	public int memberIdCheck(String memberId) {
		return ss.selectOne("project.memberIdCheck", memberId);
	}

	// ī�װ� �� ���
	public String categoryName(int categoryNo) {
		return ss.selectOne("project.categoryName", categoryNo);
	}

	// ����ī�װ� �� ���
	public String subCategoryName(int SubCategoryNo) {
		return ss.selectOne("project.subCategoryName", SubCategoryNo);
	}

	// ����� ������� ���� ��� (�̹���, ĳ��)
	public MemberVO userInfo(String memberId) {
		return ss.selectOne("project.userInfo", memberId);
	}

	// �ڱ� ������Ʈ�� �Ŀ��� ��� ��� ����
	public List<MemberVO> projectDonateList(int projectNo) {
		return ss.selectList("project.projectDonateList", projectNo);
	}

	// ��� ����
	public int comupdate(HashMap<String, String> vo) {
		int ret = ss.update("project.commodify", vo);
		return ret;
	}

	// ��� ���� �˾�
	public ReplyVO compopup(HashMap<String, String> vo) {
		return ss.selectOne("project.commodi", vo);
	}

	// ��� ����
	public void comdelete(ReplyVO vo) {
		ss.delete("project.comdelete", vo);
	}

	// �󼼺��� - ���ɺ� ����Ʈ����
	public List<ProjectVO> projectlistByCategory(String category) {
		System.out.println("category : " + category);
		return ss.selectList("project.listByCategory", category);
	}

}
