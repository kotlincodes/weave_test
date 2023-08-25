package com.example.weave_test.flutter_views

import android.content.Context
import android.graphics.Color
import android.view.LayoutInflater
import android.view.View
import android.widget.TextView
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.weave_test.R
import com.example.weave_test.adapter.StateListAdapter
import io.flutter.plugin.platform.PlatformView

internal class NativeView(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private val rvStateList: RecyclerView
//    private val tv: TextView

    override fun getView(): View {
        return rvStateList
    }

    override fun dispose() {}

    init {

//        tv = TextView(context)
//        tv.textSize = 72f
//        tv.setBackgroundColor(Color.rgb(255, 255, 255))
//        tv.text = "Rendered on a native Android view (id: $id)"
//        val inflater = LayoutInflater.from(context)
//        val view = inflater.inflate(R.layout.state_list_item,null)
//        tv=view.findViewById(R.id.textView)
//        rvStateList=view.findViewById(R.id.rv_state_list)

        rvStateList=RecyclerView(context)
        rvStateList.layoutManager=LinearLayoutManager(context)

        val stateListAdapter = creationParams?.entries?.toList()?.let { StateListAdapter(it) }
        rvStateList.adapter=stateListAdapter

    }
}