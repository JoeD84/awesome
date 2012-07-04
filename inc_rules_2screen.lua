rule_smplayer = {
    rule = { class = "Smplayer" },  
    properties = { 
        tag = tags[2][2], 
        switchtotag = true, 
        opacity = 1 }, 
    --callback = choose_screen 
}

rule_smplayer2 = {
    rule = { class = "Smplayer2" },  
    properties = { 
        tag = tags[2][2], 
        switchtotag = true, 
        opacity = 1 }, 
    --callback = choose_screen 
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
        opacity = 0.95 }
}

rule_mplayer = { 
    rule = { class = "MPlayer" }, 
    properties = { 
        tag = tags[1][8], 
        switchtotag = true, 
        floating = true } 
}

rule_mythfrontend = {   
    rule = { class = "Mythfrontend" },				
    properties = { 
        tag = tags[2][1], 
        switchtotag = true, 
        --fullscreen = false, 
        --floating = false, 
        size_hints_honor = false, 
        opacity = 1 } 
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
    { rule = { instance  = "sun-awt-X11-XFramePeer" },			properties = { floating = true } },
    { rule = { name  = "ImageJ" },   					properties = { floating = true } },
    { rule = { name  = "Figure 1" },   				        properties = { floating = true } },
    { rule = { name  = "Minecraft" }, 				        properties = { floating = true } },
	

    -- Screen 1 --
    { rule = { class = "Chrome" }, 					properties = { tag = tags[1][1] } },
    { rule = { class = "Google-chrome" }, 				properties = { tag = tags[1][1], opacity = 0.98 } },
    { rule = { class = "Chromium-browser-live" }, 			properties = { tag = tags[1][1], opacity = 1 } },
    { rule = { class = "Chromium-browser" },     			properties = { tag = tags[1][1], opacity = 1 } },
    { rule = { class = "Firefox" },      				properties = { tag = tags[1][1], switchtotag = true } },
    { rule = { class = "Exe" },		      				properties = { tag = tags[1][1], opacity = 1, fullscreen = true, floating=false, fix_buggy_fullscren = true } },

    { rule = { class = "XTerm" }, 					properties = { opacity = 0.85 } },
    { rule = { class = "XTerm", name = "xterm - root@mae" },    	properties = { tag = tags[1][2], floating = false } },
    { rule = { class = "XTerm", name = "xterm - joe@mae" },      	properties = { tag = tags[1][3], floating = false } },
    { rule = { class = "XTerm", name = "xterm - root@miranda" }, 	properties = { tag = tags[1][4], floating = false } },
    { rule = { class = "XTerm", name = "xterm - root@michelle" }, 	properties = { tag = tags[1][4], floating = false } },
    
    { rule = { class = "Pidgin" },      				properties = { tag = tags[1][5], floating = true  } },
    { rule = { class = "Pidgin", role = "buddy_list" }, 		properties = { tag = tags[1][5], floating = false } },
    { rule = { class = "Pidgin", role = "smiley_dialog" }, 		properties = { tag = tags[1][5], placement = centered } },
    { rule = { class = "Pidgin", name = "Neuer Alarm" }, 		properties = { tag = tags[1][5], floating = false } },
    { rule = { class = "Pidgin", role = "conversation" }, 		properties = { tag = tags[1][5], floating = false, opacity = 0.80 } },
    { rule = { class = "Skype" }, 					properties = { tag = tags[1][5], floating = false } },
    { rule = { class = "Skype",  name="Skype™ Chat" },		        properties = { tag = tags[1][5], floating = false } },
	
    { rule = { class = "Kate" },      					properties = { tag = tags[1][6], switchtotag = true, opacity = 1 } },
    { rule = { class = "Python2.7" },                 			properties = { tag = tags[1][6], switchtotag = true, opacity = 1 } },
    { rule = { class = "Eclipse" },                  			properties = { tag = tags[1][6], switchtotag = true, opacity = 0.98 } },
    { rule = { class = "Acroread" }, 					properties = { tag = tags[1][6], switchtotag = true, opacity = 1 } },
    { rule = { class = "Okular" }, 					properties = { tag = tags[1][6], switchtotag = true, opacity = 1 } },
    
    { rule = { class = "Konqueror" }, 					properties = { tag = tags[1][7] } },
    { rule = { class = "Konqueror", name = "Fortschrittsdialog" },	properties = { tag = tags[1][7] } },
    { rule = { class = "Konqueror", name = "Kopiervorgang" },	        properties = { tag = tags[1][7] } },

    { rule = { class = "Amarok" },      				properties = { tag = tags[1][8], switchtotag = true, floating = false } },
    
    { rule = { class = "Gimp" },      					properties = { tag = tags[1][8], floating = true }, callback = gimp_init },
    { rule = { class = "Gimp", role = "gimp-toolbox"}, 			properties = { floating = false }, callback = awful.client.setslave },
    { rule = { class = "Gimp", role = "gimp-dock" },    		properties = { floating = false }, callback = awful.client.setslave },
    { rule = { class = "Gimp", role = "gimp-image-window" }, 	        properties = { floating = false }  },

    { rule = { class = "Firefox",   name = "Downloads" }, 		properties = { tag = tags[1][9], floating = true } },
    { rule = { class = "Deluge" }, 					properties = { tag = tags[1][9] } },
    { rule = { class = "Vncviewer" },                                   properties = { tag = tags[1][9], floating = true } },
    { rule = { class = "Vncviewer", name = "TightVNC: joe's X desktop (michelle:1)"}, properties = { tag = tags[1][9]  } },
    -- Screen 2 --
    rule_mythfrontend,
    rule_mplayer,
    rule_smplayer,
    rule_smplayer2,
    { rule = { name  = "rygel" },        				properties = { tag = tags[2][2], switchtotag = true } },
    
    { rule = { class = "Amarok", name = "Schmale Werkzeugleiste" },	properties = { tag = tags[2][3], switchtotag = true, floating = false, placement = top } },
    { rule = { class = "Amarok", name = "&Medienquellen" },     	properties = { tag = tags[2][3], switchtotag = true, floating = false } },
    { rule = { class = "Amarok", name = "&Kontext" },	properties = { tag = tags[2][3], switchtotag = true, floating = false } },    
    
    { rule = { class = "Gwenview" },      				properties = { tag = tags[2][5] } },
    { rule = { class = "Kuickview" },      				properties = { tag = tags[2][5] } },

}
