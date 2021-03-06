module Badges
  class CategoryRuleService < BaseRuleService
    alias_method :category_title, :value

    private

    def perform_check
      Test.by_category(category_title).count ==
        user.successful_tests.by_category(category_title).distinct.count
    end

    def guard_check_passed?
      test.category.title == category_title
    end
  end
end
