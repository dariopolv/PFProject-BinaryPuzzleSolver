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
  
  return griglia 