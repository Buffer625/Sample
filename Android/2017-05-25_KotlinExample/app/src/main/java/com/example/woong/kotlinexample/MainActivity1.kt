package com.example.woong.kotlinexample

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.v7.widget.LinearLayoutManager
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {



    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        init()
    }


    /**
     * 데이터 초기화
     */
    fun init() {

        initRecyclerMusic()
    }


    /**
     * RecyclerMusic 초기화
     */
    fun initRecyclerMusic() {

        var musicAdapter = MusicAdapter(initMusicData())

        recyclerView.adapter = musicAdapter
        recyclerView.layoutManager = LinearLayoutManager(applicationContext)
    }


    /**
     * music List 데이터 초기화
     */
    fun initMusicData(): MutableList<MusicVO> {

        var musicList: MutableList<MusicVO> = arrayListOf()

        for (x in 1..5) {

            var musicVO01 = MusicVO("SIGNAL")
            var musicVO02 = MusicVO("I LUV IT")
            var musicVO03 = MusicVO("All I Wanna Do")
            var musicVO04 = MusicVO("Merry Me")

            musicList.add(musicVO01)
            musicList.add(musicVO02)
            musicList.add(musicVO03)
            musicList.add(musicVO04)

        }
        return musicList
    }

}