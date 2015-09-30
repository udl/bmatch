require 'ffi'
module Levenshtein
  extend FFI::Library
  ffi_lib File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "ext", "levenshtein.so"))
  attach_function :distance, [:string, :string], :int
end
