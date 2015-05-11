# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#new_user').validate ->
    rules: {
      user_mobile: {
        required: true
      }
    }
    messages: {
      user_mobile: {
        required: "请先输入手机号",
        minlength: "请输入正确的手机号"
      }
    }
