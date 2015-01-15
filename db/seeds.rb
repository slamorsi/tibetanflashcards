# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file .env file.


tibetanChars = %w(ཀ ཁ ག ང ཅ ཆ ཇ ཉ ཏ ཐ ད ན པ ཕ བ མ ཙ ཚ ཛ ཝ ཞ ཟ འ ཡ ར ལ ཤ ས ཧ ཨ)
translations = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z AA BB CC DD)
audoFiles = %w(
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/1.+ka%CC%84.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/2.+kha%CC%84.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/3.+kha%CC%B2.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/4.+nga%CC%B2.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/5.+ca%CC%84.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/6.+cha%CC%84.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/7.+cha%CC%B2.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/8.+nya%CC%B2.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/9.+ta%CC%84.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/10.+tha%CC%84.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/11.+tha%CC%B2.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/12.+na%CC%B2.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/13.+pa%CC%84.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/14.+pha%CC%84.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/15.+pha%CC%B2.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/16.+ma%CC%B2.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/17.+tsa%CC%84.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/18.+tsha%CC%84.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/19.+thsa%CC%B2.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/20.+wa%CC%B2.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/21.+sha%CC%B2.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/22.+sa%CC%B2.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/23.+a%CC%B2.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/24.+ya%CC%B2.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/25.+ra%CC%B2.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/26.+la%CC%B2.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/27.+sha%CC%84.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/28.+sa%CC%84.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/29.+ha%CC%84.mp3
  https://s3.amazonaws.com/tibetanflashcards/alphabet+pronunciations/30.+a%CC%84.mp3
)

tibetanChars.each_with_index {|item, index|
  OriginalCard.create(character: item, audio_file:audoFiles[index],translation_card_attributes: {character: translations[index], type: TranslationCard.name})  
}