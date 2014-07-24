module("util", package.seeall)

-- cclog
function cclog(...)
    for k, v in ipairs{...} do
      if type(v) =="table" then
        for k1, v1 in pairs(v) do 
            print("\t", k1, v1)
        end
      elseif type(v) == "userdata" then
            print("userdata")  
      else 
        print(string.format(...))
      end
    end
end

-- for CCLuaEngine traceback
function __G__TRACKBACK__(msg)
    cclog("----------------------------------------")
    cclog("LUA ERROR: " .. tostring(msg) .. "\n")
    cclog(debug.traceback())
    cclog("----------------------------------------")
    return msg
end

function myadd( x,y)
  print("in src")
  return x + y
end

function getCurDir()
    local obj  = io.popen("cd") --������ڽ���ģʽ�£�ǰ��������local 
    local s = obj:read("*all")
    local path=s:sub(1,-2) --path��ŵ�ǰ·��
    obj:close();  --�ص����
    return  path
end

function print_G()
  for k,v in pairs(_G) do
        cclog(k .. ":")
        if type(v) == "table" then 
          for k1, v1 in pairs(v) do 
            cclog("\t", k1, v1)
          end
        elseif type(v) == "function" then
          cclog("\t", k)  
        end  
    end
end