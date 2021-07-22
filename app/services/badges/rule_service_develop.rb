module Badges
  module RuleServiceDevelop
    class << self
      def build(badge, test_passage)
        service_name(badge).constantize.new(badge.rule_value, test_passage)
      end

      private

      def service_name(badge)
        "Badges::#{badge.rule.camelcase}RuleService"
      end
    end
  end
end
