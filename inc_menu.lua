-- {{{ Menu


i_size		= "128x128/"

i_path 		= "/home/joe/.kde4/share/icons/OxygenRefit2-black-version/" .. i_size
i_path_px	= "/usr/share/pixmaps/"
i_path_bw 	= "/usr/share/icons/black and white/" .. i_size
i_path_usr	= "/usr/share/logos/"

--i_chrome	= "/usr/share/icons/hicolor/128x128/apps/chromium-browser-live.png"
i_chrome 	= "/opt/google/chrome/product_logo_128.png"
i_skype 	= "/usr/share/icons/hicolor/48x48/apps/skype.png"
i_picasa	= i_path_px .. "picasa.xpm"
i_firefox	= i_path_px .. "firefox-bin-icon.png"
i_amarok	= i_path_bw .. "apps/amarok.png"
i_favorites	= i_path .. "actions/bookmark-new.png"
i_pidgin	= i_path .. "apps-extra/gaim.png"
i_konq		= i_path .. "apps-extra/gnome-home.png"
i_internet	= i_path .. "categories/applications-internet.png"
i_mainmenu	= i_path .. "categories/applications-other.png"
i_multimedia    = i_path .. "places/folder1.png"
i_terminal	= i_path .. "apps/terminal.png"
i_kate		= i_path .. "apps/kedit.png"
i_unterh	= i_path .. "categories/applications-other.png"
i_volume   	= i_path .. "status/audio-volume-medium.png"
i_deluge   	= i_path .. "apps-extra/deluge.png"
i_gimp   	= i_path .. "apps-extra/gimp.png"
i_kmymoney 	= i_path .. "apps-extra/gnucash.png"
i_FI            = i_path_px .. "Finanzblick.png"

i_jdown		= i_path_usr .. "Icons/jd_logo_128_128.png"
i_gentoo	= i_path_usr .. "Icons/573px-gentoo_linux_logo_mattesvg.png"
i_myth 		= i_path_usr .. "Icons/mythtv.png"

terminal_joe = 		"xterm -title 'xterm - joe@mae'         -e 'screen -D -RR'"
terminal_root = 	"xterm -title 'xterm - root@mae'        -e 'suscreen'"
terminal_xbmc = 	"xterm -title 'xterm - pi@raspbmc'      -e 'ssh -XY pi@raspbmc'"
terminal_michelle = 	"xterm -title 'xterm - root@michelle'   -e 'ssh -XY root@michelle'"
terminal_quota = 	"xterm -title 'xterm - quota@mae'       -e 'ssh -t -XY quota@mae screen -D -RR'"
chrome_bin =		"google-chrome"
chrome_opts =		" "
chrome =		chrome_bin .. chrome_opts
chrome_xxx =		chrome_bin .. " --user-data-dir=/home/joe/.config/google-chrome/Quota69 " .. chrome_opts
chrome_pd =		chrome_bin .. " --user-data-dir=/home/joe/.config/google-chrome/PeterDamien " .. chrome_opts
chrome_fb = 		chrome .. " -app=https://facebook.com"
chrome_lastfm = 	chrome .. " -app=http://www.lastfm.de/listen/user/sHiZodEM/mix"
chrome_mail = 		chrome .. " -app=https://mail.google.com"
chrome_calendar = 	chrome .. " -app=https://www.google.com/calendar"
chrome_reader = 	chrome .. " -app=https://www.google.com/reader"
chrome_reader_play =    chrome .. " -app='https://www.google.com/reader/play/#item/user%2F02902929592956513783%2Flabel%2FTumblr/0'"
chrome_docs = 		chrome .. " -app=https://docs.google.com/"
chrome_flauntr =	chrome .. " -app=http://www.flauntr.com/flauntr/assets/app.jsp"
chrome_friv =		chrome .. " -app=http://www.friv.com"
chrome_mythweb =	chrome .. " -app=https://mythtv/mythweb"
chrome_ebuddy =		chrome .. " -app=http://web.ebuddy.com/"
kmymoney =              "kmymoney /home/joe/_Dropbox/Dokumente/joe.kmy"
chrome_ytl =		chrome .. " -app=http://www.youtube.com/leanback"
firefox =               "firefox-bin"



mywebapps = {
  { "Facebook",         chrome_fb,              i_chrome },
  { "last.fm",          chrome_lastfm,          i_chrome },
  { "GMail",            chrome_mail,            i_path_usr.."Google/gmail.png" },
  { "GCalendar",        chrome_calendar,        i_path_usr.."Google/gcalendar.png" },
  { "GReader",          chrome_reader,          i_path_usr.."Google/greader.png" },
  { "GReader",          chrome_reader_play,     i_path_usr.."Google/greader.png" },
  { "GDocs",            chrome_docs,            i_path_usr.."Google/gdocs.png" },
  { "YouTube Leanback", chrome_ytl,             i_chrome },
  { "eBuddy",           chrome_ebuddy,          i_chrome },
  { "flauntR",          chrome_flauntr,         i_chrome },
  { "MythWEB",          chrome_mythweb,         i_myth },

}

myunterhaltung = {
  { "GReader - Play(Tumblr)",                   chrome_reader_play, i_path_usr.."Google/greader.png" },
  { "Friv - Flash Games", 	                chrome_friv, i_chrome },
}
  
myinternet = {
  { "Chrome",           chrome,                 i_chrome },
  { "JDownloader",      "jdownloader",          i_jdown },
  { "Firefox",          "firefox",              i_firefox },
  { "Pidgin",           "pidgin",               i_pidgin },
  { "Webapps",          mywebapps,              i_chrome },
  { "Skype",            "skype",                i_skype },
  { "Teamviewer",       "teamviewer"            },
  { "Spotify",          "spotify"               },
}

mymultimedia = {
  { "MythTV",           "mythfrontend",         i_myth },
  { "Amarok",           "amarok",               i_amarok  },
  { "Editra",           "editra",               i_kate },
  { "Gimp",             "gimp",                 i_gimp },
  --{ "Picasa",           "picasa",               i_picasa },
}

myawesomemenu = {
  { "Terminal(joe)",    terminal_joe,           i_terminal },
  { "Terminal(root)",   terminal_root,          i_terminal },
  { "Terminal(michelle)",terminal_michelle,     i_terminal },
  { "Terminal(XBMC)",   terminal_xbmc,          i_terminal },
  { "VirtualBox(WinXP)","VirtualBox --startvm WinXP"        },
  { "edit config",      "editra",               i_kate },
  { "Restart",          awesome.restart,        beautiful.awesome_icon },
  { "Quit",             awesome.quit,           beautiful.awesome_icon },
  { "Shutdown",         "awesome_shutdown",     beautiful.awesome_icon },
}

myfavorites = {
  { "Firefox",          firefox,              i_firefox },
  { "Chrome",           chrome,                 i_chrome },
  { "MythTV",           "mythfrontend",         i_myth },
  { "Amarok",           "amarok",               i_amarok },
  { "Konqueror",        "konqueror --profile filemanagement", i_konq },
  { "Finanzblick",        firefox .. " https://finanzblick.de/webapp/", i_FI },
  --{ "KmyMoney",         "kmymoney",             i_kmymoney },
}

mymainmenu = awful.menu({ items = { 
  { "Favoriten",        myfavorites,            i_favorites },
  { "Internet",         myinternet,             i_internet },
  { "Multimedia",       mymultimedia,           i_multimedia },
  { "Unterhaltung",     myunterhaltung,         i_unterh },
  { "awesome",          myawesomemenu,          beautiful.awesome_icon},
}
})

q_mainmenu = awful.menu({ items = {
  { "Firefox(Quota)", 	"su quota -c firefox", i_firefox},
  { "Chrome(XXX)", 	chrome_xxx, i_chrome },
  { "Chrome(PD)", 	chrome_pd, i_chrome },
  { "Pidgin(Quota)",	"sudo -A -u quota pidgin", i_pidgin },
  { "Terminal(Quota)",	terminal_quota,         i_terminal },

}

})


w_mainmenu = awful.menu({ items = mywebapps })

mylauncher = awful.widget.launcher(
  { image = image(i_gentoo), menu = mymainmenu }
)


-- }}}
