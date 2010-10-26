gimp_screen = 1
gimp_tag = 8

function gimp_init(gimp_client, args)
    gimp_client:add_signal("property::minimized", gimp_layout)
    gimp_client:add_signal("tagged", gimp_layout)
    gimp_layout(gimp_client, args)
end
function my_init(my_client, args)
    my_client:add_signal("property::minimized", my_layout)
    my_client:add_signal("tagged", my_layout)
    my_layout(my_client, args)
end

-- Die Gimp-Regeln.
gimp_rules = {
    all = 		{ rule = { class = "Gimp" }, 								properties = { tag = tags[1][8], size_hints_honor = false, }, },--callback = gimp_init },
    toolbox = 	{ rule = { class = "Gimp", role = "gimp-toolbox" }, 		properties = { floating = false }, callback = awful.client.setslave },
    dock = 		{ rule = { class = "Gimp", role = "gimp-dock" }, 			properties = { floating = false }, callback = awful.client.setslave },
    image = 	{ rule = { class = "Gimp", role = "gimp-image-window" }, 	properties = { floating = false } },
}
my_rules = {
    all = 	{ 
	  rule = 		{ },
	  properties = 	{ }, 
	},
    aside = { 
	  rule = 		{ class = "Konqueror", name = "Kopiervorgang" }, 	
	  properties = 	{ floating = false } 
	},
    main = 	{ 
	  rule = 		{ class = "Konqueror", role = "MainWindow*" },
	  properties = 	{ floating = false } 
	},
}
	
function gimp_layout(gimp_client, args)
    if not awful.rules.match(gimp_client, gimp_rules.all.rule) then
        return
    end
    local aside = 0
    local main = 0
    local gimp_tag_obj = tags[gimp_screen][gimp_tag]

    for k, c in pairs(client.get(gimp_screen)) do
        if not c.minimized then
            for k2, t in pairs(c:tags()) do
                if t == gimp_tag_obj then
                    if awful.rules.match(c, gimp_rules.toolbox.rule) then
                        aside = aside + 1
                    end
                    if awful.rules.match(c, gimp_rules.dock.rule) then
                        aside = aside + 1
                    end
                    if awful.rules.match(c, gimp_rules.image.rule) then
                        main = main + 1
                    end
                end
            end
        end
    end
    awful.tag.setncol(aside, tags[gimp_screen][gimp_tag])
    awful.tag.setnmaster(main, tags[gimp_screen][gimp_tag])
end

function my_layout(my_client, args)
    if not awful.rules.match(my_client, my_rules.all.rule) then
        return
    end

	
    local aside = 0
    local main = 0
    local my_tag_obj = tags[1][7]
    for k, c in pairs(client.get(1)) do
        if not c.minimized then
            for k2, t in pairs(c:tags()) do
                if t == my_tag_obj then
                    if awful.rules.match(c, my_rules.all.rule) then
                        aside = aside + 1
                    end
					if awful.rules.match(c, my_rules.aside.rule) then
                        aside = aside + 1
                    end
                    if awful.rules.match(c, my_rules.main.rule) then
                        main = main + 1
                    end
                end
            end
        end
    end
	naughty.notify{text="Main: " .. main .. "\nAside: " .. aside}
    awful.tag.setncol(aside, tags[1][7])
    awful.tag.setnmaster(main, tags[1][7])

	
	
end

awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus   = true,
					 --floating = false,
                     keys    = clientkeys,
                     buttons = clientbuttons } 
    },
    -- My Definitions --
    { rule = { class = "Plasma-desktop" },      				properties = { floating = true } },
	{ rule = { class = "Plasma" },      						properties = { floating = true } },
	{ rule = { class = "Wine" },      							properties = { floating = true } },

    -- Screen 1 --
    { rule = { class = "Chrome" }, 								properties = { tag = tags[1][1] } },
    { rule = { class = "Firefox" },      						properties = { tag = tags[1][1], switchtotag = true } },
    
	{ rule = { class = "XTerm", name = "xterm - root@michelle" }, 	properties = { tag = tags[1][2] } },
    { rule = { class = "XTerm", name = "xterm - joe@michelle" }, 	properties = { tag = tags[1][3] } },
    { rule = { class = "XTerm", name = "xterm - root@miranda" }, 	properties = { tag = tags[1][4] } },
    
	{ rule = { class = "Pidgin" },      						properties = { tag = tags[1][5], floating = true } },
	{ rule = { class = "Pidgin", role = "buddy_list" }, 		properties = { tag = tags[1][5], floating = false } },
	{ rule = { class = "Pidgin", role = "smiley_dialog" }, 		properties = { tag = tags[1][5], placement = centered } },
	{ rule = { class = "Pidgin", name = "Neuer Alarm" }, 		properties = { tag = tags[1][5], floating = false }, callback = awful.client.setslave },
	{ rule = { class = "Pidgin", role = "conversation" }, 		properties = { tag = tags[1][5], floating = false }, callback = awful.client.setslave },
    
	{ rule = { class = "Kate" },      							properties = { tag = tags[1][6] } },
    { rule = { class = "Acroread" }, 							properties = { tag = tags[1][6] } },
    
	{ rule = { class = "Konqueror" }, 							properties = { tag = tags[1][7] }, callback = my_init },
	{ rule = { class = "Konqueror", name = "Kopiervorgang" },	properties = { tag = tags[1][7] }, callback = awful.client.setslave },

    { rule = { class = "Gimp" },      							properties = { tag = tags[1][8], floating = false }, callback = gimp_init },
    { rule = { class = "Gimp", role = "gimp-toolbox"}, 			properties = { floating = false }, callback = awful.client.setslave },
    { rule = { class = "Gimp", role = "gimp-dock" },    		properties = { floating = false }, callback = awful.client.setslave },
    { rule = { class = "Gimp", role = "gimp-imaage-window" }, 	properties = { floating = false }  },

    { rule = { class = "Firefox",   name = "Downloads" }, properties = { tag = tags[1][9], floating = true } },
    { rule = { class = "Vncviewer", name = "TightVNC: joe's X desktop (miranda:0)"}, properties = { tag = tags[1][9] } },

    -- Screen 2 --
    { rule = { class = "Mythfrontend" },				properties = { tag = tags[2][1], switchtotag = true, fullscreen = false, floating = false } },
    { rule = { class = "MPlayer" },      				properties = { tag = tags[2][2], floating = true } },
    { rule = { class = "Smplayer" },      				properties = { tag = tags[2][2] } },
    { rule = { class = "Amarok" },      				properties = { tag = tags[2][3], floating = true, ontop = true } },
    { rule = { class = "Gwenview" },      				properties = { tag = tags[2][5] } },
    { rule = { class = "Kuickview" },      				properties = { tag = tags[2][5] } },

}

--{{{
--{ rule = { class = "xterm" }, properties = { maximized_vertical = true, maximized_horizontal = true } }
--If you want to set mplayer floating at startup, you can add: 
--{ rule = { name = "MPlayer" }, properties = { floating = true } }
--If you want to put Firefox on a specific tag at startup, you can add: 
--{ rule = { instance = "firefox" } properties = { tag = mytagobject } }
--If you want to put Emacs on a specific tag at startup, and immediately switch to that tag you can add: 
--{ rule = { class = "Emacs" } properties = { tag = mytagobject, switchtotag = true } }
--If you want to apply a custom callback to execute when a rule matched, you can add: 
--{ rule = { class = "dosbox" }, callback = awful.placement.centered }
--Note that all "rule" entries need to match. If any of the entry does not match, the rule won't be applied.
--	{ rule = { class = "Gedit" },       				properties = { floating = true, width = 600, height = 600, x = 420, y = 420 } },
--	{ rule = { name = "Playlist" },      				properties = { floating = true, above = true } },
--	{ rule = { class = "Gedit" },      					properties = { floating = true, width = "90%", y = "50", placement = "centerx" } },
	--}}}
