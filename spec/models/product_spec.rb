require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '売るための商品の情報の保存' do
    context '商品の情報の保存がうまく行く時' do
      it "工程どうりに登録する" do
        expect(@product).to be_valid
      end
    end

    context '商品の情報の保存がうまくいかない時' do
      it "画像がないと保存できない" do
        @product.image = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空の場合は保存できない" do
        @product.name = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it "priceが空の場合は保存できない" do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300円以上でなければ保存できない" do
        @product.price = 200
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが9999999円以下出なければ保存できない" do
        @product.price = 100000000
        @product.valid?
        binding.pry
        expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "priceが半角数字でなければ保存できない" do
        @product.price ="aaaaa"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
      it "detailが空の場合は保存できない" do
        @product.detail = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Detail can't be blank")
      end
      it "categoryのidが0の時は保存できない" do
        @product.category_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 0")
      end
      it "statusのidが0の時は保存できない" do
        @product.status_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Status must be other than 0")
      end
      it "delivery_feeのidが0の時は保存できない" do
        @product.delivery_fee_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery fee must be other than 0")
      end
      it "areaのidが0の時は保存できない" do
        @product.area_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Area must be other than 0")
      end
      it "delivery_dateのidが0の時は保存できない" do
        @product.delivery_date_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery date must be other than 0")
      end
    end
  end
end
