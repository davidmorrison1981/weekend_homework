require_relative("./guests")
require_relative("./rooms")
require_relative("./songs")
require_relative("./guests")

class RunCaraoke
  
  def intitialize
    @room_select = room_select
  end

  def intro_screen
    puts "Welcome to D's Karaoke Studio!"
    puts "Please select which room you'd like to book:"
    puts "Press 1 for Jay's 80s Electropop Room"
    puts "Press 2 for Zolts Madonno Tribute Room"
    puts "Press 3 for Tony's Smooth Sole Lover Room"

    room_select = gets
  end
  




end