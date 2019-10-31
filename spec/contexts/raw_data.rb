RSpec.shared_context 'raw data' do
  let(:raw_updates) { create_list(:raw_data_updates, 3) }
  let(:raw_profiles) { create_list(:raw_data_profile, 3) }
  let(:recommendation) { create(:raw_data_recommendation) }
  let(:updates) { raw_updates.sample }
  let(:profile) { raw_profiles.sample }
  let(:match) { updates['matches'].sample }
  let(:account) { profile['account'] }
  # let(:account) { Tinder::ActiveProfile.new(profile.data).account }
end