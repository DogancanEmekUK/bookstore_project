require 'book_repository'

RSpec.describe BookRepository do

    def reset_books_table
        seed_sql = File.read('spec/seeds.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'bookstore' })
        connection.exec(seed_sql)
    end

    before(:each) do
        reset_books_table
    end

    it "returns all the books on the database" do
        repo = BookRepository.new
        books = repo.all
        expect(books).to eq ["1 - Harry Potter - J.K. Rowling", "2 - Nineteen Eighty-Four - George Orwell", "3 - Mrs Dalloway - Virginia Woolf", "4 - Emma - Jane Austen", "5 - Dracula - Bram Stoker", "6 - The Age of Innocence - Edith Wharton"]
    end

end