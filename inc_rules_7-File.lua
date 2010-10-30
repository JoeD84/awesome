
function my_init(my_client, args)
    my_client:add_signal("property::minimized", my_layout)
    my_client:add_signal("tagged", my_layout)
    my_layout(my_client, args)
end
my_rules = {
    all = 	{ 
	  rule = 		{ },
	  properties = 	{ },
	  callback = awful.client.setslave
	},
    aside_any = { 
	  rule = {},
	  --rule = 		{ class = "Konqueror, XTerm", name = "Fortschrittsdialog, Kopiervorgang, Verschiebevorgang, Verschiebevorgang (6 % von 402.2 MiB )" }, 	
	  properties = 	{ }, --floating = false },
	  callback = awful.client.setslave
	},
    main = 	{ 
	  rule = 		{ class = "Konqueror", role = "MainWindow#1" },
	  properties = {}
	},
	any = {
	  rule = { class = { "Konqueror" } }, 
	  properties = { }
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
        if not c.minimized then
            for k2, t in pairs(c:tags()) do
                if t == my_tag_obj then
					if not awful.rules.match(c, my_rules.main.rule) then
					  --if awful.rules.match(c, my_rules.all.rule) then
						  aside = aside + 1
						  --naughty.notify{text="Alles andere X"}
					  --end
					end
					if awful.rules.match_any(c, my_rules.aside_any.rule) then
					  aside = aside + 1
					  naughty.notify{text="Aside + 1"}
					end
					--if not awful.rules.match_any(c, my_rules.aside_any.rule) then  
					  if awful.rules.match(c, my_rules.main.rule) then
						  main = main + 1
					  end
					--end
                end
            end
        end
    end
	--naughty.notify{text="Tag: " .. 7 .. "\nMain: " .. main .. "\nAside: " .. aside.."\nwmfact: "..(1-aside/10.0), timeout=10}
    awful.tag.setncol(aside, tags[1][7])
    awful.tag.setnmaster(main, tags[1][7])
	awful.tag.setmwfact(1-(aside/10), tags[1][7])
end