require "delegator"
require "kiwi"

# This class delegates another `Kiwi::Store` and provides
# an interface to use classes with `JSON.mapping` in Kiwi stores.
#
# Usage:
#
# ```
#     user = Person.from_json(...)
#     some_store = Kiwi::MemoryStore.new
#     json_store = Kiwi::JSON(Person).new(some_store)
#     json_store["user"] = user
#     json_store["user"] # => serialized <User:...>
# ```
class Kiwi::JSON(C) < Delegator(Kiwi::Store)
  class KeyNotFound < Exception; end

  # Read something from the delegated store.
  # Raises error on `nil` values
  def get(key : String)
    str_value = @object[key]
    if str_value.nil?
      raise KeyNotFound.new("Key `#{key}` not found in store")
    else
      C.from_json(str_value)
    end
  end

  # Set `key` to be `value`. When `value` is `nil`,
  # it will be removed.
  def set(key : String, value : C?)
    if value.nil?
      @object[key] = value
    else
      @object[key] = value.to_json
    end
  end

  def []=(key : String, value : C?)
    set(key, value)
  end

  def [](key)
    get(key)
  end
end
