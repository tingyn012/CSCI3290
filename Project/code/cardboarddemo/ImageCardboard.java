package com.demo.zhouc.cardboarddemo;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Point;
import android.os.Bundle;
import android.os.Environment;
import android.util.Log;
import android.view.Display;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowManager;
import android.widget.ImageView;

import java.io.File;

/**
 * Created by zhouc & xtao on 14-11-4.
 */

public class ImageCardboard extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        Bundle extras = getIntent().getExtras();
        String value = extras.getString("number");

        String mStoragePath = "CardBoardDemo/image/";
        String mLeftImageName = "left_"+value+".png";
        String mRightImageName = "right_"+value+".png";

        super.onCreate(savedInstanceState);

        //remove title bar
        this.requestWindowFeature(Window.FEATURE_NO_TITLE);

        // remove notification bar
        this.getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);

        // set content view
        setContentView(R.layout.activity_image_cardboard);

        // initialize imageview
        initImageView(mStoragePath,mLeftImageName,mRightImageName);
    }

    private void initImageView(String mStoragePath,String mLeftImageName,String mRightImageName) {

        // load 2 images
        String sdPath   = Environment.getExternalStorageDirectory().getAbsolutePath(); // SD card location
        File imgL    = new File( sdPath + File.separator + mStoragePath + File.separator + mLeftImageName );
        File imgR   = new File( sdPath + File.separator + mStoragePath + File.separator + mRightImageName );

        // save 2 images into bitmap
        Bitmap bmL  = BitmapFactory.decodeFile( imgL.getAbsolutePath() );
        Bitmap bmR  = BitmapFactory.decodeFile( imgR.getAbsolutePath() );

        // get imageview
        final ImageView imgViewL   = (ImageView) findViewById(R.id.iv_left);
        final ImageView imgViewR  = (ImageView) findViewById(R.id.iv_right);

        // get height and width of images
        float imgL_h = bmL.getHeight();
        float imgL_w = bmL.getWidth();
        float imgR_h = bmR.getHeight();
        float imgR_w = bmR.getWidth();

        // get height and width of imageview
        Display d = getWindowManager().getDefaultDisplay();
        Point szScreen = new Point();       d.getSize(szScreen);
        float imgViewL_h = szScreen.y;
        float imgViewL_w = szScreen.x / 2;
        float imgViewR_h = szScreen.y;
        float imgViewR_w = szScreen.x / 2;



        // set scale and translation of 2 images
        Matrix matrixL =  imgViewL.getImageMatrix();
        Matrix matrixR =  imgViewL.getImageMatrix();

        float scaleL = 1.0f*Math.min( 1.0f*imgViewL_h/imgL_h, 1.0f*imgViewL_w/imgL_w );
        float scaleLh = 0.8f*imgViewL_h/imgL_h;
        float scaleR = 1.0f*Math.min( 1.0f*imgViewR_h/imgR_h, 1.0f*imgViewR_w/imgR_w );
        float scaleRh = 0.8f*imgViewR_h/imgR_h;

        matrixL.postScale( scaleL, scaleLh );
        matrixR.postScale( scaleR, scaleRh );
        matrixL.postTranslate( 0, 0 );
        matrixR.postTranslate( 0, 0 );

        // display images inside the imageview
        imgViewL.setImageBitmap(bmL);
        imgViewR.setImageBitmap(bmR);

        // using matrix to control scale and translation of images
        imgViewL.setImageMatrix(matrixL);
        imgViewR.setImageMatrix(matrixR);
        imgViewL.setScaleType(ImageView.ScaleType.MATRIX);
        imgViewR.setScaleType(ImageView.ScaleType.MATRIX);

        // set imageview background color
        imgViewL.setBackgroundColor(Color.rgb(0,0,0));
        imgViewR.setBackgroundColor(Color.rgb(0,0,0));

    }
}
