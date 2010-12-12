My awesome config
==============================

Mainly as a backup.
But if you like also for your inspiration.

If you have questions feel free to ask. I will try to answer them.
Joe84D@gmail.com

# rc.lua
The Failsafe load, try to load rc_joe.lua, else load the default config.

<pre><code>* rc_joe.lua:
  * require("awful")				-- Standard awesome library
  * require("awful.autofocus")	    -- awesome default library
  * require("awful.rules")		    -- awesome default library
  * require("beautiful")  		    -- Theme handling library
  * require("naughty")			    -- Notification library
  * require("inotify")			    -- Inotify Notification library
  * require("inc_variables")		-- Some Variables
  * require("inc_tags")             -- Tag Definitions for 2 Screens
  * require("inc_menu")             -- The Awesome Menu with Icons
  * require("inc_systray")          -- The Systray
  * require("inc_key_bindings")     -- The Keybindings
  * require("inc_rules_5-IM")       -- Auto Layout for Pidgin
  * require("inc_rules_7-File")     -- Auto Layout for Konqueror
  * require("inc_rules_8-Gimp")     -- Auot Layout for GIMP
  * require("inc_rules")            -- Tag-Placing rules
  * require("inc_signals")          -- Signals
  * require("inc_log_inotify")      -- LOG Watcher
  * os.execute("export LD_PRELOAD=/usr/lib/libv4l/v4l1compat.so")
  * require("inc_autostart")        -- Autostart once with PID
</code></pre>
![Screenshot](/JoeD84/awesome/raw/master/_Screenshots/Screenshot_3.png)
![Tracking Image](//in.getclicky.com/66363572ns.gif =1x1)
