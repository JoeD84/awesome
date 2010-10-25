require("awful")		-- Standard awesome library
require("awful.autofocus")
require("awful.rules")
require("beautiful")  		-- Theme handling library
require("naughty")		-- Notification library
require("inc_variables")	
require("inc_tags")
require("inc_menu")
require("inc_systray")
require("inc_key_bindings")
require("inc_rules")
require("inc_signals")
os.execute("export LD_PRELOAD=/usr/lib/libv4l/v4l1compat.so")
require("inc_autostart")