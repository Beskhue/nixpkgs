{ lib, buildPythonApplication, fetchPypi, pythonOlder
, installShellFiles
, mock, pytest, nose
, pyyaml, backports_ssl_match_hostname, colorama, docopt
, dockerpty, docker, ipaddress, jsonschema, requests
, six, texttable, websocket_client, cached-property
, enum34, functools32, paramiko, distro, python-dotenv
}:

buildPythonApplication rec {
  version = "1.28.3";
  pname = "docker-compose";

  src = fetchPypi {
    inherit pname version;
    sha256 = "78a48ef8ff4fed092261ecb1a60d9b28b7776e72ed6df591a900008039308b0f";
  };

  # lots of networking and other fails
  doCheck = false;
  nativeBuildInputs = [ installShellFiles ];
  checkInputs = [ mock pytest nose ];
  propagatedBuildInputs = [
    pyyaml backports_ssl_match_hostname colorama dockerpty docker
    ipaddress jsonschema requests six texttable websocket_client
    docopt cached-property paramiko distro python-dotenv
  ] ++
    lib.optional (pythonOlder "3.4") enum34 ++
    lib.optional (pythonOlder "3.2") functools32;

  postPatch = ''
    # Remove upper bound on requires, see also
    # https://github.com/docker/compose/issues/4431
    sed -i "s/, < .*',$/',/" setup.py
  '';

  postInstall = ''
    installShellCompletion --bash contrib/completion/bash/docker-compose
    installShellCompletion --zsh contrib/completion/zsh/_docker-compose
  '';

  meta = with lib; {
    homepage = "https://docs.docker.com/compose/";
    description = "Multi-container orchestration for Docker";
    license = licenses.asl20;
    maintainers = with maintainers; [ Frostman ];
  };
}
