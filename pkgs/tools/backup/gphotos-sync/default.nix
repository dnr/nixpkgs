{ lib, python3Packages }:

python3Packages.buildPythonApplication rec {
  pname = "gphotos-sync";
  version = "2.14.2";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "1xq2mb6241f3gs7a7snqv177j4nqlvykxyhy5cw3d1krnzgp6dvi";
  };

  propagatedBuildInputs = with python3Packages; [
    appdirs
    attrs
    exif
    psutil
    pyyaml
    requests_oauthlib
  ];
  pythonImportsCheck = [ "gphotos" ];

  meta = with lib; {
    description = "Google Photos and Albums backup with Google Photos Library API";
    homepage    = "https://github.com/gilesknap/gphotos-sync";
    license     = licenses.mit;
    maintainers = with maintainers; [ dnr ];
  };
}
