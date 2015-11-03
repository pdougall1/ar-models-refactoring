FactoryGirl.define do
  factory :project_user_role do
    project
    user
    role
  end
end
