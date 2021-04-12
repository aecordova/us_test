require 'rails_helper'

RSpec.describe RealState, type: :model do
  before{ create(:real_state) }
  
  context 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:external_number) }
    it { should validate_presence_of(:neighborhood) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:bathrooms) }
    
    it { should validate_length_of(:name).is_at_most(128) }
    it { should validate_length_of(:street).is_at_most(128) }
    it { should validate_length_of(:external_number).is_at_most(12) }
    it { should validate_length_of(:neighborhood).is_at_most(128) }
    it { should validate_length_of(:city).is_at_most(64) }
    it { should validate_length_of(:comments).is_at_most(128) }
    
    it { should_not allow_values('#', '%', ' ').for(:external_number) }
    it { should_not allow_values('#', '%').for(:internal_number) }
    it { should allow_values('1234567890', 'abc', '-').for(:external_number) }
    it { should allow_values('1234567890', 'abc', '-', ' ').for(:internal_number) }
    
    it { should validate_numericality_of(:rooms) }
    it { should validate_numericality_of(:bathrooms) }
    
    it { should validate_inclusion_of(:country).in_array(RealState::COUNTRY_CODES) }
    
    it { should_not allow_values(0).for(:bathrooms) }
    
    context "When it's a commercial ground or a land" do
      let(:property){build(:real_state, type: "land")}

      it "allows 0 bathrooms" do
        expect(property.valid?).to be true
      end
    end
  end
end
