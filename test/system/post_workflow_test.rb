require 'test_helper'
require 'application_system_test_case'

class PostWorkflowTest < ApplicationSystemTestCase
  def setup
    @post = create(:post, :text_post)
    create(:topic, :images)
    create(:topic, :facts)
  end

  test 'post show' do
    visit "/posts/#{@post.id}"

    assert page.has_content?(@post.title)
    assert page.has_content?(@post.body)
  end

  test 'successful post create and edit' do
    # creating post
    visit new_post_path

    fill_in "Заголовок", with: "Интересный факт"
    fill_in "Текст",  with: "Рассказ про этот факт"
    select("Факты", from: "Тема")

    click_on "Создать"

    post_id =  Post.last.id.to_s
    assert_current_path "#{posts_path}/#{post_id}"
    assert page.has_content?("Интересный факт")
    assert page.has_content?("Рассказ про этот факт")

    # editing post
    visit "#{posts_path}/#{post_id}/edit"
    page.has_select?('post[topic]', selected: 'Факты')
    fill_in "Заголовок", with: "Новая причёска"
    fill_in "Текст",  with: "Несколько картинок"
    select("Картинки", from: "Тема")

    click_on "Сохранить"
    assert_current_path "#{posts_path}/#{post_id}"
    assert page.has_content?("Новая причёска")
    assert page.has_content?("Несколько картинок")
    visit "#{posts_path}/#{post_id}/edit"
    page.has_select?('post[topic]', selected: 'Картинки')
  end

  test 'post create validation errors' do
    # creating post
    visit new_post_path

    fill_in "Заголовок", with: ""
    fill_in "Текст",  with: ""

    click_on "Создать"

    assert page.has_content?("Заголовок не может быть пустым")
    assert page.has_content?("Текст не может быть пустым")

    fill_in "Заголовок", with: "x" * 301

    click_on "Создать"
    assert page.has_content?("Заголовок должен быть меньше 300 символов")
  end

  test 'post edit validation errors' do
    # editing post
    visit "#{posts_path}/#{@post.id}/edit"

    fill_in "Заголовок", with: ""
    fill_in "Текст",  with: ""

    click_on "Сохранить"

    assert page.has_content?("Заголовок не может быть пустым")
    assert page.has_content?("Текст не может быть пустым")

    fill_in "Заголовок", with: "x" * 301

    click_on "Сохранить"
    assert page.has_content?("Заголовок должен быть меньше 300 символов")
  end
end
