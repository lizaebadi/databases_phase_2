require_relative 'lib/database_connection'
require_relative 'lib/album_repository'

DatabaseConnection.connect('music_library')

# result = DatabaseConnection.exec_params('SELECT * FROM albums;', [])

#result.each do |record|
#  p record
#end

album_repository = AlbumRepository.new

album_repository.all.each do |record|
  p record
end 

