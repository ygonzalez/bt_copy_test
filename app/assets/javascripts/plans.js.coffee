# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ->
  $("i").click ->
  	event.preventDefault()
  	$(this).next().toggle("slide")
  	$(this).toggleClass "icon-minus-sign icon-plus-sign"