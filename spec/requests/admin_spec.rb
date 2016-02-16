require 'rails_helper'

describe 'site administrator' do
  it "accesses the dashboard" do
    User.create(
      email: 'user@example.com',
      password: 'password',
      password_confirmation: 'password'
    )

    visit root_path
    click_link 'Log in'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    within '.navbar-brand' do
      expect(page).to have_content 'Admin'
    end
    expect(page).to have_content 'Users'
    expect(page).to have_content 'Site'
  end

  it "denies access to the dashboard if not signed in" do
    visit root_path
    click_link 'Log in'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    within '.navbar-brand' do
      expect(page).to_not have_content 'Admin'
    end
    expect(page.current_path).to eq(new_user_session_path)
  end
end