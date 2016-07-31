require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#catch_copy' do
    let(:product) { build(:product, catch_copy: nil) }
    it "is invalid with a catch_copy" do
      product.valid?
      expect(product.errors[:catch_copy]).to include("can't be blank")
    end
  end
  describe '#concept' do
    let(:product) { build(:product, concept: nil) }
    it "is invalid with a concept" do
      product.valid?
      expect(product.errors[:concept]).to include("can't be blank")
    end
  end
  describe '#title' do
    let(:product) { build(:product, title: nil) }
    it "is invalid with a title" do
      product.valid?
      expect(product.errors[:title]).to include("can't be blank")
    end
  end
  describe '#with catch_copy, concept and title' do
    it 'is valid with a catch_copy, concept and title' do
      product = build(:product)
      expect(product).to be_valid
    end
  end
  describe '#association' do
    let(:user) { create(:user) }
    let(:product) { create(:product, user: user)}
    it 'is associated with a user' do
      expect(product.user).to eq user
    end
  end
  describe 'with comments' do
    let!(:product) { create(:product, :with_comments) }
    it 'deletes the comments when product is deleted' do
      expect{ product.destroy }.to change{ Comment.count }.by(-5)
    end
  end
  describe 'with likes' do
    let!(:product) { create(:product, :with_likes) }
    it 'deletes the likes when product is deleted' do
      expect{ product.destroy }.to change{ Like.count }.by(-5)
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
  describe '#not_liked_by(user)' do
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
