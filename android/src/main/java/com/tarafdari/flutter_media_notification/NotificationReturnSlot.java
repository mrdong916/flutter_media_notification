package com.tarafdari.flutter_media_notification;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;

public class NotificationReturnSlot extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        switch (intent.getAction()) {
            case "prev":
                FlutterMediaNotificationPlugin.callEvent("prev");
                break;
            case "next":
                FlutterMediaNotificationPlugin.callEvent("next");
                break;
            case "toggle":
                String title = intent.getStringExtra("title");
                String author = intent.getStringExtra("author");
                byte[] cover = intent.getByteArrayExtra("cover");
                boolean play = intent.getBooleanExtra("play",true);

                if(play)
                    FlutterMediaNotificationPlugin.callEvent("play");
                else
                    FlutterMediaNotificationPlugin.callEvent("pause");

                FlutterMediaNotificationPlugin.showNotification(title, author,cover,play);
                break;
        }
    }
}

