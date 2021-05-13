package DAO;

import Model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MyDao {
    private static final String url = "jdbc:postgresql://localhost:5432/booksShop";
    private static final String user = "postgres";
    private static final String password = "1234";

    public static boolean getAdminAuthenticate(String adminUsername, String adminPassword) {
        ArrayList<Admin> admins = new ArrayList<>();
        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, user, password)){

                Statement statement = conn.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM admins");
                while(resultSet.next()){

                    int id = resultSet.getInt(1);
                    String username = resultSet.getString(2);
                    String password = resultSet.getString(3);
                    Admin admin = new Admin();
                    admin.setAdminId(id);
                    admin.setAdminUsername(username);
                    admin.setAdminPassword(password);
                    admins.add(admin);
                }
            }
            for (Admin admin: admins){
                if (admin.getAdminUsername().equals(adminUsername)
                        && admin.getAdminPassword().equals(adminPassword)){
                    return true;
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return false;
    }

    public static boolean getUserAuthenticate(String username, String userPassword) {
        ArrayList<User> users = new ArrayList<>();
        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, user, password)){

                Statement statement = conn.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM users");
                while(resultSet.next()){

                    int id = resultSet.getInt(1);
                    String user_username = resultSet.getString(2);
                    String password = resultSet.getString(3);
                    String user_email = resultSet.getString(4);
                    User user = new User();
                    user.setUser_id(id);
                    user.setUsername(user_username);
                    user.setUser_password(password);
                    user.setEmail(user_email);
                    users.add(user);
                }
            }
            for (User user: users){
                if (user.getEmail().equals(username)
                        && user.getUser_password().equals(userPassword)){
                    return true;
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return false;
    }

    public static boolean addNewUser(User newUser) {
        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, user, password)){

                String sql = "INSERT INTO users (user_name, user_password, user_email) Values (?, ?, ?)";
                try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
                    preparedStatement.setString(1, newUser.getUsername());
                    preparedStatement.setString(2, newUser.getUser_password());
                    preparedStatement.setString(3, newUser.getEmail());
                    preparedStatement.executeUpdate();

                    return true;
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return false;
    }


    public ArrayList<Book> select() {

        ArrayList<Book> books = new ArrayList<>();
        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, user, password)){

                Statement statement = conn.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM books");
                while(resultSet.next()){
                    int id = resultSet.getInt(1);
                    String name = resultSet.getString(2);
                    String author = resultSet.getString(3);
                    String img = resultSet.getString(4);
                    String description = resultSet.getString(5);
                    double price = resultSet.getInt(6);
                    int year = resultSet.getInt(7);
                    Book book = new Book();
                    book.setBookId(id);
                    book.setBookName(name);
                    book.setBookYear(year);
                    book.setBookPrice(price);
                    book.setBookAuthor(author);
                    book.setBookImg(img);
                    book.setBookDescription(description);
                    books.add(book);
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return books;
    }

    public ArrayList<Cart> cartList(int user_id) {

        ArrayList<Cart> carts = new ArrayList<>();
        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, user, password)){

                Statement statement = conn.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM carts WHERE user_id="+user_id);
                while(resultSet.next()){
                    int id = resultSet.getInt(1);
                    int amount = resultSet.getInt(2);
                    String bookName = resultSet.getString(3);
                    double price = resultSet.getDouble(4);
                    double total = resultSet.getDouble(5);
                    int userId = resultSet.getInt(6);
                    Cart cart = new Cart();
                    cart.setAmount(amount);
                    cart.setBook_name(bookName);
                    cart.setCart_id(id);
                    cart.setCost(price);
                    cart.setTotal_cost(total);
                    cart.setUser_id(userId);
                    carts.add(cart);
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return carts;
    }

    public Book selectOne(int id) {

        Book book = null;
        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, user, password)){

                String sql = "SELECT * FROM books WHERE book_id=?";
                try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
                    preparedStatement.setInt(1, id);
                    ResultSet resultSet = preparedStatement.executeQuery();
                    if(resultSet.next()){
                        int bookId = resultSet.getInt(1);
                        String name = resultSet.getString(2);
                        String author = resultSet.getString(3);
                        String img = resultSet.getString(4);
                        String description = resultSet.getString(5);
                        double price = resultSet.getInt(6);
                        int year = resultSet.getInt(7);
                        book = new Book();
                        book.setBookPrice(price);
                        book.setBookYear(year);
                        book.setBookName(name);
                        book.setBookId(bookId);
                        book.setBookAuthor(author);
                        book.setBookImg(img);
                        book.setBookDescription(description);
                    }
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return book;
    }

    public boolean insert(Book book) {

        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, user, password)){

                String sql = "INSERT INTO books (book_name, book_author, book_img, book_description, book_price, book_year) Values (?, ?, ?, ?, ?, ?)";
                try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
                    preparedStatement.setString(1, book.getBookName());
                    preparedStatement.setString(2, book.getBookAuthor());
                    preparedStatement.setString(3, book.getBookImg());
                    preparedStatement.setString(4, book.getBookDescription());
                    preparedStatement.setDouble(5, book.getBookPrice());
                    preparedStatement.setInt(6, book.getBookYear());
                    preparedStatement.executeUpdate();

                    return true;
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return false;
    }

    public boolean buyCart(Cart cart) {

        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, user, password)){

                String sql = "INSERT INTO carts (amount, book_name, cost, total_cost, user_id)" +
                        " Values (?, ?, ?, ?, ?)";
                try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
                    preparedStatement.setInt(1, cart.getAmount());
                    preparedStatement.setString(2, cart.getBook_name());
                    preparedStatement.setDouble(3, cart.getCost());
                    preparedStatement.setDouble(4, cart.getTotal_cost());
                    preparedStatement.setInt(5, cart.getUser_id());
                    preparedStatement.executeUpdate();

                    return true;
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return false;
    }

    public boolean update(Book book) {

        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, user, password)){

                String sql = "UPDATE books SET book_name = ?, book_author = ?, book_img = ?, book_description = ?," +
                        " book_price = ?, book_year = ? WHERE book_id = ?";
                try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
                    preparedStatement.setString(1, book.getBookName());
                    preparedStatement.setString(2, book.getBookAuthor());
                    preparedStatement.setString(3, book.getBookImg());
                    preparedStatement.setString(4, book.getBookDescription());
                    preparedStatement.setDouble(5, book.getBookPrice());
                    preparedStatement.setInt(6, book.getBookYear());
                    preparedStatement.setInt(7, book.getBookId());
                    preparedStatement.executeUpdate();

                    return true;
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return false;
    }

    public boolean delete(int id) {

        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, user, password)){

                String sql = "DELETE FROM books WHERE book_id = ?";
                try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
                    preparedStatement.setInt(1, id);
                    preparedStatement.executeUpdate();
                    return true;
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return false;
    }

    public User selectUser(String user_email) {
        User user1 = null;
        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, user, password)){

                String sql = "SELECT * FROM users WHERE user_email=?";
                try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
                    preparedStatement.setString(1, user_email);
                    ResultSet resultSet = preparedStatement.executeQuery();
                    if(resultSet.next()){

                        int userId = resultSet.getInt(1);
                        String name = resultSet.getString(2);
                        String user_password = resultSet.getString(3);
                        String userEmail = resultSet.getString(4);
                        user1 = new User();
                        user1.setEmail(userEmail);
                        user1.setUser_password(user_password);
                        user1.setUsername(name);
                        user1.setUser_id(userId);
                    }
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return user1;
    }
}
