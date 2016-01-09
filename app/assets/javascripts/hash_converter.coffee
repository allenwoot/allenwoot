$(document).on "page:change", ->
  # Register convert buttons to post user content to /to_json or /to_ruby and replace textarea with converted result.
  $('#to-json-btn').click ->
    $.post '/to_json',
      input: $('#hash-textarea').val()
      (data) -> $('#hash-textarea').val(data)
  $('#to-ruby-btn').click ->
    $.post '/to_ruby',
      input: $('#hash-textarea').val()
      (data) -> $('#hash-textarea').val(data)
