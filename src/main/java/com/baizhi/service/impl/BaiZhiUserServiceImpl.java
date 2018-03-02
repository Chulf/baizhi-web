package com.baizhi.service.impl;

import com.baizhi.dao.BaiZhiUserDAO;
import com.baizhi.entity.BaiZhiUser;
import com.baizhi.service.BaiZhiUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

@Service
@Transactional
public class BaiZhiUserServiceImpl implements BaiZhiUserService {
    @Autowired
    private BaiZhiUserDAO dao;

    public BaiZhiUserDAO getDao() {
        return dao;
    }

    public void setDao(BaiZhiUserDAO dao) {
        this.dao = dao;
    }

    @Transactional(readOnly = true,propagation = Propagation.SUPPORTS)
    public BaiZhiUser login(String username, String password) {
        BaiZhiUser baiZhiUser = dao.queryUserByUsername(username);
        if (baiZhiUser == null) throw new RuntimeException("用户名或者密码错误！");
        if(baiZhiUser.getPassword().equals(password)){
            return baiZhiUser;
        }else{
            throw new RuntimeException("用户名或者密码错误！");
        }
    }

    public BaiZhiUser reg(BaiZhiUser user) {
        user.setId(UUID.randomUUID().toString());
        dao.insert(user);
        return user;
    }

    @Override
    @Transactional(readOnly = true,propagation = Propagation.SUPPORTS)
    public boolean checkUserOne(String username) {
        BaiZhiUser baiZhiUser = dao.queryUserByUsername(username);
        if(baiZhiUser == null){
            //该账号没有被注册
            return true;
        }
        return false;
    }

}
