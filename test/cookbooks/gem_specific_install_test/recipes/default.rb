# chef_gem "inifile" do
#   provider Chef::Provider::Package::Rubygems::SpecificInstall
#   options( :repo => "https://github.com/optiflows/inifile.git")
# end

gem_specific_install 'ini-phile' do
  repository 'https://github.com/guilhem/ini-phile.git'
  action :install
end
