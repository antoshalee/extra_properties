module ExtraProperties
  class Manager
    attr_reader :properties, :required_properties

    def initialize schema, db_values
      @schema = schema
      @db_values = db_values
      initialize_properties
    end

    def initialize_properties
      @properties = []
      @required_properties = []
      @schema.each do |definition|
        property = property_by_definition(definition)
        @properties << property
        @required_properties << property if definition['required']
      end
    end

  private

    def property_by_definition definition
      klass = get_property_klass(definition['type'])
      value = extract_property_value klass, definition['name']
      property = klass.new(definition, value)
    end

    def extract_property_value klass, prefix
      if klass.multistorage?
        klass.multistorage_postfixes.inject({}) do |result, postfix|
          result.merge(postfix => @db_values["#{prefix}_#{postfix}"])
        end
      else
        @db_values[prefix]
      end
    end

    def get_property_klass type
      Object.const_get("ExtraProperties").const_get("PropertyTypes").
        const_get("#{type.camelize}Type")
    end
  end
end