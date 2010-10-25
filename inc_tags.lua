-- {{{ Tags
tags = {}
tags.settings = {
    { name = "1:WWW", 		layout = awful.layout.suit.magnifier,		wmfact=0.87 },
    { name = "2:root", 		layout = awful.layout.suit.tile.left,		wmfact=0.6 },
    { name = "3:joe", 		layout = awful.layout.suit.tile.left,		wmfact=0.6 },
    { name = "4:miranda", 	layout = awful.layout.suit.tile.left,		wmfact=0.6 },
    { name = "5:IM", 		layout = awful.layout.suit.tile.left,		wmfact=0.7 },
    { name = "6:Text", 		layout = awful.layout.suit.magnifier,		wmfact=0.5 },
    { name = "7:File", 		layout = awful.layout.suit.tile.bottom,		wmfact=0.84 },
    { name = "8:Multimedia", layout = awful.layout.suit.tile,			wmfact=0.7 },
    { name = "9:Download", 	layout = awful.layout.suit.max,				wmfact=0.5 },
}

tags.settings2 = {
    { name = "1:MythTV", 	layout = awful.layout.suit.max,				wmfact=0.5 },
    { name = "2:GMplayer", 	layout = awful.layout.suit.max,				wmfact=0.5 },
    { name = "3:Amarok", 	layout = awful.layout.suit.max,				wmfact=0.5 },
    { name = "4:VirtualBox", 	layout = awful.layout.suit.max,			wmfact=0.5 },
    { name = "5:Bilder", 	layout = awful.layout.suit.max,				wmfact=0.5 },
    { name = "6:Misc", 		layout = awful.layout.suit.floating,		wmfact=0.5 },
    { name = "7:Misc", 		layout = awful.layout.suit.floating,		wmfact=0.5 },
    { name = "8:GIMP", 		layout = awful.layout.suit.floating,		wmfact=0.5 },
    { name = "9:Misc", 		layout = awful.layout.suit.floating,		wmfact=0.5 },
}

for s = 1, 1 do
  tags[s] = {}
  for i, v in ipairs(tags.settings) do
    tags[s][i] = tag({ name = v.name })
    tags[s][i].screen = s
    awful.tag.setproperty(tags[s][i], "layout", v.layout)
	awful.tag.setmwfact(v.wmfact, tags[s][i])
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
-- }}}