RSpec.describe Person, type: :model do

  let!(:raw_datas) { create_list(:raw_data, 3) }
  let!(:raw_data) { raw_datas.first }

  context '#from_recommendation' do
    subject { described_class.from_recommendation(recommendation: raw_data.to_recommendation) }
    it { should be_a(Person) }
  end

end
