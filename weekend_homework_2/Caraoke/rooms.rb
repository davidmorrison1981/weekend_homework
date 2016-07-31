require_relative("./room_runner")

class Rooms

  def room_genre(room_select)
    if @room_select == 1
      room_genre = @room.rooms[:jays_room]
    elsif room_select == 2
      room_genre = @room.rooms[:zsolts_room]
    elsif @room_select == 3
      room_genre = @room.rooms[:tonys_room]
    else
      puts "Sorry that selection isn't available, please try again"
      intro_screen()
    end
  end




end
