package com.dao;



import com.entities.Accessories;

import java.util.ArrayList;

public interface AccessoriesDao {
    public ArrayList<Accessories> select();
    public Accessories getAccessory(String code);
    public int sell(Accessories accessories);
}
