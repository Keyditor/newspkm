local basalt = require("basalt")

local main = basalt.createFrame():setTheme({FrameBG = colors.black, FrameFG = colors.lightGray})

-- Vertical scrolling is pretty simple, as you can tell:
local sub1 = main:addFrame():setScrollable():setSize(20, 15):setPosition(2, 2)

sub1:addLabel():setPosition(3, 2):setText("Scrollable")
sub1:addLabel():setPosition(3, 12):setText("Inside")
sub1:addLabel():setPosition(3, 20):setText("Outside")

-- Here we create a custom scroll event as you can see we dont add a :setScrollable() method to our frame, instead we add a custom scroll event
local objects = {}

local sub2 = main:addFrame():setPosition(23, 2):setSize(25, 5):onScroll(function(self, event, dir)
    local maxScroll = 0
    for k,v in pairs(objects)do -- here we iterate trough every object and get their x position + width this way we can find out what's the maximum allowed value to scroll
        local x = v:getX()
        local w = v:getWidth()
        maxScroll = x + w > maxScroll and x + w or maxScroll -- if you don't understand this line, http://lua-users.org/wiki/TernaryOperator
    end
    local xOffset = self:getOffset()
    if(xOffset+dir>=0 and xOffset+dir<=maxScroll-self:getWidth())then
        self:setOffset(xOffset+dir, 0)
    end
end)

-- Because we need to iterate the objects, we add them into a table.
table.insert(objects, sub2:addButton():setPosition(2, 2):setText("Scrollable"))
table.insert(objects, sub2:addButton():setPosition(16, 2):setText("Inside"))
table.insert(objects, sub2:addButton():setPosition(30, 2):setText("Outside"))

basalt.autoUpdate()
