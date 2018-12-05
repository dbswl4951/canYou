package or.kosta.excel;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import or.kosta.dto.DownDTO;
import or.kosta.mvc.dao.DownDao;

public class ExcelBuilder extends AbstractExcelView{
	// excelView �並 ã����, �̰��� ����Ŭ���� ExcelBuilder ��
	// AbsractExcelView �� ����߱� ������ �̰��� ���̴�.
	// DispatcherServlet -> [view]jsp (model) : forward
	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//HSSF - ����ũ�� ����Ʈ�� ���� ���� Ŭ����
		// DispatcherServlet �� ���ؼ� Model�� �޽��ϴ�.
		// ${listBooks}
		List<DownDTO> listBooks = (List<DownDTO>)model.get("listBooks");
		//poi ����
		HSSFSheet sheet = workbook.createSheet("Show Books");
		sheet.setDefaultColumnWidth(30);
		CellStyle style = workbook.createCellStyle();
		Font font = workbook.createFont();
		style.setFont(font);
		HSSFRow header = sheet.createRow(0);
		// ������ �� Ÿ��Ʋ
		String [] str= {"number", "writer", "rdate", "img"};
		for(int i=0;i<str.length;i++) {
			header.createCell(i).setCellValue(str[i]);
			header.getCell(i).setCellStyle(style);
		}
		
		int rowCount = 1;
		// ���� ������ ä��
		for (DownDTO aBook : listBooks) {
			HSSFRow aRow = sheet.createRow(rowCount++);
			aRow.createCell(0).setCellValue(aBook.getNum());
			aRow.createCell(1).setCellValue(aBook.getWriter());
			aRow.createCell(2).setCellValue(aBook.getRdate());
			aRow.createCell(3).setCellValue(aBook.getImg());
		}
		response.setContentType("Application/Msexcel");
		response.setHeader("Content-Disposition",
				"attachment; filename=tboard_exce.xls");
	}
}
