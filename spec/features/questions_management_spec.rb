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

  scenario "User view a question" do
    given_an_user_logged_with_google_account
    see_question_and_click_over("Question_3")
  end

  scenario "User view a question and creates a new answer" do
    given_an_user_logged_with_google_account
    see_question_and_click_over(("Question_4"))
    click_link "New Answer"
    when_i_create_an_answer
    i_should_see_my_answer_in_the_question_page
  end

  scenario "User search a question" do
    given_an_user_logged_with_google_account
    fill_in 'q', with: 'Question_5'
    find('input[value="Go"]').click
    i_should_see_a_list_of_questions
  end

  def see_question_and_click_over(question)
    expect(page).to have_content(question)
    click_link question
    expect(page).to have_content(question)
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
    fill_in 'question[body]', with: '- Jules Verne\r\n- J K Rowling\r\n- Charles Dickens\r\n- George Lucas\r\n'
    submit_form
  end

  def i_should_see_question_in_my_page
    expect(page).to have_current_path root_path
    expect(page).to have_content('Who directed the Star Wars movies?')
  end

  def when_i_create_an_answer
    expect(page).to have_content "New Answer"
    expect(page).to have_content "Question_4"
    fill_in 'answer[body]', with: 'Answer_1 ...'
    submit_form
  end

  def i_should_see_my_answer_in_the_question_page
    expect(page).to have_content("Answer_1 ...")
    expect(page).to have_content("total answers 1")
  end

  def i_should_see_a_list_of_questions
    expect(page).to have_content "Question_5"
  end

  def load_questions
    FactoryBot.create(:user)
    FactoryBot.create(:question)
  end

  def submit_form
    find('input[name="commit"]').click
  end
end