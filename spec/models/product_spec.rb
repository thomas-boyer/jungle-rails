require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @category = Category.new
      @product = Product.new
    end

    it "should save when given the required params" do

      @product.name = "Test product"
      @product.price = 10000
      @product.quantity = 5
      @product.category = @category
      @product.save!

      expect(@product).to be_present

    end

    it "should not save if there is no name present" do
      @product.price = 10000
      @product.quantity = 5
      @product.category = @category
      @product.valid?

      expect(@product.errors[:name]).to include("can't be blank")
    end

    it "should not save if there is no price present" do
      @product.name = "Test"
      @product.quantity = 5
      @product.category = @category
      @product.valid?

      expect(@product.errors[:price]).to include("can't be blank")
    end

    it "should not save if there is no quantity present" do
      @product.name = "Test"
      @product.price = 10000
      @product.category = @category
      @product.valid?

      expect(@product.errors[:quantity]).to include("can't be blank")
    end

    it "should not save if there is no category present" do
      @product.name = "Test"
      @product.price = 10000
      @product.quantity = 5
      @product.valid?

      expect(@product.errors[:category]).to include("can't be blank")
    end
  end
end
