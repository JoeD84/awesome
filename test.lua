if awful.rules.match(c, my_rules.main.rule) then
  aside=aside+1
esleif awful.rules.match_any(c, my_rules.aside_any.rule) then
  aside = aside + 1
  --naughty.notify{text="Aside + 1="..aside}
elesif awful.rules.match(c, my_rules.main.rule) then
  main = main + 1
  naughty.notify{text="Main + 1="..main}
elseif awful.rules.match(c, my_rules.rule_smplayer) then
  main = main + 1
  naughty.notify{text="Smplayer"}
end