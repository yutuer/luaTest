require "src/testResource"


local director = cc.Director:getInstance()
-- create menu
function CreateTestMenu()
    local menuLayer = cc.Layer:create()
    -- add close menu
    local s = director:getWinSize()
    local CloseItem = cc.MenuItemImage:create(s_pPathClose, s_pPathClose)
    --CloseItem:setScale()
    CloseItem:setPosition(cc.p(s.width - 30, s.height - 30))
    menuLayer:addChild(CloseItem)    
    return menuLayer 
end