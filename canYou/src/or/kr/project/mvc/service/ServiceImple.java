package or.kr.project.mvc.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Service;
import or.kr.project.dto.ProjectDonateVO;
import or.kr.project.mvc.dao.ProjectDaoImple;
import or.kr.project.mvc.service.Service_Transaction;


@Transactional(propagation=Propagation.REQUIRED,
rollbackFor=Exception.class,readOnly = true)
@Service
public class ServiceImple implements Service_Transaction {
	@Autowired
	ProjectDaoImple dao;
	
	@Override
	public void cancle(ProjectDonateVO vo) {
		// ������� ���� ��ȯ + ���� ���� ������
		dao.returnMoney(vo);
		// �Ŀ��� �� ����
		dao.returnFundCnt(vo);
		// �� ���� �� �Ŀ� �� ����
		dao.donateCancle(vo);
	}
	
	@Override
	public void donate(ProjectDonateVO vo, Map<String, Integer> m) {
		dao.donate(vo); // projectDonate �� �߰�
		dao.donateMoney(m); // �Ŀ��� ����� ������ �ִ� �ݾ��� ��������
	}

}
