package xxk.train.layui;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

import xxk.train.entity.User;

public class layuiJSNO {
	public static String toJSNO(int count ,List<?> list) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", count);
		JSONArray array = (JSONArray) JSON.toJSON(list);
		result.put("data", array);
		
		return JSON.toJSON(result).toString();
		
	}
	public static String to2JSNO(List<?> list) {
		//Map<String, Object> result = new HashMap<String, Object>();
		JSONArray array = (JSONArray) JSON.toJSON(list);
		//result.put("data", array);
		
		return JSON.toJSON(list).toString();
		
	}
	public static String tomageJSNO(String name,String value) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "yes");
		Map<String, Object> resuMap =new HashMap<String, Object>();
		resuMap.put(name, value);
		result.put("data", JSON.toJSON(resuMap));	
		return JSON.toJSON(result).toString();	
	}
	public static void main(String[] args) {
		Map<String, String> map = new HashMap<String, String>();
		System.out.println(tomageJSNO("xxxk", "d:1.png"));
	}

}
