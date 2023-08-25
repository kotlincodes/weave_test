package com.example.weave_test

import com.example.weave_test.flutter_views.NativeViewFactory
import io.flutter.embedding.android.FlutterActivity

import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory("<platform-view-type>",
                NativeViewFactory()
            )
    }
}
