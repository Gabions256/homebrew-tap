class Tracemark < Formula
  desc "Local code intelligence: every symbol, call and import with its evidence"
  homepage "https://github.com/Gabions256/tracemark"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Gabions256/tracemark/releases/download/v0.4.0/tracemark-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "d75369953164d26a72323b68c0543a03fc1bfcd168493eda0be3ba2a082464e1"
    end
    on_intel do
      url "https://github.com/Gabions256/tracemark/releases/download/v0.4.0/tracemark-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "f5979b173775045e892aabc390e57e1308d3f62e515c8efa445f6a4a25a4e680"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Gabions256/tracemark/releases/download/v0.4.0/tracemark-v0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "244d0b02b302e86a497055020bbabf451c235ac2ba3ff22a6f80f8713fe4562a"
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
