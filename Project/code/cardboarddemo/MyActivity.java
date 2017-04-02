package com.demo.zhouc.cardboarddemo;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.os.Environment;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.ImageView;

import java.io.File;

import static com.demo.zhouc.cardboarddemo.R.id.btn_image_cardboard;
import static com.demo.zhouc.cardboarddemo.R.id.btn_video_cardboard;
import static com.demo.zhouc.cardboarddemo.R.id.btn_video_cardboard_anime;
import static com.demo.zhouc.cardboarddemo.R.id.btn_video_cardboard_sub;


public class MyActivity extends Activity {

    private ImageView mLeftView;
    private ImageView mRightView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        initUI();
    }

    private void initUI(){
        Button btnImageCardboard = (Button) findViewById(btn_image_cardboard);
        btnImageCardboard.setOnClickListener(new View.OnClickListener() {
           @Override
            public void onClick(View v) {
                Intent i = new Intent(getApplicationContext(), ImageSelect.class);
                startActivity(i);
            }
        });

        Button btnVideoCardboard = (Button) findViewById(btn_video_cardboard);
        btnVideoCardboard.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(getApplicationContext(), VideoSelect.class);
                startActivity(i);
            }
        });

        Button btnVideoCardboard_sub = (Button) findViewById(btn_video_cardboard_sub);
        btnVideoCardboard_sub.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(getApplicationContext(), VideoCardboard.class);
                i.putExtra("type","sub");
                startActivity(i);
            }
        });

        Button btnVideoCardboard_anime = (Button) findViewById(btn_video_cardboard_anime);
        btnVideoCardboard_anime.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(getApplicationContext(), VideoCardboard.class);
                i.putExtra("type","anime");
                startActivity(i);
            }
        });
    }

}