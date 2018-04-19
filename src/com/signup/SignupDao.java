package com.signup;

import java.util.List;

import com.jdbc.JdbcUtils;

public class SignupDao implements SignupService{

    private JdbcUtils jdbcUtils;
    public SignupDao(){
        jdbcUtils=new JdbcUtils();
    }
    @Override
    public boolean signupUser(List<Object> params) {
        // TODO Auto-generated method stub
        boolean flag = false;
        try {
            jdbcUtils.getConnection();
            String sql = "insert into userinfo(username,pswd) values(?,?)";
            flag = jdbcUtils.updateByPreparedStatement(sql, params);
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }finally{
            //关闭数据库连接
            jdbcUtils.releaseConn();
        }
        return flag;
    }
}



