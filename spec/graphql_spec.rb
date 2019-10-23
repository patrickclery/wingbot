RSpec.describe GraphType::RawDataType do
  subject { described_class }

  it { is_expected.to have_field(:id).of_type("ID!") }
  it { is_expected.to have_field(:json).of_type("String!") }
  it { is_expected.to have_field(:tag).of_type("String!") }
end