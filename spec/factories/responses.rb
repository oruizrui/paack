FactoryBot.define do

  factory :api_response, class: Hash do
    skip_create
    code { 200 }
    body { create(:body_json, :two).to_json }
    initialize_with do
      attributes.
          stringify_keys.
          with_indifferent_access
    end
  end

  factory :body_json, class: Hash do
    skip_create
    initialize_with { attributes.stringify_keys }

    # _hundred
    trait :one do
      message { 'Continue' }
    end

    trait :two do
      status { 0 }
      location { "Gavà [Provincia de Barcelona;España]" }
      url { "https://www.tiempo.com/gava.htm" }
      day do
        {
            :"1"=>{:tempmin=>"9", :tempmax=>"20"},
            :"2"=>{:tempmin=>"11", :tempmax=>"14"},
            :"3"=>{:tempmin=>"11", :tempmax=>"23"},
            :"4"=>{:tempmin=>"8", :tempmax=>"10"},
            :"5"=>{:tempmin=>"7", :tempmax=>"9"}
        }
      end
    end

    trait :three do
      message { 'Multiple Choice' }
    end

    trait :fourth do
      message { 'Bad Request' }
    end

    trait :five do
      message { 'Internal Server Error' }
    end
  end
end
