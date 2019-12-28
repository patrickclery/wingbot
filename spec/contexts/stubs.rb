# ### FOR DEVELOPERS:
#
# You can make use of my spec stubs by requiring them in your in your spec
# helper: require the file `wingbot/spec/contexts/stubs.rb`
# in your $APP/spec/spec_helper.rb, then call the client as you would normally
# and the requests will be stubbed.
#
RSpec.shared_context 'stubs' do

  include WebMock::API

  # Sample JSON responses from Tinder
  let!(:profile_data)         { JSON.parse(File.read(File.join(Rails.root, "/spec/fixtures/profile.json"))) }
  let!(:recommendations_data) { JSON.parse(File.read(File.join(Rails.root, "/spec/fixtures/recommendations.json"))) }
  let!(:updates_data)         { JSON.parse(File.read(File.join(Rails.root, "/spec/fixtures/updates_with_one_match.json"))) }

  let(:api_token)             { "12a3bc45-a123-123a-1a23-1234abc4de5f" }
  let(:confirmation_code)     { "123456" }
  let(:id)                    { "1a234a56123ab12345123456" }
  let(:phone_number)          { "1234567890" }
  let(:refresh_token)         { "xxxxxxxxxxxxxxxxxxxx.xxxxxxxxxxxxxxx.xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" }
  let(:token)                 { "eyJhbGciOiJIUzI1NiJ9.MTc3ODk5MDk4MDM.5q4R0H08rE0Dd9KgxMPp6jcTfIBLCXgEuVZfC9znJTE" }

  before do
    ###########################################################################
    ### Authentication

    stub_request(:post, "https://api.gotinder.com/v2/auth/sms/send?auth_type=sms")
      .with(body: { phone_number: phone_number })
      .to_return(body: { "meta": { "status": 200 },
                         "data": { "otp_length": 6,
                                   "sms_sent":   true } }.to_json)

    stub_request(:post, "https://api.gotinder.com/v2/auth/sms/validate?auth_type=sms")
      .with(body: { phone_number: phone_number,
                    is_update:    false,
                    otp_code:     confirmation_code })
      .to_return(body: { "meta": { "status": 200 },
                         "data": { "refresh_token": refresh_token,
                                   "validated":     true } }.to_json)

    stub_request(:post, "https://api.gotinder.com/v2/auth/login/sms")
      .with(body: { phone_number:  phone_number,
                    refresh_token: refresh_token })
      .to_return(body: { "meta": { "status": 200 },
                         "data": { "_id":           id,
                                   "api_token":     api_token,
                                   "refresh_token": refresh_token,
                                   "is_new_user":   false } }.to_json)

    ###########################################################################
    # Simulate when retrieving 3 packs of 4 recommended users, then running out
    # of results

    stub_request(:get, "https://api.gotinder.com/v2/recs/core")
      .to_return(headers: { "Content-Type" => "application/json" },
                 body:    JSON.generate({ "meta": { "status": 200 },
                                          "data": recommendations_data }))
      .then.to_return(headers: { "Content-Type" => "application/json" },
                      body:    JSON.generate({ "meta": { "status": 200 },
                                               "data": recommendations_data }))
      .then.to_return(headers: { "Content-Type" => "application/json" },
                      body:    JSON.generate({ "meta": { "status": 200 },
                                               "data": recommendations_data }))
      .then.to_return(headers: { "Content-Type" => "application/json" },
                      body:    JSON.generate({ "error": { "message": "There is no one around you" } }))

    # Updates (inbox, matches, etc. - everything on the dashboard)
    stub_request(:post, "https://api.gotinder.com/updates")
      .to_return(headers: { "Content-Type" => "application/json" },
                 body:    JSON.generate({ "meta": { "status": 200 },
                                          "data": updates_data }))

    # Profile
    stub_request(:get, "https://api.gotinder.com/v2/profile?include=account%2Cboost%2Cemail_settings%2Cinstagram%2Clikes%2Cnotifications%2Cplus_control%2Cproducts%2Cpurchase%2Cspotify%2Csuper_likes%2Ctinder_u%2Ctravel%2Ctutorials%2Cuser")
      .to_return(headers: { "Content-Type" => "application/json" },
                 body:    JSON.generate({ "meta": { "status": 200 },
                                          "data": profile_data }))
  end
end
