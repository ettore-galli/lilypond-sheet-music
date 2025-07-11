export LILYPOND_INSTALL_LIB="$(ls -la1 | grep lily | head)"
export PATH=${LILYPOND_INSTALL_LIB}/bin:${PATH}