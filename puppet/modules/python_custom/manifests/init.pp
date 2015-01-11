class python_custom {


  python::virtualenv { '/var/www/myapp.example.co.uk' :
    ensure       => present,
    version      => 'system',
    requirements => '/var/www/myapp.example.co.uk/requirements.txt',
    proxy        => 'http://proxy.domain.com:3128',
    systempkgs   => true,
    distribute   => false,
    venv_dir     => '/home/www-data/virtualenvs',
    owner        => 'www-data',
    group        => 'www-data',
    cwd          => '/var/www/myapp.example.co.uk',
    timeout      => 0,
  }
  
    # include python::packages

  

    # package { 'python':
    #     ensure => installed,
    # }
}

# class python::packages {
#     $apt = ['python-dev', 'build-essential', 'python-pip', ]
#     $pip = ['flask', ]

#     package { $apt:
#         require => Class['python'],
#         ensure => installed,
#     }

#     package { $pip:
#         require => Class['python'],
#         ensure => installed,
#         provider => pip,
#     }
# }
