require 'ostruct'

class Controller
  include Rubygame
  
  def initialize(screen)
    @screen = screen
    @queue = Rubygame::EventQueue.new
    @clock = Rubygame::Clock.new
    @clock.target_framerate = 30
    @points = []

    @angle = 0
    @angle_vel = 0.5 # radians / sec
    @targets = []
    @cx, @cy = @screen.width/2, @screen.height/2
    @center = @cx, @cy
    @hotline = 0
    @hotline_decay = 250 # color / sec
    @last_frame_time = nil
    @this_frame_time = nil
    @frame_time = 0
  end
  
  def run
    puts "Beginning controller run event"
    @last_frame_time ||= Time.now
    loop do
      @this_frame_time = Time.now
      @frame_time = @this_frame_time - @last_frame_time
      @queue.each do |ev|
        case ev
        when QuitEvent
          quit
          exit
        when MouseDownEvent
#          puts "Mouse Down Event: #{ev.inspect}"
          @targets << OpenStruct.new(:angle => Math.atan2((ev.pos[1]-@cy), (ev.pos[0]-@cx)) - @angle, :dist => Math.sqrt((@cx-ev.pos[0])**2 + (@cy-ev.pos[1])**2))
          @hotline = 255
        when KeyDownEvent
          case ev.key
          when K_ESCAPE
            quit
            exit
          end
        end
      end
      fps_update
      move_targets
      draw_scene
      @clock.tick
      @last_frame_time = @this_frame_time
    end
    puts "Finished controller run event"
  end
  
  def move_targets
    @angle += @frame_time * @angle_vel
    @points = @targets.map {|t| [@cx + t.dist * Math.cos(@angle + t.angle), @cy + t.dist * Math.sin(@angle + t.angle)]}
  end
  
  def draw_scene
    @screen.fill [0,32,0]
    @points.each do |a|
      @points.each do |b|
        @screen.draw_line_a a, b, [255,0,255, 2] unless a==b
      end
    end
    # highlight last point
    @hotline = [@hotline-@frame_time * @hotline_decay,0].max
    @points.each do |pt|
      @screen.draw_line_a pt, @points[-1], [255,@hotline,255, 2] unless pt==@points[-1]
    end
    @points.each do |pt|
      @screen.draw_circle pt, 10, [0,255,255]
    end
    @screen.flip
  end
  
  def fps_update
    @screen.title = "FPS: #{'%2.3f' % @clock.framerate}"
  end
end


