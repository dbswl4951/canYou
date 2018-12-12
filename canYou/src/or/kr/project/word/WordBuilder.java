package or.kr.project.word;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.math.BigInteger;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hwpf.converter.AbstractWordConverter;
import org.apache.poi.hwpf.usermodel.Paragraph;
import org.apache.poi.xwpf.usermodel.ParagraphAlignment;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;
import org.apache.poi.xwpf.usermodel.XWPFTableCell.XWPFVertAlign;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTblWidth;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STMerge;

import or.kr.project.dto.MemberVO;
import or.kr.project.dto.ProductVO;
import or.kr.project.dto.ProjectDonateVO;
import or.kr.project.dto.ProjectVO;

public class WordBuilder{
	// �ּ� �κ� vo �ؾ���
	public void wordCD(/*Map<String, Object> map, */HttpServletRequest req, HttpServletResponse resp) throws Exception {
		/*// ������Ʈ �������� ������ ���� vo ��ü �޾ƿ���
		MemberVO mvo = (MemberVO)map.get("member");
		ProjectVO pvo = (ProjectVO)map.get("project");
		ProjectDonateVO dvo = (ProjectDonateVO)map.get("projectDonate");
		@SuppressWarnings("unchecked")
		List<ProductVO> list = (List<ProductVO>)map.get("productList");*/
		
		// �� ���� �����
		XWPFDocument document = new XWPFDocument();
		
		// Table ���� ���� �������� position�� 0
		XWPFTable table = document.createTable(16,3);
		
		// table�� ũ�⸦ setting�ϱ� ���� ������
		table.setWidth(7*1440);
		table.getCTTbl().addNewTblGrid().addNewGridCol().setW(BigInteger.valueOf(5*1440));
		
		// 0���� ũ�� ���� 0���� ũ��� ���� ���� �����̹Ƿ� ���� ���� ��� �� ������ ����
		CTTblWidth tblWidth = table.getRow(0).getCell(0).getCTTc().addNewTcPr().addNewTcW();
		tblWidth.setW(BigInteger.valueOf(7*1440));
		
		// ������ ����, ����
		// ù��° �� ������ �� ����
		mergeCellHorizontally(table, 0, 0, 2);
		// �ι�° �� ������ �� ����
		mergeCellHorizontally(table, 1, 0, 2);
		// ������° �� ������ �� ����
		mergeCellHorizontally(table, 7, 0, 2);
		// ���׹�°�� ������ �� ����
		mergeCellHorizontally(table, 13, 0, 2);
		// ���ټ���° �� ������ �� ����
		mergeCellHorizontally(table, 14, 0, 2);
		
		// Table ù��° ��
		XWPFTableRow firstRow = table.getRow(0);
		firstRow.getCell(0).setColor("3366FF");
		firstRow.getCell(0).setVerticalAlignment(XWPFVertAlign.CENTER);

		XWPFParagraph paragraph = firstRow.getCell(0).getParagraphs().get(0);
		paragraph.setAlignment(ParagraphAlignment.CENTER);
		
		XWPFRun paragraphRunOne = paragraph.createRun();
		paragraphRunOne.setBold(true);
		paragraphRunOne.setFontSize(16);
		paragraphRunOne.setText("������Ʈ ����");

		// Table �ι�° ��
		XWPFTableRow secondRow = table.getRow(1);
		secondRow.getCell(0).setVerticalAlignment(XWPFVertAlign.CENTER);
		
		paragraph = secondRow.getCell(0).getParagraphs().get(0);
		paragraph.setAlignment(ParagraphAlignment.CENTER);
		
		paragraphRunOne = paragraph.createRun();
		paragraphRunOne.setBold(true);
		paragraphRunOne.setFontSize(11);
		paragraphRunOne.setText("������ ����");
		
		// Table ����° ��
		XWPFTableRow thirdRow = table.getRow(2);
		thirdRow.getCell(0).setText("������ �̹���");
		thirdRow.getCell(1).setText("������ �̸�");
		thirdRow.getCell(2).setText("������"/*mvo.getMemberName()*/);
		
		XWPFTableRow fourthRow = table.getRow(3);
		fourthRow.getCell(1).setText("������ ��ȭ��ȣ");
		fourthRow.getCell(2).setText("010-7156-1122" /*mvo.getMemberPhone()*/);
		
		XWPFTableRow fifthRow = table.getRow(4);
		fifthRow.getCell(1).setText("������ �̸���");
		fifthRow.getCell(2).setText("chomu2004@naver,com" /*mvo.getMemberEmail()*/);
		
		XWPFTableRow sixthRow = table.getRow(5);
		sixthRow.getCell(1).setText("������ ����");
		sixthRow.getCell(2).setText("��" /*mvo.getMemberGender()*/);
		
		XWPFTableRow seventhRow = table.getRow(6);
		seventhRow.getCell(1).setText("������ ����");
		seventhRow.getCell(2).setText("25" /*mvo.getMemberAge()*/);
		
		// ������ �̹��� �κ� ���� ���ļ� �ϳ���
		mergeCellVertically(table, 0, 2, 6);
		
		for(int i=2;i<=6;i++) {
			table.getRow(i).getCell(1).setColor("6699FF");
		}
		
		// ������Ʈ ���� �κ�
		XWPFTableRow eighthRow = table.getRow(7);
		eighthRow.getCell(0).setVerticalAlignment(XWPFVertAlign.CENTER);
		
		paragraph = eighthRow.getCell(0).getParagraphs().get(0);
		paragraph.setAlignment(ParagraphAlignment.CENTER);
		
		paragraphRunOne = paragraph.createRun();
		paragraphRunOne.setBold(true);
		paragraphRunOne.setFontSize(11);
		paragraphRunOne.setText("������Ʈ ����");
		
		XWPFTableRow ninethRow = table.getRow(8);
		ninethRow.getCell(0).setText("������Ʈ ��ǥ �̹���");
		ninethRow.getCell(1).setText("������Ʈ ���");
		ninethRow.getCell(2).setText("A" /*pvo.getProjectStep()*/);
		
		XWPFTableRow tenRow = table.getRow(9);
		tenRow.getCell(1).setText("������Ʈ �̸�");
		tenRow.getCell(2).setText("���ִ� ������" /*pvo.getProjectName()*/);
		
		XWPFTableRow elevenRow = table.getRow(10);
		elevenRow.getCell(1).setText("������Ʈ ���� ��¥");
		elevenRow.getCell(2).setText("18.12.07" /*pvo.getProjectStartDate()*/);
		
		XWPFTableRow twelveRow = table.getRow(11);
		twelveRow.getCell(1).setText("������Ʈ ���� ��¥");
		twelveRow.getCell(2).setText("18.12.28" /*pvo.getProjectEndDate()*/);
		
		XWPFTableRow thirteenRow = table.getRow(12);
		thirteenRow.getCell(1).setText("������Ʈ Ȱ�� ����");
		thirteenRow.getCell(2).setText("���� ������ ����" /*�̰ž�����*/);
		
		// ������Ʈ ������ �̹��� ���� �κ�
		mergeCellVertically(table, 0, 8, 12);
		
		for(int i=8;i<=12;i++) {
			table.getRow(i).getCell(1).setColor("6699FF");
		}
		
		// ������Ʈ ������, ���丮
		XWPFTableRow fourteenRow = table.getRow(13);
		fourteenRow.getCell(0).setVerticalAlignment(XWPFVertAlign.CENTER);
		
		paragraph = fourteenRow.getCell(0).getParagraphs().get(0);
		paragraph.setAlignment(ParagraphAlignment.CENTER);
		
		paragraphRunOne = paragraph.createRun();
		paragraphRunOne.setBold(true);
		paragraphRunOne.setFontSize(11);
		paragraphRunOne.setText("������Ʈ ������ �� ���丮");
		
		XWPFTableRow fifteenRow = table.getRow(14);
		fifteenRow.getCell(0).setText("������Ʈ ���丮 ���ñ⹹�ñ�" /*pvo.getProjectStory()*/);
				
		// ��ǰ �� ����
		XWPFTableRow sixteenRow = table.getRow(15);
		sixteenRow.getCell(0).setVerticalAlignment(XWPFVertAlign.CENTER);
		
		paragraph = sixteenRow.getCell(0).getParagraphs().get(0);
		paragraph.setAlignment(ParagraphAlignment.CENTER);
		
		paragraphRunOne = paragraph.createRun();
		paragraphRunOne.setBold(true);
		paragraphRunOne.setFontSize(11);
		paragraphRunOne.setText("������Ʈ ��ǰ");
		
		mergeCellHorizontally(table, 15, 0, 2);
		
		/*// ��ǰ ���� ǥ �����
		for (ProductVO productVO : list) {
			// ������ ������Ʈ ��ǰ�� ���� ����
			XWPFTableRow list_Row = table.getRow(15);
			list_Row.getCell(0).setVerticalAlignment(XWPFVertAlign.CENTER);
			
			paragraph = list_Row.getCell(0).getParagraphs().get(0);
			paragraph.setAlignment(ParagraphAlignment.CENTER);
			
			paragraphRunOne = paragraph.createRun();
			paragraphRunOne.setBold(true);
			paragraphRunOne.setFontSize(11);
			paragraphRunOne.setText("������Ʈ ��ǰ");
			
			// ��ǰ ���� ��
			list_Row = table.createRow();
			list_Row.getCell(0).setVerticalAlignment(XWPFVertAlign.CENTER);
			
			paragraph = list_Row.getCell(0).getParagraphs().get(0);
			paragraph.setAlignment(ParagraphAlignment.CENTER);
			paragraphRunOne = paragraph.createRun();
			paragraphRunOne.setFontSize(10);
			paragraphRunOne.setText("��ǰ ����"); // 1�� �Ϸ�
			
			paragraph = list_Row.createCell().getParagraphs().get(0);
			paragraph.setAlignment(ParagraphAlignment.CENTER);
			paragraphRunOne = paragraph.createRun();
			paragraphRunOne.setFontSize(10);
			paragraphRunOne.setText(Integer.toString(productVO.getProductCnt())); // 1�� �Ϸ�
			
			// ��ǰ ���� �� 3
			paragraph = list_Row.createCell().getParagraphs().get(0);
			
		}*/
		
		System.out.println("create_table ����!");
		
		// ���� ������ ���� ����Ÿ�԰� ��� ����
		resp.setContentType("Application/Msword");
		resp.setHeader("Content-Disposition",
				"attachment; filename=create_table.docx");
		
		// ��û�� ���������� �ƿ�ǲ ��Ʈ�� ����
		OutputStream outStream = resp.getOutputStream();
		
		document.write(outStream);
		outStream.close();
		System.out.println("create_table ����!");
	}
	//���� �κ��� ���� ��ġ�� �Լ�
		private static void mergeCellVertically(XWPFTable table, int col, int fromRow, int toRow){
		    for(int rowIndex = fromRow; rowIndex <= toRow; rowIndex++){
		        XWPFTableCell cell = table.getRow(rowIndex).getCell(col);
		        if(rowIndex == fromRow){
		        	// ��ġ�� �����ϴ� ó�� ���μ��� RESTART�� ����
		            cell.getCTTc().addNewTcPr().addNewVMerge().setVal(STMerge.RESTART);
		        }else{
		        	// ��ġ�� �����ϴ� ó�� ���μ��� CONTINUE�� ����
		            cell.getCTTc().addNewTcPr().addNewVMerge().setVal(STMerge.CONTINUE);
		        }
		    }
		}
		
		//���� �κ��� ���� ��ġ�� �Լ�
		private static void mergeCellHorizontally(XWPFTable table, int row, int fromCol, int toCol){
		    for(int colIndex = fromCol; colIndex <= toCol; colIndex++){
		        XWPFTableCell cell = table.getRow(row).getCell(colIndex);
		        if(colIndex == fromCol){
		            // ��ġ�� �����ϴ� ó�� ���μ��� RESTART�� ����
		            cell.getCTTc().addNewTcPr().addNewHMerge().setVal(STMerge.RESTART);
		        }else{
		        	// �������� ���� ���� CONTINUE�� ����
		            cell.getCTTc().addNewTcPr().addNewHMerge().setVal(STMerge.CONTINUE);
		        }
		    }
		}
		
		private static void create_Product_Row(XWPFTable table, XWPFParagraph paragraph, 
				XWPFRun paragraphRunOne, ProductVO productVO, String setText) {
			// ��ǰ ���� ��
			XWPFTableRow list_Row = table.createRow();
			list_Row.getCell(0).setVerticalAlignment(XWPFVertAlign.CENTER);
			
			paragraph = list_Row.getCell(0).getParagraphs().get(0);
			paragraph.setAlignment(ParagraphAlignment.CENTER);
			paragraphRunOne = paragraph.createRun();
			paragraphRunOne.setFontSize(10);
			paragraphRunOne.setText(setText); // 1�� �Ϸ�
			
			paragraph = list_Row.createCell().getParagraphs().get(0);
			paragraph.setAlignment(ParagraphAlignment.CENTER);
			paragraphRunOne = paragraph.createRun();
			paragraphRunOne.setFontSize(10);
			paragraphRunOne.setText(Integer.toString(productVO.getProductCnt())); // 1�� �Ϸ�			
		}
}


