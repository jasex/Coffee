package com.dao;

import com.entities.Coffee;

import java.util.ArrayList;

public interface CoffeeDao {
    public ArrayList<Coffee> select();
    public void insert(Coffee coffee);
    public Coffee getCoffee(String code);
    public int sell(Coffee coffee);
    //public void update();
}
