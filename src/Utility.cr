# The problem with Colorize is that it will add methods to other classes.
# However, Anyolite does not know what to do with these, so we need to
# exclude them using the original module.

module Colorize
  @[Anyolite::ExcludeInstanceMethod("colorize")]
  module ObjectExtensions
  end
end

module ScapoLite
  COLOR_CODES = [
    :black, :red, :green, :yellow, 
    :blue, :magenta, :cyan, 
    :light_gray, :dark_gray, 
    :light_red, :light_green, :light_yellow, :light_blue, 
    :light_magenta, :light_cyan, 
    :white
  ]

  COLOR_CODE_BLACK = 0
  COLOR_CODE_RED = 1
  COLOR_CODE_GREEN = 2
  COLOR_CODE_YELLOW = 3
  COLOR_CODE_BLUE = 4
  COLOR_CODE_MAGENTA = 5
  COLOR_CODE_CYAN = 6
  COLOR_CODE_LIGHT_GRAY = 7
  COLOR_CODE_DARK_GRAY = 8
  COLOR_CODE_LIGHT_RED = 9
  COLOR_CODE_LIGHT_GREEN = 10
  COLOR_CODE_LIGHT_YELLOW = 11
  COLOR_CODE_LIGHT_BLUE = 12
  COLOR_CODE_LIGHT_MAGENTA = 13
  COLOR_CODE_LIGHT_CYAN = 14
  COLOR_CODE_WHITE = 15
end