Console = {
  __VERSION = "1.00",

  Update = function()
    if Cfg.Debug then
      Console.PerformDebug()
    end

    while true do
      if Cfg.DisableControls then
        for key,val in pairs(Controls) do
          DisableControlAction(0,val,true)
        end
      end

      if IsDisabledControlJustReleased(0, Controls["Visibility"]) then
        Wait(0)

        Console.Opened = not Console.Opened
        if Console.Opened then
          Console.Open()
        else
          Console.Close()
        end
      end

      if IsDisabledControlJustReleased(0, Controls["Focus"]) then
        Wait(0)
        Console.Focus()
      end

      Wait(0)
    end
  end,  

  Loader = function(str)
    local iter = function(t)
      local s,f = str:find(t)
      local c = 0
      while s and f do 
        s,f = str:find(t,f+1)
        c = c + 1
        Wait(0)
      end
      return c
    end
    local doRun = false
    local whiles = iter("while")
    local fors = iter("for")
    local ifs = iter(" if")
    local funcs = iter("function")
    local ends = iter("end")
    local sBrack = iter("%(")
    local eBrack = iter("%)")

    local waits = iter("Wait")
    local waitsLeft = waits - whiles
    local brackets = sBrack - eBrack
    ends = ends - whiles
    ends = ends - fors
    ends = ends - ifs
    ends = ends - funcs    

    if waitsLeft >= 0 and ends == 0 and brackets == 0 then 
      doRun = true
    end

    if doRun then
      return true
    else
      return false,{
        ["whiles          "] = tostring(whiles),
        ["waits           "] = tostring(waits),
        ["fors            "] = tostring(fors),
        ["ifs             "] = tostring(ifs),
        ["funcs           "] = tostring(funcs),
        ["ends            "] = tostring(ends),
        ["missingBracket  "] = tostring(brackets ~= 0),
        ["missingWait     "] = tostring(waitsLeft < 0),
      }
    end 
  end,

  Post = function(res,msg,col,extras)
    res = (res or "Console")
    col = (col or "gray")
    SendNUIMessage({
      type = "message",
      resource = res,
      message = msg,
      color = col,
      extras = extras,
    })
  end,

  Open = function()
    SendNUIMessage({
      type = "setAlpha",
      alpha = 0.3,
    })
    Wait(0)
    SendNUIMessage({
      type = "open"
    })
  end,

  Close = function()
    SendNUIMessage({
      type = "close"
    })
  end,

  Focus = function()  
    if not Console.Opened then return; end
    SetNuiFocus(true,true)
    SendNUIMessage({
      type = "setAlpha",
      alpha = 1.0,
    })
  end,

  Unfocus = function()
    SetNuiFocus(false,false)
    SendNUIMessage({
      type = "setAlpha",
      alpha = 0.3,
    })
  end,

  Closed = function()
    Console.Opened = false
    SetNuiFocus(false,false)
  end,

  Posted = function(postData)
    local str = tostring(postData.str)

    local res,ret = pcall(load("return "..str))
    if res then
      if ret then
        Console.Post("Console","  Executing Lua: ","yellow")
        Console.Post("Console","  "..tostring(str),"green")     
        Console.Post("Console","  Result : "..tostring(ret),"green")  
      else
        Console.Post("Console","  Executing Lua: ","yellow")
        Console.Post("Console","  "..tostring(str),"green")         
      end
      return
    else
      local func,errors = Console.Loader(str)
      if not func then 
        Console.Post("Console","  Executing this script probably isn't a good idea.","red")   
        Console.Post("Console","  "..tostring(str),"red")   
        for k,v in pairs(errors) do Console.Post("Console","  Execution Count: ","purple",{[tostring(k)] = tostring(v)}); end
      else      
        local f = load(str)  
        Console.Post("Console","  Executing Lua: ","yellow")
        Console.Post("Console","  "..tostring(str),"green")  
        local res,ret = pcall(f)
        if not res and not ret then
          f()
        end
      end
    end
  end,

  Stopped = function(postData)
    local sc = tonumber(tostring(postData.str):sub(string.len("stop  ")))
    if IsThreadActive(sc) then
      TerminateThread(sc)
      Console.Post("Console","  Terminating Thread [ID: "..sc.."]: ","red")
    else
      Console.Post("Console","  Thread does not exist [ID: "..sc.."]: ","green")
    end
  end,

  PerformDebug = function()
    SetNuiFocus(true,true)
    SetNuiFocus(false,false)
  end,
}

RegisterNUICallback('closed',Console.Closed)
RegisterNUICallback('posted',Console.Posted)
RegisterNUICallback('unfocus',Console.Unfocus)
RegisterNUICallback('stop',Console.Stopped)

_print  = function(...)
  local args = {...} 
  for _,msg in pairs(args) do
    if type(msg) ~= "string" then
      if type(msg) == "table" then
        msg = table.concat(msg)
      else
        msg = tostring(msg)
      end
    end
    local st,fn = msg:find("\n")
    while st and fn do
      msg = msg:sub(1,st-1).."<br>"..msg:sub(fn+2)
      st,fn = msg:find("\n",fn+2)
      Wait(1)
    end
    Console.Post(false,msg,false); 
  end
end
async = function(...) local args = {...} Citizen.CreateThread(function() _print(table.unpack(args)); end); end
print = (Cfg.PrintControl and Cfg.AsyncPrint and async or Cfg.PrintControl and _print or print)
log = function(...) async(...); end

Citizen.CreateThread(Console.Update)