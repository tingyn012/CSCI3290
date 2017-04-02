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
import android.widget.ImageButton;
import android.widget.ImageView;

import static com.demo.zhouc.cardboarddemo.R.id.btn_image_cardboard;

/**
 * Created by LH532M15B on 10/12/2014.
 */
public class ImageSelect extends Activity{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_image_select);

        initUI();
    }

    private void initUI() {
        ImageButton btnImageCardboard = (ImageButton) findViewById(R.id.btn_image_1);
        btnImageCardboard.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent();
                i.setClass(ImageSelect.this,ImageCardboard.class);

                i.putExtra("number","1");
                startActivity(i);
            }
        });


        ImageButton btn_image_2 = (ImageButton) findViewById(R.id.btn_image_2);
        btn_image_2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent();
                i.setClass(ImageSelect.this,ImageCardboard.class);

                i.putExtra("number","2");
                startActivity(i);
            }
        });

        ImageButton btn_image_3 = (ImageButton) findViewById(R.id.btn_image_3);
        btn_image_3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent();
                i.setClass(ImageSelect.this,ImageCardboard.class);

                i.putExtra("number","3");
                startActivity(i);
            }
        });

        ImageButton btn_image_4 = (ImageButton) findViewById(R.id.btn_image_4);
        btn_image_4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent();
                i.setClass(ImageSelect.this,ImageCardboard.class);

                i.putExtra("number","4");
                startActivity(i);
            }
        });

        ImageButton btn_image_5 = (ImageButton) findViewById(R.id.btn_image_5);
        btn_image_5.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent();
                i.setClass(ImageSelect.this,ImageCardboard.class);

                i.putExtra("number","5");
                startActivity(i);
            }
        });

        ImageButton btn_image_6 = (ImageButton) findViewById(R.id.btn_image_6);
        btn_image_6.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent();
                i.setClass(ImageSelect.this,ImageCardboard.class);

                i.putExtra("number","6");
                startActivity(i);
            }
        });
    }
}
