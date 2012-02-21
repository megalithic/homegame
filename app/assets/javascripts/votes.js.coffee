jQuery ->
  Vote = (selected_date, player_id, week_number) ->
    @selected_date = ko.observable(selected_date)
    @player_id = ko.observable(player_id)
    @week_number = ko.observable(week_number)

  ViewModel = (votes) ->
    self = this

    self.votes = ko.observableArray(ko.utils.arrayMap(votes, (vote) ->
      new Vote(vote.selected_date, vote.player_id, vote.week_number)
    ))

    self.current = ko.observable()

    self.add = (data, event) ->
      newVote = new Vote(self.current())
      self.votes.push newVote
      self.current ""

    # self.getAll = ->
    #   "the information you seek"

    self.selectOptions = ->
      return ['', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']

  # viewModel = new ViewModel([])
  # votes = viewModel.getAll()
  ko.applyBindings(new ViewModel([]))