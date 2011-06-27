---------------------------
-- Default awesome theme --
---------------------------



theme = {}

theme.icons = {}
theme.icons.path =      "/home/joe/.kde4/share/icons/OxygenRefit2-black-version_x/128x128/"
theme.icons.path_px	=   "/usr/share/pixmaps/"
theme.icons.path_bw =   "/usr/share/icons/black and white/128x128"
theme.icons.path_usr =  "/usr/share/logos/"

theme.icons.favorites = theme.icons.path .. "actions/bookmark-new.png"

--i_chrome	= i_path_px .. "chromium-browser.png"
--i_picasa	= i_path_px .. "picasa.xpm"
--i_firefox	= i_path_px .. "firefox-icon.png"
--i_amarok	= i_path_bw .. "apps/amarok.png"

--i_pidgin	= i_path .. "apps-extra/gaim.png"
--i_konq		= i_path .. "apps-extra/gnome-home.png"
--i_internet	= i_path .. "categories/applications-internet.png"
--i_mainmenu	= i_path .. "categories/applications-other.png"
--i_multimedia= i_path .. "places/folder1.png"
--i_terminal	= i_path .. "apps/terminal.png"
--i_kate		= i_path .. "apps/kedit.png"
--i_unterh	= i_path .. "categories/applications-other.png"
--i_volume   	= i_path .. "status/audio-volume-medium.png"
--i_deluge   	= i_path .. "apps-extra/deluge.png"
--i_gimp   	= i_path .. "apps-extra/gimp.png"
--i_kmymoney 	= i_path .. "apps-extra/gnucash.png"

--i_jdown		= i_path_usr .. "Icons/jd_logo_128_128.png"
--i_gentoo	= i_path_usr .. "Icons/573px-gentoo_linux_logo_mattesvg.png"
--i_myth 		= i_path_usr .. "Icons/mythtv.png"

theme.path = "/home/joe/.config/awesome/themes/default/"
theme.wallpaper_cmd = { "awsetbg /home/joe/_Multimedia/_Customization/_Wallpaper/Black_and_White/_2girls.jpg" }
--theme.wallpaper_cmd = { "awsetbg /home/joe/_Multimedia/_Customization/_Wallpaper/Black_and_White/wallpaper-56701.jpg" }
theme.font          = "sans 8"

theme.bg_normal     = "#000000"
theme.bg_focus      = "#000000"
theme.bg_urgent     = "#FF0000"
theme.bg_minimize   = "#000000"

theme.fg_normal     = "#777777"
theme.fg_focus      = "#EEEEEE"
theme.fg_urgent     = "#FFFFFF"
theme.fg_minimize   = "#555555"

theme.border_width  = "1"
theme.border_normal = "#000000"
theme.border_focus  = "#000000"
theme.border_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel   = theme.path .. "taglist/squarefw.png"
--theme.taglist_squares_sel   = theme.icons.favorites
theme.taglist_squares_unsel = theme.path .. "taglist/squarew.png"

theme.tasklist_floating_icon = theme.path .. "tasklist/floatingw.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = theme.path .. "submenu.png"
theme.menu_height = "28"
theme.menu_width  = "150"

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = theme.path .. "titlebar/close_normal.png"
theme.titlebar_close_button_focus  = theme.path .. "titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = theme.path .. "titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = theme.path .. "titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = theme.path .. "titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = theme.path .. "titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = theme.path .. "titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = theme.path .. "titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = theme.path .. "titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = theme.path .. "titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = theme.path .. "titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = theme.path .. "titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = theme.path .. "titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = theme.path .. "titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = theme.path .. "titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.path .. "titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = theme.path .. "titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = theme.path .. "titlebar/maximized_focus_active.png"

-- You can use your own layout icons like this:
theme.layout_fairh = theme.path .. "layouts/fairhw.png"
theme.layout_fairv = theme.path .. "layouts/fairvw.png"
theme.layout_floating  = theme.path .. "layouts/floatingw.png"
theme.layout_magnifier = theme.path .. "layouts/magnifierw.png"
theme.layout_max = theme.path .. "layouts/maxw.png"
theme.layout_fullscreen = theme.path .. "layouts/fullscreenw.png"
theme.layout_tilebottom = theme.path .. "layouts/tilebottomw.png"
theme.layout_tileleft   = theme.path .. "layouts/tileleftw.png"
theme.layout_tile = theme.path .. "layouts/tilew.png"
theme.layout_tiletop = theme.path .. "layouts/tiletopw.png"
theme.layout_spiral  = theme.path .. "layouts/spiralw.png"
theme.layout_dwindle = theme.path .. "layouts/dwindlew.png"



theme.awesome_icon = "/usr/share/awesome/icons/awesome16.png"

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:encoding=utf-8:textwidth=80
