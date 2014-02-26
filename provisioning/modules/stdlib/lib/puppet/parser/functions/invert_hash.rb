#
# invert_hash.rb
#

module Puppet::Parser::Functions
  newfunction(:invert_hash, :type => :rvalue, :doc => <<-EOS
This function inverts the keys and values of a hash
with an optional suffix added to the new values

*Examples:*
    invert_hash( { 'a' => '1', 'b' => '2' } , '.n' )

    Would return: {'1'=>'a.n','2'=>'b.n'}

    EOS
  ) do |arguments|

    raise(Puppet::ParseError, "invert_hash(hash, suffix): Wrong number of arguments " +
      "given (#{arguments.size} for 1)") if arguments.size < 1

    hash = arguments[0]
    suffix = ''
    if !(arguments[1].nil?)
      suffix = arguments[1]
    end
    unless hash.is_a?(Hash)
      raise(Puppet::ParseError, 'invert_hash(): Requires hash to work with')
    end

    return_hash = {}

    begin

      hash.each do |key,value|
        return_hash[value] = "#{key}#{suffix}"
      end
    rescue Exception
      raise(Puppet::ParseError, 'invert_hash(): Unable to process hash')
    end

    return return_hash
  end
end

# vim: set ts=2 sw=2 et :
