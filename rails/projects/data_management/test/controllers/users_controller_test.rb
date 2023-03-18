require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  # test 'index_route' do
  #   assert_generates '/index', { controller: 'users', action: 'index' }
  # end
  # test 'about_route' do
  #   assert_recognizes( { controller: 'users', action: 'about'}, '/about' )
  # end
  test 'about_route' do
    assert_routing( { path: 'about' }, { controller: 'users', action: 'about' } )
  end
end
