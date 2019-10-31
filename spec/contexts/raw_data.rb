RSpec.shared_context 'raw data' do
  let(:account) { profile['account'] }

  let(:raw_updates_list) { create_list(:raw_data_updates, 3) }
  let(:raw_updates) { raw_updates_list.sample }
  let(:updates) { Tinder::Updates.new(raw_updates.data) }

  let(:match) { Tinder::Match.new(raw_updates.data['matches'].sample) }

  let(:raw_data_recommendations) { create(:raw_data_recommendations) }
  let(:recommendations) do
    raw_data_recommendations.data.map do |rec|
      Tinder::Recommendation.new(rec)
    end
  end
  let(:recommendation) { recommendations.sample }

  let(:raw_profiles) { create_list(:raw_data_profile, 3) }
  let(:raw_profile) { raw_profiles.sample }
  let(:profile) { Tinder::ActiveProfile.new(raw_profile.data) }
end