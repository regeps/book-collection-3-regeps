require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "POST /books" do
    
    # 6) Fails to create a book without an author
    it "fails to create a book without an author" do
      post books_path, params: {
        book: {
          title: "Some Title",
          author: "",
          price: 9.99,
          published_date: "2025-01-28"
        }
      }
      expect(response.body).to include("Author can&#39;t be blank")
    end

    # 7) Fails to create a book without a price
    it "fails to create a book without a price" do
      post books_path, params: {
        book: {
          title: "Some Title",
          author: "Alice",
          price: nil,
          published_date: "2025-01-28"
        }
      }
      expect(response.body).to include("Price can&#39;t be blank")
    end

    # 8) Fails to create a book without a published_date
    it "fails to create a book without a published_date" do
      post books_path, params: {
        book: {
          title: "Some Title",
          author: "Alice",
          price: 9.99,
          published_date: ""
        }
      }
      expect(response.body).to include("Published date can&#39;t be blank")
    end
  end
end
