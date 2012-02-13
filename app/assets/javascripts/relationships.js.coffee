# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#relationship_employee_id').parent().hide()
  employees = $('#relationship_employee_id').html()
  $('#organization_id').change ->
    organization = $('#organization_id :selected').text()
    escaped_organization = organization.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(employees).filter("optgroup[label='#{escaped_organization}']").html()
    if options
      $('#relationship_employee_id').html(options)
      $('#relationship_employee_id').parent().show()
    else
      $('#relationship_employee_id').empty()
      $('#relationship_employee_id').parent().hide()
