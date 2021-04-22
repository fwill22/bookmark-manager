require 'pg'

feature 'testing root route, Bookmark Manager view' do
  scenario 'it prints title' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end

feature 'Viewing bookmarks' do
    scenario 'shows a list of bookmarks' do
    Bookmark.create(title: "Makers Academy", url:'http://www.makers.tech')
    Bookmark.create(title: "Youtube", url: 'http://www.youtube.com')
    Bookmark.create(title: "Twitter", url: 'http://www.twitter.com')

    visit('/bookmarks')

    expect(page).to have_link('Makers Academy', href: 'http://www.makers.tech')
    expect(page).to have_link('Youtube', href: 'http://www.youtube.com')
    expect(page).to have_link('Twitter', href: 'http://www.twitter.com')
  end
end
