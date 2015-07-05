
$(document).ready(function(e){
  
// Hide current modal when link to another is clicked

  $('#hide_sign_up').on('click', function(){
    $( '#sign_up' ).modal( 'hide' ).data( 'bs.modal', null );
  });

  $('#hide_sign_in').on('click', function(){
    $( '#sign_in' ).modal( 'hide' ).data( 'bs.modal', null );
  });
  
// bootstrap-datepicker-rails addon
  
  $('.input-daterange').datepicker({
  });

});