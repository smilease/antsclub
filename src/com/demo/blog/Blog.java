package com.demo.blog;

import com.jfinal.plugin.activerecord.Model;

/**
 * Blog model.
 */
@SuppressWarnings("serial")
public class Blog extends Model<Blog> {
	public static final Blog dao = new Blog();
}