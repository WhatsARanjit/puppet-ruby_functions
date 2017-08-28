# ruby_functions [![Build Status](https://travis-ci.org/WhatsARanjit/puppet-ruby_functions.svg)](https://travis-ci.org/WhatsARanjit/puppet-ruby_functions)

#### Table of Contents

1. [Overview](#overview)
1. [Requirements](#requirements)
1. [Usage](#usage)
1. [ruby_function()](#ruby_function)

## Overview

Call any function/method available in Ruby.  Mainly, this allows you to convert 
templates to EPP, without having to rely on ERB for Ruby functions.

## Requirements

* Puppet >= 3.8

## Usage

```
ruby_function($data_to_use, $function_name, $optional_arg1, $optional_arg2...)
```

Beyond the data to operate on and the function name, any additional arguments 
are passed to the function that is called.

### ruby_function()

Call `first()` on an Array:

```shell
[root@puppet ~]# puppet apply -e 'notice(ruby_function([1,2], "first"))'
Notice: Scope(Class[main]): 1
Notice: Compiled catalog for puppet.whatsaranjit.com in environment production in 0.02 seconds
Notice: Applied catalog in 0.24 seconds
```

Call `values_at()` on a Hash:

```shell
[root@puppet ~]# puppet apply <<'PP'
$h = { 'cat' => 'feline', 'dog' => 'canine', 'cow' => 'bovine' }
notice(ruby_function($h, 'values_at', 'cow', 'cat'))
PP

Notice: Scope(Class[main]): [bovine, feline]
Notice: Compiled catalog for puppet.whatsaranjit.com in environment production in 0.02 seconds
Notice: Applied catalog in 0.24 seconds
```

Call `take()` within an EPP template:

```shell
[root@puppet ~]# puppet apply <<'PP'
$template = '<%= [1,2,3,4].ruby_function("take", 2) %>'
notice(inline_epp($template))
PP

Notice: Scope(Class[main]): [1, 2]
Notice: Compiled catalog for puppet.whatsaranjit.com in environment production in 0.03 seconds
Notice: Applied catalog in 0.24 seconds
```

_Type:_ rvalue
