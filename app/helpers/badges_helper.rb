module BadgesHelper
  IMAGES = [
    ["Diamond", '/images/diamond.svg'],
    ["Star", '/images/star.svg'],
    ["Thumb", '/images/thumb.svg']
  ].freeze

  RULES = [
    ["Successful passing of all tests of a certain category", :category],
    ["Successful passing of all tests of a certain level", :level],
    ["Successful passing the test with a certain attempt", :attempt]
  ].freeze

  def badge_image_url_options
    IMAGES
  end

  def badge_rule_name_options
    RULES
  end
end
