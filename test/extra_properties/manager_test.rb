require 'test_helper'

class ExtraProperties::ManagerTest < ActiveSupport::TestCase

  # define custom property type
  class ExtraProperties::PropertyTypes::AddressType < ExtraProperties::PropertyTypes::BaseType
  end


  setup do
    @schema = [
      {"label"=>"Route number", "description"=>"", "type"=>"string", "required"=>false, "name"=>"route_number"},
      {"label"=>"Event date", "description"=>"", "type"=>"date", "required"=>true, "name"=>"event_date"},
      {"label"=>"Event address", "description"=>"", "type"=>"address", "required"=>true, "name"=>"event_address"},
      {"label"=>"Route desc", "description"=>"", "type"=>"string", "required"=>false, "name"=>"route_desc"}
    ]

    @db_values = {
      "route_number" => "984",
      "event_date" => "2012-02-01",
      "event_address_address" => "Lenina, 10",
      "event_address_lat" => "56.01396",
      "event_address_lng" => "92.88987"
    }
  end

  test "initialization without params" do
    assert_raise ArgumentError do
      manager = ExtraProperties::Manager.new
    end
  end

  test "empty initialization" do
    manager = ExtraProperties::Manager.new [], {}
    assert_equal [], manager.properties
    assert_equal [], manager.required_properties
  end

  test "should return properties of appropriate classes" do
    manager = ExtraProperties::Manager.new @schema, @db_values
    properties = manager.properties
    assert_equal 4, properties.length
    assert_equal ExtraProperties::PropertyTypes::StringType, properties[0].class
    assert_equal ExtraProperties::PropertyTypes::DateType, properties[1].class
    assert_equal ExtraProperties::PropertyTypes::AddressType, properties[2].class
    assert_equal ExtraProperties::PropertyTypes::StringType, properties[3].class
  end

end
