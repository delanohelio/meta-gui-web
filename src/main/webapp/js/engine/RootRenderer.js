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
      return entitesType.forEach(function(entityType) {
        return _this.drawLine(table, entityType);
      });
    };

    RootRenderer.prototype.drawLine = function(table, entityType) {
      var tr,
        _this = this;
      tr = $("<tr><td>" + entityType.name + "</td></tr>");
      tr.attr("id", "entityType_" + entityType.name);
      table.append(tr);
      return tr.click(function() {
        var widget;
        widget = RederingEngine.getWidget(entityType, null, 'root');
        return DataManager.getEntityType(entityType.id, function(entityTypeFull) {
          return DataManager.getEntities(entityTypeFull.resource, function(entities) {
            return widget.render(View.emptyPage(), entityTypeFull, entities);
          });
        });
      });
    };

    return RootRenderer;

  })();

}).call(this);
