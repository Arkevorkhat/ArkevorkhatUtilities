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
