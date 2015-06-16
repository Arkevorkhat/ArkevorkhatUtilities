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

--begin ButtonAPI by Direwolf20, Debugged by spiker985

local button={}
function clearTable()
   button = {}
end
     
function setTable(name, func, param1, param2, active, xmin, xmax, ymin, ymax)
   button[name] = {}
   button[name]["func"] = func
   button[name]["active"] = active
   if active == nil then
     active = false
   end
   button[name]["param1"] = param1
   button[name]["param2"] = param2
   button[name]["xmin"] = xmin
   button[name]["ymin"] = ymin
   button[name]["xmax"] = xmax
   button[name]["ymax"] = ymax
end
 
function remTable(name)
  button[name] = {}
  button[name]["xmin"] = 0
  button[name]["ymin"] = 0
  button[name]["xmax"] = 0
  button[name]["ymax"] = 0
end
   
 
function fill(text, color, bData)
   mon.setBackgroundColor(color)
   local yspot = math.floor((bData["ymin"] + bData["ymax"]) /2)
   local xspot = math.floor((bData["xmax"] - bData["xmin"] - string.len(text)) /2) +1
   for j = bData["ymin"], bData["ymax"] do
      mon.setCursorPos(bData["xmin"], j)
      if j == yspot then
         for k = 0, bData["xmax"] - bData["xmin"] - string.len(text) +1 do
            if k == xspot then
               mon.write(text)
            else
               mon.write(" ")
            end
         end
      else
         for i = bData["xmin"], bData["xmax"] do
            mon.write(" ")
         end
      end
   end
   mon.setBackgroundColor(colors.black)
end
     
function screen()
   local currColor
   for name,data in pairs(button) do
      local on = data["active"]
      if on == true then currColor = colors.lime else currColor = colors.red end
      fill(name, currColor, data)
   end
end
 
function toggleButton(name)
   button[name]["active"] = not button[name]["active"]
   screen()
end    
 
function flash(name)
   toggleButton(name)
   screen()
   sleep(0.15)
   toggleButton(name)
   screen()
end
                                             
function checkxy(x, y)
   for name, data in pairs(button) do
      if y>=data["ymin"] and  y <= data["ymax"] then
         if x>=data["xmin"] and x<= data["xmax"] then
            if data["param1"] == "" then
              data["func"]()
            else
              data["func"](data["param1"], data["param2"])
            end
            return true
         end
      end
   end
   return false
end
     
function heading(text)
   w, h = mon.getSize()
   mon.setCursorPos((w-string.len(text))/2+1, 1)
   mon.write(text)
end
     
function label(w, h, text)
   mon.setCursorPos(w, h)
   mon.write(text)
end

--End ButtonAPI

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
