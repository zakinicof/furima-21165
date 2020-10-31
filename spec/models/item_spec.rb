require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "image、name、description、price、category_id、item_condition_id、shipping_payer_id、prefecture_code_id、preparation_day_id、user_idが存在すれば登録できる" do
        expect(@item).to be_valid
      end
      it "priceが300以上であれば出品できる" do
        @item.price = 300
        expect(@item).to be_valid
      end
      it "priceが9999999以下であれば出品できる" do
        @item.price = 9999999
        expect(@item).to be_valid
      end
      it "priceが半角数字であれば出品できる" do
        @item.price = 1000
        expect(@item).to be_valid
      end
      it "入力された販売価格によって販売手数料の表示が変わる" do
        @item.price = 1000
        expect(@item.price / 10 == @item.id='add-tax-price')
      end
      it "入力された販売価格によって販売利益の表示が変わる" do
        @item.price = 1000
        expect(@item.price - @item.price / 10 == @item.id='profit')
      end
    end

    context '商品出品がうまくいかないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空では登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      
      it "descriptionが空では登録できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "category_idが1では登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "item_condition_idが1では登録できない" do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition must be other than 1")
      end
      it "shipping_payer_idが1では登録できない" do
        @item.shipping_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping payer must be other than 1")
      end
      it "preparation_day_idが1では登録できない" do
        @item.preparation_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation day must be other than 1")
      end
      it "priceが半角数字でなければ登録できない" do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが300未満では登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが9999999より大きいと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end