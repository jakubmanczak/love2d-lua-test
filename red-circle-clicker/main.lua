function love.load()
  init()
end

function init()
  target = {}
  target.x = (love.graphics.getWidth()) / 2 
  target.y = (love.graphics.getHeight()) / 2
  target.r = 100 -- radius
  target.screenMargin = 50

  score = 0
  timer = 1*60

  gameStarted = false
  gameFont = love.graphics.newFont(40) -- fontsize
  love.window.setTitle('RED-CIRCLE-CLICKER')
end

function love.update(dt)
  if timer > 0 and gameStarted then
    timer = timer - 1
  end
end

function love.draw()
  -- draw target
  setColorA()
  love.graphics.circle('fill', target.x, target.y, target.r)

  -- FINDING A WAY TO GET TEXT'S WIDTH WOULD BE HANDY ;) WINK WINK
  if(gameStarted == false) then
    love.graphics.setColor(0,0,0)
    love.graphics.print('START', (love.graphics.getWidth() / 2) - 60, (love.graphics.getHeight() /2) - 20)
  end
  if(timer == 0) then
    love.graphics.setColor(1,.35,.35)
    love.graphics.print('GAME OVER', (love.graphics.getWidth() / 2) - 125, (love.graphics.getHeight() / 2) - 20)
    love.graphics.print('click anywhere to reset game! ;)', (love.graphics.getWidth() /2) - 320, (love.graphics.getHeight() /2) + 20)
  end

  -- printing UI or w/e idk idc
  -- love.graphics.setColor(1,1,1) -- comment cuz red font nice
  setColorA()
  love.graphics.setFont(gameFont)
  love.graphics.print('score: ', 10, 0)
  love.graphics.setColor(1,.35,.35) -- nice red toned down hmm yes 
  love.graphics.print(score, 135, 0)
  setColorA()
  love.graphics.print('timer: ', 10, 40)
  love.graphics.print(timer/60, 135, 40)

  -- rect to cover up ugly excess decimals from timer
  love.graphics.setColor(0,0,0)
  love.graphics.rectangle('fill', 225, 40, 350, 40 )
end

function love.mousepressed(x, y, button, istouch, presses) -- thats a lot of variables dang
  if button == 1 then -- if left mouse button
     --[[local mTarDist = getDist(x, y, target.x, target.y)
     if mTarDist < target.r then
      score = score + 1
     end]]
     -- why not just group this to one if statement
     -- idk about performance idc really but i can still understand it
     -- its not that complicated lmao
    if timer > 0 then
      if getDist(x, y, target.x, target.y) < target.r then
        gameStarted = true
        score = score + 1
        -- spawn the target all over screen but give a margin so circle is not cut off
        target.x = math.random(target.r + target.screenMargin, love.graphics.getWidth() - (target.r + target.screenMargin))
        target.y = math.random(100 + target.r + target.screenMargin, love.graphics.getHeight() - (target.r + target.screenMargin))
        target.r = math.random(25, 75) -- alter target size for fun
      end
    end
    if timer == 0 then
      init()
    end
  end 
end

function getDist(xa,ya,xb,yb)
  return math.sqrt((xb - xa)^2 + (yb - ya)^2) -- is this how u do functions in lua lmao this sucks
end

function setColorA()
  if timer > 0 then
    love.graphics.setColor(1,.35,.35) -- nice red toned down hmm yes 
  end
  if timer == 0 then
    love.graphics.setColor(.35,.35,.35)
  end
end

-- whats up? ^^