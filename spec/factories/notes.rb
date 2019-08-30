FactoryBot.define do
  factory :note do
    message "My impotant note"
    association :project
    user { project.owner }
  end
end
