package com.cafe.kiosk;

import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class gson {

	public static void main(String[] args) {
		Gson gsonobj = new Gson();
		Map<String, String> inputMap = new HashMap<String, String>();
		inputMap.put("name", "makesomething");
		inputMap.put("blog", "makesomething");
		// Map => JSON 전환
		String jsonStr = gsonobj.toJson(inputMap);
		System.out.println("Map => Json : " + jsonStr);

		// JSON => Map 전환
		Map map = gsonobj.fromJson(jsonStr, Map.class);
		System.out.println("Json => Map : " + map);
		System.out.println(map.get("name"));

		// json object
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("name", "makesomething");
		jsonObject.addProperty("blog", "http://web-inf.tistory.com");
		jsonObject.addProperty("boolean", true);
		jsonObject.addProperty("int", 12345);
		System.out.println("JsonObject 생성 : " + jsonObject.toString());

		// String
		System.out.println("JsonObject name(String) : " + jsonObject.get("name").getAsString());
		System.out.println("JsonObject blog(String) : " + jsonObject.get("blog").getAsString());

		// boolean
		System.out.println("JsonObject boolean(boolean) : " + jsonObject.get("boolean").getAsBoolean());
		// int
		System.out.println("JsonObject int(int) : " + jsonObject.get("int").getAsInt());

		// JsonArray
		JsonArray jsonArray = new JsonArray();
		jsonArray.add(jsonObject);
		jsonArray.add("test1");
		jsonArray.add("test2");
		System.out.println(jsonArray.toString());
		System.out.println(jsonArray.get(0).getAsJsonObject().get("name").getAsString());

		// Parse Pretty
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String jsonOutput = gson.toJson(jsonObject);
		System.out.println(jsonOutput);
	}

}
