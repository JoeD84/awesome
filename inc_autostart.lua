autostart_pid="/home/awesome.pid"

function autostart()
  os.execute("touch " .. autostart_pid)
  awful.util.spawn(chrome_mail)
  awful.util.spawn(chrome_calendar)
  --awful.util.spawn(chrome_reader)
  awful.util.spawn(terminal_joe)
  awful.util.spawn(terminal_root)
  awful.util.spawn(terminal_miranda)
  awful.util.spawn(kmymoney)
  os.execute("shark_online &")
  os.execute("imwheel -k &")
  os.execute("pidgin&")
  os.execute("skype&")
  os.execute("blueman-applet&")
  os.execute("dropbox start&")
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
