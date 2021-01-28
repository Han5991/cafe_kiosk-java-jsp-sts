package com.model.dto;

public class oderDto {
	String menu;
	String quantity;
	String price;

	public oderDto(String menu, String quantity, String price) {
		this.menu = menu;
		this.quantity = quantity;
		this.price = price;
	}

	public String getMenu() {
		return menu;
	}

	public String getQuantity() {
		return quantity;
	}

	public String getPrice() {
		return price;
	}

}