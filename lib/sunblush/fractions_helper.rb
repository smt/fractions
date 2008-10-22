module Sunblush
  module FractionsHelper
    def nice_fraction(num, options={})
      f = num.to_fraction
      opts = {:html=>false, :top=>'sup', :bottom=>'sub'}.merge!(options)
      if opts[:html]
        "<span class=\"fraction\"><#{opts[:top]}>#{f.first}</#{opts[:top]}>&frasl;<#{opts[:bottom]}>#{f.last}</#{opts[:bottom]}></span>"
      else
        "#{f.first}/#{f.last}"
      end
    end
  
    def fractionize(num, options={})
      opts = { :html => true, :dash => false }.merge!(options)
      if num.to_f == 0.0
        0
      elsif num.to_f - num.to_i == 0.0
        num.to_i
      elsif num.to_f < 1.0
        nice_fraction(num.to_f, opts)
      else
        str = "#{num.to_i}"
        str += opts[:dash] == true ? "-" : " "
        str += "#{nice_fraction((num.to_f - num.to_i), opts)}"
        str
      end
    end
  end
end
