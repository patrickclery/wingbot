
RSpec Tests: [![CircleCI](https://circleci.com/gh/patrickclery/tinder_client.svg?style=svg)](https://circleci.com/gh/patrickclery/better_tinder)

Code Coverage: [![codecov](https://codecov.io/gh/patrickclery/better_tinder/branch/master/graph/badge.svg)](https://codecov.io/gh/patrickclery/better_tinder)

## Better Tinder 

> Synchronize & manage your Tinder account via GraphQL.

### Features

- Save recommendations to your Rails database.
- Browse your Tinder recommendations through GraphQL.

### How to get started

1. Clone repo.
   
   ```shell script
   git clone https://github.com/patrickclery/better_tinder.git
   ```
   
2. Install dependencies.

   ```shell script
   bundle install
   ```

3. Create databases.

   ```shell script
   bundle install
   rails db:create
   rails db:migrate
   ```

4. Connect to GraphiQL

   Open your browser to https://localhost.local:3000/graphiql and use GraphQL (the language itself) to interact with the data.
   
   ```graphql
   {
     data {
       id
       tag
       json
     }
   }
   ```