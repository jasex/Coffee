package com.dao;

import java.sql.*;

public class BaseDao {
    Connection conn=null;
    PreparedStatement ps=null;
    ResultSet rs=null;


    //获取链接
    public boolean getConnection(){
        String driver="com.mysql.cj.jdbc.Driver";
        String url="jdbc:mysql://localhost:3306/coffee";
        String username="zj";
        String password="123456";
        try{
            Class.forName(driver);
            conn= DriverManager.getConnection(url,username,password);
        }catch (SQLException e){
            e.printStackTrace();
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        return true;

    }

    //关闭资源
    public boolean closeResource(){
        if(null!=rs){
            try{
                rs.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }

        if(null!=ps){
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if(null!=conn){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return true;
    }

    //增删改操作
    public int executeUpdate(String sql,Object[] params){
        int updateRows=0;
        if(this.getConnection()){
            //获得sql语句
            try {
                ps=conn.prepareStatement(sql);
                //给占位符的赋值
                for(int i=0;i<params.length;i++){
                    ps.setObject(i+1,params[i] );
                }
                //执行 增删改,返回影响的行数
                updateRows=ps.executeUpdate();

            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return updateRows;
    }

    //查询 全部信息 或者指定部分信息
    public ResultSet ExecuteQuery(String sql ,Object [] params){
        if(this.getConnection()){
            try {
                ps=conn.prepareStatement(sql);
                //给占位符赋值
                for(int i=0;i<params.length;i++){
                    ps.setObject(i+1, params[i]);
                }
                // 执行查询，返回值是ResultSet型的
                rs=ps.executeQuery();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return rs;
    }

}
