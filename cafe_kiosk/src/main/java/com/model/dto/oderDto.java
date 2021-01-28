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

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

}