# encoding: utf-8

require "rest_client"

class ThzzController < ApplicationController

  def index
    @result = params[:result]
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.gen_sn
    if @user.save
      Rails.logger.debug send_sms_yunpian(@user.mobile,
                                          "【炭烤制造】套餐领取码为:#{@user.sn}。地址:南公园步行街。电话:18609000625。")
      flash[:notice] = "恭喜你！已经领取成功,请将此消息转发至朋友圈，并查收您的短信收件箱!"
      redirect_to action: 'index', result: 'ok'
    else
      flash[:error] = "对不起你已经领取,请查收您的短信收件箱，此套餐限制一人只能领取一份"
      redirect_to action: 'index', result: 'error'
    end
  end

  def yz
    @result = params[:result]
    if !params[:user]
      @user = User.new
      render action: 'yz'
      return
    end
    @user = User.find_by(sn: params[:user][:sn])
    if @user
      @user.used_at = Time.now
      if @user.save
        flash[:notice] = "验证成功"
        redirect_to action: 'yz', result: 'ok'
        return
      end
    end
    flash[:error] = "验证序列号不正确!"
    redirect_to action: 'yz', result: 'error'
  end

  private
  def user_params
    params[:user].permit(:mobile)
  end

  def send_sms_yunpian(mobile, text)
    #rails_config gem 配置
    apikey = Settings.yunpian.apikey
    url = Settings.yunpian.url
    RestClient.post(url,
                    apikey: apikey,
                    mobile: mobile,
                    text: text,
                    #content_type: :json,
                    accept: :json,
                    charset: 'utf-8')

  end
end
