require_relative("./guests")
require_relative("./rooms")
require_relative("./songs")
require_relative("./guests")

class Run

  def intitialize
    @room_select = room_select
  end

  def intro_screen
    puts "Welcome to D's Karaoke Studio!"
    puts "Please select which room you'd like to book:"
    puts "Press 1 for Jay's 80s Electropop Room"
    puts "Press 2 for Zsolt's Barry Mannilo Tribute Room"
    puts "Press 3 for Tony's Smooth Sole Lover Room"

    room_select = gets
  end
  
  def time_slot_selection
    puts "Please select the time_slot you want to book in   #{room_select.selec}"
    time_slot=gets.chomp
  end

  def guest_details
    get_guest_details()
  end

  def song_select
    puts "Please choose your tracks:"

    tracks = gets
  end

  def display_all
    puts "Thanks #{} youve booked #{} for #{}"
    puts "Your selected tracks are: #{}"
  end
end

