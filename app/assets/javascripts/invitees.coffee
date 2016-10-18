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
