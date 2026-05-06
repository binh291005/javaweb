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
public class AccountDAO {
    Connection conn = new dbConnect().getConnection();
    public void insert(Account a){
        String sql = "INSERT INTO account(userAccount,username,email,numberphone,address,password,idsell,idadmin) VALUES (?,?,?,?,?,?,?,?)";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,a.getUseraccount());
            ps.setString(2,a.getUsername());
            ps.setString(3,a.getEmail());
            ps.setString(4,a.getNumberphone());
            ps.setString(5,a.getAddress());
            ps.setString(6,a.getPassword());
            ps.setInt(7,a.getIdadmin());
            ps.setInt(8,a.getIdsell());
            ps.executeUpdate();
        }catch(Exception e){e.printStackTrace();}
    }

    public void delete(int id){
        try{
            PreparedStatement ps = conn.prepareStatement("DELETE FROM account WHERE id=?");
            ps.setInt(1,id);
            ps.executeUpdate();
        }catch(Exception e){}
    }

    public Account getById(int id){
        try{
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM account WHERE id=?");
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return new Account(
                    rs.getInt("id"),
                    rs.getString("userAccount"),
                    rs.getString("username"),
                    rs.getString("email"),
                    rs.getString("numberphone"),
                    rs.getString("address"),
                    rs.getString("password"),
                    rs.getInt("idsell"),
                    rs.getInt("idadmin")
                );
            }
        }catch(Exception e){}
        return null;
    }

    public void update(Account a){
        String sql="UPDATE account SET userAccount=?,username=?,email=?,numberphone=?,address=?,password=? WHERE id=?";
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,a.getUseraccount());
            ps.setString(2,a.getUsername());
            ps.setString(3,a.getEmail());
            ps.setString(4,a.getNumberphone());
            ps.setString(5,a.getAddress());
            ps.setString(6,a.getPassword());
            ps.setInt(7,a.getId());
            ps.executeUpdate();
        }catch(Exception e){}
    }

    public List<Account> search(String key){
        List<Account> list=new ArrayList<>();
        try{
            PreparedStatement ps=conn.prepareStatement("SELECT * FROM account WHERE username LIKE ?");
            ps.setString(1,"%"+key+"%");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                list.add(new Account(
                    rs.getInt("id"),
                    rs.getString("userAccount"),
                    rs.getString("username"),
                    rs.getString("email"),
                    rs.getString("numberphone"),
                    rs.getString("address"),
                    rs.getString("password"),
                    rs.getInt("idsell"),
                    rs.getInt("idadmin")
                ));
            }
        }catch(Exception e){}
        return list;
    }
}
