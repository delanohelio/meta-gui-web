(function() {
  var RootRenderer;

  RootRenderer = (function() {

    function RootRenderer() {}

    RootRenderer.prototype.render = function(view, entitesType, conf) {
      var table, th,
        _this = this;
      table = $("<table>");
      view.append(table);
      th = $("<tr><th>Entities</th></tr>");
      th.attr("id", "entities");
      table.append(th);
      return entitesType.forEach(function(entity) {
        return _this.drawLine(table, entity);
      });
    };

    RootRenderer.prototype.drawLine = function(table, entity) {
      var tr;
      tr = $("<tr><td>" + entity.name + "</td></tr>");
      tr.attr("id", "entity_" + entity.name);
      return table.append(tr);
    };

    return RootRenderer;

  })();

  return new RootRenderer;

}).call(this);
