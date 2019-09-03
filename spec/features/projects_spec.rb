require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  include LoginSupport
  
  # 8章 サポートモジュール
  
  scenario "user creates a new project" do
    user = FactoryBot.create(:user)
    
    sign_in user
    visit root_path
    
    expect {
      click_link "New Project"
      fill_in "Name", with: "Test Project"
      fill_in "Description", with: "Trying out Capybara"
      click_button "Create Project"
      
      expect(page).to have_content "Project was successfully created"
      expect(page).to have_content "Test Project"
      expect(page).to have_content "Owner: #{user.name}"
    }.to change(user.projects, :count).by(1)
  end
  
  # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  # 普通
  
  # scenario "user creates a new project" do
  #   user = FactoryBot.create(:user)
    
  #   visit root_path
  #   click_link "Sign in"
  #   fill_in "Email", with: user.email
  #   fill_in "Password", with: user.password
  #   click_button "Log in"
    
  #   expect {
  #     click_link "New Project"
  #     fill_in "Name", with: "Test Project"
  #     fill_in "Description", with: "Trying out Capybara"
  #     click_button "Create Project"
      
  #     expect(page).to have_content "Project was successfully created"
  #     expect(page).to have_content "Test Project"
  #     expect(page).to have_content "Owner: #{user.name}"
  #   }.to change(user.projects, :count).by(1)
  # end
  
end
