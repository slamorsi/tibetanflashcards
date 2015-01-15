class FlashCard < ActiveRecord::Base
  validates :character, presence: true
  scope :random, lambda { |current=nil| current.nil? ? order("RANDOM()").limit(1) : where('id != ?',current.id).order("RANDOM()").limit(1)} 
  scope :alpha, lambda { order(:character)}

  after_initialize :set_bg

  def set_bg
    self.background ||= "#eee" if self.new_record?
  end
end
