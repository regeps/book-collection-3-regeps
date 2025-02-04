require 'rails_helper'

RSpec.describe Book, type: :model do
  # 1) Book is valid with all required fields
  it "is valid with all required fields" do
    book = Book.new(
      title: "Some Title",
      author: "Alice",
      price: 9.99,
      published_date: Date.today
    )
    expect(book).to be_valid
  end

  # 2) Book is invalid without a title
  it "is invalid without a title" do
    book = Book.new(
      title: nil,
      author: "Alice",
      price: 9.99,
      published_date: Date.today
    )
    expect(book).not_to be_valid
  end

  # 3) Book is invalid without an author
  it "is invalid without an author" do
    book = Book.new(
      title: "Test Book",
      author: nil,
      price: 10.99,
      published_date: Date.today
    )
    expect(book).not_to be_valid
  end

  # 4) Book is invalid without a price
  it "is invalid without a price" do
    book = Book.new(
      title: "Test Book",
      author: "Jane Doe",
      price: nil,
      published_date: Date.today
    )
    expect(book).not_to be_valid
  end

  # 5) Book is invalid without a published_date
  it "is invalid without a published_date" do
    book = Book.new(
      title: "Test Book",
      author: "Jane Doe",
      price: 10.99,
      published_date: nil
    )
    expect(book).not_to be_valid
  end
end
