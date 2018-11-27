require 'Temperature'

describe 'Temperature.convert' do
  it 'converts fahrenheit to celsius' do
    expect(Temperature.convert(0, from: 'fahrenheit').round(2) ).to eq -17.78
    expect(Temperature.convert(100, from: 'fahrenheit').round(2) ).to eq 37.78
  end

  it 'converts celsius to fahrenheit' do
    expect(Temperature.convert(0, from: 'celsius', to: 'fahrenheit').round(2) ).to eq 32.00
    expect(Temperature.convert(100, from: 'celsius', to: 'fahrenheit').round(2) ).to eq 212.00
  end

  it 'converts kelvin to celsius' do
    expect(Temperature.convert(0, from: 'kelvin').round(2) ).to eq -273.15
    expect(Temperature.convert(100, from: 'kelvin').round(2) ).to eq -173.15
  end

  it 'converts celsius to kelvin' do
    expect(Temperature.convert(0, from: 'celsius', to: 'kelvin').round(2) ).to eq 273.15
    expect(Temperature.convert(100, from: 'celsius', to: 'kelvin').round(2) ).to eq 373.15
  end

  it 'converts kelvin to fahrenheit' do
    expect(Temperature.convert(0, from: 'kelvin', to: 'fahrenheit').round(2) ).to eq -459.67
    expect(Temperature.convert(100, from: 'kelvin', to: 'fahrenheit').round(2) ).to eq -279.67
  end

  it 'converts fahrenheit to kelvin' do
    expect(Temperature.convert(0, from: 'fahrenheit', to: 'kelvin').round(2) ).to eq 255.37
    expect(Temperature.convert(100, from: 'fahrenheit', to: 'kelvin').round(2) ).to eq 310.93
  end

  it 'ignores case of input' do
    expect(Temperature.convert(0, from: 'fahrenheit').round(2) ).to eq -17.78
    expect(Temperature.convert(0, from: 'Fahrenheit').round(2) ).to eq Temperature.convert(0, from: 'fahrenheit').round(2)
  end

  it 'defaults to celsius' do
    expect(Temperature.convert(0, from: 'fahrenheit').round(2) ).to eq -17.78
    expect(Temperature.convert(0, from: 'fahrenheit').round(2) ).to eq Temperature.convert(0, from: 'fahrenheit', to: 'celsius').round(2)
  end

  it 'returns an error message when input is not celsius, fahrenheit or kelvin' do
    expect{ Temperature.convert(0, from: 'rankine', to: 'celsius') }.to raise_error ArgumentError, "Invalid input scale - must be celsius, fahrenheit or kelvin"
  end
end