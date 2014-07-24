require "src/testResource"
require "src/util"



require "src/ActionManagerTest/ActionManagerTest"
local LINE_SPACE = 40

local CurPos = {x = 0, y = 0}
local BeginPos = {x = 0, y = 0}

local _allTests = {
    { isSupported = true,  name = "ActionManagerTest"      , create_func= ActionManagerTestMain  }
}

local TESTS_COUNT = table.getn(_allTests)
local director = cc.Director:getInstance()

-- create scene
local function CreateTestScene(nIdx)
    director:purgeCachedData()
    local scene = _allTests[nIdx].create_func()
    return scene
end


-- create menu
function CreateTestMenu()
    local menuLayer = cc.Layer:create()

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
    CloseMenu:addChild(CloseItem)
    menuLayer:addChild(CloseMenu)
    
    local targetPlatform = cc.Application:getInstance():getTargetPlatform()       
    if (cc.PLATFORM_OS_IPHONE == targetPlatform) or (cc.PLATFORM_OS_IPAD == targetPlatform) then
        CloseMenu:setVisible(false)
    end
   
    -- add menu items for tests
    local function menuCallback(tag)
        util.cclog(tag)
        local Idx = tag - 10000
        local testScene = CreateTestScene(Idx)
        if testScene then
            director:replaceScene(testScene)
        end
    end
    
    
    local MainMenu = cc.Menu:create()
    for index, obj in pairs(_allTests) do
        local testLabel = cc.Label:createWithTTF(obj.name, s_arialPath, 24)
        testLabel:setAnchorPoint(cc.p(0.5, 0.5))
        local testMenuItem = cc.MenuItemLabel:create(testLabel)
        if not obj.isSupported then
            testMenuItem:setEnabled(false)
        end
        testMenuItem:registerScriptTapHandler(menuCallback)
        
    end
    --MainMenu:setContentSize(cc.size(s.width, (TESTS_COUNT + 1) * (LINE_SPACE)))
    
    return menuLayer 
end