RSpec.shared_context 'raw data' do
  let(:account) { profile['account'] }

  let(:raw_updates_list) { create_list(:raw_data_updates, 3) }
  let(:raw_updates) { raw_updates_list.sample }
  let(:updates) { Tinder::Updates.new(raw_updates.data) }

  let(:match) { Tinder::Match.new(raw_updates.data['matches'].sample) }

  let(:raw_data_recommendations) { create_list(:raw_data_recommendations, 3) }
  let(:raw_data_recommendation) { raw_data_recommendations.sample }
  let(:recommendations) do
    raw_data_recommendations.map do |rec|
      Tinder::Recommendation.new(rec.data)
    end
  end
  let(:recommendation) { Tinder::Recommendation.new(raw_data_recommendation.data) }

  let(:raw_profiles) { create_list(:raw_data_profile, 3) }
  let(:raw_profile) { raw_profiles.sample }
  let(:profile) { Tinder::ActiveProfile.new(raw_profile.data) }
end