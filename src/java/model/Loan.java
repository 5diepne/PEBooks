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
public class Loan implements Serializable{

    private int id, book_id;
    private String borrower_name, loan_date, return_date; 

    public Loan() {
    }

    public Loan(int id, int book_id, String borrower_name, String loan_date, String return_date) {
        this.id = id;
        this.book_id = book_id;
        this.borrower_name = borrower_name;
        this.loan_date = loan_date;
        this.return_date = return_date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public String getBorrower_name() {
        return borrower_name;
    }

    public void setBorrower_name(String borrower_name) {
        this.borrower_name = borrower_name;
    }

    public String getLoan_date() {
        return loan_date;
    }

    public void setLoan_date(String loan_date) {
        this.loan_date = loan_date;
    }

    public String getReturn_date() {
        return return_date;
    }

    public void setReturn_date(String return_date) {
        this.return_date = return_date;
    }

    @Override
    public String toString() {
        return "Loan{" + "id=" + id + ", book_id=" + book_id + ", borrower_name=" + borrower_name + ", loan_date=" + loan_date + ", return_date=" + return_date + '}';
    }
    
    
}
