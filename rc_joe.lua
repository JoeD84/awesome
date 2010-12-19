require("awful")		    -- Standard awesome library
require("awful.autofocus")
require("awful.rules")
require("beautiful")  		-- Theme handling library
require("naughty")		    -- Notification library
--os.execute("export LD_PRELOAD=/usr/lib/libv4l/v4l1compat.so")
--os.execute("export XDG_DATA_HOME=$HOME/.kde4/share")
--os.execute("export XDG_CONFIG_HOME=$HOME/.kde4/share/config")
require("vicious")
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
--require("inc_log_inotify") -- Obsolete, using incrond for log Watching
require("inc_autostart")