class FlashCard < ActiveRecord::Base
  scope :random, lambda { |current=nil| current.nil? ? order("RANDOM()").limit(1) : where('id != ?',current.id).order("RANDOM()").limit(1)} 
end
