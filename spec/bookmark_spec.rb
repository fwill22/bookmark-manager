require 'bookmark'
require 'database_helpers'

describe Bookmark do
  
  describe ".all" do
    it "can show a list of bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.create(title: "Google", url: "http://www.google.co.uk")
      Bookmark.create(title: "Twitter", url: "http://www.twitter.com")
      Bookmark.create(title: "Makers Academy", url: "http://www.makers.tech")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq "Google"
      expect(bookmarks.first.url).to eq "http://www.google.co.uk"
    end
  end

  describe ".create" do
    it "creates a new bookmark" do
      bookmark = Bookmark.create(title: "Google", url: "http://www.google.co.uk")
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq "Google"
      expect(bookmark.url).to eq "http://www.google.co.uk"
    end
  end

  describe '.delete' do 
    it 'deletes the selected bookmark' do
      bookmark = Bookmark.create(title: "Google", url: "http://www.google.co.uk")

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end

end
