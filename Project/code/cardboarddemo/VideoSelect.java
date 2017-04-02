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
public class VideoSelect extends Activity{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_video_select);

        initUI();
    }

    private void initUI() {
        ImageButton btnImageCardboard = (ImageButton) findViewById(R.id.btn_video_1);
        btnImageCardboard.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent();
                i.setClass(VideoSelect.this,VideoCardboard.class);

                i.putExtra("type","static");
                startActivity(i);
            }
        });


        ImageButton btn_image_2 = (ImageButton) findViewById(R.id.btn_video_2);
        btn_image_2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent();
                i.setClass(VideoSelect.this,VideoCardboard.class);

                i.putExtra("type","static2");
                startActivity(i);
            }
        });

    }
}
