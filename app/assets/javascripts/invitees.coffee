setFilterParams = ->
  search = $('.navbar-form input[name=\'search\']').val()
  callCount = $('.navbar-form input[name=\'call_count\']').val()
  if search || callCount
    params = '?search=' + search + '&call_count=' + callCount
    params += '&page=' + getURLParameter('page') if getURLParameter('page')
  else
    params = ''
    params += '?page=' + getURLParameter('page') if getURLParameter('page')
  params

$(document).on 'click', '#new-invitee', ->
  $.ajax 'invitees/new' + setFilterParams(),
    type: 'Get'
    success: (response) ->
      $('body').append(response)
      $('#form-modal').modal('show')

$(document).on 'click', '.edit-invitee', ->
  inviteeID = this.dataset['id']
  $.ajax 'invitees/' + inviteeID + '/edit' + setFilterParams(),
    type: 'Get'
    success: (response) ->
      $('body').append(response)
      $('#form-modal').modal('show')
  
$(document).on 'hidden.bs.modal', '#form-modal', ->
  $(this).remove()

$(document).on 'change', '#invitee_is_invited', ->
  count = if $(this).prop('checked') then 1 else 0
  $('#invitee_call_count').val(count)

$(document).on 'change', '.filters #call_count', ->
  count = $(this).val()
  $('.navbar-form #call_count').val(count)
  $('.navbar-form').submit()
