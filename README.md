# bresenham

Ruby implementation of the Bresenham's line algorithm.

Usable as both a Ruby gem (CRuby) and a mrbgem (mruby).

## CRuby Installation

Put the following into your `Gemfile`:

``` ruby
gem "bresenham", git: "https://github.com/Dan2552/bresenham"
```

## mruby Installation

Put the following into your `Mundlefile`([?](https://github.com/Dan2552/mundler)) or `build_config.rb`:

``` ruby
conf.gem :git => 'https://github.com/Dan2552/bresenham'
```

## Usage

``` bash
Bresenham::Line.iterate_line(x0, y0, x1, y1) do |x, y|
  draw_pixel(x, y)
end
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
