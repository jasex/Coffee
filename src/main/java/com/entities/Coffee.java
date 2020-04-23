package com.entities;

public class Coffee {
    private String code;
    private String description;
    private double price;
    //原产地
    private String origin;

    private String roast;
    private String flavor;
    private String aroma;
    private String acidity;
    private String body;
    private int sold;

    public Coffee(String code, String description, double price, String origin, String roast, String flavor, String aroma, String acidity, String body, int sold) {
        this.code = code;
        this.description = description;
        this.price = price;
        this.origin = origin;
        this.roast = roast;
        this.flavor = flavor;
        this.aroma = aroma;
        this.acidity = acidity;
        this.body = body;
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

    public String getOrigin() {
        return origin;
    }

    public String getRoast() {
        return roast;
    }

    public String getFlavor() {
        return flavor;
    }

    public String getAroma() {
        return aroma;
    }

    public String getAcidity() {
        return acidity;
    }

    public String getBody() {
        return body;
    }

    @Override
    public String toString() {
//        return "Coffee{" +
//                "code='" + code + '\'' +
//                ", description='" + description + '\'' +
//                ", price=" + price +
//                ", origin='" + origin + '\'' +
//                ", roast='" + roast + '\'' +
//                ", flavor='" + flavor + '\'' +
//                ", aroma='" + aroma + '\'' +
//                ", acidity='" + acidity + '\'' +
//                ", body='" + body + '\'' +
//                '}';
        return code+"  "+description+"  "+price+"  "+origin+"  "+roast+"  "+flavor+"  "+aroma+"  "+acidity+"  "+body;
    }
}
