package com.dao;

import com.entities.Coffee;

import java.sql.SQLException;
import java.util.ArrayList;


public class CoffeeDaoImpl extends BaseDao implements CoffeeDao{
    @Override
    public ArrayList<Coffee> select() {
        ArrayList<Coffee> coffees=new ArrayList<>();

        Coffee coffee=null;

        String sql="select * from coffee;";
        Object[] params={};
        rs=this.ExecuteQuery(sql,params);
        if(null!=rs) {
            try {
                while (rs.next()) {
                    String code=rs.getString(1);
                    String description=rs.getString(2);
                    double price=rs.getDouble(3);
                    String origin=rs.getString(4);
                    String roast=rs.getString(5);
                    String flavor=rs.getString(6);
                    String aroma=rs.getString(7);
                    String acidity=rs.getString(8);
                    String body=rs.getString(9);
                    int sold=rs.getInt(10);

                    coffee=new Coffee(code,description,price,origin,roast,flavor,aroma,acidity,body,sold);
                    coffees.add(coffee);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                this.closeResource();
            }
        }

        return coffees;
    }

    @Override
    public void insert(Coffee coffee) {

    }

    @Override
    public Coffee getCoffee(String code) {
        Coffee coffee=null;

        String sql="select * from coffee where code=?;";
        Object[] params={code};
        rs=this.ExecuteQuery(sql,params);
        if(null!=rs) {
            try {
                while (rs.next()) {
                    code=rs.getString(1);
                    String description=rs.getString(2);
                    double price=rs.getDouble(3);
                    String origin=rs.getString(4);
                    String roast=rs.getString(5);
                    String flavor=rs.getString(6);
                    String aroma=rs.getString(7);
                    String acidity=rs.getString(8);
                    String body=rs.getString(9);
                    int sold=rs.getInt(10);

                    coffee=new Coffee(code,description,price,origin,roast,flavor,aroma,acidity,body,sold);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                this.closeResource();
            }
        }

        return coffee;
    }

    @Override
    public int sell(Coffee coffee) {
        String sql="update coffee set sold=? where code=?;";
        Object[] params={coffee.getSold(),coffee.getCode()};
        //执行sql语句
        return this.executeUpdate(sql,params);

    }
}
