class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :username, type: String
  field :mobile, type: String
  field :age, type: Integer
  field :sex, type: Integer
  field :sn, type: String
  field :used_at, type: Time

  validates :mobile, :sn, presence: true
  validates :mobile, uniqueness: true

  def gen_sn
    self.sn = rand(99999999)
  end

end
