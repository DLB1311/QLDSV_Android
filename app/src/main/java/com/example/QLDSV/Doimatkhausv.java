package com.example.QLDSV;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import com.example.Database.ConnectionHelper;
import com.example.Objects.TaiKhoan;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class Doimatkhausv extends AppCompatActivity {
    EditText txtMKCu, txtMKMoi, txtMKMoiXN;
    Button btnClickBack , btnDoiMatKhau;

    Connection conn;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_doimatkhausv);

        txtMKCu = findViewById(R.id.txtMKCu);
        txtMKMoi = findViewById(R.id.txtMKMoi);
        txtMKMoiXN = findViewById(R.id.txtMKMoiXN);

        btnDoiMatKhau = findViewById(R.id.btnDoiMatKhau);
        btnClickBack = findViewById(R.id.btnClickBack);

        btnClickBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(Doimatkhausv.this, Thongtinsv.class);
                startActivity(intent);
                finish();
            }
        });

        btnDoiMatKhau.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (checkEmpty(txtMKCu)) {
                    txtMKCu.setError("Không được bỏ trống.");
                } else if (checkEmpty(txtMKMoi)) {
                    txtMKMoi.setError("Không được bỏ trống.");
                }else if (checkEmpty(txtMKMoiXN)) {
                    txtMKMoiXN.setError("Không được bỏ trống.");
                }else if(!txtMKMoi.getText().toString().equals(txtMKMoiXN.getText().toString())) {
                    txtMKMoiXN.setError("Mật khẩu xác nhận không hợp lệ.");
                }else {
                    try {
                        ConnectionHelper ch = new ConnectionHelper();
                        conn = ch.connectionHelper();
//                        String query = "update TaiKhoan set TenTaiKhoan = ?, MatKhau = ? where MaTk = '" + tk.getMatk() + "'";
//                        PreparedStatement pst = conn.prepareStatement(query);
//                        pst.setString(1, tk.getTentk());
//                        pst.setString(2, tk.getMatkhau());
//                        pst.executeUpdate();
                    } catch (Exception e) {
                        Log.e("ERROR", e.getMessage());
                    }
                    alertSuccess();
                }
            }
        });
    }
    public boolean checkEmpty(EditText edt) {
        CharSequence check = edt.getText().toString();
        return TextUtils.isEmpty(check);
    }

    public boolean checkPassword(EditText edt){
        try {
            ConnectionHelper ch = new ConnectionHelper();
            conn = ch.connectionHelper();
//            String query = "update TaiKhoan set TenTaiKhoan = ?, MatKhau = ? where MaTk = '" + tk.getMatk() + "'";
//            PreparedStatement pst = conn.prepareStatement(query);
//            pst.setString(1, tk.getTentk());
//            pst.setString(2, tk.getMatkhau());
//            pst.executeUpdate();
        } catch (Exception e) {
            Log.e("ERROR", e.getMessage());
        }
        return true;
    }

    public void alertSuccess() {
        AlertDialog.Builder bulider = new AlertDialog.Builder(Doimatkhausv.this);
        bulider.setMessage("Đổi mật khẩu thành công.");
        bulider.setCancelable(true);
        bulider.setPositiveButton("Đồng ý",new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int id) {
                dialog.cancel();
                Intent intent = new Intent(Doimatkhausv.this, Thongtinsv.class);
                startActivity(intent);
                finish();
            }
        });
        AlertDialog alert = bulider.create();
        alert.show();
    }
}
