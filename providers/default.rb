use_inline_resources

# Support whyrun
def whyrun_supported?
  true
end

action :install do
  git path do
    repository new_resource.repository
    revision new_resource.revision if new_resource.revision
    notifies :create, "ruby_block[install gem #{new_resource.gemname}]"
  end

  ruby_block "install gem #{new_resource.gemname}" do
    block do
      require 'rubygems/dependency_installer'
      require 'rubygems/specification'
      require 'rubygems/builder'

      Dir.chdir(path)
      gemspec = Gem::Specification.load(gemspec_file)
      gem = Gem::Builder.new(gemspec).build
      inst = Gem::DependencyInstaller.new
      inst.install gem
      Gem.clearpaths
    end
    action :nothing
    only_if { ::File.exists?(gemspec_file) }
  end
end

def path
  ::File.join(Chef::Config[:file_cache_path], new_resource.gemname)
end

def gemspec_file
  ::File.join(path, "#{new_resource.gemname}.gemspec")
end

