{ fetchHex }:
{
  ssl_verify_fun = fetchHex {
    pkg = "ssl_verify_fun";
    version = "1.1.6";
    sha256 = "sha256-vbDSRx9FPIj/OQjnaG+G+b4yfQZcwewW+kVAGX6gRoA=";
  };
  relx = fetchHex {
    pkg = "relx";
    version = "4.4.0";
    sha256 = "sha256-VcDtY7tdVeuYOhnrlNfzB1320Sbb3/QxAqZmCpH86SU=";
  };
  providers = fetchHex {
    pkg = "providers";
    version = "1.8.1";
    sha256 = "sha256-5FdFrenEdqmkaeoIQOQYqxk2DcRPAaIzME4RikRIa6A=";
  };
  parse_trans = fetchHex {
    pkg = "parse_trans";
    version = "3.3.1";
    sha256 = "sha256-B82Vd4hfVjYtQU6MTE5r3xDUOodnq7ktJMvoskxUiIs=";
  };
  getopt = fetchHex {
    pkg = "getopt";
    version = "1.0.1";
    sha256 = "sha256-U+Grg7nOtlyWctPno1uAkum9ybPugHIUcaFhwQxZlZw=";
  };
  eunit_formatters = fetchHex {
    pkg = "eunit_formatters";
    version = "0.5.0";
    sha256 = "sha256-1si6ITQklE5uBbvAl8MgAc3Qq+OSXQJFTyKbINaHY8k=";
  };
  erlware_commons = fetchHex {
    pkg = "erlware_commons";
    version = "1.4.0";
    sha256 = "sha256-GF7PXPQ7qzoBPds2FM57un9seoJ5BOZOV9pU/N/c4uY=";
  };
  cth_readable = fetchHex {
    pkg = "cth_readable";
    version = "1.5.1";
    sha256 = "sha256-aGVBoi7+bKWkGgR7OVFsLdKPs8reXySi8ZFFs5Z/nYA=";
  };
  cf = fetchHex {
    pkg = "cf";
    version = "0.3.1";
    sha256 = "sha256-MV6NRH06SwK82/o5etA7u5iKbgqm9E063Q9OPDv5dnI=";
  };
  certifi = fetchHex {
    pkg = "certifi";
    version = "2.5.3";
    sha256 = "sha256-7VFqyzkpsQEgip1wAGLVIPOVPaO2uRjYZhBv+pgOHBA=";
  };
  bbmustache = fetchHex {
    pkg = "bbmustache";
    version = "1.10.0";
    sha256 = "sha256-Q+/6P9S7lSMVevWp4idsSTSVuEWfyHNxRKoYbLE84u4=";
  };
}
