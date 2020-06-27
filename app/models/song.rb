class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end

  def notes_content=(contents)
    contents.each do |content|
      if !content.empty?
        note = Note.create(content: content)
        self.notes << note
      end
    end
  end

  def notes_content 
    self.notes.collect { |note| note.content }
  end
end
