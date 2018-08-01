class SessionsController < ApplicationController
  def new; end

  def create
    username = params['username']
    user_session = SessionService.request(username)
    if user_session[:session] == true
      session[:username] = username
      redirect_to sessions_path
    else
      render 404
    end
  end

  def index
    user = UserService.request(session[:username])
    @user = User.new(user)
    binding.pry
  end
end

class UserService < BaseService

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
    conn.get do |req|
      req.url "/api/v1/users/#{@username}"
    end
  end
end


class User
  attr_reader :username, :phone_number

  def initialize(attrs)
    @username = attrs[:username]
    @phone_number = attrs[:phone_number]
    @devices = attrs[:devices].map { |device| Devices.new(device) }
  end
end


class Devices
  attr_reader :pin_latitude,
              :pin_longitude,
              :radius,
              :alert,
              :last_location

  def initialize(attrs)
    @pin_latitude = attrs[:pin_lat]
    @pin_longitude = attrs[:pin_long]
    @radius = attrs[:radius]
    @alert = attrs[:alert]
    @last_location = LastLocation.new(attrs[:last_location])
  end
end


class LastLocation
  attr_reader :id,
              :location_latitude,
              :location_longitude,
              :distance,
              :time
              
  def initialize(attrs)
    @id = attrs[:id]
    @location_latitude = attrs[:lat]
    @location_longitude = attrs[:long]
    @distance = attrs[:distance]
    @time = attrs[:timestamp]
  end
end
