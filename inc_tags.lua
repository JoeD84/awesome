-- {{{ Tags
tags = {}
tags.settings = {
    { name = "1:WWW", 		layout = awful.layout.suit.magnifier,		wmfact=0.87 },
    { name = "2:root", 		layout = awful.layout.suit.tile.left,		wmfact=0.6 },
    { name = "3:joe", 		layout = awful.layout.suit.tile.left,		wmfact=0.6 },
    { name = "4:miranda", 	layout = awful.layout.suit.tile.left,		wmfact=0.6 },
    { name = "5:IM", 		layout = awful.layout.suit.tile,		wmfact=0.3 },
    { name = "6:Text", 		layout = awful.layout.suit.magnifier,		wmfact=0.88 },
    { name = "7:File", 		layout = awful.layout.suit.tile.bottom,		wmfact=0.84 },
    { name = "8:Multimedia",    layout = awful.layout.suit.max,			wmfact=0.7 },
    { name = "9:Download", 	layout = awful.layout.suit.max,			wmfact=0.5 },
}

tags.settings2 = {
    { name = "1", 	layout = awful.layout.suit.max,			wmfact=0.5 },
    { name = "2", 	layout = awful.layout.suit.max,			wmfact=0.5 },
    { name = "3", 	layout = awful.layout.suit.tile.bottom,		wmfact=0.1 },
    { name = "4",       layout = awful.layout.suit.tile.bottom,		wmfact=0.9 },
    { name = "5", 	layout = awful.layout.suit.max,			wmfact=0.5 },
    { name = "6", 	layout = awful.layout.suit.floating,		wmfact=0.5 },
    { name = "7", 	layout = awful.layout.suit.floating,		wmfact=0.5 },
    { name = "8", 	layout = awful.layout.suit.floating,		wmfact=0.5 },
    { name = "9", 	layout = awful.layout.suit.floating,		wmfact=0.5 },
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
if screen.count() == 2 then                     -- Do we have 2 Screens?
    for s = 2, 2 do
      tags[s] = {}
      for i, v in ipairs(tags.settings2) do
        tags[s][i] = tag({ name = v.name })
        tags[s][i].screen = s
        awful.tag.setproperty(tags[s][i], "layout", v.layout)
        awful.tag.setmwfact(v.wmfact, tags[s][i])
      end
      tags[s][1].selected = true
    end
end
-- }}}
