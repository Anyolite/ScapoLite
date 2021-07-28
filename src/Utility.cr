# The problem with Colorize is that it will add methods to other classes.
# However, Anyolite does not know what to do with these, so we need to
# exclude them manually.

module Anyolite
  module HelperClasses
    @[Anyolite::ExcludeInstanceMethod("colorize")]
    class AnyolitePointer
    end
  end
end