#!/usr/local/bin/ruby -Ke
#
# This sample needs following two bdf files
#   8x16.bdf     : alphabets
#   jiskan16.bdf : chinese characters and kana
# 
require 'sdl'

SDL.init( SDL::INIT_VIDEO )
screen = SDL::Screen.open(640,480,16,SDL::SWSURFACE)
SDL::WM::setCaption($0, $0)

font = SDL::Kanji::Font.open("8x16.bdf",16)
font.add("jiskan16.bdf")
font.setCodingSystem(SDL::Kanji::EUC)

y = 0
x = 0

while true
  while event = SDL::Event.poll
    case event
    when SDL::Event::KeyDown, SDL::Event::Quit
      exit
    end
  end
  screen.fillRect(0,0,640,480,0)

  y = (y + 1) % 480
  x = (x + 1) % 640
  
  font.put(screen,"SDL Kanji�Υƥ�����",40,y,128,128,0)
  font.putTate(screen,"�Ľ񤭤�Ǥ��ޤ���",x,60,128,128,0)
               
  screen.updateRect(0,0,0,0)
  sleep 0.005
end
