class Tracemark < Formula
  desc "Local code intelligence: every symbol, call and import with its evidence"
  homepage "https://github.com/Gabions256/tracemark"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Gabions256/tracemark/releases/download/v0.5.0/tracemark-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "de758098d1a35a9e9fc77cdada512ee5b5783616fe970e1aaaa6692f9baf90e5"
    end
    on_intel do
      url "https://github.com/Gabions256/tracemark/releases/download/v0.5.0/tracemark-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "e8c3c5710ec45f214d66dc5ea0dcbb49660417714a0564ff2d1a8db03c1997b0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Gabions256/tracemark/releases/download/v0.5.0/tracemark-v0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "57f05d3598c867465d4b01a2fd9a1769540b1d4261fd49b29590b8183f773ff5"
    end
  end

  def install
    bin.install "tracemark"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tracemark --version")
    (testpath/"a.ts").write "export function f() { return g(); }\nfunction g() {}\n"
    system bin/"tracemark", "scan", testpath
    assert_match "f -> g", shell_output("#{bin}/tracemark --project #{testpath} graph dependencies f")
  end
end
