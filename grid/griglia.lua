griglia = {}

function initialize(x, griglia)
  for i = 0,x do
    griglia[i] = {}
    for j = 0,x do
      griglia[i][j] = 2
    end 
  end
end

function griglia:getWidth(griglia)
  return #griglia[1]
end


function tableInsert(zx, zy, ox, oy, tab, zxtab, zytab, oxtab, oytab, size)
  if tab[zx][zy] == 2 then
    tab[zx][zy] = 0
    table.insert(zxtab, zx)
    table.insert(zytab, zy)
  else 
    while tab[zx][zy] ~= 2 do
      zx = math.random(1, size)
      zy = math.random(1, size)
    end
    tab[zx][zy] = 0
    table.insert(zxtab, zx)
    table.insert(zytab, zy)
  end
  if tab[ox][oy] == 2 then
    tab[ox][oy] = 1
    table.insert(oxtab, ox)
    table.insert(oytab, oy)
  else 
    while tab[ox][oy] ~= 2 do
      ox = math.random(1, size)
      oy = math.random(1, size)
    end
    tab[ox][oy] = 1
    table.insert(oxtab, ox)
    table.insert(oytab, oy)
  end
end

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

function mode(x, y) 
  initialize(x,griglia)
  size = griglia:getWidth(griglia)
  zeroPosxTab = {}
  zeroPosyTab = {}
  onePosxTab = {}
  onePosyTab = {}
  settingTables()

  function love.draw()
    drawTables(x, y)
  end
end

return griglia 