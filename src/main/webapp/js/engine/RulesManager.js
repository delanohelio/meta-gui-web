(function() {

  window.RulesManager = {};

  RulesManager.STORAGE_TAG = "RULES";

  RulesManager.downloadAllRules = function() {
    var _this = this;
    return $.getJSON('http://localhost:8081/rules', function(rules) {
      return rules.forEach(function(rule) {
        return simpleStorage.set(RulesManager.STORAGE_TAG + rule.providedContext.name, rule);
      });
    });
  };

  RulesManager.getRule = function(context) {
    return simpleStorage.get(RulesManager.STORAGE_TAG + context);
  };

}).call(this);
