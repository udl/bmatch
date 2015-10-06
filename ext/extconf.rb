require 'mkmf'

# Stops the installation process if one of these commands is not found in
# $PATH.
find_executable('go')
puts "running make"
`make build`
