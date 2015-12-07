class WelcomeController < ApplicationController
  def index

    @book = AmazonProxy.import_book('0321944275')
    search_term = params[:search] || 'harry potter'
    # @res  = Amazon::Ecs.item_search(search_term,  { :search_index => 'Books', :sort => 'relevancerank' })
    # @imgs = Amazon::Ecs.item_search(search_term,  { :response_group => 'Images',
    #                                                 :search_index => 'Books',
    #                                                 :sort => 'relevancerank' })
  end
end
