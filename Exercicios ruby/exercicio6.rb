class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
  def method_missing(method_id, *args, &block) # capture all args in case have to call super
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(currency_name)
    dest_currency = currency_name.to_s.gsub(/s$/,'')
    puts self / @@currencies[dest_currency]
  end
end

5.dollars.in(:euros)
10.euros.in(:rupees)
