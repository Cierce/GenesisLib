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
public class BookFactory {
    
    private static BookItem bookItem = null;
    
    public static BookItem createBook(Integer bookItemId, String author, String name, String publisher)
    {
        return bookItem = new BookItem(bookItemId, author, name, publisher);
    }
}
