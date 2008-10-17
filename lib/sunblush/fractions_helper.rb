module Sunblush
  module FractionsHelper
    def nice_fraction(float, options={})
      f = float.to_fraction
      opts = {:html=>false, :top=>'sup', :bottom=>'sub'}.merge!(options)
      if opts[:html]
        "<span class=\"fraction\"><#{opts[:top]}>#{f.first}</#{opts[:top]}>&frasl;<#{opts[:bottom]}>#{f.last}</#{opts[:bottom]}></span>"
      else
        "#{f.first}/#{f.last}"
      end
    end
  end
end
