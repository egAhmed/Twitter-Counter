package com.example.twitter_counter

import android.content.ClipData
import android.content.Context
import android.os.Build
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.v4.content.ContextCompat.getSystemService
import android.text.ClipboardManager
import android.widget.EditText
import android.widget.TextView

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun fnClear(view: android.view.View) {
        var text  = (R.id.tShowCounterText) as EditText;
        text.text.clear();
    }
    fun buOpEvent(view: android.view.View) {
        var text  = (R.id.tShowCounterText) as EditText;
        var view = (R.id.etext) as TextView;
        var view2 = (R.id.etext2) as TextView;

        var ln = text.text.length.toString();

        view.setText(ln);

        view2.setText(ln.toString() + "/280");

    }
    fun fnCopy(view: android.view.View) {

        var text  = (R.id.tShowCounterText) as EditText;

        val startSelection: Int = text.getSelectionStart()
        val endSelection: Int = text.getSelectionEnd()
        if (text.getText() != null && endSelection > startSelection) {
            val selectedText: String =
                text.getText().toString().substring(startSelection, endSelection)
            val sdk = Build.VERSION.SDK_INT
            if (sdk < Build.VERSION_CODES.HONEYCOMB) {
                val clipboard = getSystemService(Context.CLIPBOARD_SERVICE) as ClipboardManager
                clipboard.text = selectedText
            } else {
                val clipboard =
                    getSystemService(Context.CLIPBOARD_SERVICE) as android.content.ClipboardManager
                val clip = ClipData.newPlainText("WordKeeper", selectedText)
                clipboard.setPrimaryClip(clip)
            }
        }
    }
}