class BeerlistService
  def beer_by_name(name)
    perform_query("beers?name=#{name}")
  end

  private

  def perform_query(url)
    uri = URI("http://api.brewerydb.com/v2/#{url}")
    add_key_to_uri(uri)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def add_key_to_uri(uri)
    if uri.query
      uri.query += "&key=#{ENV["BEERLIST_KEY"]}"
    else
      uri.query = "key=#{ENV["BEERLIST_KEY"]}"
    end
  end
end
