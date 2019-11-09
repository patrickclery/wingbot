###############################################################################
RSpec.describe GraphType::RawDataType, type: :graphtype do
  subject { described_class }

  it { should have_field("id")        .of_type("ID!") }
  it { should have_field("json")      .of_type("String!") }
  it { should have_field("tag")       .of_type("String!") }
  # Timestamps
  it { should have_field("created-at").of_type("ISO8601DateTime!") }
  it { should have_field("deleted-at").of_type("ISO8601DateTime!") }
  it { should have_field("updated-at").of_type("ISO8601DateTime!") }
end

###############################################################################
RSpec.describe GraphType::PersonType, type: :graphtype do
  subject { described_class }

  it { should have_field("id")                .of_type("ID!") }
  it { should have_field("bio")               .of_type("String!") }
  it { should have_field("birthdate")         .of_type("ISO8601DateTime!") }
  it { should have_field("city")              .of_type("String!") }
  it { should have_field("gender")            .of_type("String!") }
  it { should have_field("hide-age")          .of_type("Boolean!") }
  it { should have_field("hide-distance")     .of_type("Boolean!") }
  it { should have_field("instagram-id")      .of_type("String!") }
  it { should have_field("instagram-username").of_type("String!") }
  it { should have_field("is-traveling")      .of_type("Boolean!") }
  it { should have_field("name")              .of_type("String!") }
  it { should have_field("photos")            .of_type("String!") }
  it { should have_field("schools")           .of_type("String!") }
  it { should have_field("tinder-id")         .of_type("String!") }
  # Timestamps
  it { should have_field("active-at")         .of_type("ISO8601DateTime!") }
  it { should have_field("created-at")        .of_type("ISO8601DateTime!") }
  it { should have_field("deleted-at")        .of_type("ISO8601DateTime!") }
  it { should have_field("updated-at")        .of_type("ISO8601DateTime!") }
end