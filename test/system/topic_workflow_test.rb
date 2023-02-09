require 'test_helper'
require 'application_system_test_case'

class TopicWorkflowTest < ApplicationSystemTestCase
  def setup
    @post_image = create(:post, :image_post)
    @post_fact = create(:post, :fact_post)
    @post_text = create(:post, :text_post)
  end

  test 'topic pages' do
    topics = [
      {
        "path" => "/posts/text",
        "page_title" => "Текст",
        "post" => @post_text
      },
      {
        "path" => "/posts/images",
        "page_title" => "Картинки",
        "post" => @post_image
      },
      {
        "path" => "/posts/facts",
        "page_title" => "Факты",
        "post" => @post_fact
      }
    ]

    topics.each do |topic_data|
      visit topic_data["path"]
      page.has_content?(topic_data["page_title"])
      page.has_content?(topic_data["post"].title)
      page.has_content?(topic_data["post"].body)
    end
  end
end
