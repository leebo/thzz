class MobileArea
  include Mongoid::Document
  # 手机号前7位
  field :mobile, type: String
  # 省
  field :province, type: String
  # 城市名称
  field :cityname, type: String
  # 移动运营商
  field :isp, type: String

  validates :mobile, :province, :cityname, :isp, presence: true
  validates :mobile, uniqueness: true

  index ({ mobile: 1 }, { unique: true, name: "mobile_index" })
end
