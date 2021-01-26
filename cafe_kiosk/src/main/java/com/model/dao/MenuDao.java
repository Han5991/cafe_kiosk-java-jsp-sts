package com.model.dao;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import com.model.dto.MenuDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MenuDao extends HttpServlet {

	private static final long serialVersionUID = 1L;
	ResultSet resultSet;
	Connection connection;
	PreparedStatement preparedStatement;
	private static MenuDao admin = new MenuDao();

	public static synchronized MenuDao getInstance() {
		return admin;
	}

	public MenuDao() {

	}

	public void getCon() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:/comp/env");
			DataSource dataSource = (DataSource) envctx.lookup("jdbc/Oracle11g");
			connection = dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int insertMenu(HttpServletRequest request) {
		MultipartRequest multi = null;
		int fileSize = 1024 * 1024 * 10;
		String uploadFile = null;
		String name = null;
		String type = null;
		int rownum = 0;
		int price = 0;

		String uploadPath = "C:\\Users\\admin\\git\\cafe_kiosk\\cafe_kiosk\\src\\main\\webapp\\resources\\img";
		getCon();
		try {
			multi = new MultipartRequest(request, uploadPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
			name = multi.getParameter("name");
			price = Integer.parseInt(multi.getParameter("price"));
			type = multi.getParameter("category");
			uploadFile = multi.getFilesystemName("image");
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			File f = new File(uploadPath + "\\" + uploadFile);
			File fileNew = new File(uploadPath + "\\" + type + uploadFile);
			if (f.exists())
				f.renameTo(fileNew);
			FileInputStream fis = new FileInputStream(fileNew);

			preparedStatement = connection.prepareStatement("insert into menu values(?,?,?,?,?)");
			preparedStatement.setString(1, name);
			preparedStatement.setInt(2, price);
			preparedStatement.setBinaryStream(3, fis, (int) fileNew.length());
			preparedStatement.setString(4, fileNew.getName());
			preparedStatement.setInt(5, 0);
			rownum = preparedStatement.executeUpdate();
		} catch (Exception e) {

		} finally {
			try {
				if (connection != null)
					connection.close();
				if (preparedStatement != null)
					preparedStatement.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return rownum;
	}

	public int deleteMenu(String name) {
		String uploadPath = "C:\\Users\\admin\\git\\cafe_kiosk\\cafe_kiosk\\src\\main\\webapp\\resources\\img";
		int result = 0;
		boolean de = false;
		getCon();

		try {
			String sql = "delete from menu where imgname=?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, name);
			result = preparedStatement.executeUpdate();// 이미 인트 주소가 있으니 재활용 2가 리턴되면 삭제 성공

			File f = new File(uploadPath + "\\" + name);
			if (f.exists())
				de = f.delete();

			connection.close();
			preparedStatement.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<MenuDto> allmenu() {
		ArrayList<MenuDto> menus = new ArrayList<MenuDto>();
		getCon();

		try {
			String sql = "SELECT * FROM menu";
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				MenuDto menuDto = new MenuDto();
				menuDto.setName(resultSet.getString(1));
				menuDto.setPrice(resultSet.getInt(2));
				menuDto.setFilename(resultSet.getString(4));
				menuDto.setStock(resultSet.getInt(5));
				menus.add(menuDto);
			}
			connection.close();
			preparedStatement.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return menus;
	}

	public ArrayList<MenuDto> allmenuType(String type) {
		ArrayList<MenuDto> menus = new ArrayList<MenuDto>();
		getCon();
		try {
			String sql = "SELECT * FROM menu where imgname LIKE '"+type+"%'";
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				MenuDto menuDto = new MenuDto();
				menuDto.setName(resultSet.getString(1));
				menuDto.setPrice(resultSet.getInt(2));
				menuDto.setFilename(resultSet.getString(4));
				menuDto.setStock(resultSet.getInt(5));
				menus.add(menuDto);
			}
			connection.close();
			preparedStatement.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return menus;
	}
}
