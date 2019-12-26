class Series
  attr_reader :numbers

  def initialize(input_chars)
    @numbers = input_chars.scan(/\d/).map(&:to_i)
    raise ArgumentError, 'invalid_character_in_digits' if numbers.size != input_chars.length
  end

  def largest_product(x)
    raise ArgumentError, 'given number is greater than source string length' if x > numbers.size || x.negative?

    return 1 if x.zero?

    product = numbers[0..x-1].inject(:*)
    summary = product
    i = x

    while i < numbers.size do

      if numbers[i].zero?
        i += x
        summary = product if product > summary
        product = numbers[i-x+1..i].inject(:*)
        next
      end

      current, prev = numbers[i], numbers[i-x]

      if current > prev
        if prev.zero?
          new_product = numbers[i-x+1..i].inject(:*)
          product = new_product if new_product > product
        else
          product = product * current / prev
        end
      else
        summary = product if product > summary
        product = numbers[i-x+1..i].inject(:*)
      end

      i += 1
    end

    summary = product if product > summary
    summary
  end
end
