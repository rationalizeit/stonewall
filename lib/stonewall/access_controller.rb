module StoneWall

  # a word of caution, use this framework to guard 'normal user space' methods
  # only - don't try to guard meta stuff like 'send'.  If you have ever seen
  # 'Being John Malkovich', you can understand why.
  class AccessController
    attr_reader :guarded_class
    attr_reader :variant_field
    attr_accessor :actions
    attr_accessor :guarded_methods
    attr_accessor :method_groups

    # the matrix is the money-shot of the access controller.  You can set it
    # through add_grant, and query it through 'granted', but you can also
    # access the data structure directly if you want to avoid the dsl.
    # It is in the format [role][varient][member]
    attr_accessor :matrix

    def initialize(guarded_class)
      @guarded_class = guarded_class
      @guarded_methods = Array.new
      @actions = Hash.new
      @matrix = Hash.new
      @method_groups = Hash.new
    end

    def set_variant_field(field)
      if @variant_field.nil?
        @variant_field = field
      else
        raise "no redefinition of variant field"
      end
    end

    def add_grant(r, v, m)
      @matrix[r] ||= Hash.new
      @matrix[r][v] ||= Array.new
      @matrix[r][v] << m
    end

    def granted?(r, v, m)
      matrix[r] && matrix[r][v] && matrix[r][v].include?(m)
    end

    # --------------
    # This is 1/3rd of the magic in this gem.  Every method you guard is
    # checked by this method. It looks at the matrix of permissions you built
    # in the dsl and allows or denies based on the guarded object, the user,
    # and the method being accessed.   #should we fail secure?
    def allowed?(guarded_object, user, method)
      return true if (guarded_object.nil? || user.nil? || method.nil?)
      # if they can always view it, no need to check variant.
      always = user.stonepath_role_info.detect do |r|
        granted?(r, :all, :all) || granted?(r, :all, method)
      end
      return always if always
      
      v = guarded_object.send(variant_field).to_sym
      user.stonepath_role_info.detect do |r|
        granted?(r, v, :all) || granted?(r, v, method)
      end || false
    end
  end
end