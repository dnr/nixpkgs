{ lib, buildPythonPackage, fetchPypi, isPy3k, pytest }:

buildPythonPackage rec {
  pname = "plum_py";
  version = "0.4.0";
  format = "wheel";
  disabled = !isPy3k;

  src = fetchPypi {
    inherit pname version format;
    python = "py3";
    sha256 = "0jagksgwfya0wa978yf24mdv4qrlklj7vld4qpi5a8n589jnrm9k";
  };

  checkInputs = [ pytest ];
  pythonImportsCheck = [ "plum.test" ];

  meta = with lib; {
    description = "Classes and utilities for packing/unpacking bytes";
    homepage = "https://plum-py.readthedocs.io/en/latest/index.html";
    license = licenses.mit;
    maintainers = with maintainers; [ dnr ];
  };
}
