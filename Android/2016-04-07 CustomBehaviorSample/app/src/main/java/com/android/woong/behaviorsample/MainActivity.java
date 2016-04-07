package com.android.woong.behaviorsample;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;

import com.android.woong.behaviorsample.adapter.MusicAdapter;
import com.android.woong.behaviorsample.vo.MusicVO;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {


    private RecyclerView recyclerMusic;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        initLayout();
        init();

    }


    /**
     * 레이아웃 초기화
     */
    private void initLayout(){

        recyclerMusic = (RecyclerView)findViewById(R.id.recyclerMusic);
    }


    /**
     * 데이터 초기화
     */
    private void init(){

        //음악 리스트 데이터 초기화
        initMusicData();

        //리싸이클러뷰 초기화
        initRecyclerMusic();
    }


    /**
     * 음악 리스트 데이터 초기화
     */
    private List<MusicVO> initMusicData(){

        List<MusicVO> musicList = new ArrayList<>();

        for (int i = 0; i < 30; i++) {

            MusicVO musicVO = new MusicVO();
            musicVO.setTitle("겨울을 걷는날");

            musicList.add(musicVO);
        }

        return musicList;
    }


    /**
     * 리싸이클러뷰 초기화
     */
    private void initRecyclerMusic(){

        recyclerMusic.setLayoutManager(new LinearLayoutManager(getApplicationContext()));
        recyclerMusic.setAdapter(new MusicAdapter(initMusicData(), R.layout.item_music));

    }

}
