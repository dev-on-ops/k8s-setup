# Example vm definistions from dictionary for varying types of nodes
k8s_nodes = [
  {
    :node       => "haproxy01",
    :ip         => "192.168.255.11",
    :os         => "hashicorp/bionic64",
    :script     => "./prerequisities/setup_lb.sh",
    :cpu        => "1",
    :memory_mb  => "512"
  },
  {
    :node       => "haproxy02",
    :ip         => "192.168.255.12",
    :os         => "hashicorp/bionic64",
    :script     => "./prerequisities/setup_lb.sh",
    :cpu        => "1",
    :memory_mb  => "512"
  },
  {
    :node       => "k8scp01",
    :ip         => "192.168.255.21",
    :os         => "hashicorp/bionic64",
    :script     => "./prerequisities/setup_k8s.sh",
    :cpu        => "1",
    :memory_mb  => "512"
  },
  {
    :node       => "k8scp02",
    :ip         => "192.168.255.22",
    :os         => "hashicorp/bionic64",
    :script     => "./prerequisities/setup_k8s.sh",
    :cpu        => "1",
    :memory_mb  => "512"
  },
  {
    :node       => "k8scp03",
    :ip         => "192.168.255.23",
    :os         => "hashicorp/bionic64",
    :script     => "./prerequisities/setup_k8s.sh",
    :cpu        => "1",
    :memory_mb  => "512"
  },
  {
    :node       => "k8swk01",
    :ip         => "192.168.255.31",
    :os         => "hashicorp/bionic64",
    :script     => "./prerequisities/setup_k8s.sh",
    :cpu        => "1",
    :memory_mb  => "512"
  },
  {
    :node       => "k8swk02",
    :ip         => "192.168.255.32",
    :os         => "hashicorp/bionic64",
    :script     => "./prerequisities/setup_k8s.sh",
    :cpu        => "1",
    :memory_mb  => "512"
  },
  {
    :node       => "k8swk03",
    :ip         => "192.168.255.33",
    :os         => "hashicorp/bionic64",
    :script     => "./prerequisities/setup_k8s.sh",
    :cpu        => "1",
    :memory_mb  => "512"
  }
]

Vagrant.configure("2") do |config|
  k8s_nodes.each do |k8s_node|
    config.vm.define k8s_node[:node] do |instance|
      instance.ssh.insert_key = false
      instance.vm.box = k8s_node[:os]
      instance.vm.hostname = k8s_node[:node]
      instance.vm.network "private_network", ip: k8s_node[:ip]
      instance.vm.provision :shell, path: k8s_node[:script]
      instance.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["modifyvm", :id, "--cpus", k8s_node[:cpu]]
        v.customize ["modifyvm", :id, "--memory", k8s_node[:memory_mb]]
        v.customize ["modifyvm", :id, "--name", k8s_node[:node]]
      end
    end
  end
end
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
