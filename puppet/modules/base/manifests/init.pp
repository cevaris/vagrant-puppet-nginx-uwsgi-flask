class base {
    package { [ 'git', 'vim', 'curl', ]:
        ensure => installed,
    }
}
