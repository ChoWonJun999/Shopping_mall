package cwj.admin.service;

import cwj.config.CwjDefaultVO;

public class CwjAdminVO extends CwjDefaultVO {
	
	private String aMenuKey = "";
	private String aMenuNumber = "";
	private String aMenuName = "";
	private String aMenuVisibleState = "";
	
	private String aMenuKeyTemp = "";
	private String aMenuSubKey = "";
	private String aMenuSubNumber = "";
	private String aMenuSubName = "";
	private String aMenuSubVisibleState = "";
	
	
	public String getaMenuKeyTemp() {
		return aMenuKeyTemp;
	}
	public void setaMenuKeyTemp(String aMenuKeyTemp) {
		this.aMenuKeyTemp = aMenuKeyTemp;
	}
	public String getaMenuSubKey() {
		return aMenuSubKey;
	}
	public void setaMenuSubKey(String aMenuSubKey) {
		this.aMenuSubKey = aMenuSubKey;
	}
	public String getaMenuSubNumber() {
		return aMenuSubNumber;
	}
	public void setaMenuSubNumber(String aMenuSubNumber) {
		this.aMenuSubNumber = aMenuSubNumber;
	}
	public String getaMenuSubName() {
		return aMenuSubName;
	}
	public void setaMenuSubName(String aMenuSubName) {
		this.aMenuSubName = aMenuSubName;
	}
	public String getaMenuSubVisibleState() {
		return aMenuSubVisibleState;
	}
	public void setaMenuSubVisibleState(String aMenuSubVisibleState) {
		this.aMenuSubVisibleState = aMenuSubVisibleState;
	}
	public String getaMenuKey() {
		return aMenuKey;
	}
	public void setaMenuKey(String aMenuKey) {
		this.aMenuKey = aMenuKey;
	}
	public String getaMenuNumber() {
		return aMenuNumber;
	}
	public void setaMenuNumber(String aMenuNumber) {
		this.aMenuNumber = aMenuNumber;
	}
	public String getaMenuName() {
		return aMenuName;
	}
	public void setaMenuName(String aMenuName) {
		this.aMenuName = aMenuName;
	}
	public String getaMenuVisibleState() {
		return aMenuVisibleState;
	}
	public void setaMenuVisibleState(String aMenuVisibleState) {
		this.aMenuVisibleState = aMenuVisibleState;
	}
}