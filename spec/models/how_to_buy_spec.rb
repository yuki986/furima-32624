require 'rails_helper'

RSpec.describe HowToBuy, type: :model do
  before do
    @how_to_buy = FactoryBot.build(:how_to_buy)
  end

  describe '購入者の情報の保存' do
    context '購入者の情報の保存がうまく行く時' do
      it "工程どうりに登録する" do
        expect(@how_to_buy).to be_valid
      end
    end
    context '購入者の情報の保存が失敗する時' do
      it "postal_codeが空の時" do
        @how_to_buy.postal_code = ""
        @how_to_buy.valid?
        expect(@how_to_buy.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeがハイフンなしの時" do
        @how_to_buy.postal_code = 1234567
        @how_to_buy.valid?
        expect(@how_to_buy.errors.full_messages).to include('Postal code ハイフンありの7桁の郵便番号を入力してください')
      end
      it 'cityが空の時' do
        @how_to_buy.city = ""
        @how_to_buy.valid?
        expect(@how_to_buy.errors.full_messages).to include("City can't be blank")
      end
      it 'cityが全角ひらがな、カタカナ、漢字での入力ではない時' do
        @how_to_buy.city = 111111
        @how_to_buy.valid?
        expect(@how_to_buy.errors.full_messages).to include("City 全角ひらがな、カタカナ、漢字で市区町村を入力してください")
      end
      it 'house_numberが空の時' do
        @how_to_buy.house_number = ""
        @how_to_buy.valid?
        expect(@how_to_buy.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空の時' do
        @how_to_buy.phone_number = ""
        @how_to_buy.valid?
        expect(@how_to_buy.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁以上の時' do
        @how_to_buy.phone_number = 1234567890123
        @how_to_buy.valid?
        expect(@how_to_buy.errors.full_messages).to include("Phone number ハイフンなしで11桁以内で電話番号を入力してください(例)09033611156)")
      end
      it 'prefectureのidが0ではない時' do
        @how_to_buy.prefecture_id = 0
        @how_to_buy.valid?
        expect(@how_to_buy.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it 'tokenが空の時' do
        @how_to_buy.token = ""
        @how_to_buy.valid?
        expect(@how_to_buy.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
