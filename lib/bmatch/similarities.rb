require 'ffi'
module Similarities
  extend FFI::Library
  ffi_lib File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "ext", "similarities.so"))
  attach_function :dice_similarity, [:string, :string], :float
  attach_function :levenshtein_distance, [:string, :string], :int
end
