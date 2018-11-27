module Temperature
  require 'byebug'

  ## Converts temperatures to other scales.
  ## Works by first converting to celsius and then to output scale
  # F = (C × 9/5) + 32 => C = (F - 32) / 9/5
  # K = (C x 1) + 273.15  => C = (K - 273.15) / 1

  CELSIUS_TO_FAHRENHEIT_ADDITION = 32
  CELSIUS_TO_FAHRENHEIT_MULTIPLICATION = 9.0/5
  CELSIUS_TO_KELVIN_ADDITION = 273.15
  CELSIUS_TO_KELVIN_MULTIPLICATION = 1

  def Temperature.convert(input, from:, to: 'celsius')
    # "input" is the input temperature
    # "from" is the input temparature's scale
    # "to" is the output temparature's scale, default: 'celsius'

    from.downcase!
    to.downcase!
    unless %w(celsius fahrenheit kelvin).include? from
      raise ArgumentError, "Invalid input scale - must be celsius, fahrenheit or kelvin"
    end

    case from
    when 'celsius'
      input_to_celsius_addition = 0
      input_to_celsius_multiplication = 1
    when 'fahrenheit'
      input_to_celsius_addition = CELSIUS_TO_FAHRENHEIT_ADDITION
      input_to_celsius_multiplication = CELSIUS_TO_FAHRENHEIT_MULTIPLICATION
    when 'kelvin'
      input_to_celsius_addition = CELSIUS_TO_KELVIN_ADDITION
      input_to_celsius_multiplication = CELSIUS_TO_KELVIN_MULTIPLICATION
    end

    temp_celsius = (input - input_to_celsius_addition) / input_to_celsius_multiplication

    case to
    when 'fahrenheit'
      celsius_to_output_addition = CELSIUS_TO_FAHRENHEIT_ADDITION
      celsius_to_output_multiplication = CELSIUS_TO_FAHRENHEIT_MULTIPLICATION
    when 'kelvin'
      celsius_to_output_addition = CELSIUS_TO_KELVIN_ADDITION
      celsius_to_output_multiplication = CELSIUS_TO_KELVIN_MULTIPLICATION
    else # 'celsius'; defaults to celsius output
      celsius_to_output_addition = 0
      celsius_to_output_multiplication = 1
    end

    (temp_celsius * celsius_to_output_multiplication) + celsius_to_output_addition
  end
end