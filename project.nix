{ 
  env = [
    { name = "HOME";          eval = "$PRJ_DATA_DIR/home";  }
    { name = "EM_CACHE";      eval = "$PRJ_DATA_DIR/cache"; }
    { name = "EMCC_TEMP_DIR"; eval = "$PRJ_DATA_DIR/temp";  }
  ];
  devshell.startup.mk-dirs.text = ''
    mkdir -p $EMCC_TEMP_DIR
    mkdir -p $EM_CACHE
  '';
  files.gitignore.enable = true;
  files.gitignore.pattern."*.data" = true;
  files.gitignore.pattern."*.exe"  = true;
  files.gitignore.pattern."*.js"   = true;
  files.gitignore.pattern."*.wasm" = true;
  files.gitignore.pattern.".*"     = true;
  files.gitignore.pattern."tmp"    = true;

  # copy contents from https://github.com/github/gitignore
  # to our .gitignore
  files.gitignore.template.C                 = true;
  files.gitignore.template.Nim               = true;
  files.gitignore.template."Global/Archives" = true;
  files.gitignore.template."Global/Backup"   = true;
  files.gitignore.template."Global/Diff"     = true;

  # install a packages
  packages = [
    "emscripten"
    "httplz"
    "nim"
  ];

  # configure direnv .envrc file
  files.direnv.enable  = true;

  files.alias.deps     = ''nimble install'';

  # enable httplz as service to start with `initSvcs`
  files.services.httpd = true;
  files.alias.httpd    = ''cd $PRJ_ROOT; exec httplz -p 8000'';
}
