module BooksHelper
  def image_from_amazon(amazon_id)
    # image_tag "http://images.amazon.com/images/P/#{amazon_id}.01.ZTZZZZZZ.jpg"
    image_tag "http://ecx.images-amazon.com/images/I/#{amazon_id}._AA160_.jpg"
  end
end
