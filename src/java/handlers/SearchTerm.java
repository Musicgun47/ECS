/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package handlers;

/**
 *
 * @author JOEL
 */
public class SearchTerm {
    
    private String firstName;
    private String lastName;
    
    public SearchTerm(){
        firstName = "";
        lastName = "";
    }

    public String getFirstName() {
        return firstName;
    }
    
    public String getLastName() {
        return lastName;
    }

    public void setSearchTerm(String searchTerm) {
        if(searchTerm.contains(" ")){
            String[] names = searchTerm.split(" ");
            firstName = "%" + names[0] + "%";
            lastName = "%" + names[1] + "%";
        }
        else{
            firstName = "%" + searchTerm + "%";
            lastName = "%" + searchTerm + "%";
        }
    }
}
