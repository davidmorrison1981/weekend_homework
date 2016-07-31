require("minitest/autorun")
require("minitest/rg")
require_relative("rooms.rb")

class TestRooms < MiniTest::Test
  
  def setup
    jays_room = Room.new("Jay's 80s Electropop Room")
    zsolts_room = Room.new("Zsolt's Barry Mannilo Tribute Room")
    tonys_room = Room.new("Tony's Smooth Sole Lover Room")
    

    rooms = [jays_room, zsolts_room, tonys_room]
    
    @room = Room.new(rooms)
      
  end
   

  # def test_room_has_time_slots
  #   assert_equal(12, roomtimes())

  # end


end