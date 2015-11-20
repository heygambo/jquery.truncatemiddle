#
# jquery.truncatemiddle › A naive implementation to trunacate strings in the middle like the Apple Finder does.
#
# Copyright (c) 2015 Christian Gambardella
#
# Licensed under the MIT license:
# http://www.opensource.org/licenses/mit-license.php
#
# Project home:
# https://github.com/nerdyglasses/jquery.truncatemiddle
#
# Version:  0.0.1
# 

# Note that when compiling with coffeescript, the plugin is wrapped in another
# anonymous function. We do not need to pass in undefined as well, since
# coffeescript uses (void 0) instead.
do ($ = jQuery, window, document) ->

  # window and document are passed through as local variable rather than global
  # as this (slightly) quickens the resolution process and can be more efficiently
  # minified (especially when both are regularly referenced in your plugin).

  # Create the defaults once
  pluginName = "truncateMiddle"
  defaults =
    ellipsis: '...'
    length: 35

  # The actual plugin constructor
  class TruncateMiddle
    constructor: (element, options) ->
      # jQuery has an extend method which merges the contents of two or
      # more objects, storing the result in the first object. The first object
      # is generally empty as we don't want to alter the default options for
      # future instances of the plugin
      @$element = $(element)
      @value = null
      @setOptions(options)
      @_defaults = defaults
      @_name = pluginName
      @_initialized = false
      @init()

    init: ->
      # Place initialization logic here
      # You already have access to the DOM element and the options via the instance,
      # e.g., @$element and @settings
      @originalText = @$element.text()
      @_initialized = true
      @render()
            
    setOptions: (options) ->
      @settings = $.extend {}, defaults, options
      @render()

    render: ->
      @$element.text(@truncatedString()) if @_initialized
      
    truncatedString: ->
      str = @originalText
      if @originalText.length > @settings.length
        # Calculates how many chars can be used before and after the ellipsis
        lengthPerSection = Math.floor((@settings.length - @settings.ellipsis.length) / 2)
        beginning = str.substr(0, lengthPerSection)
        end       = str.substr(str.length - lengthPerSection, str.length)
        str       = beginning + @settings.ellipsis + end
      str
      
  # A really lightweight plugin wrapper around the constructor,
  # preventing against multiple instantiations
  $.fn[pluginName] = (command, options = {}) ->
    options = command if command.constructor.name == "Object"
    @each ->
      if $.data(@, "plugin_#{pluginName}")
        plugin = $.data(@, "plugin_#{pluginName}")
        plugin.setOptions(options)
      else
        $.data @, "plugin_#{pluginName}", new TruncateMiddle @, options
