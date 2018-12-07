/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conindustries.genesislib.model;

import java.util.List;

/**
 *
 * @author Connor
 * 
 * the LibraryDAO is the main data access object for accessing destinations and timetables.
 * 
 * LibraryDAOImpl implements LibraryDAO using jaxb.
 * It is backed by an XML file and uses jaxb to persist service objects to the file.
 * The file is read when the DAO starts and is saved every time change in object is persisted.
 */
public interface LibraryDAO {
    
    public BookItem createBookItem(BookItem bookItem);
    
    public boolean deleteBookItem(Integer bookItemId);
    
    public BookItem getBookItem(Integer bookItemId);
    
    public List<BookItem> getBooks();
    
    public void setBooks(List<BookItem> books);
    
}
