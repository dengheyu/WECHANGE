
package project.services.admin;

import jxl.Workbook;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.servlet.ServletUtilities;
import org.jfree.data.DefaultCategoryDataset;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class AdminAction extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            System.out.println("begin chongcao servlet");
            String action = request.getParameter("action");
            System.out.println(action);
            if (action.equals("export")) export(request, response);
            else if (action.equals("statistic")) statistic(request, response);

            else {
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void export(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //连接数据库，用jdbc驱动加载mysql
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException classnotfoundexception) {
            classnotfoundexception.printStackTrace();
        }
        List list = new ArrayList();
        try {
            //连接数据库
            String URL = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
            String USER = "ylx";
            String PASSWORD = "ylx";
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM goods");
            while (rs.next()) {
                List li = new ArrayList();
                li.add(rs.getString("id"));
                li.add(rs.getString("name"));
                li.add(rs.getString("models"));
                li.add(rs.getString("kind"));
                li.add(rs.getString("time"));
                list.add(li);
            }
            stmt.close();
            conn.close();
        } catch (SQLException sqlexception) {
            sqlexception.printStackTrace();
        }
        //导出
        String worksheet = "物品库信息";
        String filePath = "C:\\upload\\export\\" + (new SimpleDateFormat("yyyyMMddHHmmss")).format(new java.util.Date()) + ".xls";
        String[] title = {"id", "名称", "型号", "种类", "上传时间"};

        WritableWorkbook workbook;
        try {
            OutputStream os = new FileOutputStream(filePath);
            workbook = Workbook.createWorkbook(os);

            WritableSheet sheet = workbook.createSheet(worksheet, 0);

            jxl.write.Label label;
            for (int j = 0; j < title.length; j++) {
                label = new jxl.write.Label(j, 0, title[j]);
                sheet.addCell(label);
            }
            System.out.println(list.size());
            for (int i = 1; i < list.size() + 1; i++) {
                List li = (List) list.get(i - 1);
                for (int j = 0; j < li.size(); j++) {
                    // Label(列号,行号 ,内容 )
                    label = new jxl.write.Label(j, i, li.get(j) + "");
                    System.out.println(li.get(j) + "");
                    sheet.addCell(label);
                }
            }
            workbook.write();
            workbook.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("/views/admin/export_ok.jsp");
    }

    public void statistic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, JSONException {
        HttpSession session = request.getSession();

        String timefrom = request.getParameter("timefrom");
        String timeto = request.getParameter("timeto");

        String sql = "";
        String timeInterval = "%Y-%m-%d";
        sql = "select date_format(time,\"" + timeInterval + "\") as time_interval,count(*) as count from goods a";
        sql = sql + " where time between \"" + timefrom + "\" and \"" + timeto + "\"";

        sql = sql + " group by time_interval order by time_interval";
        //连接数据库，用jdbc驱动加载mysql
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException classnotfoundexception) {
            classnotfoundexception.printStackTrace();
        }
        List list = new ArrayList();
        try {
            //连接数据库
            String URL = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
            String USER = "ylx";
            String PASSWORD = "ylx";
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                List li = new ArrayList();
                li.add(rs.getString("time_interval"));
                li.add(rs.getString("count"));
                list.add(li);
            }
            stmt.close();
            conn.close();
        } catch (SQLException sqlexception) {
            sqlexception.printStackTrace();
        }

        String chartTitle = "统计图";
        String tmpDir = "/chart";
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        for (int i = 0; i < list.size(); i++) {
            String time = (String) ((List) (list.get(i))).get(0);
            Integer count = Integer.parseInt((String) ((List) (list.get(i))).get(1));
            String countName = "物品信息";
            dataset.addValue(count, countName, time);
        }
        JFreeChart chart = null;
        chart = ChartFactory.createBarChart3D(chartTitle, "统计图", "数量", dataset, PlotOrientation.VERTICAL, true, false, false);
        ;
        String chartFilename = ServletUtilities.saveChartAsJPEG(chart, 960, 596, null, session);
        chartFilename = tmpDir + "/" + chartFilename;
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("aaData", list);
        jsonObj.put("result_image", chartFilename);
        System.out.println(list.toString());
        System.out.println(chartFilename);
        session.setAttribute("chongcao_statistic_record_result", jsonObj);
        response.sendRedirect("/views/admin/statistic_ok.jsp");
    }

}
