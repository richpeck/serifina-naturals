##########################################################
##########################################################
##                  ___                                 ##
##                 / _ \                                ##
##                / /_\ \_ __  _ __                     ##
##                |  _  | '_ \| '_ \                    ##
##                | | | | |_) | |_) |                   ##
##                \_| |_/ .__/| .__/                    ##
##                      | |   | |                       ##
##                      |_|   |_|                       ##
##                                                      ##
##########################################################
##########################################################

## Libs ##
#= require jquery
#= require jquery.poshytip.min
#= require jquery-editable-poshytip.min

##########################################################
##########################################################

## Editable ##
## Used to allow users to edit items ##
$.fn.editable.defaults.mode = 'popup' # prefer popup
$.fn.editable.defaults.send = "always" # required because typical system requires pk + url - https://stackoverflow.com/a/22480288/1143732
$.fn.editable.defaults.ajaxOptions = { type: "PUT" } # updates sent via PUT

## X-Editable ##
## This uses the X-Editable library to provide async functionality ##
$(document).ready ->

  # Price Validation
  $('.editable.price').editable('option', 'validate', (v) ->
    if !$.isNumeric(v)
      return 'Numbers Only.'
  ).editable 'option', 'display', (v) ->
    $(this).text(value + '$')

  # Editable Object
  $('.editable').editable

    # Validations
    validate: (value) ->
      if $.trim(value) == ''
        return 'Field required'

    # Ajax
    success: (response, newValue) ->
      alert newValue

    error: (errors) ->
      msg = ''
      if errors && errors.responseText
        msg = errors.responseText
      else
        $.each errors, (k, v) ->
          msg += k+": "+v+"<br>"

      console.log msg


##########################################################
##########################################################

## Forms ##
## These are the buttons we can use to send requests to the backend ##
$(document).on "submit", "table.charms form", (e) ->
  e.preventDefault()

  ## Vars ##
  $this = $(this)

  ## Button ##
  $.ajax
    url:  $this.attr("action"),
    type: $this.find("input[name='_method']").attr("value"),
    success: (data) ->
        $this.parents("td").html(data) # replace button

##########################################################
##########################################################
