# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :late_policy do
    name { "late_10" }
    late_days {0}
    late_percent {19}
  end
end
