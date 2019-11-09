
RSpec Tests: [![CircleCI](https://circleci.com/gh/patrickclery/tinder_client.svg?style=svg)](https://circleci.com/gh/patrickclery/better_tinder)

Code Coverage: [![codecov](https://codecov.io/gh/patrickclery/better_tinder/branch/master/graph/badge.svg)](https://codecov.io/gh/patrickclery/better_tinder)

## Better Tinder 

> Synchronize & manage your Tinder account via GraphQL.

### Features

- Save recommendations to your Rails database.
- Browse your Tinder recommendations through GraphQL.

### Initial Setup

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

### Saving data from Tinder

Use rake tasks to save your data 

  ```
  rake tinder:save_token       # Save an API token to $token_path ake tinder:get_updates      # Fetch updates
  rake tinder:save_recommendations  # Fetch recommendations
  rake tinder:save_updates  # Save your Tinder account data
  ```

To grab a token, call a rake command & specify the `phone_number` or `api_token` in your environment variables.

### `rake tinder:save_token`
   
  ```
  $ rake tinder:save_token \
  phone_number=15556667777 \
  tinder_token_path=/tmp
  Enter the confirmation code sent to 15556667777> 
  123456
  Validating...
  Done!
  Your refresh token is eyJhbGciOiJIUzI1NiJ9.MTc3ODk5MDk4MDM5q4R0H08rE0Dd9KgxMPp6jcTfIBLCXgEuVZfC9znJTE
  Logging in...
  Done!
  Your tinder API token is 12a3bc45-a123-123a-1a23-1234abc4de5f
  Saved to /tmp/tinder_access_token.txt
  ```

### `rake tinder:save_updates`

Downloads your Tinder account data using the token created by `rake tinder:save_token`

## Accessing your data

Start rails `rails s`, then open your browser to https://localhost.local:3000/graphiql and use GraphQL (the language itself) to interact with the data.
   
   ```graphql
   {
     data {
       id
       tag
       json
     }
     person {
        id
        bio
        birthdate
        city
        gender
        hide-age
        hide-distance
        instagram-id
        instagram-username
        is-traveling
        name
        photos
        schools
        tinder-id
        active-at
        created-at
        updated-at
        deleted-at
        updated-at
     }
   }
   ```