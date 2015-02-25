
require 'chef/provider/package/rubygems'
class Chef
  class Provider
    class Package
      class Rubygems
        class SpecificInstall < Chef::Provider::Package::Rubygems
          def action_install
            cmd = "#{gem_binary_path} specific_install #{@new_resource.package_name} #{@new_resource.options}"
            logger.debug { "use #{cmd} to install" }
            shell_out!(cmd, :env => nil)
          end

          def candidate_version
            logger.debug { 'candidate_version not implement' }
            '0.0.0'
          end
        end
      end
    end
  end
end
