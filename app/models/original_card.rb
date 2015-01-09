class OriginalCard < FlashCard
  has_one :translation_card, class_name: FlashCard

  after_initialize :set_type

  def set_type
    self.type ||= OriginalCard.name if self.new_record?
    # self.translation_card ||= TranslationCard.new
  end

  # attr_accessor :character, :background
  accepts_nested_attributes_for :translation_card, :allow_destroy => true
  def translation_card_id
    self.translation_card.try :id
  end
  def translation_card_id=(id)
    self.translation_card = TranslationCard.find_by_id(id)
  end

  rails_admin do
    configure :translation_card do
      render do
        bindings[:object].build_translation_card if bindings[:object].translation_card.nil?
        bindings[:object].translation_card.type = TranslationCard.name
        bindings[:view].render :partial => partial.to_s, :locals => {:field => self, :form => bindings[:form]}
      end
    end

    configure :original_card_id do
      hide
      # for list view
      filterable false
      searchable false
    end
  end
end
