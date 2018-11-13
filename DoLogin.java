package project.services;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

public class DoLogin extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        String user_name = req.getParameter("user");
        String user_password = req.getParameter("password");
        int count = 0;
        String psw = "";
        String section = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException c) {
            c.printStackTrace();
        }
        try {
            //连接数据库
            String URL = "jdbc:mysql://localhost:3306/test";
            String USER = "ylx";
            String PASSWORD = "ylx";
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            //out.print("Successfully connect to the databass!<br>");
            Statement stmt = conn.createStatement();
            String SQL = "select COUNT(*) from UserManger where user_name = '" + user_name + "'";
            //System.out.println(SQL);
            //执行SQL查询语句，返回结果集
            ResultSet rs = stmt.executeQuery(SQL);
            if (rs.next()) count = rs.getInt(1);
            String sql = "select password from UserManger where user_name = '" + user_name + "'";
            rs = stmt.executeQuery(sql);
            if (rs.next()) psw = rs.getString(1);
            String ss = "select section from UserManger where user_name = '" + user_name + "'";
            rs = stmt.executeQuery(ss);
            if (rs.next()) section = rs.getString(1);
            rs.close();
            conn.close();
        } catch (SQLException s) {
            s.printStackTrace();
        }
        System.out.println(count + " " + psw);
        if (count == 0 || !user_password.equals(psw)) {
            resp.sendRedirect("/views/admin/signin_no.jsp");
        } else if (section.equals("admin")) {
            session.setAttribute("user_name", user_name);
            session.setAttribute("password", user_password);
            session.setAttribute("type", "admin");
            resp.sendRedirect("/views/admin/homelist.jsp");
        } else if(section.equals("user")){
            session.setAttribute("user_name", user_name);
            session.setAttribute("password", user_password);
            session.setAttribute("type", "customer");
            req.getRequestDispatcher("/views/customer/customer_homelist.jsp").forward(req, resp);
        } else if(section.equals("business")){
            session.setAttribute("name", user_name);
            session.setAttribute("psword", user_password);
            session.setAttribute("type", "business");
            resp.sendRedirect("/views/business/b_homelist.jsp");
        }
    }
}
