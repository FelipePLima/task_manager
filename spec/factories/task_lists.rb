FactoryGirl.define do
  factory :task_list do
    name 'Lista 1'
    done false
    is_public true
    user
  end
end
