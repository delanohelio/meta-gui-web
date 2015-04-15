(function() {

  window.RulesManager = {};

  RulesManager.STORAGE_TAG = "RULES";

  RulesManager.downloadAllRules = function() {
    var _this = this;
    return $.getJSON('http://localhost:8081/rules', function(rules) {
      return rules.forEach(function(rule) {
        return simpleStorage.set(RulesManager.STORAGE_TAG + rule.providedContext.name + rule.propertyTypeTypeLocator, rule);
      });
    });
  };

  RulesManager.getRule = function(context, propertyTypeTypeLocator) {
    var rule;
    console.log("opa");
    rule = simpleStorage.get(RulesManager.STORAGE_TAG + context + propertyTypeTypeLocator);
    if (typeof rule === "undefined") {
      rule = simpleStorage.get(RulesManager.STORAGE_TAG + context);
    }
    return rule;
  };

}).call(this);
