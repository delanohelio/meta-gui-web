(function() {

  window.Widget = (function() {

    function Widget(id, version, configuration) {
      this.id = id;
      this.version = version;
      this.configuration = configuration;
    }

    return Widget;

  })();

}).call(this);
