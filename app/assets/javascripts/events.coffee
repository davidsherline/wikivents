# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
  $(".overlay").hide()
  $("#date").datepicker(datepickerOptions)
  $("#submit").on "click", ->
    $("#search").submit()

$(document).on "ajaxStart", ->
  $(".overlay").fadeIn(300)

$(document).on "ajaxStop", ->
  $(".overlay").fadeOut(200)

datepickerOptions =
  autoclose: true
  format: "yyyy-mm-dd"
