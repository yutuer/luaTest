require "src/testResource"
require "src/util"
>>>>>>> afb91bedf276b0e52857fd8c165110b846c5b78d

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

    local function closeCallback()
        director:endToLua()
    end

    -- add close menu
    local s = director:getWinSize()
    util.cclog(s)
    local CloseItem = cc.MenuItemImage:create(s_pPathClose, s_pPathClose)
    CloseItem:registerScriptTapHandler(closeCallback)
    CloseItem:setScale(0.5)
    CloseItem:setPosition(cc.p(s.width - 40, s.height - 30))
    
    local CloseMenu = cc.Menu:create()
    CloseMenu:setPosition(0, 0)
    CloseMenu:setContentSize(cc.size(s.width, 40))
    CloseMenu:addChild(CloseItem)
    menuLayer:addChild(CloseMenu)
    util.cclog(CloseMenu:getContentSize())
    local targetPlatform = cc.Application:getInstance():getTargetPlatform()       
    if (cc.PLATFORM_OS_IPHONE == targetPlatform) or (cc.PLATFORM_OS_IPAD == targetPlatform) then
        CloseMenu:setVisible(false)
    end
    
    -- add menu items for tests
    local MainMenu = cc.Menu:create()
    --MainMenu:setContentSize(cc.size(s.width, (TESTS_COUNT + 1) * (LINE_SPACE)))
    
    return menuLayer 
end