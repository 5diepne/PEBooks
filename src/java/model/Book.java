/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;

/**
 *
 * @author DiepTCNN
 */
public class Book implements Serializable{
    private int id, quantity;
    private String title, author,publication_date;

    public Book() {
    }

    public Book(int id, String title, String author, String publication_date, int quantity) {
        this.id = id;
        this.quantity = quantity;
        this.title = title;
        this.author = author;
        this.publication_date = publication_date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublication_date() {
        return publication_date;
    }

    public void setPublication_date(String publication_date) {
        this.publication_date = publication_date;
    }

    @Override
    public String toString() {
        return "Book{" + "id=" + id + ", quantity=" + quantity + ", title=" + title + ", author=" + author + ", publication_date=" + publication_date + '}';
    }
}
