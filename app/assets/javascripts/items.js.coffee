# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
class @ItemForm
  constructor: () ->
    $("#item_nonprofit_percentage").autoNumeric('init', 
    { 
      aSep: '',
      vMax: '100',
      vMin: '0'
    })
    $("#item_price").autoNumeric('init',
    {
      mDec: '2'
    })