(function() {

  window.RootRenderer = (function() {

    function RootRenderer() {}

    RootRenderer.prototype.render = function(view, entitesType) {
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
      var tr,
        _this = this;
      tr = $("<tr><td>" + entity.name + "</td></tr>");
      tr.attr("id", "entity_" + entity.name);
      table.append(tr);
      return tr.click(function() {
        return RederingEngine.entityEvent(View.emptyPage(), entity, 'root');
      });
    };

    return RootRenderer;

  })();

}).call(this);
