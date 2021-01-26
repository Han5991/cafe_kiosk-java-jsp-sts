package com.model.dao;

//import java.io.ByteArrayInputStream;
//import java.io.InputStream;
//import java.io.ObjectInputStream;
//import java.sql.Blob;
//import java.util.ArrayList;
//import Coffee_Shop.menu.MenuDto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class OderDao {
	ResultSet resultSet;
	Connection connection;
	PreparedStatement preparedStatement;
	private static OderDao admin = new OderDao();

	public static synchronized OderDao getInstance() {
		return admin;
	}

	public OderDao() {

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

	public String getOneOder(String num) {
		String oder = "";
//		InputStream in = null;
//		Blob menu = null;
//		int s = 0;
//		byte[] buffer = null;
//		ObjectInputStream ois = null;
//		ArrayList<MenuDto> Menudtos = null;
		int odernum = Integer.parseInt(num);
		getCon();
		try {

			String sql = "select * from oderlist where oderlistnum=?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, odernum);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				oder += resultSet.getInt(1);

//				menu = resultSet.getBlob(4);
//
//				in = menu.getBinaryStream();
//				s = (int) menu.length();
//				buffer = new byte[s];
//				in.read(buffer, 0, s);
//
//				ois = new ObjectInputStream(new ByteArrayInputStream(buffer));
//				Menudtos = (ArrayList<MenuDto>) ois.readObject();
//				for (MenuDto out : Menudtos) {
//					oder += out.getName();
//					oder += out.getQuantity();
//				}
			}

			connection.close();
			preparedStatement.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return oder;
	}

	public int deleteOder(String num) {
		int odernum = Integer.parseInt(num);
		getCon();

		try {
			String sql = "delete from oderlist where oderlistnum=?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, odernum);
			odernum = preparedStatement.executeUpdate();// 이미 인트 주소가 있으니 재활용 2가 리턴되면 삭제 성공

			connection.close();
			preparedStatement.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return odernum;
	}
}
