-- {{{ Menu


i_size		= "128x128/"

i_path 		= "/home/joe/.kde4/share/icons/OxygenRefit2-black-version_x/" .. i_size
i_path_px	= "/usr/share/pixmaps/"
i_path_bw 	= "/usr/share/icons/black and white/" .. i_size
i_path_usr	= "/usr/share/logos/"

i_chrome	= i_path_px .. "chromium-browser.png"
i_picasa	= i_path_px .. "picasa.xpm"
i_firefox	= i_path_px .. "firefox-icon.png"
i_amarok	= i_path_bw .. "apps/amarok.png"
i_favorites	= i_path .. "actions/bookmark-new.png"
i_pidgin	= i_path .. "apps-extra/gaim.png"
i_konq		= i_path .. "apps-extra/gnome-home.png"
i_internet	= i_path .. "categories/applications-internet.png"
i_mainmenu	= i_path .. "categories/applications-other.png"
i_multimedia= i_path .. "places/folder1.png"
i_terminal	= i_path .. "apps/terminal.png"
i_kate		= i_path .. "apps/kedit.png"
i_unterh	= i_path .. "categories/applications-other.png"

i_jdown		= i_path_usr .. "Icons/jd_logo_128_128.png"
i_gentoo	= i_path_usr .. "Icons/573px-gentoo_linux_logo_mattesvg.png"
i_myth 		= i_path_usr .. "Icons/mythtv.png"

terminal_joe = 		"xterm -title 'xterm - joe@michelle'  -e 'screen -D -RR'"
terminal_root = 	"xterm -title 'xterm - root@michelle' -e 'suscreen'"
terminal_miranda = 	"xterm -title 'xterm - root@miranda'  -e 'ssh -XY root@miranda'"
terminal_quota = 	"xterm -title 'xterm - quota@michelle'  -e 'ssh -XY quota@michelle'"
chrome_bin =		"chromium"
chrome_opts =		" --enable-apps --enable-flags "
chrome =			chrome_bin .. chrome_opts
chrome_xxx =		chrome_bin .. " --user-data-dir=/home/joe/.config/chromium/JoeDXXX " .. chrome_opts
chrome_mail = 		chrome .. " -app=https://mail.google.com"
chrome_calendar = 	chrome .. " -app=https://www.google.com/calendar"
chrome_reader = 	chrome .. " -app=https://www.google.com/reader"
chrome_reader_play =chrome .. " -app='https://www.google.com/reader/play/#item/user%2F02902929592956513783%2Flabel%2FTumblr/0'"
chrome_docs = 		chrome .. " -app=https://docs.google.com/"
chrome_flauntr =	chrome .. " -app=http://www.flauntr.com/flauntr/assets/app.jsp"
chrome_friv =		chrome .. " -app=http://www.friv.com"
chrome_mythweb =	chrome .. " -app=https://joed.homeip.net/mythweb"
chrome_ebuddy =		chrome .. " -app=http://web.ebuddy.com/"

mywebapps = {
  { "GMail", 		chrome_mail, 		i_path_usr.."Google/gmail.png" },
  { "GCalendar", 	chrome_calendar, 	i_path_usr.."Google/gcalendar.png" },
  { "GReader", 		chrome_reader, 		i_path_usr.."Google/greader.png" },
  { "GDocs", 		chrome_docs, 		i_path_usr.."Google/gdocs.png" },
  { "eBuddy", 		chrome_ebuddy, 		i_chrome },
  { "flauntR", 		chrome_flauntr, 	i_chrome },
  { "MythWEB", 		chrome_mythweb,		i_myth },
}

myunterhaltung = {
  { "GReader - Play(Tumblr)",           chrome_reader_play, i_path_usr.."Google/greader.png" },
  { "Friv - Flash Games", 	            chrome_friv, i_chrome },
}
  
myinternet = {
  { "Chrome", 		chrome, 	        i_chrome },
  { "Webapps",		mywebapps, 	        i_chrome },
  { "JDownloader", 	"jdownloader", 	    i_jdown },
  { "Deluge", 		"deluge -u gtk", 	i_jdown },
  { "Firefox", 		"firefox", 	        i_firefox },
  { "Pidgin", 		"pidgin",	        i_pidgin },
}

mymultimedia = {
  { "MythTV", 		"mythfrontend",	i_myth },
  { "Amarok", 		"/usr/kde/3.5/bin/amarok",	i_amarok  },
  { "Editra",   	"Editra",       i_kate },
  { "Gimp", 		"gimp", 	i_picasa },
  { "Picasa", 		"picasa", 	i_picasa },
}

myawesomemenu = {
  { "Terminal(joe)", 	terminal_joe,	i_terminal },
  { "Terminal(root)", 	terminal_root,	i_terminal },
  { "Terminal(miranda)", terminal_miranda, i_terminal },
  { "edit config", 	"Editra", i_kate },
  { "Restart", 		awesome.restart, beautiful.awesome_icon },
  { "Quit", 		awesome.quit, beautiful.awesome_icon },
  { "Shutdown", 	"awesome_shutdown", beautiful.awesome_icon }
}

myfavorites = {
  { "Chrome", 		chrome, 	i_chrome },
  { "MythTV", 		"mythfrontend", i_myth },
  { "Amarok", 		"/usr/kde/3.5/bin/amarok", 	i_amarok },
  { "Konqueror", 	"konqueror --profile filemanagement", i_konq },
}

mymainmenu = awful.menu({ items = { 
  { "Favoriten", 	myfavorites, 	i_favorites },
  { "Internet", 	myinternet,	i_internet },
  { "Multimedia", 	mymultimedia,	i_multimedia },
  { "Unterhaltung", myunterhaltung,	i_unterh },
  { "awesome", 		myawesomemenu, 	 beautiful.awesome_icon}
}
})

q_mainmenu = awful.menu({ items = {
  { "Chrome(XXX)", 	chrome_xxx,	i_chrome },
  { "Pidgin(Quota)",	"sudo -A -u quota pidgin", i_pidgin},
  { "Terminal(Quota)",	terminal_quota, i_terminal},

}
})

mylauncher = awful.widget.launcher(
  { image = image(i_gentoo), menu = mymainmenu }
)


-- }}}