package or.kr.project.word;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.math.BigInteger;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Nullable;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hwpf.converter.AbstractWordConverter;
import org.apache.poi.hwpf.usermodel.Paragraph;
import org.apache.poi.util.Units;
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
	int row;
	public static String profileImg;
	public static String projectImg;
	
	// �ּ� �κ� vo �ؾ���
	public void wordCD(MemberVO vo, HttpServletRequest req, 
			HttpServletResponse resp, HttpSession session) throws Exception {
		// ������ ������� �ʱ�ȭ �۾�.
		row = 0;
		
		List<ProductVO> list = vo.getProject().getProduct();
		
		// �̹��� ���� �۾��� ���� �� �غ�
		profileImg = vo.getMemberImage();
		projectImg = vo.getProject().getProjectMainImage();
		
		// jsp�� �Ǿ��ִ� ������ ���忡 �ۼ��ϱ� ���� �ٲ�
		HashMap<String, Object> map = jsp_To_Word(vo.getProject().getProjectStory());
		String[] projectStory = (String[])map.get("story"); 
		ArrayList<String> image = (ArrayList<String>)map.get("image");
		
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
		XWPFTableRow firstRow = table.getRow(row++); //0
		firstRow.getCell(0).setColor("3366FF");
		firstRow.getCell(0).setVerticalAlignment(XWPFVertAlign.CENTER);

		XWPFParagraph paragraph = firstRow.getCell(0).getParagraphs().get(0);
		paragraph.setAlignment(ParagraphAlignment.CENTER);
		
		XWPFRun paragraphRunOne = paragraph.createRun();
		paragraphRunOne.setBold(true);
		paragraphRunOne.setFontSize(16);
		paragraphRunOne.setText("������Ʈ ����");

		// Table �ι�° ��
		XWPFTableRow secondRow = table.getRow(row++); //1
		secondRow.getCell(0).setVerticalAlignment(XWPFVertAlign.CENTER);
		
		paragraph = secondRow.getCell(0).getParagraphs().get(0);
		paragraph.setAlignment(ParagraphAlignment.CENTER);
		
		paragraphRunOne = paragraph.createRun();
		paragraphRunOne.setBold(true);
		paragraphRunOne.setFontSize(11);
		paragraphRunOne.setText("������ ����");
		
		// Table ����° ��
		XWPFTableRow thirdRow = table.getRow(row++); //2
		
		// �̹��� �ֱ�
		paragraph = thirdRow.getCell(0).getParagraphs().get(0);
		paragraphRunOne = paragraph.createRun();
		FileInputStream fis = new FileInputStream(
				session.getServletContext().getRealPath("/resources/images")+"\\"+profileImg);
		paragraphRunOne.addPicture(fis, 
				XWPFDocument.PICTURE_TYPE_JPEG, profileImg,
				Units.toEMU(150), Units.toEMU(170));
		fis.close();
		
		thirdRow.getCell(1).setText("������ �̸�");
		thirdRow.getCell(2).setText(vo.getMemberName());
		
		XWPFTableRow fourthRow = table.getRow(row++); //3
		fourthRow.getCell(1).setText("������ ��ȭ��ȣ");
		fourthRow.getCell(2).setText(vo.getMemberPhone());
		
		XWPFTableRow fifthRow = table.getRow(row++); //4
		fifthRow.getCell(1).setText("������ �̸���");
		fifthRow.getCell(2).setText(vo.getMemberEmail());
		
		XWPFTableRow sixthRow = table.getRow(row++); //5
		sixthRow.getCell(1).setText("������ ����");
		sixthRow.getCell(2).setText(vo.getMemberGender());
		
		XWPFTableRow seventhRow = table.getRow(row++); //6
		seventhRow.getCell(1).setText("������ ����");
		seventhRow.getCell(2).setText(Integer.toString(vo.getMemberAge()));
		
		// ������ �̹��� �κ� ���� ���ļ� �ϳ���
		mergeCellVertically(table, 0, 2, row-1);
		
		for(int i=2;i<=row-1;i++) {
			table.getRow(i).getCell(1).setColor("6699FF");
		}
		
		// ������Ʈ ���� �κ�
		XWPFTableRow eighthRow = table.getRow(row++); //7
		eighthRow.getCell(0).setVerticalAlignment(XWPFVertAlign.CENTER);
		
		paragraph = eighthRow.getCell(0).getParagraphs().get(0);
		paragraph.setAlignment(ParagraphAlignment.CENTER);
		
		paragraphRunOne = paragraph.createRun();
		paragraphRunOne.setBold(true);
		paragraphRunOne.setFontSize(11);
		paragraphRunOne.setText("������Ʈ ����");
		
		XWPFTableRow ninethRow = table.getRow(row++); //8
		
		//�̹��� �ֱ�
		paragraph = ninethRow.getCell(0).getParagraphs().get(0);
		paragraphRunOne = paragraph.createRun();
		fis = new FileInputStream(
				session.getServletContext().getRealPath("/resources/images")+"\\"+projectImg);
		paragraphRunOne.addPicture(fis, 
				XWPFDocument.PICTURE_TYPE_JPEG, projectImg,
				Units.toEMU(170), Units.toEMU(150));
		fis.close();
		
		ninethRow.getCell(1).setText("������Ʈ ���");
		ninethRow.getCell(2).setText(vo.getProject().getProjectStep());
		
		XWPFTableRow tenRow = table.getRow(row++); //9
		tenRow.getCell(1).setText("������Ʈ �̸�");
		tenRow.getCell(2).setText(vo.getProject().getProjectName());
		
		XWPFTableRow elevenRow = table.getRow(row++); //10
		elevenRow.getCell(1).setText("������Ʈ ���� ��¥");
		elevenRow.getCell(2).setText(vo.getProject().getProjectStartDate());
		
		XWPFTableRow twelveRow = table.getRow(row++); //11
		twelveRow.getCell(1).setText("������Ʈ ���� ��¥");
		twelveRow.getCell(2).setText(vo.getProject().getProjectEndDate());
		
		XWPFTableRow thirteenRow = table.getRow(row++); //12
		thirteenRow.getCell(1).setText("������Ʈ ��ǥ �ݾ�");
		thirteenRow.getCell(2).setText(Integer.toString(vo.getProject().getProjectCost()));
		
		// ������Ʈ ������ �̹��� ���� �κ�
		mergeCellVertically(table, 0, 8, row-1);
		
		for(int i=8;i<=row-1;i++) {
			table.getRow(i).getCell(1).setColor("6699FF");
		}
		
		// ������Ʈ ������, ���丮
		XWPFTableRow fourteenRow = table.getRow(row++); //13
		fourteenRow.getCell(0).setVerticalAlignment(XWPFVertAlign.CENTER);
		
		paragraph = fourteenRow.getCell(0).getParagraphs().get(0);
		paragraph.setAlignment(ParagraphAlignment.CENTER);
		
		paragraphRunOne = paragraph.createRun();
		paragraphRunOne.setBold(true);
		paragraphRunOne.setFontSize(11);
		paragraphRunOne.setText("������Ʈ ������ �� ���丮");
		
		XWPFTableRow fifteenRow = table.getRow(row++); //14
		
		paragraph = fifteenRow.getCell(0).getParagraphs().get(0);
		paragraph.setAlignment(ParagraphAlignment.LEFT);
		
		paragraphRunOne = paragraph.createRun();
		paragraphRunOne.setFontSize(10);
		// img �迭�� ���� ������ ���� ����
		int cnt=0;
		for(String str : projectStory) {
			if(str.equals("!ime")) {
				fis = new FileInputStream(
						session.getServletContext().getRealPath("/resources/images")+"\\"+image.get(cnt));
				paragraphRunOne.addPicture(fis, 
						XWPFDocument.PICTURE_TYPE_JPEG, image.get(cnt++), Units.toEMU(200), Units.toEMU(150));
				paragraphRunOne.addBreak();
			} else {
				paragraphRunOne.setText(str);
				paragraphRunOne.addBreak();
			}
		}		
				
		// ��ǰ �� ����
		XWPFTableRow sixteenRow = table.getRow(row++); //15
		sixteenRow.getCell(0).setVerticalAlignment(XWPFVertAlign.CENTER);
		
		paragraph = sixteenRow.getCell(0).getParagraphs().get(0);
		paragraph.setAlignment(ParagraphAlignment.CENTER);
		
		paragraphRunOne = paragraph.createRun();
		paragraphRunOne.setBold(true);
		paragraphRunOne.setFontSize(11);
		paragraphRunOne.setText("������Ʈ ��ǰ");
		
		mergeCellHorizontally(table, row-1, 0, 2);
		
		//16
		for (ProductVO productVO : list) {
			// ��ǰ ������ �����
			create_Product_Row(table, paragraph, paragraphRunOne, productVO);
		}
		
		// ���� ������ ���� ����Ÿ�԰� ��� ����
		resp.setContentType("Application/Msword");
		resp.setHeader("Content-Disposition",
				"attachment; filename="+"ProjectPlan.docx");
		
		// ��û�� ���������� �ƿ�ǲ ��Ʈ�� ����
		OutputStream outStream = resp.getOutputStream();
		document.write(outStream);
		outStream.close();
		
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
		
		private void create_Product_Row(XWPFTable table, XWPFParagraph paragraph, 
				XWPFRun paragraphRunOne, ProductVO productVO) {
			// row = 16
			// ��ǰ ���� �� ������
			XWPFTableRow list_Row = table.createRow();
			
			paragraph = list_Row.getCell(0).getParagraphs().get(0);
			paragraph.setAlignment(ParagraphAlignment.CENTER);
			paragraphRunOne = paragraph.createRun();
			paragraphRunOne.setFontSize(10);
			paragraphRunOne.setText(productVO.getProductName()); // 1�� �Ϸ�
			
			mergeCellHorizontally(table, row++, 0, 2);
			
			// ��ǰ ���� �� 1��
			list_Row = table.createRow();
			list_Row.getCell(0).setVerticalAlignment(XWPFVertAlign.CENTER);
			
			paragraph = list_Row.getCell(0).getParagraphs().get(0);
			paragraph.setAlignment(ParagraphAlignment.CENTER);
			paragraphRunOne = paragraph.createRun();
			paragraphRunOne.setFontSize(10);
			paragraphRunOne.setText("��ǰ ����"); // 1�� �Ϸ�
			
			paragraph = list_Row.getCell(1).getParagraphs().get(0);
			paragraph.setAlignment(ParagraphAlignment.CENTER);
			paragraphRunOne = paragraph.createRun();
			paragraphRunOne.setFontSize(10);
			paragraphRunOne.setText(Integer.toString(productVO.getProductCnt())); // 2�� �Ϸ�
			
			mergeCellHorizontally(table, row++, 1, 2);
			
			// ��ǰ ���� �� 2��
			list_Row = table.createRow();
			paragraph = list_Row.getCell(0).getParagraphs().get(0);
			paragraph.setAlignment(ParagraphAlignment.CENTER);
			paragraphRunOne = paragraph.createRun();
			paragraphRunOne.setFontSize(10);
			paragraphRunOne.setText("��ǰ ��"); // 1�� �Ϸ�
			
			paragraph = list_Row.getCell(1).getParagraphs().get(0);
			paragraph.setAlignment(ParagraphAlignment.CENTER);
			paragraphRunOne = paragraph.createRun();
			paragraphRunOne.setFontSize(10);
			paragraphRunOne.setText(productVO.getProductName()); // 2�� �Ϸ�
			
			mergeCellHorizontally(table, row++, 1, 2);
			
			// ��ǰ ���� �� 3��
			list_Row = table.createRow();
			paragraph = list_Row.getCell(0).getParagraphs().get(0);
			paragraph.setAlignment(ParagraphAlignment.CENTER);
			paragraphRunOne = paragraph.createRun();
			paragraphRunOne.setFontSize(10);
			paragraphRunOne.setText("��ǰ ����"); // 1�� �Ϸ�
			
			paragraph = list_Row.getCell(1).getParagraphs().get(0);
			paragraph.setAlignment(ParagraphAlignment.CENTER);
			paragraphRunOne = paragraph.createRun();
			paragraphRunOne.setFontSize(10);
			paragraphRunOne.setText(productVO.getProductInfo()); // 2�� �Ϸ�
			
			mergeCellHorizontally(table, row++, 1, 2);
			
			// ��ǰ ���� �� 4��
			list_Row = table.createRow();
			paragraph = list_Row.getCell(0).getParagraphs().get(0);
			paragraph.setAlignment(ParagraphAlignment.CENTER);
			paragraphRunOne = paragraph.createRun();
			paragraphRunOne.setFontSize(10);
			paragraphRunOne.setText("��ǰ ����"); // 1�� �Ϸ�
			
			paragraph = list_Row.getCell(1).getParagraphs().get(0);
			paragraph.setAlignment(ParagraphAlignment.CENTER);
			paragraphRunOne = paragraph.createRun();
			paragraphRunOne.setFontSize(10);
			paragraphRunOne.setText(Integer.toString(productVO.getProductCost())); // 2�� �Ϸ�
			
			mergeCellHorizontally(table, row++, 1, 2);
		}
		
		private HashMap<String, Object> jsp_To_Word(String contents) {
			// �̹����� �����ϱ� ���� list
			HashMap<String , Object> map = new HashMap<String, Object>();
			ArrayList<String> image = new ArrayList<>();
			
			String[] stx = contents.split("\r\n\r\n");
			// ������, ������ p �±� ����
			for(int i=0;i<stx.length;i++) {
				if(stx[i]=="") {
					System.out.println("��");
					continue;
				}
				if(i==stx.length-1) {
					stx[i] = stx[i].substring(3,stx[i].length()-6);
				} else {
					stx[i] = stx[i].substring(3,stx[i].length()-4);
				}
				System.out.println("stx["+i+"] : "+ stx[i]);
			}
			
			for(int i=0;i<stx.length;i++) {
				//�̹��� �±� (�̹���) ������ ���� ���
				if(stx[i].contains("<img")) {
					image.add(stx[i].substring(stx[i].indexOf("resources/images/")+17, stx[i].indexOf("\"", stx[i].indexOf("resources/images/")+17)));
					stx[i]="!ime";
				} else
					continue;
			}
			map.put("story", stx); map.put("image", image);
			return map;
		}
}


