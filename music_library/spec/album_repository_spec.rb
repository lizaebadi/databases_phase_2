require 'album_repository'


RSpec.describe AlbumRepository do 
  
  def reset_albums_table 
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end
  
  before(:each) do 
    reset_albums_table
  end

  it 'returns all albums' do 
    repo = AlbumRepository.new
    albums = repo.all

    expect(albums.length).to eq(2)

    expect(albums[0].id).to eq('1') 
    expect(albums[0].title).to eq('Doolittle')
    expect(albums[0].release_year).to eq('1989')
    expect(albums[0].artist_id).to eq('1')

    expect(albums[1].id).to eq('2')
    expect(albums[1].title).to eq('Surfer Rosa')
    expect(albums[1].release_year).to eq('1988')
    expect(albums[1].artist_id).to eq('1')
  end

  it 'returns a single album given its ID' do 
    repo = AlbumRepository.new 

    album = repo.find(1) 

    expect(album.id).to eq (1)
    expect(album.title).to eq 'Doolittle'
    expect(album.release_year).to eq '1989'
    expect(album.artist_id).to eq 1
  end

  it 'creates an album' do 
    repo = AlbumRepository.new

    album = Album.new
    album.title = 'Trompe le Monde'
    album.release_year = 1991
    album.artist_id = 1

    repo.create(album)

    all_albums = repo.all

    last_album = all_albums.last
    
    expect(last_album.title).to eq 'Trompe le Monde'
    expect(last_album.release_year).to eq '1991'
    expect(last_album.artist_id).to eq '1'
  end
end 