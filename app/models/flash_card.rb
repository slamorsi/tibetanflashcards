class FlashCard < ActiveRecord::Base
  validates :character, presence: true
  scope :random, lambda { |current=nil| current.nil? ? order("RANDOM()").limit(1) : where('id != ?',current.id).order("RANDOM()").limit(1)} 

  after_initialize :set_bg

  def set_bg
    self.background ||= "#000" if self.new_record?
  end
end
