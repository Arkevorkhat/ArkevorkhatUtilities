--Version 2

function datPrint(display, data, size, locX, locY) -- display will be the monitor name, or term, if you're not using a monitor.
  display.setTextScale(size)
  display.setCursorPos(locX, locY)
  display.write(data)
end

function formatSize(In, factDiv, factSub) --for formatting text to be placed on a monitor, get In using term.getSize()
  local active = In / factDiv
  local active2 = active - factSub
  return active2
end

function getRelativeTime(sysTime) --This will tell you if it is day, night, midnight, or midday.
  if sysTime == 0.000 then
    return "midnight"
  elseif sysTime == 12.000 then
    return "midday"
  elseif sysTime < 18.000 then
    if sysTime > 6.000 then
      return "day"
  else
    return "night"
  end
end
end

function setReactorPercentage(react) --returns amount stored and percentage full
  local base = {}
  base.stored = react.getEnergyStored()
  base.percent = base.stored / 10000000
  react.setAllcontrolRodLevels(base.percent)
  return base.stored, base.percent
end

function checkMonitorAdv(monitor)
  if monitor.isColor() == true then
    return true
  else
    return false
  end
end

function testMonitors(monitor1, monitor2)
  monitor1.write("control")
  monitor2.write("Main")
  sleep(5)
  monitor1.clear()
  monitor2.clear()
  monitor1.setCursorPos(0, 0)
  monitor2.setCursorPos(0, 0)param
end
