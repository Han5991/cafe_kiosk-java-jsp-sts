package com.cafe.kiosk;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/showImage")
public class showImage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public showImage() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Context context = null;
		DataSource dataSource = null;
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet resultSet = null;
		InputStream is = null;
		String key1 = request.getParameter("key1");

		final String sql = " SELECT img FROM menu WHERE name = '"+key1+"'";
		try {
			context = new InitialContext();// ���α׷�
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			con = dataSource.getConnection();// ����
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			stmt = con.prepareStatement(sql);
			resultSet = stmt.executeQuery();
			while (resultSet != null && resultSet.next()) {
				is = resultSet.getBinaryStream("img");
			}
			response.setContentType("jpg"); // Content Type Set
			// Image�� Stream�� ���� out
			ServletOutputStream os = response.getOutputStream();
			int binaryRead;
			while ((binaryRead = is.read()) != -1) {
				os.write(binaryRead);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
