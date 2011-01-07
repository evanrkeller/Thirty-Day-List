Factory.define :user do |f|
  f.sequence(:email) {|n| "user#{n}@example.com"}
  f.password "password"
  f.password_confirmation "password"
  f.confirmed_at DateTime.now
end
