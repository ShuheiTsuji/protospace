require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#catch_copy' do
    it { is_expected.to validate_presence_of(:catch_copy) }
  end
  describe '#concept' do
    it { is_expected.to validate_presence_of(:concept) }
  end
  describe '#title' do
    it { is_expected.to validate_presence_of(:title) }
  end
  describe '#with catch_copy, concept and title' do
    it 'is valid with a catch_copy, concept and title' do
      product = build(:product)
      expect(product).to be_valid
    end
  end

  describe 'with comments' do
    let(:product) { create(:product, :with_comments) }
    it 'deletes the comments when product is deleted' do
      product.comments.create(text: 'aaa')
      expect{ product.destroy }.to change{ Comment.count }.by(-6)
    end
  end
  describe 'with likes' do
    let(:product) { create(:product, :with_likes) }
    it 'deletes the likes when product is deleted' do
      product.likes.create
      expect{ product.destroy }.to change{ Like.count }.by(-6)
    end
  end
  describe '#posted_date' do
    it 'returns dates in a specified format' do
      product = build(:product)
      expect(product).to be_valid
    end
  end
  describe '#liked_by(user)' do
    it 'when liked by a user' do
      product = create(:product)
      product.likes.create
      expect(product).to be_valid
    end
  end
  describe '#liked_by(user)' do
    it 'when not liked by a user' do
      user = create(:user, name: 'aaa')
      like = create(:like, user_id: '')
      expect(Like.find_by(user_id: user.id)).to be_falsey
    end
  end
  describe '#reject_sub_images(attributed)' do
    let(:product) { create(:product) }
    it "doesn't save a record with nil content" do
      image   = product.images.create(role: 'main', image: nil)
      expect(image.errors[:image]).to include("can't be blank")
    end
  end
end

