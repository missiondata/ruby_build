class Chef
  module Rbenv
    module PackageDeps
      def cruby_package_deps
        case node['platform_family']
        when 'rhel', 'fedora', 'amazon'
          %w( gcc bzip2 openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel make )
        when 'debian'
          case node['platform']
          when 'debian'
            if node['platform_version'].to_i >= 10
              %w( gcc autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev make )
            else
              %w( gcc autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev make )
            end
          when 'ubuntu'
            if node['platform_version'].to_i == 20
              %w( gcc autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev make )
            elsif node['platform_version'].to_i == 18
              %w( gcc autoconf bison build-essential libssl1.0-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev make )
            else
              %w( gcc autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev make )
            end
          end
        when 'suse'
          %w( gcc make automake gdbm-devel libyaml-devel ncurses-devel readline-devel zlib-devel libopenssl-devel )
        end
      end

      def package_deps
        cruby_package_deps
      end
    end
  end
end
