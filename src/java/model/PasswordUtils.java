/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.security.MessageDigest;

/**
 *
 * @author THANH BINH
 */
public class PasswordUtils {
    public static String toMD5(String input){
        try{
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] bytes = md.digest(input.getBytes());
            StringBuilder sb = new StringBuilder();
            for(byte b: bytes){
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        }catch(Exception e){
            return null;
        }
    }
}
