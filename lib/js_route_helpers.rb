require "js_route_helpers/engine"
require "js_route_helpers/version"

module JsRouteHelpers
  @whitelist_patterns = []

  def self.include(patterns)
    @whitelist_patterns = patterns
  end

  def self.routes
    ::Rails.application.reload_routes!
    ::Rails.application.routes.named_routes.routes.select do |name, route|
      @whitelist_patterns.any? { |r| r.match(name) }
    end
  end
end
