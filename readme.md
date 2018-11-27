# Temperature converter

This simple, fast temperature converter converts between Celsius, Kelvin and Fahrenheit.

While the same output could be achieved with less lines of code, I find clear, easily understandable code to be less buggy and easier to maintain and expand in the long run.

## Usage example

```
require 'Temperature'

...

# Format
Temperature.convert(input_temp, from: 'something', to: 'something_else')

# Examples
Temperature.convert(30, from: 'fahrenheit') # 'to' defaults to Celsius if omitted

Temperature.convert(100, from: 'fahrenheit', to: 'kelvin')
```

## Installation

`$ bundle install`

## Tests

To run all tests, run `$ rspec`

For automatic testing of relevant files on file save, run `$ guard`