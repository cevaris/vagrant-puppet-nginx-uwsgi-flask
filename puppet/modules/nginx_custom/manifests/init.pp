class nginx_custom {
    # package { 'nginx':
        #   ensure => present,
        #   before => File['/etc/nginx/sites-available/default'],
        # }
    # file { '/etc/nginx/sites-available/default':
        #   ensure => file,
        #   owner => 'root',
        #   group => 'root',
        #   mode => '640',
        #   content => template('nginx/default_site.erb'),
        # }
    # service { 'nginx':
        #   ensure => running,
        #   enable => true,
        #   hasstatus => true,
        #   hasrestart => true,
        #   subscribe => File['/etc/nginx/sites-available/default'],
        # }

    

    # nginx::resource::vhost { 'myapp.example.co.uk':
    #     www_root                => '/var/www/myapp.example.co.uk/src',
    #     vhost_cfg_append        => {
    #         'passenger_enabled' => 'on',
    #         'passenger_ruby'    => '/usr/bin/ruby',
    #     }
    # }

    file { '/etc/nginx/sites-available/myapp.example.co.uk.conf':
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        mode    => '640',
        content => template('nginx_custom/default_site.erb'),
    }
}
