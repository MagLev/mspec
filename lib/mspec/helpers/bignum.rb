class Object
  def bignum_value(plus=0)
    0x8000_0000_0000_0000 + plus
  end

  def fixnum_max
    Fixnum::MAX
  end
  def fixnum_min
    Fixnum::MIN
  end
end
