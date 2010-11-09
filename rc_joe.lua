require("awful")		-- Standard awesome library
require("awful.autofocus")
require("awful.rules")
require("beautiful")  		-- Theme handling library
require("naughty")		-- Notification library
require("inotify")
require("inc_variables")	
require("inc_tags")
require("inc_menu")
require("inc_systray")
require("inc_key_bindings")
require("inc_rules_5-IM")
require("inc_rules_7-File")
require("inc_rules_8-Gimp")
require("inc_rules")
require("inc_signals")
require("inc_log_inotify")
os.execute("export LD_PRELOAD=/usr/lib/libv4l/v4l1compat.so")
require("inc_autostart")