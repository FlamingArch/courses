package com.flamingarch.database;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.List;

public class DatabaseHelper extends SQLiteOpenHelper {
    public static final String STUDENT_TABLE = "STUDENT_TABLE";
    public static final String COL_STUDENT_NAME = "STUDENT_NAME";
    public static final String COL_STUDENT_ROLLNO = "STUDENT_ROLLNO";
    public static final String COL_STUDENT_REGNO = "STUDENT_REGNO";
    public static final String COL_ID = "ID";

    public DatabaseHelper(@Nullable Context context) {
        super(context, "customer.db", null, 1);
    }

    // Called first time a database is accessed. Should create Database.
    @Override
    public void onCreate(SQLiteDatabase db) {
        String onCreateStatement = "CREATE TABLE " + STUDENT_TABLE + " (" + COL_ID + " INTEGER PRIMARY KEY AUTOINCREMENT, " + COL_STUDENT_NAME + " TEXT, " + COL_STUDENT_ROLLNO + " INT, " + COL_STUDENT_REGNO + " INT ) ";
        db.execSQL(onCreateStatement);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {

    }

    public boolean addOne(StudentModel studentModel) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues cv = new ContentValues();

        cv.put(COL_STUDENT_NAME, studentModel.getName());
        cv.put(COL_STUDENT_REGNO, studentModel.getRegistrationNumber());
        cv.put(COL_STUDENT_ROLLNO, studentModel.getRollNo());

        long insert = db.insert(STUDENT_TABLE, null, cv);

        return !(insert == -1);
    }

    public List<StudentModel> getEveryone() {
        List<StudentModel> returnList = new ArrayList<>();
        String queryString = "SElECT * FROM " + STUDENT_TABLE;
        SQLiteDatabase db = this.getReadableDatabase();

        Cursor cursor = db.rawQuery(queryString, null, null);

        if (cursor.moveToFirst()) {
            do {
                int studentId = cursor.getInt(0);
                String studentName = cursor.getString(1);
                int studentRegNo = cursor.getInt(2);
                int studentRollNo = cursor.getInt(3);

                StudentModel studentModel = new StudentModel(studentId, studentName, studentRollNo, studentRegNo);
                returnList.add(studentModel);
            } while (cursor.moveToNext());
        } else {

        }

        cursor.close();
        db.close();

        return returnList;
    }

    public boolean deleteOne(StudentModel studentModel) {
        SQLiteDatabase db = this.getWritableDatabase();
        String queryString = "DELETE FROM " + STUDENT_TABLE + " WHERE " + COL_ID + " = " + studentModel.getId();

        Cursor cursor = db.rawQuery(queryString, null, null);

        if (cursor.moveToFirst()) return true;
        else return false;
    }
}
