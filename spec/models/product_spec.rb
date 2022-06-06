require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    it "validates product is created with all required information" do
      @category = Category.new(name: "TestCategory")
      @product = Product.new(name: "TestProduct", price: "100", quantity: "10", category: @category)
      @product.save!
      expect(@product.id).to be_present
    end

    it "validates error if product name is not included" do
      @category = Category.new(name: "TestCategory")
      @product = Product.new(price: "100", quantity: "10", category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end


    it "validates error if product price is not included" do
      @category = Category.new(name: "TestCategory")
      @product = Product.new(name: "TestProduct", quantity: "10", category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")

    end

    it "validates error if product quantity is not included " do
      @category = Category.new(name: "TestCategory")
      @product = Product.new(name: "TestProduct", price: "100", category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")

    end

    it "validates error if product category is not included" do
      @category = Category.new(name: "TestCategory")
      @product = Product.new(name: "New Product", price: "100", quantity: "10")
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
 

  end
end
