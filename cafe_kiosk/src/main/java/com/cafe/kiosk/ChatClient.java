package com.cafe.kiosk;

import javax.websocket.Session;

public class ChatClient {
	private String name;
	private Session session;
	private static ChatClient instance = new ChatClient();

	public Session getSession() {
		return session;
	}

	public void setSession(Session session) {
		this.session = session;
	}

	public ChatClient() {
	}

	public static ChatClient getinstance() {
		return instance;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}