function love.load()
  target = {}
  target.x = 300
  target.y = 300
  target.r = 50 -- radius
  target.screenMargin = 50

  score = 0
  timer = 0

  gameFont = love.graphics.newFont(40) -- fontsize
end

function love.update(dt)
  
end

function love.draw()
  love.graphics.setColor(1,.35,.35) -- nice red toned down hmm yes 
  love.graphics.circle('fill', target.x, target.y, target.r)

  -- love.graphics.setColor(1,1,1) -- comment cuz red font nice
  love.graphics.setFont(gameFont)
  love.graphics.print(score, 5, 0)
end

function love.mousepressed(x, y, button, istouch, presses) -- thats a lot of variables dang
  if button == 1 then -- if left mouse button
     --[[local mTarDist = getDist(x, y, target.x, target.y)
     if mTarDist < target.r then
      score = score + 1
     end]]
     -- why not just compile this to one if statement
     -- idk about performance but i can still understand that ??
     if getDist(x, y, target.x, target.y) < target.r then
      score = score + 1
      target.x = math.random(target.r + target.screenMargin, love.graphics.getWidth() - (target.r + target.screenMargin)) -- all over screen but give 100px margin so circle not cut off
      target.y = math.random(target.r + target.screenMargin, love.graphics.getHeight() - (target.r + target.screenMargin)) -- ^^
     end
  end 
end

function getDist(xa,ya,xb,yb)
  return math.sqrt((xb - xa)^2 + (yb - ya)^2) -- is this how u do functions in lua lmao this sucks
end