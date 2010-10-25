autostart_pid="/home/awesome.pid"

function autostart()
  os.execute("touch" .. autostart_pid)
  naughty.notify{text="Autostart complete!\n" .. os.date("%d.%m.%Y %T\n\n"), timeout = 0}
end

function exists(filename)
  local file = io.open(filename)
  if file then
	io.close(file)
    naughty.notify{text="Already started!\n" .. os.date("%d.%m.%Y %T\n\n"), timeout = 0}
	return true
  else
	autostart()
	return false
  end
end

exists(autostart_pid)