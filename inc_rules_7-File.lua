-- Layout Idee von http://www.uninformativ.de/?ndo=single&newsid=115 
function my_init(my_client, args)
    my_client:add_signal("property::minimized", my_layout)
    my_client:add_signal("tagged", my_layout)
    my_layout(my_client, args)
end
my_rules = {
    all = { 
        rule = 		{ },
        properties =    { }
    },
    main = { 
        rule = 		{ class = "Konqueror", role = "MainWindow#1" },
	properties =    { }
    },
    move = {
	rule =          { class = "Konqueror", name = "Verschiebevorgang" }, 
	properties =    { }
    },
    smplayer = {
        rule =          { class = "Smplayer" }, 
    }
}

function my_layout(my_client, args)
    if not awful.rules.match(my_client, my_rules.all.rule) then
        return
    end
    local sideclients = 0
    local rows = 0
    local mainclients = 0
    local my_tag_obj = tags[1][7]
    for k, c in pairs(client.get(1)) do
        if not c.minimized then
            for k2, t in pairs(c:tags()) do
                if awful.client.floating.get(c) then break end
                if t == my_tag_obj then
                    if awful.rules.match(c, my_rules.main.rule) then
                        mainclients = mainclients + 1
                        --naughty.notify{text="Main + 1 = "..main, timeout=10}
                    elseif awful.rules.match(c, my_rules.move.rule) then
                        if rows == 0 then rows = 1 else rows = rows end
                        sideclients=sideclients+1
                        naughty.notify{text="Verschieben", timeout=10}
                        for j = 1, sideclients+1 do awful.client.setslave(c) end
                    elseif awful.rules.match(c, my_rules.smplayer.rule) then
                        main = main + 1
                        --naughty.notify{text="Smplayer", timeout=10}
                    else
                        sideclients = sideclients + 1
                        rows = rows + 1
                        --naughty.notify{text="Alles andere!", timeout=10}
                        for j = 0, sideclients do awful.client.setslave(c) end
                        --naughty.notify{text="Aside + 1 = "..aside, timeout=10}
                        --naughty.notify{text="\nSet slave!", timeout=10}
                    end
                end
            end
        end
    end
    wmfact=1-sideclients*0.18
    --naughty.notify{text="Tag: " .. 7 .. "\nMain: " .. mainclients .. "\nSideclients: " .. sideclients.."\nwmfact: "..wmfact.."\nRows:"..rows, timeout=10}
    awful.tag.setnmaster(       mainclients,    tags[1][7])
    awful.tag.setncol(          sideclients,    tags[1][7])
    awful.tag.setmwfact(        wmfact,         tags[1][7])
end

function my_layout_2(my_client, args)
    if not awful.rules.match(my_client, my_rules.all.rule) then
        return
    end
    local sideclients = 0
    local rows = 0
    local mainclients = 0
    local my_tag_obj = tags[1][7]
    for k, c in pairs(client.get(1)) do
        if not ( c.minimized or awful.client.floating.get(c) ) then
            for k2, t in pairs(c:tags()) do
                if t == my_tag_obj then
                    if awful.rules.match(c, my_rules.main.rule) then
                        mainclients = mainclients + 1
                    elseif awful.rules.match(c, my_rules.move.rule) then
                        if rows == 0 then rows = 1 else rows = rows end
                        sideclients=sideclients+1
                    elseif awful.rules.match(c, my_rules.smplayer.rule) then
                        main = main + 1
                    else
                        sideclients = sideclients + 1
                        rows = rows + 1
                    end
                end
            end
        end
    end
    wmfact=1-sideclients*0.18
    --naughty.notify{text="Unmanage!\nTag: " .. 7 .. "\nMain: " .. mainclients .. "\nSideclients: " .. sideclients.."\nwmfact: "..wmfact.."\nRows:"..rows, timeout=10}
    awful.tag.setnmaster(       mainclients,    tags[1][7])
    awful.tag.setncol(          sideclients,    tags[1][7])
    awful.tag.setmwfact(        wmfact,         tags[1][7])
end
