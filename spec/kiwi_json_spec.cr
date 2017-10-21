require "./spec_helper"
require "kiwi/memory_store"
require "json"

class Person
  JSON.mapping(name: String)
end

describe Kiwi::JSON do
  it "writes/reads the type" do
    store = Kiwi::MemoryStore.new
    json_store = Kiwi::JSON(Person).delegate(store)
    gal = Person.from_json(%{{"name": "Gal"}})

    json_store["key"] = gal
    json_store["key"].name.should eq(gal.name)
  end

  it "throws on nils" do
    store = Kiwi::MemoryStore.new
    json_store = Kiwi::JSON(Person).delegate(store)
    expect_raises(Kiwi::JSON::KeyNotFound) do
      json_store["nil"]
    end
  end
end
