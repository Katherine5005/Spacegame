__lua__
// the inital speed of the ship.
spd = 2

--------*

// is called when the "run"
// command is entered.
function _init()
  cls()
  // the initial center point.
  c   = {x=64,
         y=64}
  // player starting point.
  p1  = {x=c.x,
         y=c.y,
         point=3}
  // used to calculate camera
  // position.
  cam = {x=p1.x,
         y=p1.y}
end

// is called when the buttons
// are pressed.
function _update()
		key_left  = 0
		key_right = 1
		key_down  = 2
		key_up    = 3
		
		// a boundary, of sorts.
		if (p1.x < 0)
		then p1.x += spd end
  if (p1.x > map_celw*8-8)
  then p1.x -= spd end
  if (p1.y < 0) 
  then p1.y += spd end
  if (p1.y > map_celh*8-8) 
  then p1.y -= spd	end

  // directional navigation.
  if (btn(key_left)) then
     p1.x += -spd
     point = 0 --end  
  elseif (btn(key_right)) then 
     p1.x += spd
     point = 1 --end  
  elseif (btn(key_down)) then 
     p1.y += -spd
     point = 3 --end  
  elseif (btn(key_up)) then 
     p1.y += spd
     point = 2
  end
  
  // updates the camera pos
  // when the player moves.
  cam.x = p1.x - c.x
  cam.y = p1.y - c.y
end

// the real (x,y) size of the
// map is the following,
// multiplied by 8.
map_celw = 128
map_celh = map_celw/2

// called every... "tick"?
// used to draw the screen.
function _draw()
  // clears the screen, to 
  // prevent artifacts.
  cls()
  // moves the camera along
  // with the player's position.
  camera(cam.x, cam.y)
  // drawing the map.
  map(0,0,0,0,map_celw,map_celh)
  --drawlevel(level_mercury)
  // drawing the p1 ship.
  spr(point,p1.x,p1.y)
end

-->8
function drawlevel(level)
  for x=1, #level do
    for y=1, #level do
      spr(level[x][y],
         (x-1)*8,
         (y-1)*8)
    end
  end
end

function loadlevel(level)
end

level_mercury = {
 {48,48,48,48,48,48,48,48},
 {48,48,48,48,48,48,48,48},
 {48,48,48,48,48,48,48,48},
 {48,48,48,48,48,48,48,49},
 {48,48,48,48,48,48,49,48},
 {48,48,48,48,48,48,49,48},
 {48,48,48,48,49,49,48,48},
 {48,48,48,48,49,48,49,48},
}

--function 
--level_mars = mset(20, 20, 33)
--end
