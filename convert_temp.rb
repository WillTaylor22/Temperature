def convert_temp(input_temp, input_scale, output_scale: 'celsius')
    ## Converts temperatures to other scales.
    ## Works by first converting to celcius and then to output scale
    # F = (C × 9/5) + 32
    # K = (C x 1) - 273

    CELCIUS_TO_FARENHEIT_ADDITION = 32
    CELCIUS_TO_FARENHEIT_MULTIPLICATION = 9/5
    CELCIUS_TO_KELVIN_ADDITION = -273
    CELCIUS_TO_KELVIN_MULTIPLICATION = 1

    unless %w(celcius fahrenheit kelvin).include? input_scale
      # return "Invalid input scale - must be celcius, fahrenheit or kelvin"
    end
        
    case input_scale
    when 'celcius'
      input_to_celcius_addition = 0
      input_to_celcius_multiplication = 1
    when 'fahrenheit'
      input_to_celcius_addition = CELCIUS_TO_FARENHEIT_ADDITION
      input_to_celcius_multiplication = CELCIUS_TO_FARENHEIT_MULTIPLICATION
    when 'kelvin'
      input_to_celcius_addition = CELCIUS_TO_KELVIN_ADDITION
      input_to_celcius_multiplication = CELCIUS_TO_KELVIN_MULTIPLICATION
    end

    temp_celcius = (input_temp * input_to_celcius_multiplication) + input_to_celcius_addition
      
    case output_scale
    when 'fahrenheit'
      celcius_to_output_addition = -CELCIUS_TO_FARENHEIT_ADDITION
      celcius_to_output_multiplication = 1/CELCIUS_TO_FARENHEIT_MULTIPLICATION
    when 'kelvin'
      celcius_to_output_addition = -CELCIUS_TO_KELVIN_ADDITION
      celcius_to_output_multiplication = 1/CELCIUS_TO_KELVIN_MULTIPLICATION
    else # 'celcius'; pefaults to celcius output
      celcius_to_output_addition = 0
      celcius_to_output_multiplication = 1
    end

    (temp_celcius * celcius_to_output_multiplication) + celcius_to_output_addition
end