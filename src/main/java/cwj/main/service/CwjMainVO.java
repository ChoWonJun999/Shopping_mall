package cwj.main.service;

import cwj.config.CwjDefaultVO;

public class CwjMainVO extends CwjDefaultVO {
	
	private String aMenuKey = "";
	private String aMenuNumber = "";
	private String aMenuName = "";
	private String aMenuVisibleState = "";
	
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