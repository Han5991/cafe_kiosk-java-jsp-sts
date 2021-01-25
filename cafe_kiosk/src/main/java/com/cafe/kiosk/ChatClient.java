package com.cafe.kiosk;

public class ChatClient {
	private String name;
	private static ChatClient instance = new ChatClient();

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