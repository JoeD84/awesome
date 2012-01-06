-- {{{ Signals
-- Signal function to execute when a new client appears.

function call_layouts()
  --naughty.notify{text="Calling Layouts", timeout = 10}
  -- gimp_layout()
  my_layout()
  im_layout()
  --choose_screen()
end

client.add_signal(
    "manage", 
    function (c, startup)
        -- Add a titlebar
        if awful.client.floating.get(c) then
            awful.titlebar.add(c, { modkey = modkey, height="13" })
        end
        -- awful.titlebar.add(c, { modkey = modkey })

        -- Enable sloppy focus
        c:add_signal("mouse::enter", function(c)
            if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
                and awful.client.focus.filter(c) then
                client.focus = c
            end
        end)

        if not startup then
            -- Set the windows at the slave,
            -- i.e. put it at the end of others instead of setting it master.
            --awful.client.setslave(c)

            -- Put windows in a smart way, only if they does not set an initial position.
            if not c.size_hints.user_position and not c.size_hints.program_position then
                awful.placement.no_overlap(c)
                awful.placement.no_offscreen(c)
            end
        end
        call_layouts()
    end
)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- Wenn ein Client sich schließt, dann berechne das Gimp-Layout neu.
client.add_signal("unmanage", 
    function(c)
        call_layouts()
    end
)