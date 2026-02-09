{
  pkgs ? import <nixpkgs> { },
}:
pkgs.stdenv.mkDerivation {
  name = "pages";
  src = ./.;

  nativeBuildInputs = with pkgs; [
    asciidoctor
    zola
  ];

  buildPhase = ''
    # TODO replace this with zola build process
    asciidoctor --attribute reproducible="true" README.adoc -o index.html
  '';

  installPhase = ''
    mkdir -p $out
    cp index.html $out
    cp screenshot.webp $out
  '';
}
