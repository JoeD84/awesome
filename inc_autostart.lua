autostart_pid="/home/awesome.pid"

awful.util.spawn_with_shell("xcompmgr -r0 &")   -- Do this naughty Transparency thing

function autostart()
  os.execute("touch " .. autostart_pid)
  os.execute("nepomukserver &")
  awful.util.spawn(chrome_mail)
  awful.util.spawn(chrome_fb)
  awful.util.spawn(chrome_reader)
  awful.util.spawn(terminal_joe)
  awful.util.spawn(terminal_root)
  awful.util.spawn(terminal_michelle)
  --os.execute("shark_online &")
  --os.execute("imwheel -k &")
  os.execute("xbindkeys")
  --os.execute("irexec&")
  --os.execute("irxevent&")
  os.execute("pidgin&")
  os.execute("skype&")
  os.execute("blueman-applet&")
  os.execute("dropbox start&")
  -- Nur an Samstagen ausführen!
  if os.date("%w") == "6" then
    naughty.notify{text="Samstag", timeout = 0}
    --awful.util.spawn(kmymoney)    
  end
  naughty.notify{text="Autostart complete!\n" .. os.date("%d.%m.%Y %T\n\n"), timeout = 10}
end

function exists(filename)
  local file = io.open(filename)
  if file then
	io.close(file)
        naughty.notify{text="Already started!\n" .. os.date("%d.%m.%Y %T\n\n"), timeout = 10}


	return true
  else
	autostart()
	return false
  end
end

exists(autostart_pid)
