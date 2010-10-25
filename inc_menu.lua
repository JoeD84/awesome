-- {{{ Menu


i_size		= "128x128/"
i_path 		= "/home/joe/.kde4/share/icons/OxygenRefit2-black-version_x/" .. i_size
i_path_px	= "/usr/share/pixmaps/"
i_path_bw 	= "/usr/share/icons/black and white/" .. i_size
i_favorites	= i_path .. "actions/bookmark-new.png"
i_chrome	= i_path_px .. "chromium-bin.png"
i_picasa	= i_path_px .. "picasa.xpm"
i_firefox	= i_path_px .. "firefox-icon.png"
i_amarok	= i_path_bw .. "apps/amarok.png"
i_pidgin	= i_path .. "apps-extra/gaim.png"
i_konq		= i_path .. "apps-extra/gnome-home.png"
i_internet	= i_path .. "categories/applications-internet.png"
i_multimedia	= i_path .. "places/folder1.png"
i_myth 		= "/usr/share/logos/Icons/mythtv-logo.png"
i_terminal	= i_path .. "apps/terminal.png"
i_kate		= i_path .. "apps/kedit.png"

terminal_joe = 		"xterm -title 'xterm - joe@michelle'  -e 'screen -D -RR'"
terminal_root = 	"xterm -title 'xterm - root@michelle' -e 'suscreen'"
terminal_miranda = 	"xterm -title 'xterm - root@miranda'  -e 'ssh -XY root@miranda'"
chrome_bin =		"chromium"
chrome_opts =		" --enable-apps --enable-flags"
chrome =		chrome_bin .. chrome_opts
chrome_xxx =		chrome_bin .. " --user-data-dir=/home/joe/.config/chromium/JoeDXXX " .. chrome_opts

mychrome = {
  { "GMail", 		chrome .. " --app=https://mail.google.com", 	i_chrome },
  { "flauntR", 		chrome .. " --app=http://www.flauntr.com/flauntr/assets/app.jsp", 	i_chrome },
}

myinternet = {
  { "Chrome", 		chrome, 	i_chrome },
  { "Webapps",		mychrome, 	i_chrome },
  { "JDownloader", 	"jdownloader", 	i_jdown },
  { "Firefox", 		"firefox", 	i_firefox },
  { "Pidgin", 		"pidgin",	i_pidgin },
}

mymultimedia = {
  { "MythTV", 		"mythfrontend",	i_myth },
  { "Amarok", 		"amarok",	i_amarok  },
  { "Picasa", 		"picasa", 	i_picasa },
}

myawesomemenu = {
  { "Terminal(joe)", 	terminal_joe,	i_terminal },
  { "Terminal(root)", 	terminal_root,	i_terminal },
  { "Terminal(miranda)", terminal_miranda, i_terminal },
  { "edit config", 	"kate -s awesome", i_kate },
  { "restart", 		awesome.restart },
  { "quit", 		awesome.quit }
}

myfavorites = {
  { "Chrome", 		chrome, 	i_chrome },
  { "MythTV", 		"mythfrontend", i_myth },
  { "Amarok", 		"amarok", 	i_amarok },
  { "Konqueror", 	"konqueror --profile filemanagement", i_konq },
}

mymainmenu = awful.menu({ items = { 
  { "Favoriten", 	myfavorites, 	i_favorites },
  { "Internet", 	myinternet,	i_internet },
  { "Multimedia", 	mymultimedia,	i_multimedia },
  { "awesome", 		myawesomemenu, 	beautiful.awesome_icon }
}
})

q_mainmenu = awful.menu({ items = {
  { "Chrome(XXX)", 	chrome_xxx,	i_chrome },
  { "Pidgin(Quota)",	"sudo -A -u quota pidgin", i_pidgin},

}
})

mylauncher = awful.widget.launcher(
  { image = image(beautiful.awesome_icon), menu = mymainmenu }
)


-- }}}