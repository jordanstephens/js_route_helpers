# JsRouteHelpers

Use Rails route helpers in your javascript.

For example, take the following route definition:

**config/routes.rb**

    get "/users/:id", to: "users#show", as: :user

Rails gives you a `user_path` helper, which you can use like this:

```ruby
user_path(3) # => "/users/3"
```

JsRouteHelpers gives you a similar javascript helper:

```javascript
RouteHelpers.userPath(3) // => "/users/3"
```

**NOTE**: Javascript names are conventionally camelCase, so make sure to use the camelCase versions of your route helpers when calling them client-side.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'js_route_helpers'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install js_route_helpers

## Usage

### Setup

1. Define a route pattern whitelist in an initializer. Each item in the list should be a regular expression. If a route helper's name matches any pattern in the list, it will be exposed to the client in the javascript file.

    **config/initializers/js_route_helpers.rb**

    ```ruby
    JsRouteHelpers.include [
      %r(user),
      %r(post)
    ]
    ```

    **Important**: *You must whitelist any route you wish to expose.* You will probably not want to expose all of your routes. No routes are whitelisted by default.

2. Now, require `route_helpers` in your javascript file.

    **app/assets/javascripts/application.js**

    ```javascript
    //= require route_helpers
    ```

3. Now you can use your route helpers in your javascript just like you would in ruby.

    ```javascript
    RouteHelpers.userPath(3, { param: "value", format: "json" }) // => "/users/3.json?param=value"
    ```

* * *

**Important!**

You may need to flush the asset cache after making changes to `config/routes.rb` in order to force the changes to propagate into `route_helpers.js`. You can do this by running

```shell
$ rake tmp:cache:clear
```

This shouldn't be _too_ much of a nuisance in the long run, as routes tend to be fairly stable.

* * *

### Examples

Here are some example rails route helpers, and then the javascript counterparts provided by JsRouteHelpers:

**ruby**:
```ruby
user_path(3) # => "/users/3"
user_path(3, { param: "value" }) # => "/users/3?param=value"
user_path(3, { param: "value", format: "json" }) # => "/users/3.json?param=value"
user_path(3, { list: [1, 2] }) # => "/users/3?list%5B%5D=1&list%5B%5D=2"
```

**javascript**:
```javascript
RouteHelpers.userPath(3) // => "/users/3"
RouteHelpers.userPath(3, { param: "value" }) // => "/users/3?param=value"
RouteHelpers.userPath(3, { param: "value", format: "json" }) // => "/users/3.json?param=value"
RouteHelpers.userPath(3, { list: [1, 2] }) // => "/users/3?list%5B%5D=1&list%5B%5D=2"
```

Again, note that JsRouteHelper method names are camelCase to follow javascript convention.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/js_route_helpers/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
