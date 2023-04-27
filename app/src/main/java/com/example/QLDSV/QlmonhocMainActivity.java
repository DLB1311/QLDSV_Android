package com.example.QLDSV;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Spinner;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.SearchView;

import com.example.Objects.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class QlmonhocMainActivity extends AppCompatActivity {
    Button btnClickback;
    Button btnAddmonhoc, btnDelmonhoc;
    Connection conn;
    EditText searchMonhoc;
    ListView listMH;
    ArrayList<MonHoc> list = new ArrayList<>();
    Spinner spinner;
    ArrayList<String> listCN = new ArrayList<>();
    ArrayList<ChuyenNganh> listChuyenNganh = new ArrayList<>();
    SearchView searchView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.qlmonhoc_main);

        listMH = findViewById(R.id.listViewMonhoc);
        spinner = (Spinner) findViewById(R.id.spinnerCN);
        searchView = findViewById(R.id.searchMonhoc);
        loadSpinner(spinner, listCN);
        loadChuyenNganh();
        searchingMonhoc();

        btnDelmonhoc = findViewById(R.id.btnDelmonhoc);
        btnDelmonhoc.setEnabled(false);

        listMH.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            int chosingIndex = -1;
            @Override
            public boolean onItemLongClick(AdapterView<?> adapterView, View view, int i, long l) {
                if(chosingIndex == -1) {
                    adapterView.getChildAt(i).setBackground(getDrawable(R.color.background2nd));
                    btnDelmonhoc.setBackground(getDrawable(R.drawable.buttonmain));
                    btnDelmonhoc.setEnabled(true);
                    btnDelmonhoc.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            Log.i("Iiiii", list.get(i).toString());
                            deleteMonHoc(i);
                            btnDelmonhoc.setBackground(getDrawable(R.drawable.mybutton));
                            adapterView.getChildAt(i).setBackground(null);
                            btnDelmonhoc.setEnabled(false);
                        }
                    });
                    chosingIndex = i;
                }
                else {
                    adapterView.getChildAt(i).setBackground(getDrawable(R.color.background2nd));
                    adapterView.getChildAt(chosingIndex).setBackground(null);
                    btnDelmonhoc.setBackground(getDrawable(R.drawable.buttonmain));
                    btnDelmonhoc.setEnabled(true);
                    btnDelmonhoc.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            Log.i("Iiiii", list.get(i).toString());
                            deleteMonHoc(i);
                            btnDelmonhoc.setBackground(getDrawable(R.drawable.mybutton));
                            adapterView.getChildAt(i).setBackground(null);
                            btnDelmonhoc.setEnabled(false);
                        }
                    });
                    chosingIndex = -1;
                }
                return true;
            }
        });

        btnClickback = findViewById(R.id.btnClickback);
        btnClickback.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(QlmonhocMainActivity.this, TrangChuPGV.class);
                startActivity(intent);
            }
        });



        btnAddmonhoc = findViewById(R.id.btnAddmonhoc);
        btnAddmonhoc.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(QlmonhocMainActivity.this, QlmonhocTaomonhocActivity.class);
                startActivity(intent);
            }
        });

        spinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {

            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                String tenCN = listCN.get(i).toString();
                if(getMaCN(tenCN).equals("")){
                    loadListMonHoc();
                    listMH.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                        @Override
                        public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                            Intent intent = new Intent(QlmonhocMainActivity.this, QlmonhocDetailsActivity.class);
                            Log.i("MaMh", list.get(i).getMamh());
                            intent.putExtra("mamh", list.get(i).getMamh());
                            startActivity(intent);
                        }
                    });
                }
                else {
                    loadListMonHocChuyenNganh(getMaCN(tenCN));
                    listMH.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                        @Override
                        public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                            Intent intent = new Intent(QlmonhocMainActivity.this, QlmonhocDetailsActivity.class);
                            Log.i("MaMh", list.get(i).getMamh());
                            intent.putExtra("mamh", list.get(i).getMamh());
                            startActivity(intent);
                        }
                    });
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {

            }
        });
    }

    public void searchingMonhoc() {
        searchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            @Override
            public boolean onQueryTextSubmit(String query) {
                return false;
            }

            @Override
            public boolean onQueryTextChange(String newText) {
                ArrayList<MonHoc> listMonhocDB = new ArrayList<>();
                try {
                    connectionHelper ch = new connectionHelper();
                    conn = ch.connectionClass();
                    if(conn != null) {
                        String query = "SELECT * FROM MonHoc";
                        Statement st = conn.createStatement();
                        ResultSet rs = st.executeQuery(query);
                        while (rs.next()) {
                            String mamh = rs.getString("MaMH");
                            String tenmh = rs.getString("TenMH");
                            MonHoc mh = new MonHoc(mamh, tenmh);
                            listMonhocDB.add(mh);
                        }
                    }
                }
                catch (Exception e) {
                    Log.e("ERROR", e.getMessage());
                }
                ArrayList<MonHoc> listSearching = new ArrayList<>();
                for (MonHoc mh : listMonhocDB) {
                    if (mh.getTenmh().toLowerCase().contains(newText.toLowerCase()) ||
                            mh.getMamh().toLowerCase().contains(newText.toLowerCase())) {
                        listSearching.add(mh);
                    }
                }
                MonhocAdapter adapter = new MonhocAdapter(getApplicationContext(), R.layout.list_monhoc, listSearching);
                listMH.setAdapter(adapter);

                return false;
            }
        });
    }

    public void loadListMonHoc() {
        try {
            connectionHelper ch = new connectionHelper();
            conn = ch.connectionClass();
            if(conn != null) {
                String query = "SELECT * FROM MonHoc";
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(query);
                while (rs.next()) {
                    String mamh = rs.getString("MaMH");
                    String tenmh = rs.getString("TenMH");
                    MonHoc mh = new MonHoc(mamh, tenmh);
                    list.add(mh);
                }
            }
        }
        catch (Exception e) {
            Log.e("ERROR", e.getMessage());
        }
        MonhocAdapter adapter = new MonhocAdapter(this,R.layout.list_monhoc,list);
        listMH.setAdapter(adapter);
    }
    public void loadListMonHocChuyenNganh(String str) {
        list = new ArrayList<>();
        try {
            connectionHelper ch = new connectionHelper();
            conn = ch.connectionClass();
            if(conn != null) {
                String query = "SELECT * FROM MonHoc WHERE MaCN = '"+str+"'";
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(query);
                while (rs.next()) {
                    String mamh = rs.getString("MaMH");
                    String tenmh = rs.getString("TenMH");
                    MonHoc mh = new MonHoc(mamh, tenmh);
                    list.add(mh);
                }
            }
        }
        catch (Exception e) {
            Log.e("ERROR", e.getMessage());
        }
        MonhocAdapter adapter = new MonhocAdapter(this,R.layout.list_monhoc,list);
        listMH.setAdapter(adapter);
    }
    public void loadSpinner(Spinner spinner, ArrayList listCN) {
        listCN.add("Chọn tất cả chuyên ngành");
        try {
            connectionHelper ch = new connectionHelper();
            conn = ch.connectionClass();
            if(conn != null) {
                String query = "SELECT * FROM ChuyenNganh";
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(query);
                while (rs.next()) {
                    String tencn = rs.getString("TenCN");
                    listCN.add(tencn);
                }
            }
        }
        catch (Exception e) {
            Log.e("ERROR", e.getMessage());
        }
        ArrayAdapter adapter = new ArrayAdapter(this, R.layout.spinner_item,listCN);
        adapter.setDropDownViewResource(R.layout.spinner_dropdown_chuyennganh);
        spinner.setAdapter(adapter);
    }
    public void loadChuyenNganh() {
        try {
            connectionHelper ch = new connectionHelper();
            conn = ch.connectionClass();
            if (conn != null) {
                String query = "SELECT * FROM ChuyenNganh";
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(query);
                while (rs.next()) {
                    String macn = rs.getString("MaCN");
                    String tencn = rs.getString("TenCN");
                    ChuyenNganh cn = new ChuyenNganh(macn, tencn);
                    listChuyenNganh.add(cn);
                }
            }
        } catch (Exception e) {
            Log.e("ERROR", e.getMessage());
        }
    }
    public String getMaCN(String str) {
        String MaCN = "";
        for(Object obj: listChuyenNganh) {
            if(obj instanceof ChuyenNganh) {
                if(str.equals(((ChuyenNganh) obj).getTencn())) {
                    MaCN = ((ChuyenNganh) obj).getMacn();
                }
            }
        }
        return MaCN;
    }
    public ArrayList<kehoachGiangDay> loadData(String str) {
        ArrayList<kehoachGiangDay> listKeHoach = new ArrayList<>();
        try {
            connectionHelper ch = new connectionHelper();
            conn = ch.connectionClass();
            if(conn != null) {
                String query = "SELECT MaCN FROM KeHoach WHERE MaMH = '" + str + "'";
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(query);
                while (rs.next()) {
                    String macn = rs.getString("MaCN");
                    kehoachGiangDay kh = new kehoachGiangDay(macn);
                    listKeHoach.add(kh);
                }
            }
        }
        catch (Exception e) {
            Log.e("ERROR", e.getMessage());
        }
        return listKeHoach;
    }
    public void deleteFail(String str) {
        AlertDialog.Builder bulider = new AlertDialog.Builder(QlmonhocMainActivity.this);
        bulider.setMessage("Không thể xoá môn " + str.trim() + ". Do môn học này đã có kế hoạch giảng dạy");
        bulider.setCancelable(true);
        bulider.setPositiveButton("Đồng ý",new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int id) {
                dialog.cancel();
            }
        });
        AlertDialog alert = bulider.create();
        alert.show();
        bulider.setOnDismissListener(new DialogInterface.OnDismissListener() {
            @Override
            public void onDismiss(DialogInterface dialogInterface) {
                dialogInterface.dismiss();
            }
        });
    }
    public void deleteMonHoc(int i) {
        AlertDialog.Builder bulider = new AlertDialog.Builder(QlmonhocMainActivity.this);
        bulider.setMessage("Xác nhận xoá môn học này?");
        bulider.setCancelable(true);
        bulider.setPositiveButton("Yes",new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int id) {
                String mamh = list.get(i).getMamh();
                Log.i("MaMH", mamh);
                MonHoc monhoc = list.get(i);
                Log.i("MonhocMaMH", monhoc.getMamh());
                ArrayList<kehoachGiangDay> listKeHoach = loadData(mamh);
                if(listKeHoach.size() == 0) {
                    list.remove(monhoc);
                    try {
                        String query = "DELETE FROM MonHoc WHERE MaMH = '" + mamh + "'";
                        PreparedStatement pst = conn.prepareStatement(query);
                        pst.executeUpdate();
                    } catch (Exception e) {
                        Log.e("ERROR", e.getMessage());
                    }
                    loadListMonHoc();
                }
                else {
                    deleteFail(list.get(i).getTenmh());
                }
                listKeHoach = new ArrayList<>();
                dialog.cancel();
            }
        });
        bulider.setNegativeButton("No",new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int id) {
                dialog.cancel();
            }
        });
        AlertDialog alert = bulider.create();
        alert.show();
    }
}