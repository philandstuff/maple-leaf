{ stdenv, fetchurl, php, runCommand }:

let

  src = fetchurl {
    url = "https://download.owncloud.org/community/owncloud-8.0.0.tar.bz2";
    sha256 = "0c62cb06fe4c3eb107bccc4302f2bb3b9f7e5373cf7c9dd307fea8e823e6342f";
  };
  version = "8.0.0";

in

runCommand "owncloud-${version}"
  { }
  ''
    tar xf ${src}
    mv owncloud $out
  ''
