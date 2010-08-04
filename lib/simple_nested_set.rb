module SimpleNestedSet
  class InconsistentMove < ActiveRecord::ActiveRecordError ; end
  class ImpossibleMove   < ActiveRecord::ActiveRecordError ; end

  autoload :ActMacro,        'simple_nested_set/act_macro'
  autoload :ClassMethods,    'simple_nested_set/class_methods'
  autoload :InstanceMethods, 'simple_nested_set/instance_methods'
  autoload :Move,            'simple_nested_set/move'
  autoload :NestedSet,       'simple_nested_set/nested_set'
  autoload :Protection,      'simple_nested_set/protection'
end

ActiveRecord::Base.send :extend, SimpleNestedSet::ActMacro