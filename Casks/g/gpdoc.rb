cask "gpdoc" do
  version "1.32.0"
  sha256 "c49a865fed5dc28b5aa43bf8e41b71d91a3972f513b70b3c94f73bcfcc3da095"

  url "https://github.com/repetere/homebrew-tap/releases/download/gpdoc-cli-v#{version}/gpdoc-cli-#{version}-runtime.tar.gz",
      verified: "github.com/repetere/homebrew-tap/"
  name "GPDoc CLI"
  desc "Document tools and terminal editor"
  homepage "https://gpdoc.io/cli"

  livecheck do
    url "https://github.com/repetere/homebrew-tap/releases"
    regex(/^gpdoc-cli-v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  depends_on formula: "node"

  command_wrapper "gpdoc",
                  executable: "#{HOMEBREW_PREFIX}/opt/node/bin/node",
                  args:       ["#{staged_path}/gpdoc-runtime/node_modules/@gpdoc/cli/bin/gpdoc.js"]

  zap trash: [
    "~/.config/gpdoc/credentials.json",
    "~/.config/gpdoc/list-state.json",
  ]
end
