package com.mvc.bean;

public class LoginBean 
{
    private String username,password, firstName, lastName;
    
    public void setName(String firstName, String lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }
    
    public String getName() {
        return firstName + " " + lastName;
    }
    
    public String getUsername(){
        return username;
    }
    public void setUsername(String username){
        this.username=username;
    }
    public String getPassword(){
        return password;
    }
    public void setPassword(String password){
        this.password=password;
    }
}
