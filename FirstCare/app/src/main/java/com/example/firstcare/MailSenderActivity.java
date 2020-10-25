package com.example.firstcare;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;

import com.example.firstcare.GMailSender;
import com.example.firstcare.R;

public class MailSenderActivity extends Activity {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.email);

        final Button send = (Button) this.findViewById(R.id.send);
        send.setOnClickListener(new View.OnClickListener() {

            public void onClick(View v) {
                try {
                    GMailSender sender = new GMailSender("architsiby@gmail.com", "lordsloveMAN");
                    sender.sendMail("This is Subject",
                            "This is Body",
                            "architsiby@gmail.com",
                            "architsiby@gmail.com");

                } catch (Exception e) {
                    Log.e("SendMail", e.getMessage(), e);
                }

            }
        });

    }
}