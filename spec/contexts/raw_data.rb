RSpec.shared_context 'raw data' do

  let!(:basic_account) { create(:account) }
  let!(:person) { create(:person, account: basic_account, tinder_id: basic_account.tinder_id) }
  let(:raw_updates) { create(:raw_data_updates) }
  let(:raw_data_recommendations) { create(:raw_data_recommendations) }
  let(:raw_profiles) { create_list(:raw_data_profile, 3) }
  let(:raw_profile) { raw_profiles.sample }

  let!(:account) { profile.account }
  let(:profile) { Tinder::ActiveProfile.new(raw_profile.data) }
  let(:recommendations) do
    raw_data_recommendations.data.map do |rec|
      Tinder::Recommendation.new(rec)
    end
  end
  let(:recommendation) { recommendations.sample }
  let(:updates) { Tinder::Updates.new(raw_updates.data) }
  let(:matches) { Tinder::Updates.new(raw_updates.data) }
  let(:match) { Tinder::Match.new(raw_updates.data['matches'].sample) }

end