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
      booking.processCard()
      false
      
  processCard: ->
    card = 
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, booking.handleStripeResponse)
        
  handleStripeResponse: (status, response) ->
    if status == 200
      alert(response.id)
    else
    $('#stripe_error').text(response.error.message)
    $('input[type=submit]').attr('disabled', false)
            
              
    