class python_custom {

    python::virtualenv { '/var/www/myapp.example.co.uk' :
        ensure       => present,
        requirements => '/var/www/myapp.example.co.uk/src/requirements.txt',
        venv_dir     => '/var/www/myapp.example.co.uk/venv',
        owner        => 'root',
        group        => 'www-data',
        mode         => '0755',
    }

}
