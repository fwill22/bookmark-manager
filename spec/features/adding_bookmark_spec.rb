feature 'submitting a new bookmark' do
  scenario 'add a bookmark' do
    visit ('/bookmarks/new')
    fill_in('title', with: 'Google')
    fill_in('url', with: 'http://www.google.co.uk')
    click_button('add bookmark')
    expect(page).to have_link('Google', href: 'http://www.google.co.uk')
  end
end