rule_smplayer = {
    rule = { class = "Smplayer" },  
    properties = { 
        tag = tags[2][2], 
        switchtotag = true, 
        opacity = 1 }, 
    callback = choose_screen 
}

screen_pos = 2

function choose_screen(client_in, args)
    naughty.notify{text="Choose Screen",  timeout=0}
    client_in:add_signal("property::minimized", my_screen)
    client_in:add_signal("tagged", my_screen)
    my_screen(client_in, args)
end



function my_screen(my_client, args)
    naughty.notify{text="My Screen",  timeout=0}
    if not awful.rules.match(my_client, rule_smplayer.rule) then
        return
    end
    for k, c in pairs(client.get(1)) do
        naughty.notify{text="Move to Screen" .. my_client .."\nTest:"..c,  timeout=0}
        awful.client.movetotag(tags[screen_pos][5], c)
    end
    naughty.notify{text="Tag: " .. t,  timeout=0}
end


rule_defaults={ 
    rule = { },
    properties = { 
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus   = true,
        --floating = false,
        placement = centered,
        keys    = clientkeys,
        buttons = clientbuttons,
        opacity = 0.9 },
    callback = my_layout
}

rule_mplayer = { 
    rule = { class = "MPlayer" }, 
    properties = { 
        tag = tags[1][8], 
        switchtotag = true, 
        floating = true } 
}


    
awful.rules.rules = {
 
    -- All clients will match this rule.
    rule_defaults,
    -- My Definitions --
    { rule = { class = "Plasma-desktop" },      			properties = { floating = true } },
    { rule = { class = "Plasma" },      				properties = { floating = true } },
    { rule = { class = "Wine" },      			        	properties = { floating = true } },
    { rule = { class = "Xmessage" },   					properties = { floating = true } },
    { rule = { class = "ij-ImageJ" },   				properties = { floating = true } },
    { rule = { name  = "ImageJ" },   					properties = { floating = true } },
    { rule = { name  = "Figure 1" },   				        properties = { floating = true } },
    { rule = { name  = "Minecraft" }, 				        properties = { floating = true } },
	

    -- Screen 1 --
    { rule = { class = "Chrome" }, 					properties = { tag = tags[1][1] } },
    { rule = { class = "Chromium-browser-live" }, 			properties = { tag = tags[1][1], opacity = 1 } },
    { rule = { class = "Firefox" },      				properties = { tag = tags[1][1], switchtotag = true } },

    { rule = { class = "XTerm" }, 					properties = { opacity = 0.85 } },
    { rule = { class = "XTerm", name = "xterm - root@michelle" }, 	properties = { tag = tags[1][2], floating = false } },
    { rule = { class = "XTerm", name = "xterm - joe@michelle" }, 	properties = { tag = tags[1][3], floating = false } },
    { rule = { class = "XTerm", name = "xterm - root@miranda" }, 	properties = { tag = tags[1][4], floating = false } },
        
    { rule = { class = "Pidgin" },      				properties = { tag = tags[1][5], floating = true  }, callback = im_init },
    { rule = { class = "Pidgin", role = "buddy_list" }, 		properties = { tag = tags[1][5], floating = false } },
    { rule = { class = "Pidgin", role = "smiley_dialog" }, 		properties = { tag = tags[1][5], placement = centered } },
    { rule = { class = "Pidgin", name = "Neuer Alarm" }, 		properties = { tag = tags[1][5], floating = false }, callback = awful.client.setslave },
    { rule = { class = "Pidgin", role = "conversation" }, 		properties = { tag = tags[1][5], floating = false }, callback = awful.client.setslave },
    { rule = { class = "Skype" }, 					properties = { tag = tags[1][5], floating = false } },
    { rule = { class = "Skype",  name="Skype™ Chat" },		        properties = { tag = tags[1][5], floating = false }, callback = awful.client.setslave },
	
    { rule = { class = "Kate" },      					properties = { tag = tags[1][6] } },
    { rule = { class = "Python2.7" },  			        	properties = { tag = tags[1][6] } },
    { rule = { name  = "*Editra v0.5.99" },      			properties = { tag = tags[1][6] } },
    { rule = { class = "Acroread" }, 					properties = { tag = tags[1][6] } },
    
    { rule = { class = "Konqueror" }, 					properties = { tag = tags[1][7] } },
    { rule = { class = "Konqueror", name = "Fortschrittsdialog" },	properties = { tag = tags[1][7] }, callback = awful.client.setslave },
    { rule = { class = "Konqueror", name = "Kopiervorgang" },	        properties = { tag = tags[1][7] }, callback = awful.client.setslave },

    { rule = { class = "Gimp" },      					properties = { tag = tags[1][8], floating = true }, callback = gimp_init },
    { rule = { class = "Gimp", role = "gimp-toolbox"}, 			properties = { floating = false }, callback = awful.client.setslave },
    { rule = { class = "Gimp", role = "gimp-dock" },    		properties = { floating = false }, callback = awful.client.setslave },
    { rule = { class = "Gimp", role = "gimp-image-window" }, 	        properties = { floating = false }  },

    { rule = { class = "Firefox",   name = "Downloads" }, 		properties = { tag = tags[1][9], floating = true } },
    { rule = { class = "Deluge" }, 					properties = { tag = tags[1][9] } },
    { rule = { class = "Vncviewer", name = "TightVNC: joe's X desktop (miranda:0)"}, properties = { tag = tags[1][9],  } },

    -- Screen 2 --
    {   rule = { class = "Mythfrontend" },				
        properties = { 
            tag = tags[2][1], 
            switchtotag = true, 
            fullscreen = false, 
            floating = false, 
            size_hints_honor = false, 
            opacity = 1 } },
    rule_mplayer,
    rule_smplayer,
    { rule = { name  = "rygel" },        				properties = { tag = tags[2][2], switchtotag = true } },
    { rule = { class = "Amarok" },      				properties = { tag = tags[2][3], switchtotag = true, floating = false } },
    { rule = { class = "Gwenview" },      				properties = { tag = tags[2][5] } },
    { rule = { class = "Kuickview" },      				properties = { tag = tags[2][5] } },

}