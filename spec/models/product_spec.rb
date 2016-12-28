require 'rails_helper'

describe Product do
  before do
    @product = Product.create!(name: "Onnit Hemp Force Active")
    @user = User.create!(email: "test@mail.de", password: "testpassword")
    @product.comments.create!(rating: 1, user: @user, body: "Awful product")
    @product.comments.create!(rating: 3, user: @user, body: "Mediocre product")
    @product.comments.create!(rating: 5, user: @user, body: "Great product")
  end

  it "returns the average rating of all comments" do
  	expect(@product.average_rating).to eq 3
  end

  it "is not valid" do
    expect(Product.new(description: "Nice shake")).not_to be_valid
  end


end