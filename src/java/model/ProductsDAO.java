/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author THANH BINH
 */
public class ProductsDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Products> getAll() {
        List<Products> list = new ArrayList<>();
        String sql = "select * from product";
        try {
            conn = new dbConnect().getConnection(); // mở kết nối với sql
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Products(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(8)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from category";
        try {
            conn = new dbConnect().getConnection(); // mở kết nối với sql
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Products getLast() {
        String sql = "SELECT * FROM product ORDER BY id DESC LIMIT 1";
        try {
            conn = new dbConnect().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Products(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(8)
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Products> getProductByCID(String cid) {
        List<Products> list = new ArrayList<>();
        String sql = "select * from product where cid = ?";
        try {
            conn = new dbConnect().getConnection(); // mở kết nối với sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Products(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(8)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Products getProductByID(String id) {
        String sql = "select * from product where id = ?";
        try {
            conn = new dbConnect().getConnection(); // mở kết nối với sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return (new Products(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(8)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Products> searchByName(String txtSearch) {
        List<Products> list = new ArrayList<>();
        String sql = "select * from product where name like ?";
        try {
            conn = new dbConnect().getConnection(); // mở kết nối với sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Products(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(8)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Account login(String user, String pass) {
        String sql = "select * from account where username = ? and password = ?";
        try {
            conn = new dbConnect().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getBoolean(8),
                        rs.getBoolean(9));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public Account checkAccount(String user) {
        String sql = "select * from account where username = ?";
        try {
            conn = new dbConnect().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getBoolean(8),
                        rs.getBoolean(9));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public void signup(String useraccount, String username, String email, int phone, String address, String pass) {
        String sql = "insert into account(userAccount,username,email,numberphone,address,password,idsell,idadmin) values(?,?,?,?,?,?,0,0)";
        try {
            conn = new dbConnect().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, useraccount);
            ps.setString(2, username);
            ps.setString(3, email);
            ps.setInt(4, phone);
            ps.setString(5, address);
            ps.setString(6, pass);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Products> getProductBySellID(int id) {
        List<Products> list = new ArrayList<>();
        String sql = "select * from product where sID = ?";
        try {
            conn = new dbConnect().getConnection(); // mở kết nối với sql
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Products(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(8)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void deleteProduct(int pid) {
        String sql = "delete from product where id = ?";
        try {
            conn = new dbConnect().getConnection(); // mở kết nối với sql
            ps = conn.prepareStatement(sql);
            ps.setInt(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addProduct(String name, String image, String price, String description, int category, int sid, int quantity) {
        String sql = "INSERT INTO product(name, image, price, description, cid, sID, quantity) VALUES (?,?,?,?,?,?,?)";
        try {
            conn = new dbConnect().getConnection(); // mở kết nối với sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, description);
            ps.setInt(5, category);
            ps.setInt(6, sid);
            ps.setInt(7, quantity);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void editProduct(String name, String image, String price, String description, int category, int pid, int quantity) {
        String sql = "UPDATE product SET name=?,image=?,price=?,description=?,cid=?,quantity=? WHERE id = ?";
        try {
            conn = new dbConnect().getConnection(); // mở kết nối với sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, description);
            ps.setInt(5, category);
            ps.setInt(6, quantity);
            ps.setInt(7, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Products> getNewProducts() {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT * FROM product ORDER BY id DESC LIMIT 8";
        try {
            conn = new dbConnect().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Products(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(8)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Products> getBestProducts() {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT * FROM product ORDER BY id ASC LIMIT 8"; // tạm thời

        try {
            conn = new dbConnect().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Products(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(8)
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public void insertContact(String name, String email, String message) {
        String sql = "INSERT INTO contact(name, email, message) VALUES(?,?,?)";

        try {
            Connection conn = new dbConnect().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, message);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        ProductsDAO dao = new ProductsDAO();
        List<Products> list = dao.getAll();
        List<Category> listC = dao.getAllCategory();
        for (Category o : listC) {
            System.out.println(o);
        }

    }
}
