require 'sdl'

SDL.init( SDL::INIT_VIDEO )
screen = SDL::Screen.open(640,480,16,SDL::SWSURFACE)

image = SDL::Surface.loadBMP("icon.bmp")
image.setColorKey( SDL::SRCCOLORKEY , image[0,0])
image = image.displayFormat

aimage = SDL::Surface.loadBMP("icon.bmp")
aimage.setColorKey( SDL::SRCCOLORKEY, aimage[0,0] )
aimage.setAlpha(SDL::SRCALPHA, 128 )
aimage = aimage.displayFormat

angle = 0

while true

  while event = SDL::Event.poll
    case event
    when SDL::Event::Quit
      exit
    when SDL::Event::KeyDown
      exit if event.sym == SDL::Key::ESCAPE
    end
  end
  
  angle += 2
  
  screen.fillRect(0,0,640,480,[100,100,100])

  SDL::Surface.transformDraw(image,screen,angle,1,1,image.w/2,image.h/2,100,100,0 )
  SDL::Surface.transformBlit(image,screen,angle,1,1,image.w/2,image.h/2,200,200,0 )

  SDL::Surface.transformDraw(image,screen,angle,1,1,0,0,300,300,0 )
  SDL::Surface.transformBlit(image,screen,angle,1,1,0,0,400,200,0 )

  SDL::Surface.transformBlit(aimage,screen,angle,1,1,0,0,100,400,0 )
  
  screen.updateRect(0,0,0,0)

end
