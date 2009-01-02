class Setup
  def initialize
    @screen = Screen.new [800,600], 0, [Rubygame::HWSURFACE,Rubygame::DOUBLEBUF]
    @queue = Rubygame::EventQueue.new
    @control = Controller.new(@screen)
  end

  def run
    @control.run
#     puts "Beginning setup run event"
#     loop do
#       @queue.each do |ev|
#         case ev
#         when Rubygame::QuitEvent
#           Rubygame.quit
#           exit
#         when Rubygame::KeyDownEvent
#           case ev.key
#           when Rubygame::K_ESCAPE
#             Rubygame.quit
#             exit
#           when Rubygame::K_RETURN
#             @control.run
#           end
#         end
#       end
#     end
#     puts "Finished setup run event"
  end
end

