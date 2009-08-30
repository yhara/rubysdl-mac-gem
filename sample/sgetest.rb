require 'sdl'

SDL.init( SDL::INIT_VIDEO )
screen = SDL::Screen.open(640,480,16,SDL::SWSURFACE)
SDL::WM::setCaption $0, $0

# draw red pixel at (200,200)
screen[200,200] = screen.format.mapRGB(255,0,0)
# draw green pixel at (260,200)
screen[260,200] = screen.format.mapRGB(0,255,0)
# draw blue pixel at (320,200)
screen[320,200] = screen.format.mapRGB(0,0,255)

Red=screen.format.mapRGB(255,0,0)
screen.drawLine(20,20,300,200,Red)
screen.drawRect(49,59,80,80,Red)
screen.drawCircle(100,100,50,[87,87,87])
screen.drawCircle(300,300,30,Red,true)

screen.flip

while true
  while event = SDL::Event.poll
    case event
    when SDL::Event::KeyDown, SDL::Event::Quit
      exit
    end
  end

  sleep 0.2
end
