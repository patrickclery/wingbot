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

###############################################################################
RSpec.describe GraphType::MessageType, type: :graphtype do
  subject { described_class }

  it { should have_field("id")               .of_type("ID!") }
  it { should have_field("content")          .of_type("String!") }
  it { should have_field("is-outgoing")      .of_type("Boolean!") }
  it { should have_field("tinder-message-id").of_type("String!") }
  it { should have_field("created-at")       .of_type("ISO8601DateTime!") }
  it { should have_field("deleted-at")       .of_type("ISO8601DateTime!") }
  it { should have_field("sent-at")          .of_type("ISO8601DateTime!") }
end


###############################################################################
RSpec.describe GraphType::MatchType, type: :graphtype do
  subject { described_class }

  it { should have_field("id")                  .of_type("ID!") }
  it { should have_field("common-friend-count") .of_type("Int!") }
  it { should have_field("common-like-count")   .of_type("Int!") }
  it { should have_field("is-boost-match")      .of_type("Boolean!") }
  it { should have_field("is-closed")           .of_type("Boolean!") }
  it { should have_field("is-dead")             .of_type("Boolean!") }
  it { should have_field("is-fast-match")       .of_type("Boolean!") }
  it { should have_field("is-following")        .of_type("Boolean!") }
  it { should have_field("is-following-moments").of_type("Boolean!") }
  it { should have_field("is-muted")            .of_type("Boolean!") }
  it { should have_field("is-pending")          .of_type("Boolean!") }
  it { should have_field("is-super-like")       .of_type("Boolean!") }
  it { should have_field("tinder-match-id")     .of_type("String!") }
  it { should have_field("person-id")           .of_type("Int!") }
  it { should have_field("participants")        .of_type("[Int!]!") }
  it { should have_field("readreceipt")         .of_type("[Int!]!") }
  it { should have_field("seen")                .of_type("[Int!]!") }

  # Timestamps
  it { should have_field("last-active-at")      .of_type("ISO8601DateTime!") }
  it { should have_field("matched-at")          .of_type("ISO8601DateTime!") }
  it { should have_field("created-at")          .of_type("ISO8601DateTime!") }
  it { should have_field("deleted-at")          .of_type("ISO8601DateTime!") }
  it { should have_field("sent-at")             .of_type("ISO8601DateTime!") }
end