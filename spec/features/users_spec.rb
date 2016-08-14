require 'rails_helper'

RSpec.feature 'user', type: :feature do
  let(:user) { build(:user) }
  let(:product) { build(:product) }

  def sign_up_and_logout
    visit root_path
    click_on 'Get Started'
    click_on 'Sign up now'
    fill_in 'user_name', with: user.name
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    fill_in 'user_member', with: user.member
    fill_in 'user_profile', with: user.profile
    fill_in 'user_works', with: user.works
    click_button 'save'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
    click_on 'Logout'
  end



  def sign_in
    sign_up_and_logout
    expect(page).to have_content 'Signed out successfully.'
    click_on 'Get Started'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully.'
  end

  def post_product
    sign_in
    click_on 'New Proto'
    fill_in 'product_title', with: product.title
    attach_file 'product[images_attributes][0][image]', "#{Rails.root}/spec/fixtures/img/i320.jpeg"
    3.times do |i|
      attach_file "product[images_attributes][#{i}][image]", "#{Rails.root}/spec/fixtures/img/i320.jpeg"
    end
    fill_in 'product_catch_copy', with: product.catch_copy
    fill_in 'product_concept', with: product.concept
    click_on 'publish'
    expect(page).to have_content 'succeed in post'
  end

  it 'sign_up' do
    sign_up_and_logout
  end

  it 'sign_in' do
    sign_in
  end

  it 'post_product' do
    post_product
  end
end
