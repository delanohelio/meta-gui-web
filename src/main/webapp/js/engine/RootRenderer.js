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
        widget = RenderingEngine.getWidget(entityType, null, 'root');
        return DataManager.getEntityType(entityType.id, function(entityTypeFull) {
          widget.entityType = entityTypeFull;
          return widget.render(View.emptyPage());
        });
      });
    };

    return RootRenderer;

  })();

}).call(this);
