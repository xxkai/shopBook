package core.entity;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class CoreEntity implements Serializable{
	
	private static final long serialVersionUID = -911196730890342627L;

	//封装公共的字段
	private int deleted; //0:未删除   1：已删除
	
	//封装变化的数据【来自页面==》查询条件， 来自后台/数据库==》展示信息 】
	private Map<String,Object> dataMap = new HashMap<>();

	public int getDeleted() {
		return deleted;
	}

	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}
}
