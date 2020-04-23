package com.dao;

import com.entities.Accessories;


import java.sql.SQLException;
import java.util.ArrayList;

public class AccessoriesDaoImpl extends BaseDao implements AccessoriesDao{
    @Override
    public ArrayList<Accessories> select() {
        ArrayList<Accessories> accessories=new ArrayList<>();
        Accessories accessories_=null;

        String sql="select * from accessories;";
        Object[] params={};
        rs=this.ExecuteQuery(sql,params);
        if(null!=rs) {
            try {
                while (rs.next()) {
                    String code=rs.getString(1);
                    String description=rs.getString(2);
                    double price=rs.getDouble(3);
                    int sold=rs.getInt(4);
                    accessories_=new Accessories(code,description,price,sold);
                    accessories.add(accessories_);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                this.closeResource();
            }
        }

        return accessories;
    }

    @Override
    public Accessories getAccessory(String code) {
        Accessories accessories=null;
        String sql="select * from accessories where code=?;";
        Object[] params={code};
        rs=this.ExecuteQuery(sql,params);
        if(null!=rs) {
            //如果ResultSet不为空
            try {
                while (rs.next()) {
                    code=rs.getString(1);
                    String description=rs.getString(2);
                    double price=rs.getDouble(3);
                    int sold=rs.getInt(4);
                    accessories=new Accessories(code,description,price,sold);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                this.closeResource();
            }
        }

        return accessories;
    }

    @Override
    public int sell(Accessories accessories) {
        String sql="update accessories set sold=? where code=?;";
        Object[] params={accessories.getSold(),accessories.getCode()};
        //执行sql语句
        return this.executeUpdate(sql,params);
    }
}
