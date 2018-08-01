class BaseService
  def conn
    Faraday.new('https://machine-ltd.herokuapp.com')
  end
end
