class User
  include Mongoid::Document
  field :username, type: String
  field :mobile, type: String
  field :age, type: Integer
  field :sex, type: Integer
  field :sn, type: String
  field :used_at, type: Time
end
