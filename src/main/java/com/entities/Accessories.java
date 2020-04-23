package com.entities;

public class Accessories {
    private String code;
    private String description;
    private double price;
    private int sold;

    public Accessories(String code, String description, double price, int sold) {
        this.code = code;
        this.description = description;
        this.price = price;
        this.sold = sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public int getSold() {
        return sold;
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

    @Override
    public String toString() {
//        return "Accessories{" +
//                "code='" + code + '\'' +
//                ", description='" + description + '\'' +
//                ", price=" + price +
//                '}';
        return code+"  "+description+"  "+price;
    }
}
