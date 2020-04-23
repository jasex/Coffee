package com.entities;

public class CoffeeBrewing {
    private String code;
    private String description;
    private double price;
    private String model;
    private String waterSupply;
    private int numOfCups;
    private int sold;

    public CoffeeBrewing(String code, String description, double price, String model, String waterSupply, int numOfCups, int sold) {
        this.code = code;
        this.description = description;
        this.price = price;
        this.model = model;
        this.waterSupply = waterSupply;
        this.numOfCups = numOfCups;
        this.sold = sold;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public String getCode() {
        return code;
    }

    public String getDescription() {
        return description;
    }

    public double getPrice() {
        return price;
    }

    public String getModel() {
        return model;
    }

    public String getWaterSupply() {
        return waterSupply;
    }

    public int getNumOfCups() {
        return numOfCups;
    }

    @Override
    public String toString() {
//        return "CoffeeBrewing{" +
//                "code='" + code + '\'' +
//                ", description='" + description + '\'' +
//                ", price=" + price +
//                ", model='" + model + '\'' +
//                ", waterSupply='" + waterSupply + '\'' +
//                ", numOfCups=" + numOfCups +
//                '}';
        return code+"  "+description+"  "+price+"  "+model+"  WaterSupply:"+waterSupply+"  numOfCups:"+numOfCups;
    }
}
