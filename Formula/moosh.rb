class Moosh < Formula
  desc "Moosh — MCP server that lets an AI agent control macOS"
  homepage "https://osx.agani.app"
  version "0.3.0"
  url "https://osx.agani.app/download/osx-mcp-0.3.0-macos-universal.tar.gz"
  sha256 "7640cb54185422e69837afc94dc8d5ff474c676bb557d9e03b295b6d863d119f"
  license "MIT"

  depends_on macos: :ventura

  def install
    bin.install "osx-mcp"
  end

  def caveats
    <<~EOS
      Moosh needs Accessibility permission before it can do anything, and
      Screen Recording permission for the Screenshot tool. Grant both to the
      app that starts the server (your terminal, Claude, Cursor, or ChatGPT)
      in System Settings → Privacy & Security.

      The command is osx-mcp. Point your MCP client at:
        #{opt_bin}/osx-mcp
    EOS
  end

  test do
    assert_predicate bin/"osx-mcp", :executable?
  end
end
