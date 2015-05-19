# encoding: utf-8

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
  validates :sn, format: { with: /\d{8}/ }
  validates :mobile,  uniqueness: { message: "你已经领取过，每人只能领取一次,请查收你的短信,或者联系我们" }
  validates :mobile, format: { with: /1[3|4|5|7|8][0-9]\d{8}/ , message: "手机号码输入不正确" }

  def gen_sn
    self.sn = rand(99999999)
  end


end
