(function() {

  window.View = {};

  View.emptyPage = function() {
    var body, page;
    body = $("body");
    body.empty();
    page = $('<div>');
    body.append(page);
    return page;
  };

}).call(this);
