package com.dao;

import com.entities.Coffee;
import com.entities.CoffeeBrewing;

import java.sql.SQLException;
import java.util.ArrayList;

public class CoffeeBrewingImpl extends BaseDao implements CoffeeBrewingDao{
    @Override
    public ArrayList<CoffeeBrewing> select() {
        ArrayList<CoffeeBrewing> coffeeBrewings=new ArrayList<>();

        CoffeeBrewing coffeeBrewing=null;

        String sql="select * from coffeebrewing;";
        Object[] params={};
        rs=this.ExecuteQuery(sql,params);
        if(null!=rs) {
            try {
                while (rs.next()) {
                    String code=rs.getString(1);
                    String description=rs.getString(2);
                    double price=rs.getDouble(3);
                    String model=rs.getString(4);
                    String waterSupply=rs.getString(5);
                    int numOfCups=rs.getInt(6);
                    int sold=rs.getInt(7);

                    coffeeBrewing=new CoffeeBrewing(code,description,price,model,waterSupply,numOfCups,sold);
                    coffeeBrewings.add(coffeeBrewing);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                this.closeResource();
            }
        }

        return coffeeBrewings;
    }

    @Override
    public CoffeeBrewing getCoffeeBrewing(String code) {
        CoffeeBrewing coffeeBrewing=null;

        String sql="select * from coffeebrewing where code=?;";
        Object[] params={code};
        rs=this.ExecuteQuery(sql,params);
        if(null!=rs) {
            try {
                while (rs.next()) {
                    code=rs.getString(1);
                    String description=rs.getString(2);
                    double price=rs.getDouble(3);
                    String model=rs.getString(4);
                    String waterSupply=rs.getString(5);
                    int numOfCups=rs.getInt(6);
                    int sold=rs.getInt(7);

                    coffeeBrewing=new CoffeeBrewing(code,description,price,model,waterSupply,numOfCups,sold);

                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                this.closeResource();
            }
        }

        return coffeeBrewing;
    }

    @Override
    public int sell(CoffeeBrewing coffeeBrewing) {
        String sql="update coffeeBrewing set sold=? where code=?;";
        Object[] params={coffeeBrewing.getSold(),coffeeBrewing.getCode()};
        //执行sql语句
        return this.executeUpdate(sql,params);
    }
}
