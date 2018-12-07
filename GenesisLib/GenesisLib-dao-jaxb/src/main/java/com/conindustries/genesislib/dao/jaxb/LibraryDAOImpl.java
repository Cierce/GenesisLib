/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conindustries.genesislib.dao.jaxb;

import com.conindustries.genesislib.model.Book;
import com.conindustries.genesislib.model.BookItem;
import com.conindustries.genesislib.model.Library;
import com.conindustries.genesislib.model.LibraryDAO;
import java.io.File;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Connor
 */
public class LibraryDAOImpl implements LibraryDAO {
    
    private final Object Lock = new Object();
    private String dataFileLocation = null;
    private File jaxbFile = null;
    private Library library = null;
    private JAXBContext jaxbContext = null;
    
    public LibraryDAOImpl(String dataFileLocation)
    {
        super();
        if(dataFileLocation == null)
        {
            throw new IllegalArgumentException("datafile cannot be null");
        }
        this.dataFileLocation = dataFileLocation;
        load();
    }
    
    @Override
    public BookItem createBookItem(BookItem bookItem) {
        
        if(bookItem == null)
        {
            throw new IllegalArgumentException("book must not be null");
        }
        
        synchronized(Lock)
        {
           library.getBooks().add(bookItem);
           save();
           return bookItem;
        }
    }

    @Override
    public boolean deleteBookItem(Integer bookItemId) {
       
        if(bookItemId == null)
        {
            throw new IllegalArgumentException("bookId must not be null");
        }
       
       synchronized(Lock)
       {
           Iterator<BookItem> iterator = library.getBooks().iterator();
           while(iterator.hasNext())
           {
               BookItem bookItem = iterator.next();
               
               if(bookItem.getBookItemId().equals(bookItemId))
               {
                   iterator.remove();
                   save();
                   return true;
               }
           }
           return false;
       }
    }

    @Override
    public BookItem getBookItem(Integer bookItemId) {
        if(bookItemId == null)
        {
            throw new IllegalArgumentException("bookId must not be null");
        }
        
        synchronized(Lock)
        {
            List<BookItem> books = library.getBooks();
            Iterator<BookItem> iterator = books.iterator();
            while(iterator.hasNext())
            {
                BookItem foundBook = iterator.next();
                if(foundBook.getBookItemId().equals(bookItemId))
                {
                    return foundBook;
                }
            }
        }
        return null;
    }
    
    private BookItem copy(BookItem bookItem)
    {
        try {
            StringWriter sw = new StringWriter();
            Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
            jaxbMarshaller.marshal(bookItem, sw);
            
            StringReader sr = new StringReader(sw.toString());
            Unmarshaller jaxbUnMarshaller = jaxbContext.createUnmarshaller();
            BookItem newBook = (BookItem) jaxbUnMarshaller.unmarshal(sr);
            return newBook;
        } 
        catch(JAXBException ex) {
            throw new RuntimeException("problem copying jaxb object", ex);
        }
    }
    
      /**
     * loads jaxb file at beginning of program
     */
    private void load() {

        try {
            // jaxb context needs jaxb.index jaxbFile to be in same classpath
            // this contains a list of Jaxb annotated classes for the context to parse
            jaxbContext = JAXBContext.newInstance(new Class[]{com.conindustries.genesislib.model.Library.class});

            // try to load dataFileLocation "./bookstore-jaxb.xml"
            jaxbFile = new File(dataFileLocation);
            
            if (jaxbFile.exists()) {
                // load jaxbFile
                Unmarshaller jaxbUnMarshaller = jaxbContext.createUnmarshaller();
                library = (Library) jaxbUnMarshaller.unmarshal(jaxbFile);
            } else {
                // create annd save an empty jaxbFile
                library = new Library();

                // make directories if dont exist
                jaxbFile.getParentFile().mkdirs();

                // save empty data to new file
               save();
            }

        } catch (JAXBException ex) {
            throw new RuntimeException("problem creating persistor", ex);
        }

    }

    /**
     * saves data to datafile on updates
     */
    private void save() {
        try {
            Marshaller jaxbMarshaller = jaxbContext.createMarshaller();

            // output pretty printed
            jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
            jaxbMarshaller.marshal(library, jaxbFile);
        } catch (JAXBException ex) {
            throw new RuntimeException("problem persisting dao", ex);
        }
    }

    @Override
    public List<BookItem> getBooks() {
       return library.getBooks();
    }

    @Override
    public void setBooks(List<BookItem> books) {
       library.setBooks(books);
    }
}
