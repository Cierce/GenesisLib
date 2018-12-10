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
    
    private static Book book = null;
    
    public static Book createBook(String author, String title, String publisher)
    {
        return book = new Book(author, title, publisher);
    }
}
