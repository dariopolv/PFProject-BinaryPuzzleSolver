require "buttons"
function love.load() 

  local griglia = require "grid.griglia"

  math.randomseed(os.time())
  math.random(); math.random(); math.random()

  font = love.graphics.newFont(32)

  table.insert(buttons, newButton("6 x 6 Mode", 

      function() 
        mode(6, 7.5)
        draw_buttons(6, 7.5, 500, 50, 535, 55)
      end))

  table.insert(buttons, newButton("8 x 8 Mode",
      function() 
        mode(8, 5.5)
        draw_buttons(8, 5.5,550,50,585,55)
      end))

  table.insert(buttons, newButton("10 x 10 Mode",
      function() 
        mode(10, 4.5)
        draw_buttons(10, 4.5, 645, 50, 680, 55)
      end))

  table.insert(buttons, newButton("12 x 12 Mode",
      function() 
        mode(12, 3.5)
        draw_buttons(12, 3.5, 10, 50, 40, 55)
      end))

  table.insert(buttons, newButton("Quit", function() love.event.quit(0) end))

end


function love.draw()

  generate_buttons(buttons)

end
