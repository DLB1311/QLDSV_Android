package com.example.QLDSV;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;

public class Thongtinsv extends AppCompatActivity {

    private CardView cvHome;
    private Button btnDMK;
    String maSinhVien;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_thongtinsv);
        Intent intent = getIntent();
        maSinhVien = intent.getStringExtra("maSinhVien");
        //      Ánh xạ
        setControl();

//      Click
        setEvent();
    }

    private void setEvent() {
        cvHome.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Thongtinsv.this, TrangChuSV.class);
                intent.putExtra("maSinhVien", maSinhVien);
                startActivity(intent);
            }
        });
        btnDMK.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Thongtinsv.this, Doimatkhausv.class);
                intent.putExtra("maSinhVien", maSinhVien);
                startActivity(intent);
            }
        });
    }

    private void setControl() {
        cvHome= findViewById(R.id.cv_home);
        btnDMK= findViewById(R.id.btn_dmk);
    }


}
