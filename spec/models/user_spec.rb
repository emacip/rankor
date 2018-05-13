require 'rails_helper'

RSpec.describe User, type: :model do
  it "create or update user from an oauth hash" do
    auth = {
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
            expires_at: DateTime.now,
        }
    }

    User.update_or_create(auth)
    user = User.first

    expect(user.provider).to eq("google")
    expect(user.uid).to eq("12345678910")
    expect(user.name).to eq("Han Solo")
    expect(user.email).to eq("han.solo@millenniumfalcon.com")
    expect(user.first_name).to eq("Han")
    expect(user.last_name).to eq("Solo")
    expect(user.token).to eq("abcdefg12345")
    expect(user.refresh_token).to eq("12345abcdefg")
    expect(user.expires_at).to eq(auth[:credentials][:expires_at])
  end
end
