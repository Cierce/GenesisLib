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
 
@XmlRootElement(name = "bookitem")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(propOrder = {"bookItemId", "author", "name", "publisher"})*/
@XmlRootElement
public class BookItem  {
    
    private Integer bookItemId = null;
    private String author;
    private String name;
    private String publisher;
    
    public BookItem()
    {
        
    }
    
    public BookItem(Integer bookItemId, String author, String name, String publisher)
    {
        this.bookItemId = bookItemId;
        this.author = author;
        this.name = name;
        this.publisher = publisher;
    }
  
    public void setBookItemId(Integer bookItemId)
    {
        this.bookItemId = bookItemId;
    }
    
    public Integer getBookItemId()
    {
        return bookItemId;
    }
    
    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }
    
    @Override
    public String toString() {
        return "ID: " + bookItemId
                + "\nAuthor: " + author
                + "\nName: " + name
                + "\nPublisher " + publisher;
    }
}