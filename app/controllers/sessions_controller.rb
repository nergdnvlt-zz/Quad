class SessionsController < ApplicationController
  def new; end

  def create
    username = params['username']
    session = SessionService.create_session(username)
    binding.pry
  end
end

class BaseService
  def conn
    Faraday.new('https://machine-ltd.herokuapp.com/api/v1')
  end
end

class SessionService < BaseService

  def create_session(username)
    .new(username).parsed_request
  end

  def parsed_request
  end

  private

  def initialize(username)
    @username = username
  end

  def request
    conn.post do |req|
      req.url '/sessions'
      req.body = "{'username': '#{@username}' }"
  end
end
