/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conindustries.genesislib.service;

import com.conindustries.genesislib.model.Book;
import com.conindustries.genesislib.model.BookItem;
import com.conindustries.genesislib.model.BookstoreFacade;
import com.conindustries.genesislib.model.LibraryDAO;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;
/**
 *
 * @author Connor
 */
public class BookstoreFacadeImpl implements BookstoreFacade{

    LibraryDAO libraryDAO = null;
    
    // atomic integer is used for ticket ID to avoid concurrent access exceptions
    // and always ensure we get a unique ticket ID
    AtomicInteger nextBookNumber = new AtomicInteger(0);

    public void setLibraryDAO(LibraryDAO libraryDAO)
    {
        this.libraryDAO = libraryDAO;
    }
    
    @Override
    public BookItem createBookItem(BookItem bookItem) {
        return libraryDAO.createBookItem(bookItem);
    }

    @Override
    public boolean deleteBookItem(Integer bookId) {
        return libraryDAO.deleteBookItem(bookId);
    }

    @Override
    public BookItem getBookItem(Integer bookItemId) {
        return libraryDAO.getBookItem(bookItemId);
    }

    @Override
    public Book createBook(String author, String title, String publisher) {
        return new Book(author, title, publisher);
    }

    @Override
    public List<BookItem> getBooks() {
        return libraryDAO.getBooks();
    }

    @Override
    public void setBooks(List<BookItem> books) {
        libraryDAO.setBooks(books);
    }

    @Override
    public void updateBookItem(BookItem bookItem) {
        libraryDAO.updateBookItem(bookItem);
    }
}

    
   