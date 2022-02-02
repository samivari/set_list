require 'rails_helper'

RSpec.describe 'the songs show page' do
  it 'displays the song title' do
    artist = Artist.create(name: 'JO MOTHER')
    song = artist.songs.create!(title: 'I like yo feet', length: 252, play_count: 80_085)
    song2 = artist.songs.create!(title: 'I eat bread', length: 444, play_count: 90_009)
    visit "/songs/#{song.id}"
    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song2.title)
  end

  it 'displays the artist for the song' do
    artist = Artist.create(name: 'JO MOTHER')
    song = artist.songs.create!(title: 'I like yo feet', length: 252, play_count: 80_085)
    song2 = artist.songs.create!(title: 'I eat bread', length: 444, play_count: 90_009)
    visit "/songs/#{song.id}"
    save_and_open_page
    expect(page).to have_content(artist.name)
  end
end
