require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "post is valid when all props are specified" do
    assert build(:post, :text_post).valid?
  end

  test "post without topic fails validation" do
    refute build(:post).valid?
  end

  test "post with empty title fails validation" do
    refute build(:post, :text_post, title: '').valid?
  end

  test "post with empty body fails validation" do
    refute build(:post, :text_post, body: '').valid?
  end

  test "post with too long title fails validation" do
    refute build(:post, :text_post, title: 'Z' * 301).valid?
  end
end
