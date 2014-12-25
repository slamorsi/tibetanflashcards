class AddAudioFileToFlashCards < ActiveRecord::Migration
  def change
    add_column :flash_cards, :audio_file, :string
  end
end
