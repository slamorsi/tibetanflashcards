class TranslationCard < FlashCard
  belongs_to :original_card, class_name: FlashCard

  after_initialize :set_type
  def set_type
    self.type ||= OriginalCard.name if self.new_record?
  end

  rails_admin do
    configure :translation_card_id do
      hide
      # for list view
      filterable false
      searchable false
    end
  end
end
