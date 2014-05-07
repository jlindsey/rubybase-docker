Docker Ruby Base Image
======================
A simple base image for Ruby apps. Based on the excellent [`phusion/baseimage`][1].

Contents
--------
* Packages for many common Gems (`libxml`, `libpq`, `build-essential`, etc)
* [rbenv][2] at `/root/.rbenv`, and exported the proper `$PATH`
* Ruby 2.1.0
* Bundler

Recommended Usage
-----------------
Extend this image with your own, using `phusion/baseimage`'s awesome
startup script support to bundle your gems, etc.

In production, you should create a data container to mount that wraps
the rbenv directory so that you aren't reinstalling your bundle from
scratch every time you deploy:

```
$ docker run --name GEM_DATA -v /root/.rbenv jlindsey/rubybase-docker true
$ docker run --name my_app --volumes-from GEM_DATA #...
```

License
-------
Copyright (c) 2014 Josh Lindsey. See [LICENSE][3] for details.

[1]: https://github.com/phusion/baseimage-docker
[2]: https://github.com/sstephenson/rbenv
[3]: https://github.com/jlindsey/rubybase-docker/blob/master/LICENSE
