actions :install
default_action :install

attribute :gemname, :kind_of => String, :name_attribute => true
attribute :repository, :kind_of => String, :required => true
attribute :revision, :kind_of => String
attribute :compile_time, kind_of: [TrueClass, FalseClass], :default => false

def after_created
  Array(action).each { |action| run_action(action) } if compile_time
end
