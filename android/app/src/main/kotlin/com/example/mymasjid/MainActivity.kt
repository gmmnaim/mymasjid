package com.example.mymasjid

import android.os.Bundle
import android.view.WindowManager
import android.os.PowerManager
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {

    private var wakeLock: PowerManager.WakeLock? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        /// 🔥 KEEP SCREEN ON
        window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)

        /// 🔥 KEEP CPU ON (TV DOZE FIX)
        val pm = getSystemService(POWER_SERVICE) as PowerManager
        wakeLock = pm.newWakeLock(
            PowerManager.PARTIAL_WAKE_LOCK,
            "MyMasjid::WakelockTag"
        )
        wakeLock?.acquire()
    }

    override fun onDestroy() {
        super.onDestroy()
        wakeLock?.release()
    }
}
