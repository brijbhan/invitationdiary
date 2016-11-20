$(document).on 'click', '#new-invitee', ->
  $.ajax 'invitees/new',
    type: 'Get'
    success: (response) ->
      $('body').append(response)
      $('#form-modal').modal('show')

$(document).on 'click', '.edit-invitee', ->
  inviteeID = this.dataset['id']
  $.ajax 'invitees/' + inviteeID + '/edit',
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
