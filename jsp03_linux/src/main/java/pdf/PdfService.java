package pdf;

import java.awt.Color;
import java.io.FileOutputStream;
import java.util.List;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import shop.CartDAO;
import shop.CartDTO;

public class PdfService {
	public String createPdf() {
		CartDAO dao = new CartDAO();
		String message = "";
		try {
			Document document = new Document();
			PdfWriter.getInstance(document, new FileOutputStream("/home/user/upload/sample.pdf"));
			document.open();
			BaseFont baseFont = BaseFont.createFont("/home/user/upload/malgun.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
			Font title = new Font(baseFont, 25);
			Font font = new Font(baseFont, 12);
			PdfPTable table = new PdfPTable(4);
			Chunk chunk = new Chunk("장바구니", title);
			Paragraph ph = new Paragraph(chunk);
			ph.setAlignment(Element.ALIGN_CENTER);
			document.add(ph);
			document.add(Chunk.NEWLINE);
			
			// Header
			PdfPCell cell1 = new PdfPCell(new Phrase("상품명", font));
			cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell1.setBackgroundColor(BaseColor.PINK);
			table.addCell(cell1);
			PdfPCell cell2 = new PdfPCell(new Phrase("단가", font));
			cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell2.setBackgroundColor(BaseColor.PINK);
			table.addCell(cell2);
			PdfPCell cell3 = new PdfPCell(new Phrase("수량", font));
			cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell3.setBackgroundColor(BaseColor.PINK);
			table.addCell(cell3);
			PdfPCell cell4 = new PdfPCell(new Phrase("금액", font));
			cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
			cell4.setBackgroundColor(BaseColor.PINK);
			table.addCell(cell4);
			
			// 데이터
			List<CartDTO> items = dao.list_cart("mh");
			for(int i = 0; i < items.size(); i++) {
				CartDTO dto = items.get(i);
				PdfPCell cellProductName = new PdfPCell(new Phrase(dto.getProduct_name(), font));
				table.addCell(cellProductName);
				PdfPCell cellPrice = new PdfPCell(new Phrase("" + dto.getPrice(), font));
				table.addCell(cellPrice);
				PdfPCell cellAmount = new PdfPCell(new Phrase("" + dto.getAmount(), font));
				table.addCell(cellAmount);
				PdfPCell cellMoney = new PdfPCell(new Phrase("" +dto.getMoney(), font));
				table.addCell(cellMoney);
			}
			document.add(table);
			document.close();
			message = "pdf 파일이 생성되었습니다.";
		} catch (Exception e) {
			e.printStackTrace();
			message = "pdf 파일 생성 실패...";
		}
		return message;
	}
}
