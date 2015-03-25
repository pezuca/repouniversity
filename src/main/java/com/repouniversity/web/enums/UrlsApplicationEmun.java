package com.repouniversity.web.enums;

/**
 * @author Federico Tray
 */
@SuppressWarnings("javadoc")
// public declarations
public enum UrlsApplicationEmun {

	LOGIN("/login"),
	DASHBOARD("/dashboard");
	
	private String url;

	UrlsApplicationEmun(String url) {
		this.url = url;
	}

	/**
	 * @return app url
	 */
	public String getUrl() {
		return this.url;
	}
}
