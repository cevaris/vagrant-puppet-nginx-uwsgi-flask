node default {
    exec { 'apt-update':
        command => '/usr/bin/apt-get update',
    }

    Exec["apt-update"] -> Package <| |>

    include users
    class { 'nginx':
        package_source  => 'passenger',
        http_cfg_append => {
            'passenger_root' => '/usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini',
        }
    }
    include nginx_custom
    class { 'python' :
        version    => 'system',
        pip        => true,
        virtualenv => true,
        # gunicorn   => true,
    }
    include python_custom
    include uwsgi
    include base
}
