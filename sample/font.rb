# This sample needs a true type font file `sample.ttf'.
require 'sdl'

SDL.init( SDL::INIT_VIDEO )

screen = SDL::Screen.open(640,480,16,SDL::SWSURFACE)
SDL::WM::setCaption($0,$0)

SDL::TT.init

font = SDL::TT::Font.open('sample.ttf',24)
font.style = SDL::TT::STYLE_NORMAL

font.drawSolidUTF8(screen,'test SDL_ttf',300,150,255,255,255)

screen.flip

while true
  while event = SDL::Event.poll
    case event
    when SDL::Event::KeyDown, SDL::Event::Quit
      exit
    end
  end

  sleep 0.1
end
