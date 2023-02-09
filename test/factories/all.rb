FactoryBot.define do
  factory :post do
    title { 'Заголовок поста' }
    body { 'Содержимое поста' }

    trait :text_post do
      title { 'Заголовок текстового поста' }
      body { 'Содержимое текстового поста' }
      association :topic, factory: [:topic, :text]
    end
  end

  factory :topic do
    trait :text do
      add_attribute( :alias ) { 'text' }
      title { 'Текст' }
    end
  end
end
