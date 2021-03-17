{ lib, buildPythonPackage, fetchPypi, isPy3k, plum_py }:

let
  # exif depends on older plum_py==0.3.1
  plum_py' = plum_py.overridePythonAttrs (old: rec {
    version = "0.3.1";
    src = fetchPypi {
      inherit (old) pname format;
      inherit version;
      python = "py3";
      sha256 = "1ra8b9rqh3ykbryqn9np03i0d42m8xcxh13by72k8q8409syqa4k";
    };
  });
in

buildPythonPackage rec {
  pname = "exif";
  version = "1.2.0";
  disabled = !isPy3k;

  src = fetchPypi {
    inherit pname version;
    sha256 = "02zld3nazc3zhar490w9alkvgvdcdr0ilq9ajc8bm49jk4l1kp52";
  };

  propagatedBuildInputs = [ plum_py' ];
  pythonImportsCheck = [ "exif" ];

  meta = with lib; {
    description = "Read and modify image EXIF metadata using Python";
    homepage    = "https://gitlab.com/TNThieding/exif";
    license     = licenses.mit;
    maintainers = with maintainers; [ dnr ];
  };
}
