class <<SDL  
  alias was_init wasInit
end

# rubysdl_video.c
module SDL
  class Screen
    alias update_rect updateRect
    alias flip flip
    alias toggle_fullscreen toggleFullScreen
  end
  class << Screen
    alias check_mode checkMode
    alias list_modes listModes
    alias set_gamma setGamma
    alias get_gamma_ramp getGammaRamp
    alias set_gamma_ramp setGammaRamp
  end
end

module SDL
  class << Surface
    alias load_bmp loadBMP
  end

  class Surface
    alias get_pixel getPixel
    alias put_pixel putPixel
    alias display_format displayFormat
    alias display_format_alpha displayFormatAlpha
    alias set_color_key setColorKey
    alias fill_rect fillRect
    alias set_clip_rect setClipRect
    alias get_clip_rect getClipRect
    alias set_alpha setAlpha
    alias save_bmp saveBMP
    alias set_palette setPalette
    alias set_colors setColors
    alias must_lock? mustLock?
    alias copy_rect copyRect
  end

  class PixelFormat
    alias map_rgb mapRGB
    alias map_rgba mapRGBA
    alias get_rgb getRGB
    alias get_rgba getRGBA
  end
end


# rubysdl_event.c
module SDL
  class << Event
    alias app_state appState
    alias enable_unicode enableUNICODE
    alias disable_unicode disableUNICODE
    alias enable_unicode? enableUNICODE?
  end
end

# rubysdl_sge_video.c
module SDL
  if defined?(CollisionMap) then
    class << Surface
      alias auto_lock? autoLock?
      alias auto_lock_on autoLockON 
      alias auto_lock_off autoLockOFF
      alias transform_draw transformDraw
    end
  
    class Surface
      alias draw_line drawLine
      alias draw_rect drawRect
      alias draw_circle drawCircle
      alias draw_ellipse drawEllipse
    end
    
    class CollisionMap
      alias collision_check collisionCheck
      alias bounding_box_check boundingBoxCheck
    end

    class << CollisionMap
      alias bounding_box_check boundingBoxCheck
    end
    
    class BMFont
      alias set_color setColor
    end
  end

  # rubysdl_kanji.c
  if defined?(Kanji) then
    module Kanji
      class Font
        alias set_coding_system setCodingSystem
        alias put_tate putTate
      end
    end
  end
end


# rubysdl_time.c
class << SDL
  alias get_ticks getTicks
end

# rubysdl_cdrom.c
module SDL
  class << CD
    alias num_drive numDrive
    alias index_name indexName
  end

  class CD
    alias play_tracks playTracks
    alias num_tracks numTracks
    alias current_track currentTrack
    alias current_frame currentFrame
    alias track_type trackType
    alias track_length trackLength
  end
end

# rubysdl_joystick.c
module SDL
  class << Joystick
    alias index_name indexName
    alias update_all updateAll
  end

  class Joystick
    alias num_axes numAxes
    alias num_balls numBalls
    alias num_hats numHats
    alias num_buttons numButtons
  end
end

# rubysdl_event_key.c
module SDL
  class << Key
    alias mod_state modState
    alias enable_key_repeat enableKeyRepeat
    alias disable_key_repeat disableKeyRepeat
    alias get_key_name getKeyName
  end
end

# rubysdl_wm.c
class << SDL::WM
  alias set_caption setCaption
  alias grab_input grabInput
end

# rubysdl_mixer.c
module SDL
  if defined?(Mixer) then
    class << Mixer
      alias play_channel playChannel
      alias set_volume setVolume
      alias allocate_channels allocateChannels
      alias play_music playMusic
      alias fade_in_music fadeInMusic
      alias set_volume_music setVolumeMusic
      alias halt_music haltMusic
      alias fade_out_music fadeOutMusic
      alias pause_music pauseMusic
      alias resume_music resumeMusic
      alias rewind_music rewindMusic
      alias pause_music? pauseMusic?
      alias play_music? playMusic?
    end

    module Mixer
      class Wave
	alias set_volume setVolume
      end
    end
  end
end

# rubysdl_ttf.c
module SDL
  if defined?(TT) then
    module TT
      class Font
        alias text_size textSize
        alias fixed_width? fixedWidth?
        alias family_name familyName
        alias style_name styleName
        alias line_skip lineSkip
        alias draw_solid_utf8 drawSolidUTF8
        alias draw_blended_utf8 drawBlendedUTF8
        alias draw_shaded_utf8 drawShadedUTF8
        alias render_solid_utf8 renderSolidUTF8
        alias render_blended_utf8 renderBlendedUTF8
        alias render_shaded_utf8 renderShadedUTF8
      end
    end
  end
end

# rubysdl_smpeg.c
module SDL
  if defined?(MPEG) then
    class MPEG
#     alias load load
#     alias new new
#     alias info info
      alias enable_audio enableAudio
      alias enable_video enableVideo
#     alias status status
      alias set_volume setVolume
      alias set_display setDisplay
      alias set_loop setLoop
      alias scale_xy scaleXY
#     alias scale scale
#     alias move move
      alias set_display_region setDisplayRegion
#     alias play play
#     alias pause pause
#     alias stop stop
#     alias rewind rewind
#     alias seek seek
#     alias skip skip
      alias render_frame renderFrame
      alias set_filter setFilter
    end
  end
end

# rubysdl_opengl.c
module SDL
  if defined?(GL)
    class << GL
      alias set_attr setAttr
      alias get_attr getAttr
      alias swap_buffers swapBuffers
    end
  end
end


class << SDL
  if method_defined?(:transform) then
    alias transform_blit transformBlit
  end

  alias blit_surface2 blitSurface2
end
