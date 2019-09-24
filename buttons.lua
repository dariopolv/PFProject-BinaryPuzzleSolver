griglia = require "grid.griglia"

BUTTON_HEIGHT = 64  
function newButton(text, fn)
  return {text = text, fn = fn,
   now = false,
   last = false }
end

 buttons = {}
 buttons2 = {}
 buttons3 = {}
-- buttons4 = {}
 

 font = nil
  
  function gen(grid, var, position)
    bx = 500 + var
    by = 60 + position
    w = bx + 20
    
    button_width = 55
    button_height = 45
    for i, button in ipairs(grid) do

      by = by + 50
      z = by + 5
      
      button.last = button.now
      
      color = {0.4, 0.4, 0.5, 1.0} 
    
 mx, my = love.mouse.getPosition()
 hot = mx > bx and mx < bx + button_width + 100  and
           my > by and my < by + button_height
                
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
      button_height+100,
      button_width -10
    )
    
     textW = font:getWidth(button.text)
      textH = font:getHeight(button.text)
      
      love.graphics.setColor(0,0,0,1)
      love.graphics.print(
        button.text,
        font,
        w,z
      )
    end
    end
 
  
  function generate_buttons(grid) 

  ww = love.graphics.getWidth()
  wh = love.graphics.getHeight()
  
  button_width = ww * (1/3)
  margin = 16
  
  total_heigth = (BUTTON_HEIGHT + margin) * #buttons
  cursor_y = 0
  
  for i, button in ipairs(grid) do
    button.last = button.now
    
    bx = (ww * 0.5) - (button_width * 0.5)
    by = (wh * 0.5) - (total_heigth * 0.5) + cursor_y
     
    color = {0.4, 0.4, 0.5, 1.0} 
    
 mx, my = love.mouse.getPosition()
    
    hot = mx > bx and mx < bx + button_width and
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
      
     textW = font:getWidth(button.text)
       textH = font:getHeight(button.text)
      
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


function draw_buttons(a, b, var, position) 
   
        function love.draw()
         
        drawTables(a, b)
        gen(buttons2,var, position)
end

end
