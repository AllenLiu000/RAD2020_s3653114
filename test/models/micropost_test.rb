require 'test_helper'

class MicropostTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @micropost = @user.microposts.build(topic: "Game", title: "game title", content: "Lorem ipsum", views_count: 0)
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "topic should be present" do
    @micropost.topic = "   "
    assert_not @micropost.valid?
  end

  test "title should be present" do
    @micropost.title = "   "
    assert_not @micropost.valid?
  end

  test "title should be at most 150 characters" do
    @micropost.title = "a" * 151
    assert_not @micropost.valid?
  end

  test "content should be present" do
    @micropost.content = "   "
    assert_not @micropost.valid?
  end

  test "content should be at most 500 characters" do
    @micropost.content = "a" * 501
    assert_not @micropost.valid?
  end

  test "views_count should be present" do
    @micropost.views_count = nil
    assert_not @micropost.valid?
  end

  test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end
end