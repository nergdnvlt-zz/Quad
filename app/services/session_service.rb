class SessionService < BaseService

  def self.request(username)
    new(username).parsed_request
  end

  def parsed_request
    JSON.parse(request.body, symbolize_names: true)
  end

  private

  def initialize(username)
    @username = username
  end

  def request
    conn.post do |req|
      req.url '/api/v1/sessions'
      req.headers['Content-Type'] = 'application/json'
      req.body = "{\"username\": \"#{@username}\" }"
    end
  end
end
