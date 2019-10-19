require 'httparty'

class InternetStatusChecker
  def initialize(urls_to_check:)
    @urls_to_check = urls_to_check
  end

  def online?
    @urls_to_check.all? { |url| is_responding?(url) }
  end

  private

  def is_responding?(url)
    r = HTTParty.get(url)
    r.code >= 200 and r.code < 400
  end
end
