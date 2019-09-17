BUTTON_HEIGHT = 64  
function newButton(text, fn)
  return {text = text, fn = fn,
   now = false,
   last = false }
end

 buttons = {}
 buttons2 = {}

 font = nil
 
 function generate(bx, by, w, z, grid)
      mx,my = love.mouse.getPosition()
      for i, button in ipairs(grid) do
      button.last = button.now
       color = {0.4, 0.4, 0.5, 1.0} 
    
    
 hot = mx > bx and mx < bx + 200  and
           my > by and my < by + 43
                
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
      150,
      45
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

function draw_buttons(a, b, w, x, y, z) 
        function love.draw()
        drawTables(a, b)
        table.insert(buttons2, newButton("Back", function() 
              function love.draw()
                love.graphics.setBackgroundColor(0,0,0,0)
                generate_buttons(buttons)
                end
      end))
        generate(w,x,y,z,buttons2)
        
        table.insert(buttons2, newButton("Solve", function() 
              function love.draw() 
                drawTables(a,b)
              end
            end
            ))
        generate(w,x+60, y, z+60, buttons2)
  
end
  end