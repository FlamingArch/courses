package com.flamingarch.database;

public class StudentModel {
    private int id;
    private String name;
    private int rollNo;
    private int registrationNumber;

    // constructors

    public StudentModel(int id, String name, int rollNo, int registrationNumber) {
        this.id = id;
        this.name = name;
        this.rollNo = rollNo;
        this.registrationNumber = registrationNumber;
    }

    public StudentModel() {

    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getRollNo() {
        return rollNo;
    }

    public int getRegistrationNumber() {
        return registrationNumber;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setRollNo(int rollNo) {
        this.rollNo = rollNo;
    }

    public void setRegistrationNumber(int registrationNumber) {
        this.registrationNumber = registrationNumber;
    }

    @Override
    public String toString() {
        return "StudentModel{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", rollNo=" + rollNo +
                ", registrationNumber=" + registrationNumber +
                '}';
    }
}
