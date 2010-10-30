awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus   = true,
					 --floating = false,
					 placement = centered,
                     keys    = clientkeys,
                     buttons = clientbuttons },
	  callback = my_layout
    },
    -- My Definitions --
    { rule = { class = "Plasma-desktop" },      				properties = { floating = true } },
	{ rule = { class = "Plasma" },      						properties = { floating = true } },
	{ rule = { class = "Wine" },      							properties = { floating = true } },
	{ rule = { class = "Xmessage" },   							properties = { floating = true } },

    -- Screen 1 --
    { rule = { class = "Chrome" }, 								properties = { tag = tags[1][1] } },
    { rule = { class = "Firefox" },      						properties = { tag = tags[1][1], switchtotag = true } },

	{ rule = { class = "XTerm" }, 									properties = { }, callback = awful.client.setslave },
	{ rule = { class = "XTerm", name = "xterm - root@michelle" }, 	properties = { tag = tags[1][2] } },
    { rule = { class = "XTerm", name = "xterm - joe@michelle" }, 	properties = { tag = tags[1][3] } },
    { rule = { class = "XTerm", name = "xterm - root@miranda" }, 	properties = { tag = tags[1][4] } },
    
	{ rule = { class = "Pidgin" },      						properties = { tag = tags[1][5], floating = true }, callback = im_init },
	{ rule = { class = "Pidgin", role = "buddy_list" }, 		properties = { tag = tags[1][5], floating = false } },
	{ rule = { class = "Pidgin", role = "smiley_dialog" }, 		properties = { tag = tags[1][5], placement = centered } },
	{ rule = { class = "Pidgin", name = "Neuer Alarm" }, 		properties = { tag = tags[1][5], floating = false }, callback = awful.client.setslave },
	{ rule = { class = "Pidgin", role = "conversation" }, 		properties = { tag = tags[1][5], floating = false }, callback = awful.client.setslave },
	{ rule = { class = "Skype" }, 								properties = { tag = tags[1][5], floating = false } },
	{ rule = { class = "Skype",  name="Skype™ Chat" },			properties = { tag = tags[1][5], floating = false }, callback = awful.client.setslave },
	
	{ rule = { class = "Kate" },      							properties = { tag = tags[1][6] } },
    { rule = { class = "Acroread" }, 							properties = { tag = tags[1][6] } },
    
	{ rule = { class = "Konqueror" }, 							properties = { tag = tags[1][7] } },
	{ rule = { class = "Konqueror", name = "Fortschrittsdialog" },	properties = { tag = tags[1][7] }, callback = awful.client.setslave },
	{ rule = { class = "Konqueror", name = "Kopiervorgang" },	properties = { tag = tags[1][7] }, callback = awful.client.setslave },

    { rule = { class = "Gimp" },      							properties = { tag = tags[1][8], floating = false }, callback = gimp_init },
    { rule = { class = "Gimp", role = "gimp-toolbox"}, 			properties = { floating = false }, callback = awful.client.setslave },
    { rule = { class = "Gimp", role = "gimp-dock" },    		properties = { floating = false }, callback = awful.client.setslave },
    { rule = { class = "Gimp", role = "gimp-imaage-window" }, 	properties = { floating = false }  },

    { rule = { class = "Firefox",   name = "Downloads" }, properties = { tag = tags[1][9], floating = true } },
    { rule = { class = "Vncviewer", name = "TightVNC: joe's X desktop (miranda:0)"}, properties = { tag = tags[1][9] } },

    -- Screen 2 --
    { rule = { class = "Mythfrontend" },				properties = { tag = tags[2][1], switchtotag = true, fullscreen = false, floating = false, size_hints_honor = false } },
    { rule = { class = "MPlayer" },      				properties = { tag = tags[2][2], switchtotag = true, floating = true } },
    { rule = { class = "Smplayer" },      				properties = { tag = tags[2][2], switchtotag = true } },
    { rule = { class = "Amarok" },      				properties = { tag = tags[2][3], switchtotag = true } },
    { rule = { class = "Gwenview" },      				properties = { tag = tags[2][5] } },
    { rule = { class = "Kuickview" },      				properties = { tag = tags[2][5] } },

}