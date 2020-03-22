FactoryBot.define do

  factory :data, class: Hash do
    skip_create

    tempmins { [9, 11, 11, 8, 7] }
    tempmaxs { [20, 14, 23, 10, 9] }
    today { {:tempmins=>[9], :tempmaxs=>[20]} }

    initialize_with do
      attributes.
          with_indifferent_access.
          deep_symbolize_keys
    end
  end
end
