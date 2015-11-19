//
// jquery.truncatemiddle › A naive implementation to trunacate strings in the middle like the Apple Finder does.
//
// Copyright (c) 2015 Christian Gambardella
//
// Licensed under the MIT license:
// http://www.opensource.org/licenses/mit-license.php
//
// Project home:
// https://github.com/nerdyglasses/jquery.truncatemiddle
//
// Version:  0.0.1
// 


(function() {
  (function($, window, document) {
    var TruncateMiddle, defaults, pluginName;
    pluginName = "truncateMiddle";
    defaults = {
      length: 35,
      ellipsis: ' ... '
    };
    TruncateMiddle = (function() {
      function TruncateMiddle(element, options) {
        this.$element = $(element);
        this.value = null;
        this.setOptions(options);
        this._defaults = defaults;
        this._name = pluginName;
        this._initialized = false;
        this.init();
      }

      TruncateMiddle.prototype.init = function() {
        this.originalText = this.$element.text();
        this._initialized = true;
        return this.render();
      };

      TruncateMiddle.prototype.setOptions = function(options) {
        this.settings = $.extend({}, defaults, options);
        return this.render();
      };

      TruncateMiddle.prototype.render = function() {
        if (this._initialized) {
          return this.$element.text(this.truncatedString());
        }
      };

      TruncateMiddle.prototype.truncatedString = function() {
        var beginning, end, lengthPerSection, str;
        str = this.originalText;
        if (this.originalText.length > this.settings.length) {
          lengthPerSection = Math.floor((this.settings.length - this.settings.ellipsis.length) / 2);
          beginning = str.substr(0, lengthPerSection);
          end = str.substr(str.length - lengthPerSection, str.length);
          str = beginning + this.settings.ellipsis + end;
        }
        return str;
      };

      return TruncateMiddle;

    })();
    return $.fn[pluginName] = function(command, options) {
      if (options == null) {
        options = {};
      }
      if (command.constructor.name === "Object") {
        options = command;
      }
      return this.each(function() {
        var plugin;
        if ($.data(this, "plugin_" + pluginName)) {
          plugin = $.data(this, "plugin_" + pluginName);
          if (plugin[command]) {
            return plugin[command](options);
          }
        } else {
          return $.data(this, "plugin_" + pluginName, new TruncateMiddle(this, options));
        }
      });
    };
  })(jQuery, window, document);

}).call(this);
