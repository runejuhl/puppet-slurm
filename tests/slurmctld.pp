#
# You can execute this manifest as follows in your vagrant box
#
#      sudo puppet apply -t /vagrant/tests/slurmctld.pp
#
node default {
  include ::slurm::params

  class { '::slurm':
    service_manage  => false,
    manage_firewall => true,
    wrappers => $slurm::params::extra_rpms_basename
  }
  include ::slurm::slurmctld
}
