require File.dirname(__FILE__) + '/../test_helper'
require 'case_controller'

# Re-raise errors caught by the controller.
class CaseController; def rescue_action(e) raise e end; end

class CaseControllerTest < Test::Unit::TestCase
  def setup
    @controller = CaseController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
