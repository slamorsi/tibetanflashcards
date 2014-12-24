class OriginalCard < FlashCard
  has_one :translation_card, class_name: FlashCard

  # attr_accessor :character, :background
  accepts_nested_attributes_for :translation_card, :allow_destroy => true

  rails_admin do
    configure :original_card do
      hide
    end
  end
end
