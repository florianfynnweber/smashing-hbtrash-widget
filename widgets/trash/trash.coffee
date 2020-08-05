class Dashing.Trash extends Dashing.Widget

  ready: ->
    # This is fired when the widget is done being rendered
    $(".sign").hide(); #hide all signs

  onData: (data) ->
   # Handle incoming data
   # You can access the html node of this widget with `@node`
   # Example: $(@node).fadeOut().fadeIn() will make the node flash each time data comes in.
    @setSigns(data)
    @setDateString(data.date)
    @set('date', data.date)

  setSigns: (data) ->
    if data.type == 1
        $(".text").text("Restmüll / Bioabfall")
        $(".sign_blue").hide()
        $(".sign_yellow").hide()
        $(".sign_black").show()
        $(".sign_brown").show()
        $(".sign_tree").hide()
    if data.type == 2
        $(".text").text("Papier / Gelber Sack")
        $(".sign_blue").show()
        $(".sign_yellow").show()
        $(".sign_black").hide()
        $(".sign_brown").hide()
        $(".sign_tree").hide()
    if data.type == 3
        $(".text").text("Tannenbaumabfuhr")
        $(".sign_blue").hide()
        $(".sign_yellow").hide()
        $(".sign_black").hide()
        $(".sign_brown").hide()
        $(".sign_tree").show()

  setDateString: (date) ->
    today = new Date()
    trashdate = Date.parse(date)
    daysup = Math.ceil((trashdate - today) / (1000 * 60 * 60 * 24))
    if daysup < 1
      @set('date_string', "Heute")
    else if daysup == 1
      @set('date_string', "Morgen")
    else
      @set('date_string', "Noch #{daysup} Tage")

  formatTime: (i) ->
    if i < 10 then "0" + i else i

