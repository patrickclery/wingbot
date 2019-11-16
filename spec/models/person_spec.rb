RSpec.describe Person, type: :model do

  it { should belong_to(:account).autosave(true).required }
  it { should have_many(:matches) }
  # Collections
  it { should have_db_column(:bio)                .of_type(:text)    }
  it { should have_db_column(:birthdate)          .of_type(:date)    }
  it { should have_db_column(:city)               .of_type(:json)    }
  it { should have_db_column(:common_friends)     .of_type(:json)    }
  it { should have_db_column(:gender)             .of_type(:string)  }
  it { should have_db_column(:hide_age)           .of_type(:boolean) }
  it { should have_db_column(:hide_distance)      .of_type(:boolean) }
  it { should have_db_column(:instagram_id)       .of_type(:string)  }
  it { should have_db_column(:instagram_photos)   .of_type(:json)    }
  it { should have_db_column(:instagram_username) .of_type(:string)  }
  it { should have_db_column(:is_traveling)       .of_type(:boolean) }
  it { should have_db_column(:jobs)               .of_type(:json)    }
  it { should have_db_column(:name)               .of_type(:string)  }
  it { should have_db_column(:photos)             .of_type(:json)    }
  it { should have_db_column(:schools)            .of_type(:json)    }
  it { should have_db_column(:teaser)             .of_type(:json)    }
  it { should have_db_column(:tinder_id)          .of_type(:string)  }
  # Timestamps
  it { should have_db_column(:active_at)  .of_type(:datetime) }
  it { should have_db_column(:created_at) .of_type(:datetime) }
  it { should have_db_column(:deleted_at) .of_type(:datetime) }
  it { should have_db_column(:updated_at) .of_type(:datetime) }

  describe '#from_recommendation' do
    subject do
      Person.from_recommendation(recommendation).then do |person|
        person.account = account
        person
      end
    end

    let!(:account) { create(:account) }
    let!(:raw_recommendations) { create(:raw_data_recommendations) }
    let!(:recommendation) { raw_recommendations.to_recommendations.sample }

    it { should be_a(Person) }
    it { should be_valid }
  end

  describe '#from_person' do
    let!(:raw_updates) { create(:raw_data_updates) }
    let!(:person_struct) { raw_updates.to_updates.matches.sample.person }
    subject do
      Person.from_person(person_struct).then do |person|
        person.account = account
        person
      end
    end
  end

end
