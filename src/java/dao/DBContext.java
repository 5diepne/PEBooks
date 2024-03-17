package dao;

import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Book;
import model.Loan;

public class DBContext implements DatabaseInfo, Serializable {

    private String borrowerName;
    private String startDate;
    private String endDate;

    public DBContext() {
    }

    public DBContext(String borrowerName, String startDate, String endDate) {
        this.borrowerName = borrowerName;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public String getBorrowerName() {
        return borrowerName;
    }

    public void setBorrowerName(String borrowerName) {
        this.borrowerName = borrowerName;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public static Connection getConnect() {
        try {
            Class.forName(DRIVERNAME);
        } catch (ClassNotFoundException e) {
            System.out.println("Error loading driver" + e);
        }
        try {
            Connection con = DriverManager.getConnection(DBURL, USERDB, PASSDB);
            return con;
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }
//-----------------------------------------------------------------------

//-------------------------------------------------------------------------------------------
    public ArrayList<Book> getAll() {
        ArrayList<Book> list = new ArrayList<Book>();
        //Connection con = getConnect();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("select * from Books");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5)));
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Loan> getAllLoans() {
        ArrayList<Loan> list = new ArrayList<Loan>();
        //Connection con = getConnect();
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("select * from Loans");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Loan(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5)));
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void updateBooksByAuthor(String oldAuthor, String newAuthor) {
        String sql = "UPDATE [dbo].[Books]\n"
                + "   SET author = ?\n"
                + " WHERE author = ?";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, newAuthor);
            ps.setString(2, oldAuthor);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<Book> getBorrowedBooks() {
        List<Book> list = new ArrayList<>();
        String sql = "SELECT * FROM Books\n"
                + "WHERE id IN (\n"
                + "	SELECT book_id FROM Loans\n"
                + "	WHERE borrower_name = ? \n"
                + "		  AND loan_date >= ? \n"
                + "		  AND loan_date <= ? \n"
                + ")";
        try (Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, borrowerName);
            ps.setString(2, startDate);
            ps.setString(3, endDate);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Book b = new Book(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5));
                list.add(b);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean getBooksOverdue(String borrowedName) {
        List<Loan> list = new ArrayList<>();
        String sql = "select * from Loans where getdate() > return_date and borrower_name = ?";
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, borrowerName);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public static void main(String[] args) {
        DBContext d = new DBContext();
        System.out.println(d.getBorrowedBooks());

    }
//---------------------------------------------------------

//---------------------------------------------------------------------------
}
