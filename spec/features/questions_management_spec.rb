require 'rails_helper'

RSpec.feature "Questions management"  do

  before do
    stub_omniauth
    load_questions
  end

  scenario "User can see all questions" do
    given_an_user_logged_with_google_account
    should_appear_list_of_questions
  end

  scenario "User creates a new question"

  def given_an_user_logged_with_google_account
    visit root_path
    click_link "Sign in with Google"
  end

  def should_appear_list_of_questions
    expect(page).to have_content("Question_1")
  end

  def load_questions
    FactoryBot.create(:question)
  end
end