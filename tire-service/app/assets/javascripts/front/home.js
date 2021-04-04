// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require activestorage
//= require_tree .
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require turbolinks
//= require popper
//= require bootstrap
//= require chosen-jquery
//= require chartkick
//= require Chart.bundle
//= require bootstrap-select
//= require bootstrap/alert
//= require bootstrap/dropdown

jQuery(function($){
  $("form#search_order").on('ajax:success', function(event, data, status, xhr) {
    console.log("Great!");
    $("#order-report-results").html(data);
  });

  $("form#search_order").on('ajax:error', function(event, xhr, status, error) {
    console.log("sorry mate!");
  });
})