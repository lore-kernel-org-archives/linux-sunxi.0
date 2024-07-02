Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AAD1AD9E7
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Jul 2024 15:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719933686; cv=none; b=Xjdf9cjKqIbNbGJeKcuhnv39salOlWIAHL4Qfio0CWTdh5O3HQUBRTR+C4sLzNwsC9i8e9mjJrGh1nTL3MFe1TAezja/FSm2Icm0QkXJFiSP5bSHLS7hKuoILDUMLlUYV7B4NUDCFD8JNgkitmfFIG1iJV/LUVEACVNJDAlmeWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719933686; c=relaxed/simple;
	bh=4Fi+t1hnknC6MAcud7j4Xp/6+RBHlyGiIsKdAkBOi/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u+RISKEv+U595FJwo9WGI1va5YfSSCfaJRfq0W7ffnuYkcZcQOeTAwg/gdjSRrfjVBrWfDwD8W6U0SxXFAKYuML1ZtKZcNIFvi6iF5FOOVXxOGTW/WujUBvScx4Jz8SbCIwxGmMuY/GybBsDX7vBWa3RVbOjuxvrs1Fo2seOFKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NGDSzd79; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NGDSzd79"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B6DC2BD10;
	Tue,  2 Jul 2024 15:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719933685;
	bh=4Fi+t1hnknC6MAcud7j4Xp/6+RBHlyGiIsKdAkBOi/Y=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=NGDSzd79bP31L3+BMOk83S9D5OkGxAhCc500Lr8m9pV0mUccRD4hhntAiJ6qQjGdR
	 CppRtUoa4dWLi3yXHvQN0/v2R+8+vpJb2I0W28FFn1Wzl+f2vUTUxrxrVYpJDKPX/u
	 sDBytKOiClPitGS+oHOrHuV80JJK8cyWaAhskV52UzDDCgqMTEkrCi9+WN0UD7rgXR
	 149wNsS5fBu5XH2kabCNLLIWcFwB4jczYfDSwh/lj+gwMof/Jwcl/2kP0YSIfyBjUc
	 zqTtHX1V0qmTpVgCmLfwevKMEVY3hZkmagScY7WPsOSbJhX+alpRuaJDC+hNIiydMw
	 HKGisgOxV+7iQ==
Received: by wens.tw (Postfix, from userid 1000)
	id BDB495F852; Tue,  2 Jul 2024 23:21:22 +0800 (CST)
Date: Tue, 2 Jul 2024 23:21:22 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/3] Allwinner SoC device tree changes for 6.11
Message-ID: <ZoQa8r1N8yi7FlPV@wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zC3t8RTKVMd8uPGl"
Content-Disposition: inline


--zC3t8RTKVMd8uPGl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi SoC maintainers,

Here's the last pull request for this cycle. As the tag mentions, there
is one commit that is shared with the clk changes. Also, ARM64 and
RISC-V changes are combined in one branch / tag. We don't have a lot of
the latter, but please let me know if you prefer otherwise.


The Allwinner SoCs have a bunch of changes including

- cache information for all the ARM64 SoCs
- more peripherals for H616
- CPU DVFS on some H700 boards
- name and model fixups for Pine64 boards
- system LDOs (embedded in the SoC) for D1s/T11s SoC
- New boards: ClockworkPi and DevTerm

Please pull.


Thanks
ChenYu



The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunx=
i-dt-for-6.11

for you to fetch changes up to 0ce1d34678e5d214746ee4887f9f7714c39e331f:

  riscv: dts: allwinner: Add ClockworkPi and DevTerm devicetrees (2024-06-3=
0 23:06:52 +0800)

----------------------------------------------------------------
Allwinner SoC device tree changes for 6.11

This includes a commit shared with the clk tree. This commit adds clock
and reset indices to the device tree binding, and thus is needed for
both the device tree and driver changes.

ARM64 device tree and binding-only changes
- Add LRADC (low resolution ADC for resistor network based keys) for H616 S=
oC
- Add cache information for A64, H6, and H616 SoCs
- Correct model names and descriptions for Pine64 boards
- Add GPADC (general purpose ADC) for H616 SoC
- Add ADC joysticks based on GPADC for anbernic-rg35xx-h board
- Add additional CPU OPPs for the H700 on top of existing H616 ones
- Enable DVFS for rg35xx boards
- Add IOMMU for H616 SoC

RISC-V device tree changes
- Add system LDOs to D1s/T113 SoC
- Add ClockworkPi and DevTerm device trees

----------------------------------------------------------------
Andre Przywara (1):
      arm64: dts: allwinner: h616: add IOMMU node

Chen-Yu Tsai (2):
      Merge branch 'sunxi/shared-clk-ids-for-6.11' into sunxi/dt-for-6.11
      riscv: dts: allwinner: d1s-t113: Add system LDOs

Chris Morgan (3):
      dt-bindings: clock: sun50i-h616-ccu: Add GPADC clocks
      arm64: dts: allwinner: h616: Add GPADC device node
      arm64: dts: allwinner: anbernic-rg35xx-h: Add ADC joysticks

Dragan Simic (5):
      arm64: dts: allwinner: Add cache information to the SoC dtsi for H6
      dt-bindings: arm: sunxi: Correct the descriptions for Pine64 boards
      arm64: dts: allwinner: Correct the model names for Pine64 boards
      arm64: dts: allwinner: Add cache information to the SoC dtsi for A64
      arm64: dts: allwinner: Add cache information to the SoC dtsi for H616

James McGregor (2):
      dt-bindings: input: sun4i-lradc-keys: Add H616 compatible
      ARM: dts: sun50i: Add LRADC node

Pavel L=F6bl (1):
      ARM: dts: sunxi: remove duplicated entries in makefile

Ryan Walklin (2):
      arm64: dts: allwinner: h616: add additional CPU OPPs for the H700
      arm64: dts: allwinner: rg35xx: Enable DVFS CPU frequency scaling

Samuel Holland (1):
      riscv: dts: allwinner: Add ClockworkPi and DevTerm devicetrees

 Documentation/devicetree/bindings/arm/sunxi.yaml   |  16 +-
 .../input/allwinner,sun4i-a10-lradc-keys.yaml      |   4 +-
 arch/arm/boot/dts/allwinner/Makefile               |  62 -----
 .../boot/dts/allwinner/sun50i-a64-pine64-lts.dts   |   2 +-
 .../boot/dts/allwinner/sun50i-a64-pine64-plus.dts  |   2 +-
 .../arm64/boot/dts/allwinner/sun50i-a64-pine64.dts |   2 +-
 .../boot/dts/allwinner/sun50i-a64-pinebook.dts     |   2 +-
 .../allwinner/sun50i-a64-pinetab-early-adopter.dts |   2 +-
 .../boot/dts/allwinner/sun50i-a64-pinetab.dts      |   2 +-
 .../dts/allwinner/sun50i-a64-sopine-baseboard.dts  |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      |  37 ++-
 .../dts/allwinner/sun50i-h6-pine-h64-model-b.dts   |   2 +-
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts      |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi       |  37 +++
 .../boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi    |  25 +-
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  67 ++++++
 .../allwinner/sun50i-h700-anbernic-rg35xx-2024.dts |   4 +-
 .../allwinner/sun50i-h700-anbernic-rg35xx-h.dts    |  79 +++++++
 arch/riscv/boot/dts/allwinner/Makefile             |   2 +
 .../dts/allwinner/sun20i-d1-clockworkpi-v3.14.dts  | 252 +++++++++++++++++=
++++
 .../boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts |  36 +++
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi  |  11 +
 include/dt-bindings/clock/sun50i-h616-ccu.h        |   1 +
 include/dt-bindings/reset/sun50i-h616-ccu.h        |   1 +
 24 files changed, 558 insertions(+), 94 deletions(-)
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-clockworkpi-v3.=
14.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.d=
ts

--zC3t8RTKVMd8uPGl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmaEGvIACgkQOJpUIZwP
JDBGRhAA5xRw7IkiXsPzlH0c/VBOyVlObRESvauWCjDT9rzjI5lkgNWKb9Dq9i2j
fgrMxosBXFF9dlMfoW5v9630zHORUdZHZW3D+RnOJoUek2cBJXKmOUsNQOjdOesb
DazeEb8+e+QHXcSveMJiVtFQvM6iwTloj6vU8+DaoD0Z4NUgGTaYIgzFhIDyH6AY
6SlPAVMgX3UrnAv9shT/CEEJQ1HoqE6CAIWBrRvlrALLfVLHQQjyNQkrojQpbfVn
psbeokolc95lv5PJ2lsT/pAk1Mgj6/MqwzVuImGelMfIhJ8hmvFwXnt0aAKtcdap
PchoDjCjeIpAfQI1TVqeFAlYH51W4ORv0ChaLG6qI37U6Qu5eiewzrATGa6X5NsQ
G3Kj9lR+ib16Ub1i5aTW5q19xxz/w44TnbSkJFJTZa8OvLKUlPmR75eXXa78DMIT
XBmM8gwb8ibyd3hN377mO/TQgAhP+T0KT4WA0jYbBdF31qq4sEkkqOpClCrxWaIi
ySm8SmF0PEiLktmbzMYvnUV3kCV10+vkkJfjmOMYmO7rLf5kDN3Oj1zN0ysV2Sy1
YWPAYYgyM8FXcedIHCtpOXblKcgvlMOs4+QN0+2sXo+LJdjDncxliwkJgeOJ0yQY
RPnBKw8UoIOxtLkzd6D5JKbvcPN2FEqnI58eNj1APHltptZoo/g=
=wKUw
-----END PGP SIGNATURE-----

--zC3t8RTKVMd8uPGl--
