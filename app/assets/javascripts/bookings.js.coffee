# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  booking.setupForm()

booking =
  setupForm: ->
    $('#new_booking').submit ->
      $('input[type=submit]').attr('disabled', true)
      if $('#card_number').length
        booking.processCard()
        false
      else
        true
  
  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, booking.handleStripeResponse)
  
  handleStripeResponse: (status, response) ->
    if status == 200
      $('#booking_stripe_card_token').val(response.id)
      $('#new_booking')[0].submit()
    else
      $('#stripe_error').text(response.error.message)
      $('input[type=submit]').attr('disabled', false)
              
    