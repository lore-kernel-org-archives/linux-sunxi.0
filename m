Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CFF3FB7E5
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Apr 2026 13:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468122; cv=none; b=uUTZa6bvZkrI/lftcLnE2PIdD7494Sm0bW5Pmo7nBT9zbAZOxJjRYlsbniOLz/8u8oR8TI4wQvfKakA59iTAkVTSYYnPsLrtTe5+t5YAk2XoJ7a2nK3PydRKKgs7mx8rEOw6TvIoUYJiQVzEBXc/RyNxKh1/QKx4vSGWjbTcvmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468122; c=relaxed/simple;
	bh=irXtwPrpSj0LK/Vc3C2L4jkuZhHTLgOTY1rrJGbeliA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQcXjn9a5iiHO1K3+GDNMQaG3byZ2jrW3LV2AW5Lq/1+EDI1WDj3B2OYi4/cNX1F6mQwnsINHMw9+EbeO9RP+VJCKvEldGucLIrLgdayOiLsKS0ahleI8XEdhTDu5TSifTOicVre/N7eHTCs9azNVpvSfLdAoEVuqJYSK9+a0gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id C93A41F8005C
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Apr 2026 13:08:35 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id BED27B404A1; Wed, 29 Apr 2026 13:08:34 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id D8235B4049B;
	Wed, 29 Apr 2026 13:08:32 +0000 (UTC)
Date: Wed, 29 Apr 2026 15:08:30 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Tom Rini <trini@konsulko.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 3/3] sunxi: configs: enable power LEDs on 64-bit boards
Message-ID: <afICzqv7jawLFjyB@shepard>
References: <20260429092828.3076719-1-andre.przywara@arm.com>
 <20260429092828.3076719-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4iRbv5l7W4bqZFhs"
Content-Disposition: inline
In-Reply-To: <20260429092828.3076719-4-andre.przywara@arm.com>


--4iRbv5l7W4bqZFhs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andre,

On Wed 29 Apr 26, 11:28, Andre Przywara wrote:
> We recently gained a simple way to enable a power LED very early in the
> SPL boot, through simple Kconfig variables.
>=20
> Add those symbols to those boards' defconfigs where the DT indicates a
> default-on power LED. The number used is <port bank> * 32 + <pin no>,
> an active low setup means CONFIG_SPL_SUNXI_LED_STATUS_ACTIVE_HIGH must be
> undefined.
>=20
> This will light up the power LED very early in the (SPL) boot phase on
> those 64-bit boards.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>

All the best,

Paul

> ---
>  configs/anbernic_rg35xx_h700_defconfig | 2 ++
>  configs/bananapi_m64_defconfig         | 2 ++
>  configs/beelink_gs1_defconfig          | 2 ++
>  configs/liontron-h-a133l_defconfig     | 3 +++
>  configs/nanopi_neo2_defconfig          | 2 ++
>  configs/nanopi_neo_plus2_defconfig     | 2 ++
>  configs/orangepi_3_defconfig           | 2 ++
>  configs/orangepi_lite2_defconfig       | 2 ++
>  configs/orangepi_pc2_defconfig         | 2 ++
>  configs/orangepi_prime_defconfig       | 2 ++
>  configs/orangepi_zero2_defconfig       | 2 ++
>  configs/orangepi_zero_plus2_defconfig  | 2 ++
>  configs/orangepi_zero_plus_defconfig   | 2 ++
>  configs/radxa-cubie-a5e_defconfig      | 3 +++
>  configs/tanix_tx1_defconfig            | 2 ++
>  15 files changed, 32 insertions(+)
>=20
> diff --git a/configs/anbernic_rg35xx_h700_defconfig b/configs/anbernic_rg=
35xx_h700_defconfig
> index 2fa57cbecce..2abea94e979 100644
> --- a/configs/anbernic_rg35xx_h700_defconfig
> +++ b/configs/anbernic_rg35xx_h700_defconfig
> @@ -16,6 +16,8 @@ CONFIG_DRAM_SUNXI_PHY_ADDR_MAP_1=3Dy
>  CONFIG_MACH_SUN50I_H616=3Dy
>  CONFIG_SUNXI_DRAM_H616_LPDDR4=3Dy
>  CONFIG_R_I2C_ENABLE=3Dy
> +CONFIG_SPL_SUNXI_LED_STATUS=3Dy
> +CONFIG_SPL_SUNXI_LED_STATUS_GPIO=3D268
>  CONFIG_SPL_I2C=3Dy
>  CONFIG_SPL_SYS_I2C_LEGACY=3Dy
>  CONFIG_SYS_I2C_MVTWSI=3Dy
> diff --git a/configs/bananapi_m64_defconfig b/configs/bananapi_m64_defcon=
fig
> index d957071cb13..3d1f5d27e5d 100644
> --- a/configs/bananapi_m64_defconfig
> +++ b/configs/bananapi_m64_defconfig
> @@ -4,6 +4,8 @@ CONFIG_DEFAULT_DEVICE_TREE=3D"sun50i-a64-bananapi-m64"
>  CONFIG_SPL=3Dy
>  CONFIG_MACH_SUN50I=3Dy
>  CONFIG_MMC_SUNXI_SLOT_EXTRA=3D2
> +CONFIG_SPL_SUNXI_LED_STATUS=3Dy
> +CONFIG_SPL_SUNXI_LED_STATUS_GPIO=3D120
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>  CONFIG_SUPPORT_EMMC_BOOT=3Dy
>  CONFIG_SUN8I_EMAC=3Dy
> diff --git a/configs/beelink_gs1_defconfig b/configs/beelink_gs1_defconfig
> index de46d205453..ebac032915f 100644
> --- a/configs/beelink_gs1_defconfig
> +++ b/configs/beelink_gs1_defconfig
> @@ -5,6 +5,8 @@ CONFIG_SPL=3Dy
>  CONFIG_MACH_SUN50I_H6=3Dy
>  CONFIG_SUNXI_DRAM_H6_LPDDR3=3Dy
>  CONFIG_MMC_SUNXI_SLOT_EXTRA=3D2
> +CONFIG_SPL_SUNXI_LED_STATUS=3Dy
> +CONFIG_SPL_SUNXI_LED_STATUS_GPIO=3D356
>  # CONFIG_PSCI_RESET is not set
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>  CONFIG_LED=3Dy
> diff --git a/configs/liontron-h-a133l_defconfig b/configs/liontron-h-a133=
l_defconfig
> index 831d5b56e3a..836e8d12ff0 100644
> --- a/configs/liontron-h-a133l_defconfig
> +++ b/configs/liontron-h-a133l_defconfig
> @@ -23,6 +23,9 @@ CONFIG_MACH_SUN50I_A133=3Dy
>  CONFIG_SUNXI_DRAM_A133_LPDDR4=3Dy
>  CONFIG_MMC_SUNXI_SLOT_EXTRA=3D2
>  CONFIG_R_I2C_ENABLE=3Dy
> +CONFIG_SPL_SUNXI_LED_STATUS=3Dy
> +CONFIG_SPL_SUNXI_LED_STATUS_GPIO=3D240
> +# CONFIG_SPL_SUNXI_LED_STATUS_ACTIVE_HIGH is not set
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>  CONFIG_SPL_I2C=3Dy
>  CONFIG_SPL_SYS_I2C_LEGACY=3Dy
> diff --git a/configs/nanopi_neo2_defconfig b/configs/nanopi_neo2_defconfig
> index 6704a24a880..63fa6bac9ba 100644
> --- a/configs/nanopi_neo2_defconfig
> +++ b/configs/nanopi_neo2_defconfig
> @@ -6,6 +6,8 @@ CONFIG_SPL=3Dy
>  CONFIG_MACH_SUN50I_H5=3Dy
>  CONFIG_DRAM_ZQ=3D3881977
>  # CONFIG_DRAM_ODT_EN is not set
> +CONFIG_SPL_SUNXI_LED_STATUS=3Dy
> +CONFIG_SPL_SUNXI_LED_STATUS_GPIO=3D362
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>  CONFIG_SUN8I_EMAC=3Dy
>  CONFIG_USB_EHCI_HCD=3Dy
> diff --git a/configs/nanopi_neo_plus2_defconfig b/configs/nanopi_neo_plus=
2_defconfig
> index e80e32a63d4..9d1b783476d 100644
> --- a/configs/nanopi_neo_plus2_defconfig
> +++ b/configs/nanopi_neo_plus2_defconfig
> @@ -7,6 +7,8 @@ CONFIG_MACH_SUN50I_H5=3Dy
>  CONFIG_DRAM_ZQ=3D3881977
>  # CONFIG_DRAM_ODT_EN is not set
>  CONFIG_MMC_SUNXI_SLOT_EXTRA=3D2
> +CONFIG_SPL_SUNXI_LED_STATUS=3Dy
> +CONFIG_SPL_SUNXI_LED_STATUS_GPIO=3D362
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>  CONFIG_SUN8I_EMAC=3Dy
>  CONFIG_USB_EHCI_HCD=3Dy
> diff --git a/configs/orangepi_3_defconfig b/configs/orangepi_3_defconfig
> index 125137bc321..409fa705a06 100644
> --- a/configs/orangepi_3_defconfig
> +++ b/configs/orangepi_3_defconfig
> @@ -6,6 +6,8 @@ CONFIG_MACH_SUN50I_H6=3Dy
>  CONFIG_SUNXI_DRAM_H6_LPDDR3=3Dy
>  CONFIG_MMC_SUNXI_SLOT_EXTRA=3D2
>  CONFIG_BLUETOOTH_DT_DEVICE_FIXUP=3D"brcm,bcm4345c5"
> +CONFIG_SPL_SUNXI_LED_STATUS=3Dy
> +CONFIG_SPL_SUNXI_LED_STATUS_GPIO=3D356
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>  CONFIG_PHY_SUN50I_USB3=3Dy
>  CONFIG_USB_XHCI_HCD=3Dy
> diff --git a/configs/orangepi_lite2_defconfig b/configs/orangepi_lite2_de=
fconfig
> index 577f7436c15..5d72d34eb9d 100644
> --- a/configs/orangepi_lite2_defconfig
> +++ b/configs/orangepi_lite2_defconfig
> @@ -4,6 +4,8 @@ CONFIG_DEFAULT_DEVICE_TREE=3D"sun50i-h6-orangepi-lite2"
>  CONFIG_SPL=3Dy
>  CONFIG_MACH_SUN50I_H6=3Dy
>  CONFIG_SUNXI_DRAM_H6_LPDDR3=3Dy
> +CONFIG_SPL_SUNXI_LED_STATUS=3Dy
> +CONFIG_SPL_SUNXI_LED_STATUS_GPIO=3D356
>  # CONFIG_PSCI_RESET is not set
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>  CONFIG_USB_EHCI_HCD=3Dy
> diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defcon=
fig
> index d856a25814b..464b34f4ec0 100644
> --- a/configs/orangepi_pc2_defconfig
> +++ b/configs/orangepi_pc2_defconfig
> @@ -6,6 +6,8 @@ CONFIG_SPL=3Dy
>  CONFIG_MACH_SUN50I_H5=3Dy
>  CONFIG_DRAM_ZQ=3D3881977
>  CONFIG_SPL_SPI_SUNXI=3Dy
> +CONFIG_SPL_SUNXI_LED_STATUS=3Dy
> +CONFIG_SPL_SUNXI_LED_STATUS_GPIO=3D362
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>  CONFIG_SPL_I2C=3Dy
>  CONFIG_SPL_SYS_I2C_LEGACY=3Dy
> diff --git a/configs/orangepi_prime_defconfig b/configs/orangepi_prime_de=
fconfig
> index e93154cc0e9..e5e9009378c 100644
> --- a/configs/orangepi_prime_defconfig
> +++ b/configs/orangepi_prime_defconfig
> @@ -6,6 +6,8 @@ CONFIG_SPL=3Dy
>  CONFIG_MACH_SUN50I_H5=3Dy
>  CONFIG_DRAM_ZQ=3D3881977
>  # CONFIG_DRAM_ODT_EN is not set
> +CONFIG_SPL_SUNXI_LED_STATUS=3Dy
> +CONFIG_SPL_SUNXI_LED_STATUS_GPIO=3D362
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>  CONFIG_SUN8I_EMAC=3Dy
>  CONFIG_USB_EHCI_HCD=3Dy
> diff --git a/configs/orangepi_zero2_defconfig b/configs/orangepi_zero2_de=
fconfig
> index 831bfe66e25..b387b4795ad 100644
> --- a/configs/orangepi_zero2_defconfig
> +++ b/configs/orangepi_zero2_defconfig
> @@ -10,6 +10,8 @@ CONFIG_MACH_SUN50I_H616=3Dy
>  CONFIG_SUNXI_DRAM_H616_DDR3_1333=3Dy
>  CONFIG_R_I2C_ENABLE=3Dy
>  CONFIG_SPL_SPI_SUNXI=3Dy
> +CONFIG_SPL_SUNXI_LED_STATUS=3Dy
> +CONFIG_SPL_SUNXI_LED_STATUS_GPIO=3D76
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>  CONFIG_SPL_I2C=3Dy
>  CONFIG_SPL_SYS_I2C_LEGACY=3Dy
> diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zer=
o_plus2_defconfig
> index c4d9800975c..9758ffd385e 100644
> --- a/configs/orangepi_zero_plus2_defconfig
> +++ b/configs/orangepi_zero_plus2_defconfig
> @@ -7,6 +7,8 @@ CONFIG_MACH_SUN50I_H5=3Dy
>  CONFIG_DRAM_ZQ=3D3881977
>  # CONFIG_DRAM_ODT_EN is not set
>  CONFIG_MMC_SUNXI_SLOT_EXTRA=3D2
> +CONFIG_SPL_SUNXI_LED_STATUS=3Dy
> +CONFIG_SPL_SUNXI_LED_STATUS_GPIO=3D362
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>  CONFIG_SUN8I_EMAC=3Dy
>  CONFIG_USB_EHCI_HCD=3Dy
> diff --git a/configs/orangepi_zero_plus_defconfig b/configs/orangepi_zero=
_plus_defconfig
> index 4b6491dc846..bb159428a14 100644
> --- a/configs/orangepi_zero_plus_defconfig
> +++ b/configs/orangepi_zero_plus_defconfig
> @@ -6,6 +6,8 @@ CONFIG_SPL=3Dy
>  CONFIG_MACH_SUN50I_H5=3Dy
>  CONFIG_DRAM_ZQ=3D3881977
>  # CONFIG_DRAM_ODT_EN is not set
> +CONFIG_SPL_SUNXI_LED_STATUS=3Dy
> +CONFIG_SPL_SUNXI_LED_STATUS_GPIO=3D362
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>  CONFIG_SUN8I_EMAC=3Dy
>  CONFIG_USB_EHCI_HCD=3Dy
> diff --git a/configs/radxa-cubie-a5e_defconfig b/configs/radxa-cubie-a5e_=
defconfig
> index 9d204ef5548..84bc4e3d4a9 100644
> --- a/configs/radxa-cubie-a5e_defconfig
> +++ b/configs/radxa-cubie-a5e_defconfig
> @@ -15,6 +15,9 @@ CONFIG_DRAM_SUNXI_TPR12=3D0x3533302f
>  CONFIG_MACH_SUN55I_A523=3Dy
>  CONFIG_MMC_SUNXI_SLOT_EXTRA=3D2
>  CONFIG_R_I2C_ENABLE=3Dy
> +CONFIG_SPL_SUNXI_LED_STATUS=3Dy
> +CONFIG_SPL_SUNXI_LED_STATUS_GPIO=3D356
> +# CONFIG_SPL_SUNXI_LED_STATUS_ACTIVE_HIGH is not set
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>  CONFIG_SPL_I2C=3Dy
>  CONFIG_SPL_SYS_I2C_LEGACY=3Dy
> diff --git a/configs/tanix_tx1_defconfig b/configs/tanix_tx1_defconfig
> index 1bd167ce0f6..03b18701859 100644
> --- a/configs/tanix_tx1_defconfig
> +++ b/configs/tanix_tx1_defconfig
> @@ -14,6 +14,8 @@ CONFIG_MACH_SUN50I_H616=3Dy
>  CONFIG_SUNXI_DRAM_H616_LPDDR3=3Dy
>  CONFIG_MMC_SUNXI_SLOT_EXTRA=3D2
>  CONFIG_R_I2C_ENABLE=3Dy
> +CONFIG_SPL_SUNXI_LED_STATUS=3Dy
> +CONFIG_SPL_SUNXI_LED_STATUS_GPIO=3D231
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>  CONFIG_SPL_I2C=3Dy
>  CONFIG_SPL_SYS_I2C_LEGACY=3Dy
> --=20
> 2.43.0
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--4iRbv5l7W4bqZFhs
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnyAs4ACgkQhP3B6o/u
lQxTCA/9EJ/AOv/y6qvJMOy8x6XkxwfFX/4WsUv9Uu8SB3zPMTZhBHjkgwDxQ8aF
CzVPggypLKkHVe/u3zl/OMoFg+c3spp0lgJlWgNg6tdz7m1io/VfSPUWKIHkQmFc
mdkI9B3KCZ+gPNetrFyboAN25NZwb/tBlYcLQWmeoT7Aq2U/fv1fxF1XF1UBE6Db
jJmg9mGnADnYLvBG0se5e0d38AFcmYbDzHrvJoXJgeyP0s3uX6Esu7Luo5mY8aBe
MoKxeb4Pg1sNea8gwQFp6AHQoncrvxxNJgFcPeQ/nZWdjoQLT7ea5P3kJJBIM16t
57jN3KzohE9qAhO3lbE8gXyVa0dGLGVjX6PdrUkWrQr6IHmnxT1GJpjnYC0O52n0
JRVhz+vvjLJeSM9/0HUSlN2AehSZEjqei+Nshpk8QbmMCzoFocwcA3yOBvVl/Wy0
CatlamvQjmtf/hbHuCEKwjZ511z8jZXe7emAYehxoY0yZNed/VdGI1laA/6fxEGU
o+3Nc5s2K/eLwYWOl9CsQMV67W1GHqsYwpVJ+rKHdbs1l68W0CkDv+vl/lAwOaRf
uvzbi0fQh0ldkCN8G5sWlbBQKDbhpw5GPG8c+BYYyEWJwkOisIsZKDMtelgwe4Hk
0Y94CsFAR/pgSKllK/jdVMpuTvT4vQWtVsWJsUhJL/1u2j0w8tA=
=25xE
-----END PGP SIGNATURE-----

--4iRbv5l7W4bqZFhs--
