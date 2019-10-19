# frozen_string_literal: true

require 'httparty'

class InternetStatusChecker
  def initialize(urls_to_check:)
    @urls_to_check = urls_to_check
  end

  def online?
    @urls_to_check.all? { |url| responding?(url) }
  end

  private

  def responding?(url)
    HTTParty.get(url)
  rescue SocketError
    false
  end
end
