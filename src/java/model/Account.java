/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author THANH BINH
 */
public class Account {
    private int id;
    private String useraccount;
    private String username;
    private String email;
    private String numberphone;
    private String address;
    private String password;
    private int idsell;
    private int idadmin;

    public Account() {
    }

    public Account(int id, String useraccount, String username, String email, String numberphone, String address, String password, int idsell, int idadmin) {
        this.id = id;
        this.useraccount = useraccount;
        this.username = username;
        this.email = email;
        this.numberphone = numberphone;
        this.address = address;
        this.password = password;
        this.idsell = idsell;
        this.idadmin = idadmin;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUseraccount() {
        return useraccount;
    }

    public void setUseraccount(String useraccount) {
        this.useraccount = useraccount;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNumberphone() {
        return numberphone;
    }

    public void setNumberphone(String numberphone) {
        this.numberphone = numberphone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIdsell() {
        return idsell;
    }

    public void setIdsell(int idsell) {
        this.idsell = idsell;
    }

    public int getIdadmin() {
        return idadmin;
    }

    public void setIdadmin(int idadmin) {
        this.idadmin = idadmin;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", useraccount=" + useraccount + ", username=" + username + ", email=" + email + ", numberphone=" + numberphone + ", address=" + address + ", password=" + password + ", idsell=" + idsell + ", idadmin=" + idadmin + '}';
    }
    
}
