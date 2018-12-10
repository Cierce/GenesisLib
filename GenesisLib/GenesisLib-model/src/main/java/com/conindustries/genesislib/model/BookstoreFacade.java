/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conindustries.genesislib.model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Connor
 */
public interface BookstoreFacade extends LibraryDAO {

    @Override
    public BookItem createBookItem(BookItem bookItem);
    
    @Override
    public boolean deleteBookItem(Integer bookItemId);
    
    @Override
    public BookItem getBookItem(Integer bookItemId);
    
    @Override
    public void updateBookItem(BookItem bookItem);
    
    @Override
    public List<BookItem> getBooks();
    
    @Override
    public void setBooks(List<BookItem> books);
    
    /**
     * Creates a new book with a unique bookId based upon the supplied bookItem
     * @param book
     * @return new book with a unique bookId
     */
    public Book createBook(String author, String name, String publisher);
}
