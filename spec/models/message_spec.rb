RSpec.describe Message, type: :model do

  let!(:raw_updates) { create(:raw_data_updates) }
  let!(:updates) { raw_updates.to_updates }
  let!(:matches) { updates.matches }
  let!(:message) { messages.first }
  let!(:messages) { updates.matches.select { |m| m.messages.any? }.first.messages }

  describe "schema" do
    it { should have_db_column(:content) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:deleted_at).of_type(:datetime) }
    it { should have_db_column(:is_outgoing).of_type(:boolean) }
    it { should have_db_column(:sent_at).of_type(:datetime) }
    it { should have_db_column(:tinder_message_id).of_type(:string) }
  end

  describe "associations" do
    it { should belong_to(:match) }
    it { should have_many(:replies).with_foreign_key(:parent_id) }
    it { should belong_to(:message).with_foreign_key(:parent_id) }
  end

  describe "validations" do
    it { should validate_presence_of(:match) }
    it { should_not validate_presence_of(:message) }
  end

  describe '#from_message', type: :method do
    subject { described_class.from_message(message) }
    it { expect(Message).to respond_to(:from_message).with(1).argument }
    it { should be_a(Message) }
  end

end
