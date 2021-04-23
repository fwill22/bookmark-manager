feature 'Deleting bookmarks' do
  scenario 'A user can delete a bookmark' do
    Bookmark.create(title: 'Google', url: 'http://www.google.co.uk')
    Bookmark.create(title: 'Twitter', url: 'http://www.twitter.com')
    visit('/bookmarks')
    expect(page).to have_link('Google', href: 'http://www.google.co.uk')
    expect(page).to have_link('Twitter', href: 'http://www.twitter.com')

    first('.bookmark').click_button('Delete')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Google', href: 'http://www.google.co.uk')
    expect(page).to have_link('Twitter', href: 'http://www.twitter.com')
  end
end
