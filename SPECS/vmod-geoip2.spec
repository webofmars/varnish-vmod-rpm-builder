Summary: geoip2 support for Varnish VCL
Name: vmod-geoip2
Version: 6.0.2
Release: 1%{?dist}
License: BSD
Group: System Environment/Daemons
Source0: libvmod-geoip2.tar.gz
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
Requires: varnish >= 6.0.2
BuildRequires: make
# BuildRequires: python-docutils
BuildRequires: varnish >= 6.0.2
BuildRequires: varnish-devel >= 6.0.2

%description
geoip2 support for Varnish VCL

%prep
%setup -n libvmod-geoip2

%build
./autogen.sh
./configure --prefix=/usr/ --docdir='${datarootdir}/doc/%{name}'
make
#make check

%install
make install DESTDIR=%{buildroot}
mkdir -p %{buildroot}/usr/share/doc/%{name}/

%clean
rm -rf %{buildroot}

%files
%defattr(-,root,root,-)
%{_libdir}/varnish/vmods/
%doc /usr/share/doc/%{name}/*
%{_mandir}/man?/*

%changelog
* Thu Dec 03 2020 Frederic Leger <frederic@webofmars.com>
- Varnish 6.0 support.

* Fri Jan 29 2016 Audun Ytterdal <audun.ytterdal@vg.no>
- Varnish 4.1 support.

