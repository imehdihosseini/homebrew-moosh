# Homebrew formula for moosh.
#
# The version, url and sha256 lines below are rewritten automatically by
# .github/workflows/release.yml every time a tag is pushed. Keep them on one
# line each or that rewrite will stop matching.
class Moosh < Formula
  desc "Moosh — MCP server that lets an AI agent control macOS"
  homepage "https://moosh.agani.app"
  version "0.3.0"
  url "https://moosh.agani.app/download/moosh-0.3.0-macos-universal.tar.gz"
  sha256 "ade0abd42bfadaa9605da7874d46bef208e5fdada9e90ed82a43b1d48ce62879"
  license "MIT"

  depends_on macos: :ventura

  def install
    bin.install "moosh"
  end

  def caveats
    <<~EOS
      moosh needs Accessibility permission before it can do anything, and
      Screen Recording permission for the Screenshot tool. Grant both to the app
      that starts the server (your terminal, Claude, Cursor or ChatGPT) in
      System Settings, then Privacy & Security.

      Point your MCP client at the full path:
        #{opt_bin}/moosh
    EOS
  end

  test do
    assert_predicate bin/"moosh", :executable?
    assert_match "Architectures in the fat file", shell_output("lipo -info #{bin}/moosh")
  end
end