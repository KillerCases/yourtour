
$(document).ready(function(e){


console.log('awakening')
$('#hide_sign_up').on('click', function(){
  $( '#sign_up' ).modal( 'hide' ).data( 'bs.modal', null );
});
  
$('#hide_sign_in').on('click', function(){
  $( '#sign_in' ).modal( 'hide' ).data( 'bs.modal', null );
});

});