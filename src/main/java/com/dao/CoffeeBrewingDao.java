package com.dao;


import com.entities.CoffeeBrewing;

import java.util.ArrayList;

public interface CoffeeBrewingDao {
    public ArrayList<CoffeeBrewing> select();
    public CoffeeBrewing getCoffeeBrewing(String code);
    public int sell(CoffeeBrewing coffeeBrewing);
}
