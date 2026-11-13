class Codeatlas < Formula
  desc "Local code intelligence: every symbol, call and import with its evidence"
  homepage "https://github.com/Gabions256/codeatlas"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Gabions256/codeatlas/releases/download/v0.1.1/atlas-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "0090420a1ab91d95ecb41da66f2e7f14be06a1bf309c273f725a2ad192b50995"
    end
    on_intel do
      url "https://github.com/Gabions256/codeatlas/releases/download/v0.1.1/atlas-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "03808298edb161352aa23c3825d985834f6997404537b6e1855ca975d2b7c348"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Gabions256/codeatlas/releases/download/v0.1.1/atlas-v0.1.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "da1d9c4d164078b585d49271ba692fa11668139eae390db6fe801f76601c3298"
    end
  end

  conflicts_with "atlas", because: "both install an `atlas` executable"

  def install
    bin.install "atlas"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/atlas --version")
    (testpath/"a.ts").write "export function f() { return g(); }\nfunction g() {}\n"
    system bin/"atlas", "scan", testpath
    assert_match "f -> g", shell_output("#{bin}/atlas --project #{testpath} graph dependencies f")
  end
end
