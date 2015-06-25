(function() {

  window.RelationshipWidget = (function() {

    function RelationshipWidget() {}

    RelationshipWidget.prototype.render = function(view, relationType, relation) {};

    RelationshipWidget.prototype.populateSelectField = function(selectField, resource, propertyKey, relationshipIds) {
      var _this = this;
      return DataManager.getEntities(resource, function(entities) {
        return entities.forEach(function(entity) {
          var option;
          option = new Option(entity.id);
          if (propertyKey) {
            option = new Option(entity[propertyKey], entity.id);
          }
          selectField.append(option);
          if (relationshipIds && relationshipIds.indexOf(entity.id) !== -1) {
            return option.selected = true;
          }
        });
      });
    };

    return RelationshipWidget;

  })();

}).call(this);
