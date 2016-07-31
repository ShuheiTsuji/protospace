require 'rails_helper'

RSpec.describe Image, type: :model do
  describe '#create' do
    describe '#without image attributes' do
      let(:image) { build(:image, :main, image: nil) }
      it 'returns error' do
        image.valid?
        expect(image.errors[:image]).to include("can't be blank")
      end
    end

    describe '#without role attributes' do
      let(:image) { build(:image, role: nil) }
      it 'returns error' do
        image.valid?
        expect(image.errors[:role]).to include("can't be blank")
      end
    end

    describe "has the wrong content format" do
      let(:image) { build(:image, :main, image: fixture_file_upload("img/i320.aaa", 'img/aaa')) }
      it 'has the wrong content format' do
        image.valid?
        expect(image.errors[:image][0]).to include("You are not allowed to upload \"aaa\" files, allowed types: jpg, jpeg, gif, png")
      end
    end

    describe '#with valid attributes' do
      let(:image) { build(:image, :main) }
      it "has a valid attributes" do
        expect(image).to be_valid
      end
    end
  end
end



