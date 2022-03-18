# == Schema Information
#
# Table name: terms
#
#  id         :bigint           not null, primary key
#  season     :bigint           not null
#  starts_on  :date             not null
#  ends_on    :date             not null
#  year       :bigint           not null
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)      not null
#
# Indexes
#
#  index_terms_on_slug             (slug) UNIQUE
#  index_terms_on_starts_on        (starts_on)
#  index_terms_on_year_and_season  (year,season)
#

FactoryBot.define do

  factory :term do
    year { 2022 }

    factory :term100 do
      season { 100 }
      starts_on { "2022-01-01" }
      ends_on { "2022-05-31" }
    end

    factory :term200 do
      season { 200 }
      starts_on { "2022-06-01" }
      ends_on { "2022-07-15" }
    end

    factory :term300 do
      season { 300 }
      starts_on { "2022-07-16" }
      ends_on { "2022-08-15" }
    end

    factory :term400 do
      season { 400 }
      starts_on { "2022-08-16" }
      ends_on { "2022-12-15" }
    end

    factory :term500 do
      season { 500 }
      starts_on { "2022-12-16" }
      ends_on { "2022-12-31" }
    end
  end
end
