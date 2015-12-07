# app/models/amazon_proxy.rb
require 'amazon/ecs'
class AmazonProxy
  Amazon::Ecs.configure do |options|
    options[:AWS_access_key_id] = ENV['AWSAccessKeyId']
    options[:AWS_secret_key]    = ENV['AWSSecretKey']
    options[:associate_tag]     = 'vgsa-20'
  end

  def self.get_price(asin)
    item = fetch(asin)
    # item.get('OfferSummary/LowestNewPrice/FormattedPrice')
    price = {amount: item.get('OfferSummary/LowestNewPrice/Amount').to_i,
             formated_price: item.get('OfferSummary/LowestNewPrice/FormattedPrice')}
    # price = price.insert(-3,'.');
    # formated_price = '$' + price.to_s
  end


  def self.import_boardgame(asin)
    item = fetch(asin)
    save_boardgame asin, item
  end

  def self.save_boardgame(asin,item)
    return if Boardgame.exists?(asin: asin)

    options                          = {}
    image_url                        = item.get_hash('MediumImage')['URL']
    item_attributes                  = item.get_element('ItemAttributes')
    options[:asin]                   = asin
    options[:title]                  = item_attributes.get('Title')
    options[:published_at]           = item_attributes.get('PublicationDate')
    options[:author]                 = item_attributes.get_array('Author').join(', ')
    options[:amazon_image_url]       = image_url
    options[:small_image]            = item.get_hash('SmallImage')['URL']
    options[:description]            = item.get('EditorialReviews/EditorialReview/Content')
    options[:amazon_link]            = item.get('DetailPageURL')
    options[:lowest_price]           = item.get('OfferSummary/LowestNewPrice/Amount')
    options[:lowest_price_formatted] = item.get('OfferSummary/LowestNewPrice/FormattedPrice')
    
    # options[:image_url]        = save_image(asin, image_url)
    Boardgame.create! options
    
  end

  private
    def self.fetch(asin)
      result = Amazon::Ecs.item_lookup(asin, { :response_group => 'Medium' })
      # result = Amazon::Ecs.item_search('ruby')
      result.items[0]
    end
end