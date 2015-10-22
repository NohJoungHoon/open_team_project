package com.jsp.study.vo;

public class Matzip {

	private String s_name;
	private float point_x;
	private float point_y;
	private String loc;
	private String menu;
	private String pic1;
	private String pic2;
	private String pic3;
	
	public Matzip(String s_name, float point_x, float point_y, String loc, String menu, String pic1, String pic2, String pic3) {
		this.s_name = s_name;
		this.point_x = point_x;
		this.point_y = point_y;
		this.loc = loc;
		this.menu = menu;
		this.pic1 = pic1;
		this.pic2 = pic2;
		this.pic3 = pic3;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public float getPoint_x() {
		return point_x;
	}

	public void setPoint_x(float point_x) {
		this.point_x = point_x;
	}

	public float getPoint_y() {
		return point_y;
	}

	public void setPoint_y(float point_y) {
		this.point_y = point_y;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getPic1() {
		return pic1;
	}

	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}

	public String getPic2() {
		return pic2;
	}

	public void setPic2(String pic2) {
		this.pic2 = pic2;
	}

	public String getPic3() {
		return pic3;
	}

	public void setPic3(String pic3) {
		this.pic3 = pic3;
	}
	
}
