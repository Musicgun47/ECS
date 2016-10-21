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
public class DepartmentHandle {
    
    public static String[] departments = {"Management", "Human Resources", "Finance", "Development & Design",
    "Sales", "Marketing", "Shipping", "Product Development", "Supply Chain", "IT"};
    private int index;
    private int dept_id_generico;
    private int dept_id_mega;
    private String deptName;
    
    public DepartmentHandle(){
        index = 5;
        dept_id_generico = 0;
        dept_id_mega = 0;
        deptName = "";
    }

    public int getDept_id_generico() {
        return dept_id_generico;
    }

    public int getDept_id_mega() {
        return dept_id_mega;
    }
    
    public static int[] getID(int index){
        switch(index){
            case 0: return new int[]{1, 0};
            case 1: return new int[]{2, 1};
            case 2: return new int[]{3, 0};
            case 3: return new int[]{4, 0};
            case 4: return new int[]{6, 3};
            case 5: return new int[]{7, 4};
            case 6: return new int[]{8, 0};
            case 7: return new int[]{0, 2};
            case 8: return new int[]{0, 5};
            case 9: return new int[]{0, 6};
            default:return new int[]{0, 0};
        }
    }
    
    public String[] getDepartments(){
        return departments;
    }
    
    public void setIndex(int index){
        this.index = index;
        dept_id_generico = getID(index)[0];
        dept_id_mega = getID(index)[1];
        deptName = departments[index];
    }
    
    public int getIndex(){
        return index;
    }
    
    
    
    public String getDept(){
        return deptName;
    }
}
