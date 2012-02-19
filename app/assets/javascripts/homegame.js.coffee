jQuery ->
  $("input[type='text']:visible:first").focus()
  ko.applyBindings(new ViewModel())

class ViewModel
  constructor: ->
    @dates = ko.observableArray(['', 'Monday','Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'])

  submitVote: () ->
    alert('foo')

# viewModel =>
#   dates: ko.observableArray(['Monday','Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']),
#   submitVote: () ->
#     alert('foo')