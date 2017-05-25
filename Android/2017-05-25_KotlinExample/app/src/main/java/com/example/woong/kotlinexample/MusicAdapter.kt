package com.example.woong.kotlinexample

import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView

/**
 * Created by woong on 2017. 5. 19..
 */

class MusicAdapter (musicList : MutableList<MusicVO>) : RecyclerView.Adapter<MusicAdapter.MusicViewHolder>() {

    private var musicList : MutableList<MusicVO>? = musicList


    override fun onCreateViewHolder(parent: ViewGroup?, viewType: Int): MusicViewHolder {

        var view = LayoutInflater.from(parent!!.context).inflate(R.layout.item_music,parent,false)
        return MusicViewHolder(view)
    }

    override fun onBindViewHolder(holder: MusicViewHolder?, position: Int) {

        var musicVO = musicList!![position]
        holder!!.textTitle.text = musicVO.title
    }

    override fun getItemCount(): Int {
        return musicList!!.size
    }


    class MusicViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        var textTitle = view.findViewById(R.id.textTitle) as TextView
    }
}