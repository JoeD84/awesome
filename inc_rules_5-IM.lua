-- Layout Idee von http://www.uninformativ.de/?ndo=single&newsid=115 
function im_init(im_client, args)
    im_client:add_signal("property::minimized", im_layout)
    im_client:add_signal("tagged", im_layout)
    im_layout(im_client, args)
end
im_rules = {
    all = 	{ 
	  rule =	{ }
    },
    aside_any = { 
	  rule_any = 	{ name={"Skype™ Chat"} },
	  --rule =	{ class = "Konqueror, XTerm", name = "Fortschrittsdialog, Kopiervorgang, Verschiebevorgang, Verschiebevorgang (6 % von 402.2 MiB )" }, 	
	  properties = 	{ },
	  callback = awful.client.setslave
    },
    main_any =	{ 
	  rule_any = 	{ role={"buddy_list"},  name={"shizodem - Skype™ (Beta)"} }, --name=".*Skype.*"
	  properties = 	{  } 
    }
}
function im_layout(im_client, args)
    if not awful.rules.match(im_client, im_rules.all.rule) then
        return
    end
    local aside = 0
    local main = 0
    local my_tag_obj = tags[1][5]
    for k, c in pairs(client.get(1)) do
        if not c.minimized then
            for k2, t in pairs(c:tags()) do
                if t == my_tag_obj then
                    if not awful.rules.match_any(c, im_rules.main_any.rule_any) then
                      aside = 1
                      --naughty.notify{text="Test"}
                      if awful.rules.match_any(c, im_rules.aside_any.rule_any) then
                            aside = 1
                      end
                      awful.client.setslave(c)
                    else
                      main = main + 1
                    end
                end
            end
        end
    end
	if aside==0 then
	  --naughty.notify{text="Blub - Tag: " .. 5 .. "\nMain: " .. main .. "\nAside: " .. aside, timeout=10}
	  awful.tag.setncol(0, tags[1][5])
	  awful.tag.setnmaster(2, tags[1][5])  
	else	
	  --naughty.notify{text="Tag: " .. 5 .. "\nMain: " .. main .. "\nAside: " .. aside, timeout=10}
	  awful.tag.setncol(aside, tags[1][5])
	  awful.tag.setnmaster(main, tags[1][5])
	  --awful.tag.setmwfact(1-(aside/10), tags[1][7])
	end
end
