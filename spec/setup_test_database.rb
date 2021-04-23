require 'pg'

def setup_test_database
  p "Setting up test database..."

  connection = PG.connect(dbname: 'bookmark_manager_test')

  connection.exec("DROP TABLE bookmarks;")
  connection.exec("CREATE TABLE bookmarks (id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60));")
end
