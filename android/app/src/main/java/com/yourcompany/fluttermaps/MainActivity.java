package com.yourcompany.fluttermaps;

import android.content.Intent;
import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private static final String MAPS_CHANNEL = "com.faisalabid/maps";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        new MethodChannel(getFlutterView(), MAPS_CHANNEL).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                        if (call.method.equals("launchMaps")) {
                            Intent i = new Intent(MainActivity.this, MapsActivity.class);
                            i.putExtra("lat", (double)call.argument("lat"));
                            i.putExtra("long", (double)call.argument("long"));
                            startActivity(i);
                        } else {
                            result.notImplemented();
                        }
                    }
                }
        );
    }
}
