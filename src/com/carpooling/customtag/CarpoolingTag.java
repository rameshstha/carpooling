package com.carpooling.customtag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class CarpoolingTag extends SimpleTagSupport {
	String textColor;
	String text;

	public void doTag() throws JspException, IOException // render custom tag
	{
		JspWriter out = getJspContext().getOut();
			out.write(String.format("<span style='color:%s'>%s</span>", textColor, text));
	}

	// Need a setter for each attribute of custom tag
	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}

	public void setText(String text) {
		this.text = text;
	}
}