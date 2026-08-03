Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6A033F368
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773822; cv=none; b=rdQpxzzGTImA4CM0+uf6eH0de12U1j6HFP9aOlY03jz4OPlqEtX/OAjsd996b6v1hv2C/ltpCmDovnzXLtsctIa3ReWlaEru6j5IOnSJUXGU2jpL+C9TGrUHvym5X+CyE+j6SEJqy048gCD8fn2NHNj6JIFKROYBBkixJX+YbpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773822; c=relaxed/simple;
	bh=E2Wx0GwCStNxmO8wm7EoKnhIxSfDmBxToNsmWCxbSpA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ENjkhZmn6F2gfkNHxKLA87BxbnvGQDSZG1mZ9kfgPF6HgAFSC7bzqD0BDMZYdrD+iOYIGsjlflzWIhUszZN36+d/HpoRERlaakXn86rTCOL+gHFtOnBHnj15Vge6FrJQEY5TK1bljme0AUvXPGsuAyQHrOkwuJNYqUksr9lC0Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F92EOKaN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F92EOKaN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C145D1F00A3D;
	Mon,  3 Aug 2026 16:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785773820;
	bh=fz/yhgramPyqO11h3jGH/apBj+buGxJvV8oh1IsOZuw=;
	h=Date:From:To:Cc:Subject;
	b=F92EOKaNAqy4yd36v4eHUzQ4wojTze8kPEQfkjQJDB1N+R1AY+KoFCrZubtsafb7w
	 /JRuiZxMDXRAo3lpJXE8axmD3KDlYBMIIeQjaXnOy0lymPp8XzVo3TjDVrWW7ImtvN
	 8cXUzc6HO3H/AR7wb1CqRY+fmC/I98Qgcv1MUwG1vAdvxRBIZOivPbklQYLkCajSTn
	 IqKbtejx/171WxG+Mohx8wvsOvfumYpdyAzMJaOxRilMTlfJLsFnrwRMB0MZjxGllK
	 q4/7ou4vGhnfyd8C0nuKLgM7NTZIBy9rxzfo+wX1zOZ2V94sABg/s2ttdrsNwxvnT8
	 qO6u35bs7GuQw==
Date: Tue, 4 Aug 2026 00:16:55 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner DT Changes for 7.3
Message-ID: <anC-91INc6lOHrg1@home.wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RAz7QJWQMC7QD/S6"
Content-Disposition: inline


--RAz7QJWQMC7QD/S6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunx=
i-dt-for-7.3

for you to fetch changes up to be145483f8eee440d335ed794a2294fd55ff2a35:

  arm64: dts: allwinner: Correct white-space style (2026-08-03 23:37:01 +08=
00)

The top two patches were just merged, but they are pure whitespace fixes
=66rom the DT maintainer, and they compile correctly. So I just sent them
together.

----------------------------------------------------------------
Allwinner device tree changes for 7.3

Some changes for old chips/devices and some for recent ones.

- A10 PMU interrupt number fixed
- A100/A133 gained LRADC
- enabled overlay support for sun8i-h2-plus pi boards
- A523 family gained consumer IR receiver
- H728-based X96QPRO+ gained SPDIF audio output
- PinePhone's mpu6050 mount orientation fixed
- style fixes

New board added:
- Baijie Helper A133
- NetCube Systems OpenNMC (dobermann)

----------------------------------------------------------------
Alexander Sverdlin (5):
      dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
      dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
      dt-bindings: input: sun4i-lradc-keys: Add A100/A133 compatible
      arm64: dts: allwinner: a100: Add LRADC node
      arm64: dts: allwinner: A133: add support for Baijie Helper A133 board

Andre Przywara (2):
      ARM: dts: allwinner: a10: Fix PMU interrupt
      arm64: dts: allwinner: a523: enable IR on the Avaota A1

Justin Suess (3):
      media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
      arm64: dts: allwinner: a523: add IR receiver nodes
      arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+

Krzysztof Kozlowski (3):
      ARM: dts: allwinner: sun8i-h3: Correct indentation
      ARM: dts: allwinner: Correct white-space style
      arm64: dts: allwinner: Correct white-space style

Lukas Schmid (3):
      dt-bindings: arm: sunxi: Add NetCube Systems OpenNMC (dobermann)
      riscv: dts: allwinner: d1s-t113: Add uart4 pinctrl required by NetCub=
e Systems OpenNMC
      ARM: dts: allwinner: add support for NetCube Systems OpenNMC (doberma=
nn)

Nisarg Rajput (1):
      ARM: dts: allwinner: enable overlay support for sun8i-h2-plus pi boar=
ds

Ondrej Jirman (1):
      arm64: dts: allwinner: sun50i-a64-pinephone: Fix mpu6050 mount matrix

Per Larsson (2):
      arm64: dts: allwinner: a523: Add SPDIF output PH pin mux option
      arm64: dts: allwinner: a523: Enable SPDIF on X96QPRO+

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   7 +
 .../input/allwinner,sun4i-a10-lradc-keys.yaml      |   1 +
 .../bindings/media/allwinner,sun4i-a10-ir.yaml     |   8 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/allwinner/Makefile               |   5 +
 arch/arm/boot/dts/allwinner/sun4i-a10-gemei-g9.dts |   2 +-
 arch/arm/boot/dts/allwinner/sun4i-a10-inet1.dts    |   4 +-
 arch/arm/boot/dts/allwinner/sun4i-a10.dtsi         |   2 +-
 .../boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts    |   4 +-
 .../allwinner/sun8i-t113s-netcube-dobermann.dts    | 149 ++++++++++++++++
 .../dts/allwinner/sun8i-t113s-netcube-nagami.dtsi  |   2 +-
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi     |  10 ++
 .../allwinner/sun50i-a133-helperboard-core.dtsi    | 197 +++++++++++++++++=
++++
 .../boot/dts/allwinner/sun50i-a133-helperboard.dts | 148 ++++++++++++++++
 .../boot/dts/allwinner/sun50i-a64-pinephone.dtsi   |   4 +-
 .../boot/dts/allwinner/sun50i-a64-sopine.dtsi      |   2 +-
 .../allwinner/sun50i-h5-libretech-all-h5-cc.dts    |   2 +-
 .../boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts  |   2 +-
 .../dts/allwinner/sun50i-h5-orangepi-zero-plus.dts |   2 +-
 .../dts/allwinner/sun50i-h616-orangepi-zero.dtsi   |   2 +-
 .../dts/allwinner/sun50i-h618-orangepi-zero2w.dts  |   2 +-
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     |  43 +++++
 .../boot/dts/allwinner/sun55i-h728-x96qpro+.dts    |  30 ++++
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts   |   8 +-
 .../boot/dts/allwinner/sun55i-t527-orangepi-4a.dts |   2 +-
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi  |   6 +
 27 files changed, 627 insertions(+), 20 deletions(-)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-doberma=
nn.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard-c=
ore.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.d=
ts

--RAz7QJWQMC7QD/S6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmpwvvcACgkQOJpUIZwP
JDCfDxAAuv0e7TK4s9DBsBe2bzD+oC230jbqF07LjH5l05/fy8bGNoYwWS8S4nkz
si/vkNMT3xFqJgnVr3XHPkel08a9eDPML6sSi13MqHG+EqGEXBx3zm+gr7pFV3Na
8F5mUuCIRJ8gembiARkMf+F5YLZIq9L762rgzbFs4KHmFoH5r6q4JX4MGqKTQbaV
k41vcbNf7k4n3+Sjt29Ck49nvPsnDLqdvqdEHus8Dn81BxGuLAY3YkM2m10Z5rYO
p3KBsftI2sACzwMQCgLVPNNaoFZtCK5usb2mlC7D0S6uq55LDRas/qfoacvkIxsy
AVmrIbTqGXNE/LQVb4Ct7jP9WcfZI1d70ZgRoSYawLu/uxVjOdcD6XfK9rg0CodB
vzcBQbwU1exg5p0O3qtoH7d24Ru2+Px3qmC7xHQSwNOCOOHqmJlRUSeaQnqmbP7b
paV0kULrJlUBYfRPbl0ZJb1uejocx4eQ945jPSaDNEInWujqEzpG/05uNRNaGaP9
bm4JymygUvWykNn1d3JpNWqCjSnJDHX2ce+OCC9J6zHovECTrNin7jQU7kDliBJw
pO8r3F/lEvc10ySQKX62SFYwlOj+YgD+QYfvF2XNLsuGVNkxQlyPlFAN+uuFRDVa
jI1EuA6U+zgcQOxfRkBz4gYbEYSoQCX6ukKTkqF/b9mduxFh2BI=
=dy0/
-----END PGP SIGNATURE-----

--RAz7QJWQMC7QD/S6--
