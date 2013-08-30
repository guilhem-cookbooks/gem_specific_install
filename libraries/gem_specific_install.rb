
require 'chef/provider/package/rubygems'
class Chef::Provider::Package::Rubygems::SpecificInstall < Chef::Provider::Package::Rubygems

   def load_current_resource
     @current_resource = Chef::Resource::Package::GemPackage.new(@new_resource.name)
     @current_resource.package_name(@new_resource.package_name)
   end

  def install_package(name, version)
    cmd = "#{gem_binary_path} specific_install #{name} -l #{@new_resource.source}"
    cmd << " -b #{@new_resource.options[:branch]}" if Hash === @new_resource.options && @new_resource.options[:branch]
    shell_out!(cmd, :env=>nil)
  end

  def find_newest_remote_version(gem_dependency, *sources)
    logger.debug {"find_newest_remote_version not implement"}
    return
  end

#  def target_version_already_installed?   
#    return false
#  end
end
