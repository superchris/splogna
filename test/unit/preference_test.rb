require 'test_helper'

class PreferenceTest < ActiveModel::TestCase
  include ActiveModel::Lint::Tests

  setup do
    @model = Preference.new
  end
end
