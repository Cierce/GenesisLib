/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conindustries.genesislib.service;

import com.conindustries.genesislib.dao.jaxb.LibraryDAOImpl;
import com.conindustries.genesislib.model.BookstoreFacade;
import com.conindustries.genesislib.model.LibraryDAO;

/**
 *
 * @author Connor
 */
public class ServiceFactory {

    BookstoreFacade bookstoreFacade = null;
    
    String dataFileUri = null;

    public ServiceFactory(String dataFileUri) {
        if (dataFileUri == null) {
            throw new IllegalArgumentException("dataFileUri must not be null");
        }
        
        LibraryDAO libraryDAO = new LibraryDAOImpl(dataFileUri);
        BookstoreFacadeImpl bookstoreFacadeImpl = new BookstoreFacadeImpl();
        bookstoreFacadeImpl.setLibraryDAO(libraryDAO);
        bookstoreFacade = bookstoreFacadeImpl;
    }
    
    public BookstoreFacade getBookStoreFacade()
    {
        return bookstoreFacade;
    }
}
