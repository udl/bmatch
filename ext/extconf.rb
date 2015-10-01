require 'mkmf'

# Stops the installation process if one of these commands is not found in
# $PATH.
find_executable('go')

# Create a dummy extension file. Without this RubyGems would abort the
# installation process. On Linux this would result in the file "bmatch.so"
# being created in the current working directory.
#
# Normally the generated Makefile would take care of this but since we
# don't generate one we'll have to do this manually.
#
File.open(File.join(Dir.pwd, 'bmatch.' + RbConfig::CONFIG['DLEXT']), "w") {}

Dir.chdir(File.dirname(__FILE__)) do
  `go build -buildmode=c-shared -o similarities.so similarities.go`
end

# This is normally set by calling create_makefile() but we don't need that
# method since we'll provide a dummy Makefile. Without setting this value
# RubyGems will abort the installation.
$makefile_created = true
