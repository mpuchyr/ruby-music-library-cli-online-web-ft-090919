require 'bundler'
Bundler.require

module Concerns
  module Findable
    def find_by_name(item_name)
      self.all.detect {|item| item.name == item_name}
    end

    def find_or_create_by_name(item_name)
      item = self.find_by_name(item_name)
      if !item
        item = self.create(item_name)
      end
      item
    end

    def new_from_filename(filename)

    end

    def create_from_filename(filename)

    end
  end
end

require_all 'lib'
