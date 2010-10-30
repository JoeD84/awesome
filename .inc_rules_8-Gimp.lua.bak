function gimp_init(gimp_client, args)
    gimp_client:add_signal("property::minimized", gimp_layout)
    gimp_client:add_signal("tagged", gimp_layout)
    gimp_layout(gimp_client, args)
end
gimp_rules = {
    all = 		{ rule = { class = "Gimp" }, 								properties = { tag = tags[1][8], size_hints_honor = false, }, },--callback = gimp_init },
    toolbox = 	{ rule = { class = "Gimp", role = "gimp-toolbox" }, 		properties = { floating = false }, callback = awful.client.setslave },
    dock = 		{ rule = { class = "Gimp", role = "gimp-dock" }, 			properties = { floating = false }, callback = awful.client.setslave },
    image = 	{ rule = { class = "Gimp", role = "gimp-image-window" }, 	properties = { floating = false } },
}
function gimp_layout(gimp_client, args)
    if not awful.rules.match(gimp_client, gimp_rules.all.rule) then
        return
    end
    local aside = 0
    local main = 0
    local gimp_tag_obj = tags[1][8]

    for k, c in pairs(client.get(1)) do
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
    awful.tag.setncol(aside, tags[1][8])
    awful.tag.setnmaster(main, tags[1][8])
end
