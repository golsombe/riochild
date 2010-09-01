require 'shoulda'
require 'test_helper'
class ChildTest < Test::Unit::TestCase
    should_have_many(:family_children)
    #should_have_many(:families).through(:family_children)
    should_have_many(:child_updates)
    should_have_many(:child_images)

    should_validate_presence_of(:first)
    should_validate_presence_of(:last)
    should_validate_numericality_of(:age)
    should_validate_numericality_of(:grade)
  end
