


function love.load() 
  local griglia = require "grid.griglia"
  require "buttons" 
  
  mode6 = false
  mode8 = false
  mode10 = false
  mode12 = false
  
  function resetControl()
    mode6 = false
    mode8 = false
    mode10 = false
    mode12 = false
    end

  math.randomseed(os.time())
  math.random(); math.random(); math.random()

  font = love.graphics.newFont(32)
  
  function setvariables() 
    if mode6 == true then
    a = 6
    b = 7.5
    var = 0

  elseif mode8 == true then
    a = 8
    b = 5.5
    var = 50
  elseif mode10 == true then
    a = 10
    b = 4.5
    var = 145
  elseif mode12 == true then
    a = 12
    b = 3.5
    var = -490
  end
end

  table.insert(buttons, newButton("6 x 6 Mode", 
      
      function() 
      mode6 = true
      setvariables()
      mode(a, b)
      draw_buttons(a, b, var)
         
    end))

  table.insert(buttons, newButton("8 x 8 Mode",
      function() 
        
        mode8 = true
        setvariables()
        mode(a,b)
        draw_buttons(a,b,var)
     
        end))

  table.insert(buttons, newButton("10 x 10 Mode",
      function() 
        mode10 = true
        setvariables()
        mode(a,b)
        draw_buttons(a,b,var)
      end))

  table.insert(buttons, newButton("12 x 12 Mode",
      function() 
        mode12 = true
        setvariables()
        mode(a,b)
        draw_buttons(a,b,var)
      end))

  table.insert(buttons, newButton("Quit", function() love.event.quit(0) end))
  
  
  table.insert(buttons2, newButton("Back", function() 
              function love.draw()
                love.graphics.setBackgroundColor(0,0,0,0)
                resetControl()
                generate_buttons(buttons)
                end
      end))
        
        table.insert(buttons2, newButton("Solve", function() 
              
              function love.draw() 
                bool = false
                setvariables()
                cont = 0
                 
                 repeat  resolve(griglia,a)
                   cont = cont +1
                 until ( cont == 200) 
                 
                
                printSolution(a,b)
            
              end
            end
            ))
        
        table.insert(buttons2, newButton("Refresh", function()
               setvariables()
               mode(a,b)
               draw_buttons(a,b,var)
              end))

end

function love.draw()
  generate_buttons(buttons)

end
