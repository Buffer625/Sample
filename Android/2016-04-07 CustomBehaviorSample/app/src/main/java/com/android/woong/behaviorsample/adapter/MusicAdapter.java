package com.android.woong.behaviorsample.adapter;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.android.woong.behaviorsample.R;
import com.android.woong.behaviorsample.vo.MusicVO;

import java.util.List;

/**
 * Created by woong on 2016. 4. 7..
 */
public class MusicAdapter extends RecyclerView.Adapter<MusicAdapter.ViewHolder> {

    private List<MusicVO> musicList;
    private int itemLayout;

    /**
     * 생성자
     * @param items
     * @param itemLayout
     */
    public MusicAdapter(List<MusicVO> items , int itemLayout){

        this.musicList = items;
        this.itemLayout = itemLayout;
    }

    /**
     * 레이아웃을 만들어서 Holer에 저장
     * @param viewGroup
     * @param viewType
     * @return
     */
    @Override
    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int viewType) {

        View view = LayoutInflater.from(viewGroup.getContext()).inflate(itemLayout,viewGroup,false);
        return new ViewHolder(view);
    }

    /**
     * listView getView 를 대체
     * 넘겨 받은 데이터를 화면에 출력하는 역할
     *
     * @param viewHolder
     * @param position
     */
    @Override
    public void onBindViewHolder(ViewHolder viewHolder, int position) {

        MusicVO item = musicList.get(position);
        viewHolder.textTitle.setText(item.getTitle());
        viewHolder.itemView.setTag(item);

    }

    @Override
    public int getItemCount() {
        return musicList.size();
    }

    /**
     * 뷰 재활용을 위한 viewHolder
     */
    public static class ViewHolder extends RecyclerView.ViewHolder{

        public TextView textTitle;

        public ViewHolder(View itemView){
            super(itemView);

            textTitle = (TextView) itemView.findViewById(R.id.textTitle);
        }

    }
}
