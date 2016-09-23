require 'rails_helper'

describe User do
  describe '#create' do
    it "is valid with a name, email, password" do
      user = build(:user, name: "aaaaa")
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a member" do
      user = build(:user, member: nil)
      user.valid?
      expect(user.errors[:member]).to include("can't be blank")
    end


    it "is invalid without a profile" do
      user = build(:user, profile: nil)
      user.valid?
      expect(user.errors[:profile]).to include("can't be blank")
    end

    it "is invalid without a works" do
      user = build(:user, works: nil)
      user.valid?
      expect(user.errors[:works]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user, name: "aaaaa")
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is invalid with a name that has more than 7 characters " do
      user = build(:user, name: "aaaaaaaa")
      user.valid?
      expect(user.errors[:name][0]).to include("is too long")
    end

    it "is valid with a name that has less than 6 characters " do
      user = build(:user, name: "aaaaaa")
      expect(user).to be_valid
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
  end
end
