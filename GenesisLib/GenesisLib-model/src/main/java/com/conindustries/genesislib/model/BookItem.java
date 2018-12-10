/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conindustries.genesislib.model;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

/**
 *
 * @author Connor
 */

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(propOrder = {"bookItemId", "price", "isLoaned"})
@XmlRootElement
public class BookItem extends Book{
    
    private Integer bookItemId = null;
    private double price;
    private boolean isLoaned;
    
    public BookItem()
    {
        
    }
    
    public BookItem(Integer bookItemId, double price, Book book)
    { 
        this.bookItemId = bookItemId;
        super.setAuthor(book.getAuthor());
        super.setTitle(book.getTitle());
        super.setPublisher(book.getPublisher());
        this.price = price;
    }
  
    public void setBookItemId(Integer bookItemId)
    {
        this.bookItemId = bookItemId;
    }
    
    public Integer getBookItemId()
    {
        return bookItemId;
    }
    
    public void setPrice(double price)
    {
        this.price = price;
    }
    
    public double getPrice()
    {
        return price;
    }
    
    public void setLoanStatus(boolean isLoaned)
    {
        this.isLoaned = isLoaned;
    }
    
    public boolean getLoanStatus()
    {
        return isLoaned;
    }
    
    @Override
    public String toString() {
        return "ID: " + bookItemId;
    }
}
