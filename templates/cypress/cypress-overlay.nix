final: prev: {
  cypress = prev.cypress.overrideAttrs (oldAttrs: rec {
    pname = "cypress";
    version = "9.5.2"; # Override to the project version

    src = prev.fetchzip {
      url = "https://cdn.cypress.io/desktop/${version}/linux-x64/cypress.zip";
      sha256 = "09bb304xwj3z919s8w82xawsxiq3g8k3sd66zq8mv5917phhvjsh"; # grab the right hash (instructions on the readme)
    };

    installPhase =
      let
        matchForChrome = "yield utils_1.default.copyExtension(pathToExtension, extensionDest);";
        appendForChrome = "yield fs_1.fs.chmodAsync(extensionBg, 0o0644);";

        matchForFirefox = "copyExtension(pathToExtension, extensionDest)";
        replaceForFirefox = "copyExtension(pathToExtension, extensionDest).then(() => fs.chmodAsync(extensionBg, 0o0644))";
      in
      ''
        sed -i '/${matchForChrome}/a\${appendForChrome}' \
            ./resources/app/packages/server/lib/browsers/chrome.js

        sed -i 's/${matchForFirefox}/${replaceForFirefox}/' \
            ./resources/app/packages/server/lib/browsers/utils.js
      '' + oldAttrs.installPhase;
  });
}