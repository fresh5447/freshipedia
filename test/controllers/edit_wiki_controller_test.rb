require 'test_helper'

class EditWikiControllerTest < ActionController::TestCase
  test "should get show_wiki" do
    get :show_wiki
    assert_response :success
  end

  test "should get add_collaborators" do
    get :add_collaborators
    assert_response :success
  end

end
