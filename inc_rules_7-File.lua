
function my_init(my_client, args)
    my_client:add_signal("property::minimized", my_layout)
    my_client:add_signal("tagged", my_layout)
    my_layout(my_client, args)
end
my_rules = {
    all = { 
        rule = 		{ },
	properties = 	{ },
	callback =      awful.client.setslave
    },
    main = { 
        rule = 		{ class = "Konqueror", role = "MainWindow#1" },
	properties =    { }
    },
    aside_any = { 
        rule =          { },
	--rule = 	{ class = "Konqueror, XTerm", name = "Fortschrittsdialog, Kopiervorgang, Verschiebevorgang, Verschiebevorgang (6 % von 402.2 MiB )" },
	properties = 	{ }, --floating = false },
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
    local aside = 0
    local main = 0
    local my_tag_obj = tags[1][7]
    for k, c in pairs(client.get(1)) do
        if not ( c.minimized or floating.get(c) ) then
            for k2, t in pairs(c:tags()) do
                if t == my_tag_obj then
                    if awful.rules.match(c, my_rules.main.rule) then
                        main = main + 1
                        --naughty.notify{text="Main + 1 = "..main, timeout=10}
                    elseif awful.rules.match(c, my_rules.move.rule) then
                        aside = aside + 1
                        --naughty.notify{text="Verschieben", timeout=10}
                        awful.client.setslave(c)
                    elseif awful.rules.match(c, my_rules.smplayer.rule) then
                        main = main + 1
                        --naughty.notify{text="Smplayer", timeout=10}
                    else
                        aside = aside + 1
                        --naughty.notify{text="Alles andere!", timeout=10}
                        awful.client.setslave(c)
                        --naughty.notify{text="Aside + 1 = "..aside, timeout=10}
                        --naughty.notify{text="\nSet slave!", timeout=10}
                    end
                end
            end
        end
    end
    wmfact=1-aside*0.18
    --naughty.notify{text="Tag: " .. 7 .. "\nMain: " .. main .. "\nAside: " .. aside.."\nwmfact: "..wmfact.."\nWindow:", timeout=10}
    awful.tag.setnmaster(       main,            tags[1][7])
    awful.tag.setncol(          aside,           tags[1][7])
    awful.tag.setmwfact(        wmfact,   tags[1][7])
end