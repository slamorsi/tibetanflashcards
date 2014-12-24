class TranslationCard < FlashCard
  belongs_to :original_card, class_name: FlashCard

  rails_admin do
    configure :translation_card do
      hide
    end
  end
end
