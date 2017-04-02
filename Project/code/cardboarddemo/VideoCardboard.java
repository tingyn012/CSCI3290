package com.demo.zhouc.cardboarddemo;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Point;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.Environment;
import android.view.Display;
import android.view.Window;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.MediaController;
import android.widget.VideoView;

import java.io.File;
import java.io.IOException;

/**
 * Created by zhouc on 14-11-4.
 */
public class VideoCardboard extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Bundle extras = getIntent().getExtras();
        String type = extras.getString("type");

        String mStoragePath = "CardBoardDemo/video/";
        String mLeftVideoName = "result_left.wmv";
        String mRightVideoName = "subtitles_right.wmv";

        if(type.equals("static")) {
            mLeftVideoName = "result_left.wmv";
            mRightVideoName = "result_right.wmv";
        }
        if(type.equals("static2")) {
            mLeftVideoName = "result_left2.wmv";
            mRightVideoName = "result_right2.wmv";
        }
        if(type.equals("sub")) {
            mLeftVideoName = "subtitles_left.wmv";
            mRightVideoName = "subtitles_right.wmv";
        }
        if(type.equals("anime")) {
            mLeftVideoName = "animelogo_left.wmv";
            mRightVideoName = "animelogo_right.wmv";
        }
        //Remove title bar
        this.requestWindowFeature(Window.FEATURE_NO_TITLE);

        //Remove notification bar
        this.getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);

        setContentView(R.layout.activity_video_cardboard);

        // initialize videoview
        initVideoView(mStoragePath,mLeftVideoName,mRightVideoName);
    }

    private void initVideoView(String mStoragePath,String mLeftVideoName,String mRightVideoName) {
        // get videoview
        VideoView vidViewL      = (VideoView) findViewById(R.id.vv_left);
        VideoView vidViewR    = (VideoView) findViewById(R.id.vv_right);

        // load 2 images
        String sdPath = Environment.getExternalStorageDirectory().getAbsolutePath();
        File vidL = new File(sdPath + File.separator + mStoragePath + File.separator + mLeftVideoName);
        File vidR = new File(sdPath + File.separator + mStoragePath + File.separator + mRightVideoName);
        vidViewL.setVideoPath( vidL.getAbsolutePath() );
        vidViewR.setVideoPath( vidR.getAbsolutePath() );

        // set the scale and translation of the video
        float scaleL = 1.0f;
        float scaleR = 1.0f;
        float transL_x = 10, transL_y = 10;
        float transR_x = 10, transR_y = 10;

        vidViewL.setScaleX(scaleL);     vidViewL.setScaleY(1f*scaleL);
        vidViewR.setScaleX(scaleR);     vidViewR.setScaleY(1f*scaleR);
        vidViewL.setTranslationX(transL_x);
        vidViewL.setTranslationY(transL_y);
        vidViewR.setTranslationX(transR_x);
        vidViewR.setTranslationY(transR_y);

        // start to play the video
        vidViewL.start();
        vidViewR.start();

    }
}
