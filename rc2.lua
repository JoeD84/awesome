require("awful")		-- Default Awful Libary
require("awful.autofocus")	-- Autofocus Settings
require("awful.rules")		-- Awful rules
require("beautiful")		-- Themes
require("naughty")		-- Notifications
--require("variables")

beautiful.init("/home/joe/.config/awesome/themes/zenburn/theme.lua")
layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.floating
}

terminal = "xterm"
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor
terminal_joe = "xterm -title 'xterm - joe@michelle' -e 'screen -D -RR'"
terminal_root = "xterm -title 'xterm - root@michelle' -e suscreen"
terminal_miranda = "xterm -title 'xterm - root@miranda' -e 'ssh -XY root@miranda'"
modkey = "Mod4"

-- Variables
--require("tags") -- Tags Definition

tags = {}
tags.settings = {
    { name = "1:WWW", layout = awful.layout.suit.max },
    { name = "2:root", layout = awful.layout.suit.fair },
    { name = "3:joe", layout = awful.layout.suit.fair },
    { name = "4:miranda", layout = awful.layout.suit.max },
    { name = "5:IM", layout = awful.layout.floating },
    { name = "6:Text", layout = awful.layout.suit.max },
    { name = "7:Misc", layout = awful.layout.suit.max },
    { name = "8:Misc", layout = awful.layout.suit.max },
    { name = "9:Misc", layout = awful.layout.suit.max },
}

tags.settings2 = {
    { name = "1:MythTV", layout = awful.layout.suit.max },
    { name = "2:GMplayer", layout = awful.layout.suit.max },
    { name = "3:Amarok", layout = awful.layout.suit.max },
    { name = "4:VirtualBox", layout = awful.layout.suit.max },
    { name = "5:Bilder", layout = awful.layout.suit.max },
    { name = "6:Misc", layout = awful.layout.suit.max },
    { name = "7:Misc", layout = awful.layout.suit.max },
    { name = "8:Misc", layout = awful.layout.suit.max },
    { name = "9:Misc", layout = awful.layout.suit.max },
}

for s = 1, 1 do
  tags[s] = {}
  for i, v in ipairs(tags.settings) do
    tags[s][i] = tag({ name = v.name })
    tags[s][i].screen = s
    awful.tag.setproperty(tags[s][i], "layout", v.layout)
  end
  tags[s][1].selected = true
end

for s = 2, 2 do
  tags[s] = {}
  for i, v in ipairs(tags.settings2) do
    tags[s][i] = tag({ name = v.name })
    tags[s][i].screen = s
    awful.tag.setproperty(tags[s][i], "layout", v.layout)
  end
  tags[s][1].selected = true
end

--
--require("menu") -- Menus
-- {{{ Menu
-- Create a laucher widget and a main menu

myawesomemenu = {
  { "manual", terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua" },
  { "restart", awesome.restart },
  { "quit", awesome.quit }
}

myfavorites = {
  { "Firefox", "firefox" },
  { "Chrome", "chromium-bin --disable-plugins" },
  { "Amarok 4", "amarok" },
  { "Amarok 3.5", "/usr/kde/3.5/bin/amarok" },
  { "MythTV", "mythfrontend" },
  { "Pidgin", "pidgin" },
  { "Konqueror", "konqueror --profile filemanagement" },
  { "Terminal", terminal }
}

mymainmenu = awful.menu({ items = { 
  { "Favoriten", myfavorites, beautiful.awesome_icon },
  { "awesome", myawesomemenu, beautiful.awesome_icon }
}
})

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),

menu = mymainmenu })

-- }}}

--

-- require("widgets")

require("vicious")
confdir = awful.util.getdir("config")

-- {{{ Widget icons
beautiful.widget_cpu = confdir .. "/icons-zenburn-anrxc/cpu.png"
beautiful.widget_bat = confdir .. "/icons-zenburn-anrxc/bat.png"
beautiful.widget_mem = confdir .. "/icons-zenburn-anrxc/mem.png"
beautiful.widget_fs = confdir .. "/icons-zenburn-anrxc/disk.png"
beautiful.widget_net = confdir .. "/icons-zenburn-anrxc/down.png"
beautiful.widget_netup = confdir .. "/icons-zenburn-anrxc/up.png"
beautiful.widget_mail = confdir .. "/icons-zenburn-anrxc/mail.png"
beautiful.widget_vol = confdir .. "/icons-zenburn-anrxc/vol.png"
beautiful.widget_org = confdir .. "/icons-zenburn-anrxc/cal.png"
beautiful.widget_date = confdir .. "/icons-zenburn-anrxc/time.png"
beautiful.widget_crypto = confdir .. "/icons-zenburn-anrxc/crypto.png"

-- }}}

-- {{{ Widgets

beautiful.fg_widget = "#AECF96"
beautiful.fg_center_widget = "#88A175"
beautiful.fg_end_widget = "#FF5656"
beautiful.fg_off_widget = "#494B4F"
beautiful.fg_netup_widget = "#7F9F7F"
beautiful.fg_netdn_widget = "#CC9393"
beautiful.bg_widget = "#3F3F3F"
beautiful.border_widget = "#3F3F3F"

-- }}}

-- {{{ Reusable separators

spacer = widget({ type = "textbox", name = "spacer" })
spacer.text = " "
separator = widget({ type = "textbox", name = "separator" })
separator.text = "|"

-- }}}

-- {{{ CPU usage graph and temperature

cpuicon = widget({ type = "imagebox", name = "cpuicon" })
cpuicon.image = image(beautiful.widget_cpu)
thermalwidget = widget({ type = "textbox", name = "thermalwidget" })
cpuwidget = awful.widget.graph()
cpuwidget:set_width(50)
cpuwidget:set_max_value(100)
cpuwidget:set_background_color(beautiful.fg_off_widget)
cpuwidget:set_border_color(beautiful.border_widget)
cpuwidget:set_color(beautiful.fg_end_widget)
cpuwidget:set_gradient_colors({
beautiful.fg_end_widget,
beautiful.fg_center_widget,
beautiful.fg_widget })

--awful.widget.layout.margins[cpuwidget.widget] = { top = 2, bottom = 2 }

vicious.register(cpuwidget, vicious.widgets.cpu, "$1", 2)

--vicious.register(thermalwidget, vicious.widgets.thermal, "$1C", 60, "TZS0")

-- }}}

-- {{{ Memory usage bar

-- Widget icon

memicon = widget({ type = "imagebox", name = "memicon" })

memicon.image = image(beautiful.widget_mem)

--memwidget = awful.widget.graph()

--memwidget:set_width(100)

--memwidget:set_scale(false)

--memwidget:set_max_value(100)

--memwidget:set_background_color(beautiful.fg_off_widget)

--memwidget:set_border_color(beautiful.border_widget)

--memwidget:set_color(beautiful.fg_end_widget)

--memwidget:set_gradient_colors({

-- beautiful.fg_end_widget,

-- beautiful.fg_center_widget,

-- beautiful.fg_widget })

--awful.widget.layout.margins[memwidget.widget] = { top = 2, bottom = 2 }

--vicious.register(memwidget, vicious.widgets.mem, "$2", 1)

-- }}}

-- Initialize widget

-- memwidget = widget({ type = 'progressbar'})

-- Progressbar properties

-- memwidget:set_width(80)

-- memwidget:set_height(8)

-- memwidget:set_vertical(true)

-- memwidget:set_background_color("#494B4F")

-- memwidget:set_border_color(nil)

-- memwidget:set_color("#AECF96")

-- memwidget:set_gradient_colors({ "#AECF96", "#88A175", "#FF5656" })

-- Register widget

-- vicious.register(memwidget, vicious.widgets.mem, '$1', 13)

memwidget = widget({ type = 'textbox' })
--vicious.enable_caching(vicious.widgets.mem)
vicious.register(memwidget, vicious.widgets.mem, '$1% ($2MB/$3MB) ', 13)

-- {{{ Volume level, progressbar and changer

-- Widget icon

volicon = widget({ type = "imagebox", name = "volicon" })

volicon.image = image(beautiful.widget_vol)

volbarwidget = awful.widget.progressbar()

volbarwidget:set_width(80)

volbarwidget:set_vertical(false)

volbarwidget:set_background_color(beautiful.fg_off_widget)

volbarwidget:set_border_color(nil)

volbarwidget:set_color(beautiful.fg_widget)

volbarwidget:set_gradient_colors({

beautiful.fg_widget,

beautiful.fg_center_widget,

beautiful.fg_end_widget })

--awful.widget.layout.margins[volbarwidget.widget] = { top = 2, bottom = 2 }

vicious.register(volbarwidget, vicious.widgets.volume, "$1", 2, "PCM")

volbarwidget.widget:buttons(awful.util.table.join(

awful.button({ }, 1, function () awful.util.spawn("kmix", false) end),

awful.button({ }, 2, function () awful.util.spawn("amixer -q set PCM toggle", false) end),

awful.button({ }, 4, function () awful.util.spawn("amixer -q sset PCM 5+", false) end),

awful.button({ }, 5, function () awful.util.spawn("amixer -q sset PCM 5-", false) end)

)

)

--volwidget:buttons( volbarwidget.widget:buttons() )

-- }}}

-- Create a textclock widget

mytextclock = awful.widget.textclock({ align = "right" })

-- Create a systray

mysystray = widget({ type = "systray" })

-- Create a wibox for each screen and add it

mywibox = {}

mypromptbox = {}

mylayoutbox = {}

mytaglist = {}

mytaglist.buttons = awful.util.table.join(

awful.button({ }, 1, awful.tag.viewonly),

awful.button({ modkey }, 1, awful.client.movetotag),

awful.button({ }, 3, awful.tag.viewtoggle),

awful.button({ modkey }, 3, awful.client.toggletag),

awful.button({ }, 4, awful.tag.viewnext),

awful.button({ }, 5, awful.tag.viewprev)

)

mytasklist = {}

mytasklist.buttons = awful.util.table.join(

awful.button({ }, 1, function (c)

if not c:isvisible() then

awful.tag.viewonly(c:tags()[1])

end

client.focus = c

c:raise()

end),

awful.button({ }, 3, function ()

if instance then

instance:hide()

instance = nil

else

instance = awful.menu.clients({ width=250 })

end

end),

awful.button({ }, 4, function ()

awful.client.focus.byidx(1)

if client.focus then client.focus:raise() end

end),

awful.button({ }, 5, function ()

awful.client.focus.byidx(-1)

if client.focus then client.focus:raise() end

end))

for s = 1, screen.count() do

-- Create a promptbox for each screen

mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })

-- Create an imagebox widget which will contains an icon indicating which layout we're using.

-- We need one layoutbox per screen.

mylayoutbox[s] = awful.widget.layoutbox(s)

mylayoutbox[s]:buttons(awful.util.table.join(

awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),

awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),

awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),

awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))

-- Create a taglist widget

mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

-- Create a tasklist widget

mytasklist[s] = awful.widget.tasklist(function(c)

return awful.widget.tasklist.label.currenttags(c, s)

end, mytasklist.buttons)

-- Create the wibox

mywibox[s] = awful.wibox({ position = "bottom", screen = s })

-- Add widgets to the wibox - order matters

mywibox[s].widgets = {

{

mylauncher,

mytaglist[s],

mypromptbox[s],

layout = awful.widget.layout.horizontal.leftright

},

mylayoutbox[s],

mytextclock,

s == 1 and mysystray or nil,

mytasklist[s],

layout = awful.widget.layout.horizontal.rightleft

}

end

-- }}}

-- {{{ meine Widgets

mytextbox = widget({ type = "textbox", name = "mytextbox" })

mytextbox.text = "Hello, world!"

JoeWidget = {}

JoeWidget[1] = awful.wibox({ position = "top", screen = 1 })

JoeWidget[1].widgets = {

seperator, volicon, volbarwidget,

separator, memicon, memwidget,

separator, cpuicon, cpuwidget, thermalwidget,

layout = awful.widget.layout.horizontal.leftright }

-- Widgets

-- require("key") -- Key bindings

root.buttons(awful.util.table.join(

awful.button({ }, 3, function () mymainmenu:toggle() end),

awful.button({ }, 4, awful.tag.viewnext),

awful.button({ }, 5, awful.tag.viewprev)

))

globalkeys = awful.util.table.join(

awful.key({ modkey, }, "Left", awful.tag.viewprev ),

awful.key({ modkey, }, "Right", awful.tag.viewnext ),

awful.key({ modkey, }, "Escape", awful.tag.history.restore),

awful.key({ modkey, }, "j",

function ()

awful.client.focus.byidx( 1)

if client.focus then client.focus:raise() end

end),

awful.key({ modkey, }, "k",

function ()

awful.client.focus.byidx(-1)

if client.focus then client.focus:raise() end

end),

awful.key({ modkey, }, "w", function () mymainmenu:show(true) end),

-- Layout manipulation

awful.key({ modkey, "Shift" }, "j", function () awful.client.swap.byidx( 1) end),

awful.key({ modkey, "Shift" }, "k", function () awful.client.swap.byidx( -1) end),

awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),

awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),

awful.key({ modkey, }, "u", awful.client.urgent.jumpto),

awful.key({ modkey, }, "Tab",

function ()

awful.client.focus.history.previous()

if client.focus then

client.focus:raise()

end

end),

-- Standard program

awful.key({ modkey, }, "Return", function () awful.util.spawn(terminal_root) end),

awful.key({ modkey, "Control" }, "r", awesome.restart),

awful.key({ modkey, "Shift" }, "q", awesome.quit),

awful.key({ modkey, }, "l", function () awful.tag.incmwfact( 0.05) end),

awful.key({ modkey, }, "h", function () awful.tag.incmwfact(-0.05) end),

awful.key({ modkey, "Shift" }, "h", function () awful.tag.incnmaster( 1) end),

awful.key({ modkey, "Shift" }, "l", function () awful.tag.incnmaster(-1) end),

awful.key({ modkey, "Control" }, "h", function () awful.tag.incncol( 1) end),

awful.key({ modkey, "Control" }, "l", function () awful.tag.incncol(-1) end),

awful.key({ modkey, }, "space", function () awful.layout.inc(layouts, 1) end),

awful.key({ modkey, "Shift" }, "space", function () awful.layout.inc(layouts, -1) end),

-- Prompt

awful.key({ modkey }, "r", function () mypromptbox[mouse.screen]:run() end),

awful.key({ modkey }, "x",

function ()

awful.prompt.run({ prompt = "Run Lua code: " },

mypromptbox[mouse.screen].widget,

awful.util.eval, nil,

awful.util.getdir("cache") .. "/history_eval")

end)

)

clientkeys = awful.util.table.join(

awful.key({ modkey, }, "f", function (c) c.fullscreen = not c.fullscreen end),

awful.key({ modkey, "Shift" }, "c", function (c) c:kill() end),

awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle ),

awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),

awful.key({ modkey, }, "o", awful.client.movetoscreen ),

awful.key({ modkey, "Shift" }, "r", function (c) c:redraw() end),

awful.key({ modkey, }, "n", function (c) c.minimized = not c.minimized end),

awful.key({ modkey, }, "m",

function (c)

c.maximized_horizontal = not c.maximized_horizontal

c.maximized_vertical = not c.maximized_vertical

end)

)

-- Compute the maximum number of digit we need, limited to 9

keynumber = 0

for s = 1, screen.count() do

keynumber = math.min(9, math.max(#tags[s], keynumber));

end

-- Bind all key numbers to tags.

-- Be careful: we use keycodes to make it works on any keyboard layout.

-- This should map on the top row of your keyboard, usually 1 to 9.

for i = 1, keynumber do

globalkeys = awful.util.table.join(globalkeys,

awful.key({ modkey }, "#" .. i + 9,

function ()

local screen = mouse.screen

if tags[screen][i] then

awful.tag.viewonly(tags[screen][i])

end

end),

awful.key({ modkey, "Control" }, "#" .. i + 9,

function ()

local screen = mouse.screen

if tags[screen][i] then

awful.tag.viewtoggle(tags[screen][i])

end

end),

awful.key({ modkey, "Shift" }, "#" .. i + 9,

function ()

if client.focus and tags[client.focus.screen][i] then

awful.client.movetotag(tags[client.focus.screen][i])

end

end),

awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,

function ()

if client.focus and tags[client.focus.screen][i] then

awful.client.toggletag(tags[client.focus.screen][i])

end

end))

end

clientbuttons = awful.util.table.join(

awful.button({ }, 1, function (c) client.focus = c; c:raise() end),

awful.button({ modkey }, 1, awful.mouse.client.move),

awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys

root.keys(globalkeys)

--

--require("rules") -- Window Placing rules

--require("signals") -- Signal function to execute when a new client appears.

client.add_signal("manage", function (c, startup)

-- Add a titlebar

-- awful.titlebar.add(c, { modkey = modkey })

-- Enable sloppy focus

c:add_signal("mouse::enter", function(c)

if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier

and awful.client.focus.filter(c) then

client.focus = c

end

end)

if not startup then

-- Set the windows at the slave,

-- i.e. put it at the end of others instead of setting it master.

-- awful.client.setslave(c)

-- Put windows in a smart way, only if they does not set an initial position.

if not c.size_hints.user_position and not c.size_hints.program_position then

awful.placement.no_overlap(c)

awful.placement.no_offscreen(c)

end

end

end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)

client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

--

--require("autostart") -- Autostart Programs

 