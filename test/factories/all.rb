FactoryBot.define do
  factory :post do
    title { 'Заголовок поста' }
    body { 'Содержимое поста' }

    trait :text_post do
      title { 'Заголовок текстового поста' }
      body { 'Содержимое текстового поста' }
      association :topic, factory: [:topic, :text]
    end

    trait :image_post do
      title { 'Заголовок поста с картинкой' }
      body { 'Картинка' }
      association :topic, factory: [:topic, :text]
    end

    trait :image_post do
      title { 'Заголовок поста с фактом' }
      body { 'Описание факта' }
      association :topic, factory: [:topic, :text]
    end
  end

  factory :topic do
    trait :text do
      add_attribute( :alias ) { 'text' }
      title { 'Текст' }
    end

    trait :images do
      add_attribute( :alias ) { 'images' }
      title { 'Картинки' }
    end

    trait :facts do
      add_attribute( :alias ) { 'facts' }
      title { 'Факты' }
    end
  end
end
