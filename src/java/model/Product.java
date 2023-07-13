/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author hoang
 */
public class Product {
    private int productID;
    private String productName;
    private String image;
    private float price;
    private String description;
    private String supplier;
    private Category category;

    public Product() {
    }

    public Product(int productID, String productName, String image, float price, String description, String supplier, Category category) {
        this.productID = productID;
        this.productName = productName;
        this.image = image;
        this.price = price;
        this.description = description;
        this.supplier = supplier;
        this.category = category;
    }

    public Product(String productName, String image, float price, String description, String supplier, Category category) {
        this.productName = productName;
        this.image = image;
        this.price = price;
        this.description = description;
        this.supplier = supplier;
        this.category = category;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    

    @Override
    public String toString() {
        return "Product ID = " + productID + ", Product Name = "+ productName + ", Image = " + image + ", Price = " + price + ", Description = " + description + "Category ID = " + category.getCategoryID();
    }
    
    
}
