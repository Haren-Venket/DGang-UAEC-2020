package com.example.firstcare;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.pdf.PdfDocument;
import android.os.Bundle;
import android.util.Log;
import android.view.View;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.AdapterListUpdateCallback;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

public class EmergencyActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        //pdf();


    }

    void pdf(){
        PdfDocument document = new PdfDocument();
        Paint paint = new Paint();
        PdfDocument.PageInfo pageInfo = new PdfDocument.PageInfo.Builder(250, 350, 1).create();
        PdfDocument.Page myPage = document.startPage(pageInfo);
        Canvas canvas = myPage.getCanvas();

        paint.setTextSize(15.5f);
        paint.setColor(Color.parseColor("black"));

        canvas.drawText("WTF",20,20,paint);
        document.finishPage(myPage);
        File file = new File(this.getFilesDir(),"WTf.pdf");
        try {
            document.writeTo(new FileOutputStream(file));
        } catch (IOException e) {
            e.printStackTrace();
        }

        document.close();


    }
};