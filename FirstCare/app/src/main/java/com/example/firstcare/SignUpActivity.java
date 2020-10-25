package com.example.firstcare;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.firebase.firestore.CollectionReference;
import com.google.firebase.firestore.FirebaseFirestore;

import java.util.HashMap;
import java.util.Map;

public class SignUpActivity extends AppCompatActivity {


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.register_page);
        Button submit = findViewById(R.id.submit);
        submit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                final String TAG = "Sample";
                EditText fullName = findViewById(R.id.name);
                EditText address = findViewById(R.id.address);
                EditText p_num = findViewById(R.id.phn);
                EditText i_num = findViewById(R.id.hin);
                EditText e_num = findViewById(R.id.ecn);
                EditText m_conditions = findViewById(R.id.emc);
                FirebaseFirestore db = FirebaseFirestore.getInstance();
                final CollectionReference collectionReference = db.collection("Users");
                Map<String, String> user = new HashMap<>();
                user.put("fullName", fullName.getText().toString());
                user.put("address", address.getText().toString());
                user.put("p_num", p_num.getText().toString());
                user.put("i_num", i_num.getText().toString());
                user.put("e_num", e_num.getText().toString());
                user.put("m_conditions", m_conditions.getText().toString());

                collectionReference
                        .document(fullName.getText().toString())
                        .set(user)
                        .addOnSuccessListener(new OnSuccessListener<Void>() {
                            @Override
                            public void onSuccess(Void aVoid) {
                                // These are a method which gets executed when the task is succeeded
                                Log.d(TAG, "Data has been added successfully!");
                            }
                        })
                        .addOnFailureListener(new OnFailureListener() {
                            @Override
                            public void onFailure(@NonNull Exception e) {
                                // These are a method which gets executed if there’s any problem
                                Log.d(TAG, "Data could not be added!" + e.toString());
                            }
                        });
            }
        });


    }
}

