require_relative 'book'
require_relative 'database_connection'

class BookRepository

  # Selecting all records
  # No arguments
  def all
    arr_books = []
    # Executes the SQL query:
    sql = 'SELECT id, title, author_name FROM books;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record| 
      books = Book.new

      books.id = record['id']
      books.title = record['title']
      books.author_name = record['author_name']
      
      arr_books << books
    end
    return arr_books
    # Returns an array of Book objects.
  end
end