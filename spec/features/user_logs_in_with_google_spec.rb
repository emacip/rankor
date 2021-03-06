require 'rails_helper'

RSpec.feature "User logs in" do
  before do
    stub_omniauth
  end

  scenario "using google oauth2" do

    visit root_path
    expect(page).to have_link("Sign in with Google")
    click_link "Sign in with Google"
    expect(page).to have_content("Han Solo")
    expect(page).to have_link("Logout")
  end
end


def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
        provider: "google",
        uid: "12345678910",
        info: {
            name: "Han Solo",
            email: "han.solo@millenniumfalcon.com",
            first_name: "Han",
            last_name: "Solo"
        },
        credentials: {
            token: "abcdefg12345",
            refresh_token: "12345abcdefg",
            expires_at: DateTime.now
        }
    })
end