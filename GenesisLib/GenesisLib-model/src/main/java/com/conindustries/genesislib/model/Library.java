/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conindustries.genesislib.model;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * The library object provides the sets and lists used to persist objects by the LibraryDAOImpl
 * @author Connor
 */
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Library {
    
    @XmlElementWrapper(name = "books")
    @XmlElement(name = "book")
    private List<BookItem> books = new ArrayList<BookItem>();
    
    public List<BookItem> getBooks()
    {
        return books;
    }
    
    public void setBooks(List<BookItem> books)
    {
        this.books = books;
    }
}
