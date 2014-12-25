class FlashCardsController < ApplicationController
  load_and_authorize_resource
  # before_action :set_flash_card, only: [:show, :edit, :update, :destroy]
  before_action :set_type, only: [:new]

  before_action :set_s3_post, only: [:new, :edit]

  respond_to :html

  def index
    # @flash_cards = FlashCard.all
    respond_with(@flash_cards)
  end

  def show
    @next_card = OriginalCard.random((@flash_card.is_a? OriginalCard) ? @flash_card : nil)
    if(@next_card != nil)
      @next_card = original_card_path(@next_card.first)
    end
    respond_with(@flash_card) 
    # do |format|
    #   if(@flash_card.type == OriginalCard.name) then
    #     format.html {render "original_cards/show"}
    #   elsif(@flash_card.type == TranslationCard.name) then
    #     format.html {render "translation_cards/show"}
    #   end
    # end
  end

  def new
    # @flash_card = FlashCard.new
    respond_with(@flash_card)
  end

  def edit
  end

  def create
    # @flash_card = FlashCard.new(flash_card_params)
    @flash_card.save
    respond_with(@flash_card)
  end

  def update
    @flash_card.update(flash_card_params)
    respond_with(@flash_card)
  end

  def destroy
    @flash_card.destroy
    respond_with(@flash_card)
  end

  private
    # def set_flash_card
    #   @flash_card = FlashCard.find(params[:id])
    # end
    def set_type
      @flash_card.type = params[:type]
    end

    def set_s3_post
      if(@flash_card.type == OriginalCard.name)
        #add this back in part of key name if uniqueness is required #{SecureRandom.uuid} 
        @s3_direct_post = S3_BUCKET.presigned_post(key: "audio/${filename}", success_action_status: 201, acl: :public_read)
      end
    end

    def flash_card_params
      params.require(:flash_card).permit(:character, :background, :type, :original_card_id, :audio_file)
    end
end
