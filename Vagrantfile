#######################################################################
# Example with Salt Master and Salt Minions

k8s_nodes = [
  {
    :node       => "mgmt01",
    :ip         => "192.168.255.11",
    :os         => "hashicorp/bionic64",
    :cpu        => "2",
    :memory_mb  => "2048",
    :salt_type  => "master"
  },
  {
    :node       => "haproxy01",
    :ip         => "192.168.255.21",
    :os         => "hashicorp/bionic64",
    :cpu        => "1",
    :memory_mb  => "512",
    :salt_type  => "minion"
  },
  {
    :node       => "haproxy02",
    :ip         => "192.168.255.22",
    :os         => "hashicorp/bionic64",
    :cpu        => "1",
    :memory_mb  => "512",
    :salt_type  => "minion"
  },
  {
    :node       => "k8scp01",
    :ip         => "192.168.255.31",
    :os         => "hashicorp/bionic64",
    :cpu        => "1",
    :memory_mb  => "512",
    :salt_type  => "minion"
  },
  {
    :node       => "k8scp02",
    :ip         => "192.168.255.32",
    :os         => "hashicorp/bionic64",
    :cpu        => "1",
    :memory_mb  => "512",
    :salt_type  => "minion"
  },
  {
    :node       => "k8scp03",
    :ip         => "192.168.255.33",
    :os         => "hashicorp/bionic64",
    :cpu        => "1",
    :memory_mb  => "512",
    :salt_type  => "minion"
  },
  {
    :node       => "k8swk01",
    :ip         => "192.168.255.41",
    :os         => "hashicorp/bionic64",
    :cpu        => "1",
    :memory_mb  => "512",
    :salt_type  => "minion"
  },
  {
    :node       => "k8swk02",
    :ip         => "192.168.255.42",
    :os         => "hashicorp/bionic64",
    :cpu        => "1",
    :memory_mb  => "512",
    :salt_type  => "minion"
  },
  {
    :node       => "k8swk03",
    :ip         => "192.168.255.43",
    :os         => "hashicorp/bionic64",
    :cpu        => "1",
    :memory_mb  => "512",
    :salt_type  => "minion"
  }
]

Vagrant.configure("2") do |config|
  k8s_nodes.each do |k8s_node|
    if k8s_node[:salt_type] == "master"
      config.vm.define k8s_node[:node] do |instance|
        # VM Configs
        instance.ssh.insert_key = false
        instance.vm.box = k8s_node[:os]
        instance.vm.hostname = k8s_node[:node]
        instance.vm.network "private_network", ip: k8s_node[:ip]
        instance.vm.provider :virtualbox do |v|
          v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
          v.customize ["modifyvm", :id, "--cpus", k8s_node[:cpu]]
          v.customize ["modifyvm", :id, "--memory", k8s_node[:memory_mb]]
          v.customize ["modifyvm", :id, "--name", k8s_node[:node]]
        end
        # Salt Configs
        instance.vm.synced_folder "saltstack/salt/", "/srv/salt"
        instance.vm.synced_folder "saltstack/pillar/", "/srv/pillar"
        instance.vm.provision :salt do |salt|
          salt.master_config = "saltstack/etc/master"
          salt.master_key = "saltstack/keys/master_minion.pem"
          salt.master_pub = "saltstack/keys/master_minion.pub"
          salt.minion_key = "saltstack/keys/master_minion.pem"
          salt.minion_pub = "saltstack/keys/master_minion.pub"
          salt.seed_master = {
                              "haproxy01" => "saltstack/keys/haproxy01.pub",
                              "haproxy02" => "saltstack/keys/haproxy02.pub",
                              "k8scp01" => "saltstack/keys/k8scp01.pub",
                              "k8scp02" => "saltstack/keys/k8scp02.pub",
                              "k8scp03" => "saltstack/keys/k8scp03.pub",
                              "k8swk01" => "saltstack/keys/k8swk01.pub",
                              "k8swk02" => "saltstack/keys/k8swk02.pub",
                              "k8swk03" => "saltstack/keys/k8swk03.pub"
                             }
    
          salt.install_type = "stable"
          salt.install_master = true
          salt.no_minion = true
          salt.verbose = true
          salt.colorize = true
          salt.bootstrap_options = "-P -c /tmp -x python3"
        end
      end
    end
    if k8s_node[:salt_type] == "minion"
      config.vm.define k8s_node[:node] do |instance|
        instance.ssh.insert_key = false
        instance.vm.box = k8s_node[:os]
        instance.vm.hostname = k8s_node[:node]
        instance.vm.network "private_network", ip: k8s_node[:ip]
        instance.vm.provider :virtualbox do |v|
          v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
          v.customize ["modifyvm", :id, "--cpus", k8s_node[:cpu]]
          v.customize ["modifyvm", :id, "--memory", k8s_node[:memory_mb]]
          v.customize ["modifyvm", :id, "--name", k8s_node[:node]]
        end
        instance.vm.provision :salt do |salt|
          salt.minion_config = "saltstack/etc/minion"
#          salt.minion_config = "saltstack/etc/#{ k8s_node[:node]}"
          salt.minion_key = "saltstack/keys/#{ k8s_node[:node]}.pem"
          salt.minion_pub = "saltstack/keys/#{ k8s_node[:node]}.pub"
          salt.install_type = "stable"
          salt.verbose = true
          salt.colorize = true
          salt.bootstrap_options = "-P -c /tmp -x python3"
        end
      end
    end
  end
end

#######################################################################
# Example vm definistions from dictionary for varying types of nodes
#
#k8s_nodes = [
#  {
#    :node       => "haproxy01",
#    :ip         => "192.168.255.11",
#    :os         => "hashicorp/bionic64",
#    :script     => "./prerequisities/setup_lb.sh",
#    :cpu        => "1",
#    :memory_mb  => "512"
#  },
#  {
#    :node       => "haproxy02",
#    :ip         => "192.168.255.12",
#    :os         => "hashicorp/bionic64",
#    :script     => "./prerequisities/setup_lb.sh",
#    :cpu        => "1",
#    :memory_mb  => "512"
#  },
#  {
#    :node       => "k8scp01",
#    :ip         => "192.168.255.21",
#    :os         => "hashicorp/bionic64",
#    :script     => "./prerequisities/setup_k8s.sh",
#    :cpu        => "1",
#    :memory_mb  => "512"
#  },
#  {
#    :node       => "k8scp02",
#    :ip         => "192.168.255.22",
#    :os         => "hashicorp/bionic64",
#    :script     => "./prerequisities/setup_k8s.sh",
#    :cpu        => "1",
#    :memory_mb  => "512"
#  },
#  {
#    :node       => "k8scp03",
#    :ip         => "192.168.255.23",
#    :os         => "hashicorp/bionic64",
#    :script     => "./prerequisities/setup_k8s.sh",
#    :cpu        => "1",
#    :memory_mb  => "512"
#  },
#  {
#    :node       => "k8swk01",
#    :ip         => "192.168.255.31",
#    :os         => "hashicorp/bionic64",
#    :script     => "./prerequisities/setup_k8s.sh",
#    :cpu        => "1",
#    :memory_mb  => "512"
#  },
#  {
#    :node       => "k8swk02",
#    :ip         => "192.168.255.32",
#    :os         => "hashicorp/bionic64",
#    :script     => "./prerequisities/setup_k8s.sh",
#    :cpu        => "1",
#    :memory_mb  => "512"
#  },
#  {
#    :node       => "k8swk03",
#    :ip         => "192.168.255.33",
#    :os         => "hashicorp/bionic64",
#    :script     => "./prerequisities/setup_k8s.sh",
#    :cpu        => "1",
#    :memory_mb  => "512"
#  }
#]
#
#Vagrant.configure("2") do |config|
#  k8s_nodes.each do |k8s_node|
#    config.vm.define k8s_node[:node] do |instance|
#      instance.ssh.insert_key = false
#      instance.vm.box = k8s_node[:os]
#      instance.vm.hostname = k8s_node[:node]
#      instance.vm.network "private_network", ip: k8s_node[:ip]
#      instance.vm.provision :shell, path: k8s_node[:script]
#      instance.vm.provider :virtualbox do |v|
#        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
#        v.customize ["modifyvm", :id, "--cpus", k8s_node[:cpu]]
#        v.customize ["modifyvm", :id, "--memory", k8s_node[:memory_mb]]
#        v.customize ["modifyvm", :id, "--name", k8s_node[:node]]
#      end
#    end
#  end
#end
#######################################################################
# Example loop vm creation like count in terraform
#hap_instance_count = 2
#hap_start_ip = 10
#Vagrant.configure("2") do |config|
#  (1..hap_instance_count).each do |hap_instance_number|
#    ip = (hap_instance_number + hap_start_ip)
#    config.vm.define "haproxy0#{hap_instance_number}" do |instance|
#      instance.ssh.insert_key = false
#      instance.vm.box = "hashicorp/bionic64"
#      instance.vm.hostname = "haproxy0#{hap_instance_number}"
#      instance.vm.network "private_network", ip: "192.168.255.#{ip}"
#      instance.vm.provider :virtualbox do |v|
#        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
#        v.customize ["modifyvm", :id, "--memory", "512"]
#        v.customize ["modifyvm", :id, "--name", "haproxy0#{hap_instance_number}]"]
#      end
#    end
#  end
#end
########################################################################
# Example vm creation with static description blocks
#Vagrant.configure("2") do |config|
#  config.ssh.insert_key = false
#  config.vm.define "haproxy01" do |haproxy01|
#    haproxy01.vm.box = "hashicorp/bionic64"
#    haproxy01.vm.hostname = "haproxy01"
#    haproxy01.vm.network "private_network", ip: "192.168.255.11"
#    haproxy01.vm.provider :virtualbox do |v|
#      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
#      v.customize ["modifyvm", :id, "--memory", "512"]
#      v.customize ["modifyvm", :id, "--name", "haproxy01"]
#    end
#  end
#  config.vm.define "haproxy02" do |haproxy02|
#    haproxy02.vm.box = "hashicorp/bionic64"
#    haproxy02.vm.hostname = "haproxy02"
#    haproxy02.vm.network "private_network", ip: "192.168.255.12"
#    haproxy02.vm.provider :virtualbox do |v|
#      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
#      v.customize ["modifyvm", :id, "--memory", "512"]
#      v.customize ["modifyvm", :id, "--name", "haproxy02"]
#    end
#  end
#end
###############################################################################
# config.vm.provision :shell, path: "bootstrap.sh"
# config.vm.network :forwarded_port, guest: 80, host: 4568
