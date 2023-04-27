package com.example.QLDSV;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.example.Database.DatabaseManager;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class DangNhap extends AppCompatActivity {
    EditText txtTaikhoan, txtPassword;
    Button btnDangnhap;
    Connection conn;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.dangnhap_main);

        txtTaikhoan = findViewById(R.id.txtTaikhoan);
        txtPassword = findViewById(R.id.txtPassword);

        btnDangnhap = findViewById(R.id.btnDangnhap);
        btnDangnhap.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String mavt = loadMaVaiTro(txtTaikhoan.getText().toString(), txtPassword.getText().toString());
                String matk = loadMaTK(txtTaikhoan.getText().toString(), txtPassword.getText().toString());

                if(checkEmpty(txtTaikhoan)) {
                    txtTaikhoan.setError("Vui lòng nhập tên tài khoản");
                }
                else if(checkEmpty(txtPassword)) {
                    txtPassword.setError("Vui lòng nhập mật khẩu");
                }
                else {
                    if (mavt.equals("")) {
                        AlertDialog.Builder bulider = new AlertDialog.Builder(DangNhap.this);
                        bulider.setMessage("Thông tin đăng nhập chưa chính xác.");
                        bulider.setCancelable(true);
                        bulider.setPositiveButton("Đồng ý",new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int id) {
                                dialog.cancel();
                            }
                        });
                        AlertDialog alert = bulider.create();
                        alert.show();
                    }
                    else if(mavt.equals("VT1")) {
                        Intent intent = new Intent(DangNhap.this, TrangChuPGV.class);
                        startActivity(intent);
                    }
                    else if (mavt.equals("VT2")) {
                        Intent intent = new Intent(DangNhap.this, nhapdiem.class);
                        startActivity(intent);
                    }
                    else if (mavt.equals("VT3")) {
                        Intent intent = new Intent(DangNhap.this, TrangChuSV.class);
                        intent.putExtra("maSinhVien", matk);
                        startActivity(intent);
                    }
                    else {
                        Intent intent = new Intent(DangNhap.this, nhapdiem_ct_ltc.class);
                        startActivity(intent);
                    }
                }
            }
        });
    }
    public String loadMaVaiTro(String taikhoan, String matkhau) {
        String mavt = "";
        try {
//            connectionHelper ch = new connectionHelper();
//            conn = ch.connectionClass();

            conn = DatabaseManager.getConnection();
            if(conn != null) {
                String query = "SELECT MaVaitro FROM TaiKhoan WHERE TenTaiKhoan = '" + taikhoan + "' AND MatKhau = '" + matkhau + "'";
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(query);
                while (rs.next()) {
                    mavt = rs.getString("MaVaiTro");
                }
            }
        }
        catch (Exception e) {
            Log.e("ERROR", e.getMessage());
        }
        Log.e("MAVT", mavt);
        return mavt;
    }

    public String loadMaTK(String taikhoan, String matkhau) {
        String matk = "" ;
        try {
//            connectionHelper ch = new connectionHelper();
//            conn = ch.connectionClass();

            conn = DatabaseManager.getConnection();
            if(conn != null) {
                String query = "SELECT Matk FROM TaiKhoan WHERE TenTaiKhoan = '" + taikhoan + "' AND MatKhau = '" + matkhau + "'";
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(query);
                while (rs.next()) {
                    matk = rs.getString("Matk");

                }
            }
        }
        catch (Exception e) {
            Log.e("ERROR", e.getMessage());
        }
        Log.e("MATK", matk);
        return matk;
    }

    boolean checkEmpty(EditText edt) {
        CharSequence check = edt.getText().toString();
        return TextUtils.isEmpty(check);
    }
}