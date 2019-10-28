require 'factory_bot'
require 'factory_bot_rails'

FactoryBot.define do
  factory :raw_data do
    factory :raw_data_recommendation do
      data {
        <<JSON
{
  "type": "user",
  "user": {
    "_id": "5d0d5ae45e92c21500cf2710",
    "bio": "Hi,  I like nice guys. No hookups.  NO HOOKUPS!",
    "birth_date": "1983-06-25T07:35:44.060Z",
    "name": "Kara",
    "photos": [
      {
        "id": "4da64c4e-7c81-4610-800e-1a6c4a6db451",
        "crop_info": {
          "user": {
            "width_pct": 1.0,
            "x_offset_pct": 0.0,
            "height_pct": 0.8,
            "y_offset_pct": 0.0
          },
          "algo": {
            "width_pct": 0.4391271770000458,
            "x_offset_pct": 0.13059724867343903,
            "height_pct": 0.49214738607406616,
            "y_offset_pct": 0.05345390364527702
          },
          "processed_by_bullseye": true,
          "user_customized": false
        }
      }
    ],
    "gender": 1,
    "jobs": [],
    "schools": []
  },
  "facebook": {
    "common_connections": [],
    "connection_count": 0,
    "common_interests": []
  },
  "spotify": {
    "spotify_connected": false
  },
  "distance_mi": 6,
  "content_hash": "EZeTbQcXQibdH0piwPSgwhos6VCbhqf8vtNpCL4iXXHY6",
  "s_number": 757286233,
  "teasers": []
}
JSON
      }
    end
  end
end