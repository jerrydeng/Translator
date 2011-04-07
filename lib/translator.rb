require 'rubygems'
require 'httparty'

module Translator
  include HTTParty

  dir = Pathname(__FILE__).dirname.expand_path

  require dir + '../config'

  def self.bot(string)
    key = CONFIGURATIONS[:key]
    sr  = CONFIGURATIONS[:source_language] || "en"
    ds  = CONFIGURATIONS[:destination_language] || "zh-TW"
    response = HTTParty.get('https://www.googleapis.com/language/translate/v2?key='+key+'&q='+string+'&source='+sr+'&target='+ds)
    response["data"]["translations"][0]["translatedText"]
  end
end
