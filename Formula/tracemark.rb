class Tracemark < Formula
  desc "Local code intelligence: every symbol, call and import with its evidence"
  homepage "https://github.com/Gabions256/tracemark"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Gabions256/tracemark/releases/download/v0.2.0/tracemark-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "91273390e3874dcbe7593ccac51c5d290f6430410535e40eaad7abe3d4aafea3"
    end
    on_intel do
      url "https://github.com/Gabions256/tracemark/releases/download/v0.2.0/tracemark-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "eb338f8ddbf6f35a04a308cbf4e6b923d548a2fd139af16ea6f7eab66c02ed9f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Gabions256/tracemark/releases/download/v0.2.0/tracemark-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "36558f93c6b3ba3aa32b90836df082cdf96e49a83d05c2a8077768252524fa32"
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
