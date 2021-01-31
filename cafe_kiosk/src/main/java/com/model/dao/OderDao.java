package com.model.dao;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutput;
import java.io.ObjectOutputStream;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.model.dto.oderDto;
import com.model.dto.oderlistDto;

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

	public void close() {
		try {
			if (connection != null)
				connection.close();
			if (preparedStatement != null)
				preparedStatement.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<oderlistDto> allOder() {
		ArrayList<oderlistDto> alloder = new ArrayList<oderlistDto>();
		InputStream in = null;
		Blob menu = null;
		int s = 0;
		byte[] buffer = null;
		ObjectInputStream ois = null;
		ArrayList<oderDto> oderDtos = null;

		try {
			getCon();
			String sql = "SELECT * FROM oder where status='조리전' ORDER BY TO_NUMBER(odernum)";
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				oderlistDto oderlistDto = new oderlistDto();
				oderlistDto.setOdernum(resultSet.getString(1));
				oderlistDto.setOderdate(resultSet.getString(3));
				oderlistDto.setSum(resultSet.getString(4));
				oderlistDto.setStatus(resultSet.getString(5));

				menu = resultSet.getBlob(2);
				in = menu.getBinaryStream();
				s = (int) menu.length();
				buffer = new byte[s];
				in.read(buffer, 0, s);
				ois = new ObjectInputStream(new ByteArrayInputStream(buffer));
				oderDtos = (ArrayList<oderDto>) ois.readObject();
				oderlistDto.setOderDtos(oderDtos);

				alloder.add(oderlistDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return alloder;
	}

	@SuppressWarnings("unchecked")
	public String getOneOder(String num) {
		InputStream in = null;
		Blob menu = null;
		int s = 0;
		byte[] buffer = null;
		ObjectInputStream ois = null;
		ArrayList<oderDto> oderDtos = null;
		String oder = "";
		try {
			getCon();
			String sql = "select * from oder where odernum=?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, num);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {

				menu = resultSet.getBlob(2);
				in = menu.getBinaryStream();
				s = (int) menu.length();
				buffer = new byte[s];
				in.read(buffer, 0, s);
				ois = new ObjectInputStream(new ByteArrayInputStream(buffer));
				oderDtos = (ArrayList<oderDto>) ois.readObject();
				for (oderDto a : oderDtos) {
					oder += a.getMenu() + ",";
					oder += a.getQuantity() + ",";
				}

				oder += resultSet.getString(1) + ",";
				oder += resultSet.getString(3) + ",";
				oder += resultSet.getString(4) + ",";
				oder += resultSet.getString(5);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return oder;
	}

	public int deleteOder(String num) {
		int odernum = Integer.parseInt(num);
		getCon();

		try {
			String sql = "delete from oder where odernum=?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, odernum);
			odernum = preparedStatement.executeUpdate();

			connection.close();
			preparedStatement.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return odernum;
	}

	public int startOder(String num) {
		int odernum = Integer.parseInt(num);
		getCon();

		try {
			String sql = "update oder set status= '조리완료' where odernum=?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, odernum);
			odernum = preparedStatement.executeUpdate();

			connection.close();
			preparedStatement.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return odernum;
	}
	
	public int insertOder(ArrayList<oderDto> oderDtos, String sum) {
		int result = 0;
		try {
			getCon();
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			ObjectOutput c = new ObjectOutputStream(bos);
			c.writeObject(oderDtos);// 주문목록

			byte[] a = bos.toByteArray();

			Blob b1 = connection.createBlob();
			b1.setBytes(1, a);

			String sql = "insert into oder values(seq_oder.NEXTVAL,?,to_char(sysdate,'mm.dd hh24:mi'),?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setBlob(1, b1);
			preparedStatement.setString(2, sum);
			preparedStatement.setString(3, "조리전");

			preparedStatement.executeQuery();

			sql = "SELECT MAX(TO_NUMBER(odernum)) FROM oder";
			preparedStatement = connection.prepareStatement(sql);

			resultSet = preparedStatement.executeQuery();
			while (resultSet.next())
				result = resultSet.getInt(1);

			preparedStatement = connection.prepareStatement(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
}
