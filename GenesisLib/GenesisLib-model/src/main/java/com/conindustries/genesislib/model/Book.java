/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conindustries.genesislib.model;

/**
 *
 * @author Connor
 */

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

public class Book extends BookItem {
    
    private double price;
    private Integer bookNumber;

    public Book()
    {
      
    }
   
    public void setPrice(double price)
    {
        this.price = price;
    }
    
    public double getPrice()
    {
        return price;
    }
    
    public void setBookNumber(Integer bookNumber)
    {
        this.bookNumber = bookNumber;
    }
    
    public Integer getBookNumber()
    {
        return bookNumber;
    }
    
    @Override
    public String toString()
    {
       return("Book Price: " + price
               + "\nBook Contents " + super.toString());
    }
}