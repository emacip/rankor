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

  scenario "User creates a new question" do
    given_an_user_logged_with_google_account
    click_link "New Question"
    when_i_create_a_question
    i_should_see_question_in_my_page
  end

  def given_an_user_logged_with_google_account
    visit root_path
    click_link "Sign in with Google"
  end

  def should_appear_list_of_questions
    expect(page).to have_content("Question_1")
  end

  def when_i_create_a_question
    expect(page).to have_content("New Question")
    fill_in 'question[title]', with: 'Who directed the Star Wars movies?'
    fill_in 'question[body]', with: '** George Lucas **'
    submit_form
  end

  def i_should_see_question_in_my_page
    expect(page).to have_current_path root_path
    expect(page).to have_content('Who directed the Star Wars movies?')
  end

  def load_questions
    FactoryBot.create(:question)
  end

  def submit_form
    find('input[name="commit"]').click
  end
end