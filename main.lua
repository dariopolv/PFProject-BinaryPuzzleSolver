

BUTTON_HEIGHT = 64  
function newButton(text, fn)
  return {text = text, fn = fn,
   now = false,
   last = false }
end

local buttons = {}
local font = nil

function settingTables()
 
for i = 1, size do
      zx = math.random(1, size)
      zy = math.random(1, size)
      ox = math.random(1, size)
      oy = math.random(1, size) 
    
    tableInsert(zx,zy,ox,oy,griglia, zeroPosxTab, zeroPosyTab, onePosxTab, onePosyTab, size)
end
end

function drawTables(size, cellSize)
  a = 143
  b = 43
    love.graphics.setBackgroundColor( 255,255,255)
    love.graphics.setColor( 0,0,0 )

    for re = 1,size do
      for ra = 1, size do  
        x = size*cellSize
        y = size*cellSize
        w=re*x   
        k=ra*y  
        love.graphics.rectangle("line",170,70,w,k)
      end  
    end
   for i = 1, size do
     
   love.graphics.print(0, x*zeroPosxTab[i]+a , y*zeroPosyTab[i]+b)
   love.graphics.print(1, x*onePosxTab[i]+a , y*onePosyTab[i]+b)
   end
   end


function love.load() 
local griglia = require "grid.griglia"
math.randomseed(os.time())
math.random(); math.random(); math.random()

  
  font = love.graphics.newFont(32)
  
  table.insert(buttons, newButton("6 x 6 Mode", 
    
      function() 
        initialize(6,griglia)
        size = griglia:getWidth(griglia)
        zeroPosxTab = {}
        zeroPosyTab = {}
        onePosxTab = {}
        onePosyTab = {}
        settingTables()
        
    function love.draw()
    drawTables(6, 7.5)
  end
  end ))
  
  table.insert(buttons, newButton("8 x 8 Mode",
      function() 
        initialize(8,griglia)
        size = griglia:getWidth(griglia)
        zeroPosxTab = {}
        zeroPosyTab = {}
        onePosxTab = {}
        onePosyTab = {}
        settingTables()
        
     function love.draw()
      drawTables(8, 5.5)
    end
    end))
  
  table.insert(buttons, newButton("10 x 10 Mode",
      function() 
        initialize(10,griglia)
        size = griglia:getWidth(griglia)
        zeroPosxTab = {}
        zeroPosyTab = {}
        onePosxTab = {}
        onePosyTab = {}
        settingTables()
        
    function love.draw()
      drawTables(10, 4.5)
    end
      end))
  
  table.insert(buttons, newButton("12 x 12 Mode",
      function() 
        initialize(12,griglia)
        size = griglia:getWidth(griglia)
        zeroPosxTab = {}
        zeroPosyTab = {}
        onePosxTab = {}
        onePosyTab = {}
        settingTables()
        
     function love.draw()
     drawTables(12, 3.5)
      end
        end))
    
  
end

function love.draw()
  local ww = love.graphics.getWidth()
  local wh = love.graphics.getHeight()
  
  local button_width = ww * (1/3)
  local margin = 16
  
  local total_heigth = (BUTTON_HEIGHT + margin) * #buttons
  local cursor_y = 0
  
  for i, button in ipairs(buttons) do
    button.last = button.now
    
    local bx = (ww * 0.5) - (button_width * 0.5)
    local by = (wh * 0.5) - (total_heigth * 0.5) + cursor_y
     
    local color = {0.4, 0.4, 0.5, 1.0} 
    
    local mx, my = love.mouse.getPosition()
    
    local hot = mx > bx and mx < bx + button_width and
                my > by and my < by + BUTTON_HEIGHT
                
     if hot then
       color = {0.8, 0.8, 0.9, 1.0}
     end
     
     button.now = love.mouse.isDown(1)
     
     if button.now and not button.last and hot then
       button.fn() 
     end
       
     
    
    love.graphics.setColor(unpack(color))
    love.graphics.rectangle("fill", 
      bx,
      by,
      button_width,
      BUTTON_HEIGHT
      )
      
      local textW = font:getWidth(button.text)
      local textH = font:getHeight(button.text)
      
      love.graphics.setColor(0,0,0,1)
      love.graphics.print(
        button.text,
        font,
        (ww * 0.5) - textW * 0.5,
        by + textH * 0.5
        )
      
      cursor_y = cursor_y + (BUTTON_HEIGHT + margin)
      
    end
  
end
