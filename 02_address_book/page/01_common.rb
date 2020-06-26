module Ezframe
  class Html
    def self.hook_for_convert(ht_h)
      return Materialize.convert(ht_h)
    end
  end
end