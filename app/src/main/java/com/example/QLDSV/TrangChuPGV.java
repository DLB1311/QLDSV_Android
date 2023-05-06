package com.example.QLDSV;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

public class TrangChuPGV extends AppCompatActivity {
    Button btnMonhoc;
    Button btnLoptinchi;

    Button btnTaiKhoanSV;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.trangchu_pgv);

        btnMonhoc = findViewById(R.id.btnMonhoc);
        btnTaiKhoanSV = findViewById(R.id.btnTaiKhoanSV);
        btnMonhoc.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Log.i("Btn", "Bam nut ne");

                Intent intent = new Intent(TrangChuPGV.this, QlmonhocMainActivity.class);
                startActivity(intent);
                finish();
            }
        });
        btnTaiKhoanSV.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(TrangChuPGV.this, Qltaikhoansv.class);
                startActivity(intent);
                finish();
            }
        });

        btnLoptinchi = findViewById(R.id.btnLoptinchi);
        btnLoptinchi.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(TrangChuPGV.this, Qlloptinchi_main.class);
                startActivity(intent);
                finish();
            }
        });
    }
}