class Song
    attr_reader :title, :artist, :genre
    def initialize(input_title, input_artist, input_genre)
      @title = input_title
      @artist = input_artist
      @genre = input_genre
    end
end