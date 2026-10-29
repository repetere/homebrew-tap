# Homebrew formula for the published GPDoc CLI.
# Version and every dependency artifact were independently verified before generation.
class Gpdoc < Formula
  desc "GPDoc command-line document tools and terminal editor"
  homepage "https://gpdoc.io/cli"
  url "https://registry.npmjs.org/@gpdoc/cli/-/cli-1.32.0.tgz"
  version "1.32.0"
  sha256 "b17811536bccb2fb1ff7351120c46ab7e0b54123088df0a72f90ba466a2c36b7"

  depends_on "node"

  resource "dependency-0" do
    url "https://registry.npmjs.org/@gpdoc/filekit/-/filekit-1.32.0.tgz"
    sha256 "ea980845d420409354bede18dc876f8977028c3e3b43b47c6afce2eb5f6a913b"
  end

  resource "dependency-1" do
    url "https://registry.npmjs.org/argparse/-/argparse-2.0.1.tgz"
    sha256 "27903847fc8215e6fc5a33e81490f7baba66403f8aade33771b988cca097728c"
  end

  resource "dependency-2" do
    url "https://registry.npmjs.org/fflate/-/fflate-0.8.3.tgz"
    sha256 "38c2cd824402407b43153c782274aec2ea83ea688e4aa0b743c5f2c305857d92"
  end

  resource "dependency-3" do
    url "https://registry.npmjs.org/isomorphic.js/-/isomorphic.js-0.2.5.tgz"
    sha256 "dc9b112ace1f98451bf4395931def195c1ea94663c28e7486ab285659abb0262"
  end

  resource "dependency-4" do
    url "https://registry.npmjs.org/js-yaml/-/js-yaml-4.3.2.tgz"
    sha256 "c7b241d2224cf9253ff53854aa4cee87da91bd889c4d0fa3a3ffd1041ecee5b1"
  end

  resource "dependency-5" do
    url "https://registry.npmjs.org/lib0/-/lib0-0.2.119.tgz"
    sha256 "af518712f438583aa2863c21f6cf4ec655a520e7c9d7a0c95376244aeb870128"
  end

  resource "dependency-6" do
    url "https://registry.npmjs.org/marked/-/marked-12.0.2.tgz"
    sha256 "6cfd2d09c6bce2541558a1547e5f3b9895ed743f0d287536ff2280e318e8a074"
  end

  resource "dependency-7" do
    url "https://registry.npmjs.org/ws/-/ws-8.22.0.tgz"
    sha256 "ca9b3798b2e11ce8fac6713f50ef0501aa12b09b330623c1dc409dff94e7abc8"
  end

  resource "dependency-8" do
    url "https://registry.npmjs.org/yaml/-/yaml-2.9.0.tgz"
    sha256 "008fa204cb1ba700e0272ba045abbf09a6ffe63456e8146ba97cac6c2ad1ef91"
  end

  resource "dependency-9" do
    url "https://registry.npmjs.org/yjs/-/yjs-13.6.33.tgz"
    sha256 "cfd28813389c4204a6d1ae3db7847c8b47195523c9ef8e31a8a4b69a2b499f34"
  end

  def install
    system Formula["node"].opt_bin/"node", "-e", "if (Number(process.versions.node.split('.')[0]) < 20) process.exit(1)"
    (libexec/"node_modules/@gpdoc/cli").install buildpath.children
    (libexec/"node_modules/@gpdoc/filekit").install resource("dependency-0")
    (libexec/"node_modules/argparse").install resource("dependency-1")
    (libexec/"node_modules/fflate").install resource("dependency-2")
    (libexec/"node_modules/isomorphic.js").install resource("dependency-3")
    (libexec/"node_modules/js-yaml").install resource("dependency-4")
    (libexec/"node_modules/lib0").install resource("dependency-5")
    (libexec/"node_modules/marked").install resource("dependency-6")
    (libexec/"node_modules/ws").install resource("dependency-7")
    (libexec/"node_modules/yaml").install resource("dependency-8")
    (libexec/"node_modules/yjs").install resource("dependency-9")
    (bin/"gpdoc").write <<~SH
      #!/bin/sh
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/node_modules/@gpdoc/cli/bin/gpdoc.js" "$@"
    SH
    (bin/"gpdoc").chmod 0555
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/gpdoc version").strip
    system bin/"gpdoc", "new", testpath/"sample.gpdoc.md", "--title", "Package test"
    assert_match '"valid":true', shell_output("#{bin}/gpdoc validate #{testpath}/sample.gpdoc.md --json")
  end
end
