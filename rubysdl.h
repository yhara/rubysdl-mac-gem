/*
  Ruby/SDL   Ruby extension library for SDL

  Copyright (C) 2001-2004 Ohbayashi Ippei
  
  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  */

#include <SDL.h>
#include <ruby.h>
#include <stdio.h>

/* Macros */
#define GLOBAL_DEFINE_GET_STRUCT(struct_name, fun, klass, klassstr) \
struct_name* fun(VALUE obj) \
{ \
  struct_name* st; \
  \
  if(!rb_obj_is_kind_of(obj, klass)){ \
    rb_raise(rb_eTypeError, "wrong argument type %s (expected " klassstr ")", \
             rb_obj_classname(obj)); \
  } \
  Data_Get_Struct(obj, struct_name, st); \
  return st; \
} 

#define DEFINE_GET_STRUCT(struct_name, fun, klass, klassstr) \
static GLOBAL_DEFINE_GET_STRUCT(struct_name, fun, klass, klassstr)

#define SetRect(Rect,X,Y,W,H) \
do{ \
  Rect.x=NUM2INT(X); \
  Rect.y=NUM2INT(Y); \
  Rect.w=NUM2INT(W); \
  Rect.h=NUM2INT(H); \
}while(0) \

#define INT2BOOL(x) ((x)?Qtrue:Qfalse)

/* Global variables */
#define eSDLError rubysdl_eSDLError
#ifdef DEF_GLOBAL
VALUE eSDLError;
#else
extern VALUE eSDLError;
#endif

/* Global functions */
#define VALUE2COLOR rubysdl_VALUE2COLOR
Uint32 VALUE2COLOR(VALUE color,SDL_PixelFormat *format);

void rubysdl_putPixel(SDL_Surface *surface, Sint16 x, Sint16 y, Uint32 color);
Uint32 rubysdl_getPixel(SDL_Surface *surface, Sint16 x, Sint16 y);
int rubysdl_is_quit(void);

#define Surface_create rubysdl_Surface_create
VALUE Surface_create(SDL_Surface* surface);

#define Get_SDL_Surface rubysdl_Get_SDL_Surface
SDL_Surface* Get_SDL_Surface(VALUE obj);

#ifdef HAVE_SDLSKK
#include <SDL_ttf.h>
#define Get_TTF_Font rubysdl_Get_TTF_Font
TTF_Font* Get_TTF_Font(VALUE obj);
#endif

/* declaration of initialize functions */
VALUE rubysdl_init_video(VALUE mSDL);
void rubysdl_init_sge(VALUE mSDL, VALUE cSurface);
void rubysdl_init_GL(VALUE mSDL);
void rubysdl_init_image(VALUE mSDL, VALUE cSurface);
void rubysdl_init_Event(VALUE mSDL);
void rubysdl_init_Key(VALUE mSDL);
void rubysdl_init_Mouse(VALUE mSDL);
void rubysdl_init_Joystick(VALUE mSDL);
void rubysdl_init_CD(VALUE mSDL);
void rubysdl_init_time(VALUE mSDL);
void rubysdl_init_WM(VALUE mSDL);
void rubysdl_init_Kanji(VALUE mSDL);
void rubysdl_init_TTF(VALUE mSDL);
void rubysdl_quit_TTF(void);
void rubysdl_init_Mixer(VALUE mSDL);
void rubysdl_quit_Mixer(void);
void rubysdl_init_MPEG(VALUE mSDL);
void rubysdl_init_SKK(VALUE mSDL);

