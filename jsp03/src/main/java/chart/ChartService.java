package chart;

import java.awt.Color;
import java.awt.Font;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.StandardChartTheme;
import org.jfree.data.general.DefaultPieDataset;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.itextpdf.text.Document;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfWriter;

import shop.CartDAO;
import shop.CartDTO;

public class ChartService {

	public JFreeChart createChart() {
		CartDAO cartDao = new CartDAO();
		List<CartDTO> list = cartDao.cart_money();
		DefaultPieDataset dataset = new DefaultPieDataset();
		for (CartDTO dto : list) {
			dataset.setValue(dto.getProduct_name(), dto.getMoney());
		}
		JFreeChart chart = null;
		String title = "장바구니 통계";
		try {
			chart = ChartFactory.createPieChart(title, dataset, true, true, false);
			chart.getTitle().setFont(new Font("돋움", Font.BOLD, 15));
			Font font = new Font("돋움", Font.PLAIN, 12);
			Color color = new Color(0, 0, 0);
			StandardChartTheme chartTheme = (StandardChartTheme) StandardChartTheme.createJFreeTheme();
			chartTheme.setExtraLargeFont(font);
			chartTheme.setLargeFont(font);
			chartTheme.setRegularFont(font);
			chartTheme.setSmallFont(font);
			chartTheme.setAxisLabelPaint(color);
			chartTheme.setLegendItemPaint(color);
			chartTheme.setItemLabelPaint(color);
			chartTheme.apply(chart);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return chart;
	}

	public void makeImage(List<CartDTO> list, HttpServletResponse response) throws ServletException, IOException {
		ChartUtilities.writeChartAsPNG(response.getOutputStream(), createChart(), 900, 550);
	}

	public String makePdf() {
		String message = "";
		try {
			JFreeChart chart = createChart();
			Document document = new Document();
			try {
				PdfWriter.getInstance(document, new FileOutputStream("c:/work/test.pdf"));
				document.open();
				Image png = Image.getInstance(ChartUtilities.encodeAsPNG(chart.createBufferedImage(500, 500)));
				document.add(png);
				document.close();
				message = "pdf 파일이 생성되었습니다.";
			} catch (Exception e) {
				e.printStackTrace();
				message = "pdf 파일 생성 실패...";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}

	public JSONObject getChartData() {
		CartDAO cartDao = new CartDAO();
		List<CartDTO> items = cartDao.cart_money();
		JSONObject data = new JSONObject();
		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
		JSONArray title = new JSONArray();
		col1.put("label", "상품명");
		col1.put("type", "string");
		col2.put("label", "금액");
		col2.put("type", "number");
		title.add(col1);
		title.add(col2);
		data.put("cols", title);
		JSONArray body = new JSONArray();
		for (CartDTO dto : items) {
			JSONObject name = new JSONObject();
			name.put("v", dto.getProduct_name());
			JSONObject money = new JSONObject();
			money.put("v", dto.getMoney());
			JSONArray row = new JSONArray();
			row.add(name);
			row.add(money);
			JSONObject cell = new JSONObject();
			cell.put("c", row);
			body.add(cell);
		}
		data.put("rows", body);
		return data;
	}
}