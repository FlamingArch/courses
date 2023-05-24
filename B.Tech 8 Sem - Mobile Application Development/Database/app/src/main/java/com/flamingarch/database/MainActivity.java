package com.flamingarch.database;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

import java.util.List;

public class MainActivity extends AppCompatActivity {
    // References to all buttons and layouts
    Button btn_add, btn_view;
    EditText et_name, et_roll_no, et_reg_no;
    ListView lv_customer_list;

    ArrayAdapter studentArrayAdapter;
    DatabaseHelper helper;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btn_add = findViewById(R.id.btnAdd);
        btn_view = findViewById(R.id.btnView);
        et_name = findViewById(R.id.etName);
        et_reg_no = findViewById(R.id.etRegNo);
        et_roll_no = findViewById(R.id.etRollNo);
        lv_customer_list = findViewById(R.id.lvStudents);

        helper = new DatabaseHelper(MainActivity.this);


        showCustomersOnListView(helper);

        btn_add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                StudentModel studentModel;
                try {
                    studentModel = new StudentModel(-1, et_name.getText().toString(), Integer.parseInt(et_roll_no.getText().toString()), Integer.parseInt(et_reg_no.getText().toString()));
                    Toast.makeText(MainActivity.this, "Success Creating Object", Toast.LENGTH_LONG).show();

                } catch (Exception e) {
                    Toast.makeText(MainActivity.this, "Error Creating Object", Toast.LENGTH_LONG).show();
                    studentModel = new StudentModel(-1, "error", 0, 0);
                }

                DatabaseHelper databaseHelper = new DatabaseHelper(MainActivity.this);

                boolean success = databaseHelper.addOne(studentModel);
                Toast.makeText(MainActivity.this, "Add result: " + success, Toast.LENGTH_LONG).show();

                showCustomersOnListView(helper);

            }
        });

        btn_view.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                helper = new DatabaseHelper(MainActivity.this);
                showCustomersOnListView(helper);
            }
        });

        lv_customer_list.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                StudentModel clickedStudent = (StudentModel) parent.getItemAtPosition(position);
                helper.deleteOne(clickedStudent);
                showCustomersOnListView(helper);
                Toast.makeText(MainActivity.this, "Deleted Student: " + clickedStudent.getName(), Toast.LENGTH_SHORT).show();
            }
        });

    }

    private void showCustomersOnListView(DatabaseHelper helper) {
        studentArrayAdapter = new ArrayAdapter<StudentModel>(MainActivity.this, android.R.layout.simple_list_item_1, helper.getEveryone());
        lv_customer_list.setAdapter(studentArrayAdapter);
    }
}