class FlashCardsController < ApplicationController
  load_and_authorize_resource
  # before_action :set_flash_card, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    # @flash_cards = FlashCard.all
    respond_with(@flash_cards)
  end

  def show
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

    def flash_card_params
      params.require(:flash_card).permit(:character, :background, :type, :original_card_id)
    end
end
