FactoryBot.define do
  factory :high_school do
    name { 'I Liceum Ogólnokształcące w Pcimiu Dolnym' }
    city { 'Pcimie Dolne' }
    school_type { 0 }

    factory :high_school_with_users do
      after :create do |high_school|
        create_list :user, 10, high_school: high_school
      end
    end
  end
end