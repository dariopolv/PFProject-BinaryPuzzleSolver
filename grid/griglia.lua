griglia = {}
solution1Xtab = {} 
solution1Ytab = {}
solution0Xtab = {}
solution0Ytab = {}

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



function insertSolution(solutionXtab, x, solutionYtab, y)
  table.insert(solutionXtab, x)
  table.insert(solutionYtab,y)
end


function isSolved(grid, size)
  bool = false
  cont = 0
  for i = 1, size do
    for j = 1, size do
      if grid[i][j] ~= 2 then
        cont = cont + 1
      end
    end
    end
        if cont == size * size then
        bool = true
  end
     
    return bool
  end




function impossibleToSolve(grid, size)
  row = 1
  cont_zeros_col = 0
  cont_ones_col = 0
  cont_zeros_row = 0
  cont_ones_row = 0
  for i = 1, size do
    for j = 1, size do
      
      if cont_ones_col > size/2 or cont_zeros_col > size/2 or cont_zeros_row > size/2 or cont_ones_row > size/2 then
        print("not solvable")
      end
      
     -- print(cont_ones_col,cont_ones_row,cont_zeros_col, cont_zeros_row)
      
      if cont_ones_row == size/2 then
       for n = 1, size do 
        if grid[row][n] == 2 then
          grid[row][n] = 0
         -- print(row, n, grid[row][n])
          insertSolution(solution0Xtab, row, solution0Ytab, n)
        end
      end
    end
    
    if cont_zeros_row == size/2 then
       for n = 1, size do 
        if grid[row][n] == 2 then
          grid[row][n] = 1
          insertSolution(solution1Xtab, row, solution1Ytab, n)
        end
      end
    end
    
    if cont_ones_col == size/2 then
       for n = 1, size do 
        if grid[n][row] == 2 then
          grid[n][row] = 0
          insertSolution(solution0Xtab, n, solution0Ytab, row)
        end
      end
    end
    
    if cont_zeros_col == size/2 then
       for n = 1, size do 
        if grid[n][row] == 2 then
          grid[n][row] = 1
          insertSolution(solution1Xtab, n, solution1Ytab, row)
        end
      end
    end
    
      if grid[j][row] == 0 then
        cont_zeros_col = cont_zeros_col + 1
     end
     
      if grid[j][row] == 1 then 
        cont_ones_col = cont_ones_col + 1
      end
        
      if grid[row][j] == 0 then
        cont_zeros_row = cont_zeros_row + 1 
      end
      if grid[row][j] == 1 then
        cont_ones_row = cont_ones_row + 1
      end
    end
  row = row + 1
  cont_zeros_col = 0
  cont_ones_col = 0
  cont_zeros_row = 0
  cont_ones_row = 0
  end
end
    

function resolve(grid,size) 
  row = 1
  colcont1 = 0
  colcont0 = 0
  rowcont1 = 0
  rowcont0 = 0
  
  for i = 1, size do
    for j = 1, size do
   

   if grid[row][j] == 1 then
      colcont1 = colcont1 + 1
    end
    
    if grid[row][j] == 0 then
      colcont0 = colcont0 + 1
    end
    
    if grid[j][row] == 1 then
      rowcont1 = rowcont1 + 1
    end
    
    if grid[j][row] == 0 then
      rowcont0 = rowcont0 + 1
    end
  
      if grid[row][j] == grid[row][j+1] then
        --  print(row, j, grid[row][j], row, j+1, grid[row][j+1])
          if grid[row][j] == 0 then 
            if grid[row][j-1] == 2 and j+1 <= size and j~=1 then
              grid[row][j-1] = 1
              insertSolution(solution1Xtab, row, solution1Ytab, j-1)
              end
              if grid[row][j+2] == 2 and j+1 < size  then
            grid[row][j+2] = 1
            insertSolution(solution1Xtab, row, solution1Ytab, j+2)
          end
        elseif grid[row][j] == 1 then
            if grid[row][j-1] == 2 and j+1 <= size and j~=1 then
            grid[row][j-1] = 0 
            insertSolution(solution0Xtab,row, solution0Ytab, j-1)
            end
            if grid[row][j+2] == 2 and j+1 < size then
              grid[row][j+2] = 0
              insertSolution(solution0Xtab,row,solution0Ytab, j+2)
            end
            end
          end
          
          if j < size then
          if grid[j][row] == grid[j+1][row] and grid[j][row] ~= 2  then
            if grid[j][row] == 1 then
              if j ~= 1 and grid[j-1][row] == 2 then 
            grid[j-1][row] = 0 
            insertSolution(solution0Xtab, j-1, solution0Ytab, row)
          end
              if j <= size - 2 and grid[j+2][row] == 2 then
                grid[j+2][row] = 0
                insertSolution(solution0Xtab, j+2, solution0Ytab, row)
               -- print("ok")
              end
              
            elseif grid[j][row] == 0 then
              if j ~= 1 and grid[j-1][row] == 2 then 
            grid[j-1][row] = 1 
            insertSolution(solution1Xtab, j-1, solution1Ytab, row)
          end
              if j <= size - 2 and grid[j+2][row] == 2 then
                grid[j+2][row] = 1
                insertSolution(solution1Xtab, j+2, solution1Ytab, row)
            
          end
          end
        end
      end
      
      if j <= size - 2  then
      if grid[row][j] == grid[row][j+2] and grid[row][j] ~= 2 then
        if grid[row][j] == 1 and grid[row][j+1] == 2 then
          grid[row][j+1] = 0 
          insertSolution(solution0Xtab, row, solution0Ytab, j+1)
        end
        if grid[row][j] == 0 and grid[row][j+1] == 2 then
          grid[row][j+1] = 1
          insertSolution(solution1Xtab,row,solution1Ytab, j+1)
          end
      end
      
      if grid[j][row] == grid[j+2][row] and grid[j][row] ~= 2 then
        if grid[j][row] == 1 and grid[j+1][row] == 2 then
          grid[j+1][row] = 0 
          insertSolution(solution0Xtab, j+1, solution0Ytab, row)
        end
        if grid[j][row] == 0 and grid[j+1][row] == 2 then
          grid[j+1][row] = 1 
          insertSolution(solution1Xtab, j+1, solution1Ytab, row) 
        end
        
        end
      
    end
    
     if colcont0 == size/2 then
     for n = 1, size do 
       if grid[row][n] == 2 then
         grid[row][n] = 1
         insertSolution(solution1Xtab, row, solution1Ytab, n)
       end
     end
   end
   
   if colcont1 == size/2 then
     for n = 1, size do 
       if grid[row][n] == 2 then
         grid[row][n] = 0
         insertSolution(solution0Xtab, row, solution0Ytab, n)
       end
     end
   end
   
   if rowcont0 == size/2 then
     for n = 1, size do 
       if grid[n][row] == 2 then
         grid[n][row] = 1
         insertSolution(solution1Xtab, n, solution1Ytab, row)
       end
     end
   end
   
   if rowcont1 == size/2 then
     for n = 1, size do 
       if grid[n][row] == 2 then
         grid[n][row] = 0
         insertSolution(solution0Xtab, n, solution0Ytab, row)
         
       end
     end
     end
end
   row = row + 1
  colcont1 = 0
  colcont0 = 0
  rowcont1 = 0
  rowcont0 = 0
   
end

end


function check(grid, size)
  row = 1
  col = 1
  rowContZeros = 0
  rowContOnes = 0
  colContZeros = 0
  colContOnes = 0
  for i = 1, size do
    for j = 1, size do
      if rowContZeros > 2 or colContZeros > 2 or rowContOnes > 2 or colContOnes > 2 then
        return false
      end
      
      if grid[j][row] == 1 then
        rowContOnes = rowContOnes + 1
      else
        rowContOnes = 0
      end 
      
      if grid[j][row] == 0 then
        rowContZeros = rowContZeros + 1
      else
        rowContZeros = 0
      end
      
      if grid[col][j] == 0 then
        colContZeros = colContZeros + 1
      else
        colContZeros = 0
    end
    
     if grid[col][j] == 1 then 
      colContOnes = colContOnes + 1 
    else 
      colContOnes = 0
    end
    
   
  end
   row = row + 1
   col = col + 1
end
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
    num = 0
  if size == 6 then
    num = 3
  elseif size == 8 then 
    num = 5
  elseif size == 10 then
  num = 7
elseif size == 12 then
  num = 9
  end
  for i = 1, size+num do
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
    num = 0
  if size == 6 then
    num = 3
  elseif size == 8 then 
    num = 4
  elseif size == 10 then
  num = 7
elseif size == 12 then
  num = 9
  end
  
  for i = 1, size+num do
    love.graphics.setColor(1,0,0,1)
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
  if check(griglia, size) == false then
    mode(x, y)
  end

  function love.draw()
    drawTables(x, y)
  end
end

function resetSolution()
                solution0Xtab = {}
                solution0Ytab = {}
                solution1Xtab = {}
                solution1Ytab = {}
              end
              

function printSolution(a,b,var)
 function love.draw()
  drawTables(a,b)
  love.graphics.setColor(0,0,0,1)
  for i = 1, #solution1Xtab do
  love.graphics.print(1, (a*b)*solution1Xtab[i]+143 , (a*b)*solution1Ytab[i]+43)
end
for i = 1, #solution0Xtab do
  love.graphics.print(0, a*b*solution0Xtab[i]+143, a*b*solution0Ytab[i]+43)
end

gen(buttons3,var,150)
end
  end

return griglia 