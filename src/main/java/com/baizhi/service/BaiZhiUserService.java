package com.baizhi.service;

import com.baizhi.entity.BaiZhiUser;

public interface BaiZhiUserService {
	public BaiZhiUser login(String username,String password);
	public BaiZhiUser reg(BaiZhiUser user);
	//检查该账号是否已经注册
	public boolean checkUserOne(String username);
}
