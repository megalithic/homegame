jQuery ->
  $("input[type='text']:visible:first").focus()

  ko.applyBindings(viewModel)


viewModel =>
  dates: ko.observableArray()