require("awful")		    	-- Standard awesome library
require("awful.autofocus")
require("awful.rules")
awful.util.spawn_with_shell("xcompmgr -r0 &")
require("beautiful")  		    	-- Theme handling library
require("naughty")		    	-- Notification library
require("vicious")			-- ?
require("inotify")			-- Benachrichtigungen
require("inc_variables")		-- Theme / Layouts / Programs Variables
require("inc_tags")			-- Tags
require("inc_menu")			-- Menu
require("inc_systray")			-- Systray
require("inc_key_bindings")		-- Tastenkürzel
require("inc_rules_5-IM")		-- rules
require("inc_rules_7-File")		-- rules
require("inc_rules_8-Gimp")		-- rules
require("inc_rules")			-- rules!
require("inc_signals")			-- signals
require("inc_autostart")		-- Autostart
