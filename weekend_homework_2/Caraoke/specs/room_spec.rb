require("minitest/autorun")
require("minitest/rg")
require_relative("rooms.rb")

class TestRooms < MiniTest::Test
  
  def test_room_has_time_slots
    assert_equal(12, roomtimes())

end


end