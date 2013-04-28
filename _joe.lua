require("awful")		    	        -- Standard awesome library
require("awful.autofocus")
require("awful.rules")
require("beautiful")  		    	        -- Theme handling library
require("naughty")		    	        -- Notification library
require("vicious")			        -- ?
--require("inotify")			        -- Benachrichtigungen
require("inc_variables")		        -- Theme / Layouts / Programs Variables
require("inc_tags")			        -- Tags
require("inc_menu")			        -- Menu
require("inc_systray")			        -- Systray
require("inc_key_bindings")		        -- Tastenkürzel
require("inc_rules_5-IM")		        -- rules for IM placing
require("inc_rules_7-File")		        -- rules for Konqueror placing
require("inc_rules_8-Gimp")		        -- rules for Gimp placing
if screen.count() == 1 then                     -- Do we have 2 Screens?
require("inc_rules") else		        -- rules for 1 Screen
require("inc_rules_2screen")end		        -- rules for 2 screens
require("inc_signals")			        -- signals
require("inc_autostart")		        -- Autostart
