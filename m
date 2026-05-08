Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F7F343D8F
	for <linux-sunxi@lists.linux.dev>; Fri,  8 May 2026 12:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778243162; cv=none; b=rKK0H17w91q8uVn1HBZ2A88JBfEtgEWHRpLHWKgu4xeTxrrR4DDDLLlpTPytZbzNQezVQA0XDtot4iP2mmImH2G/2lWSyYIzz7vwym+6/zfzpozsF6cjCjgpeCNc1OMK410b3FkdffSaTHPY1IvdjisDQeCZO8egTqkvVX0tq8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778243162; c=relaxed/simple;
	bh=tePm3ihPSpfsy2Cml1JZLABTDerqvwjcSOwgAWL+wGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NcppCabhcqFnmCmldPOBd7+DKBDQmmLwhvjeLawya81SEOXxwwSE7ayL8CttQo0gV9V4uyA1IQ4ECSSoqQHO5v+LzYzffimV7fxO3tl3AVE4x+ztQ9DZ0f6OTNNmq4Ak0eu2iD1YYr31V7aq1lOZoIM0Kwo5SNMccx38+QjffJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 7577F1F8004F
	for <linux-sunxi@lists.linux.dev>; Fri,  8 May 2026 12:25:50 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 6ABF2B4061D; Fri,  8 May 2026 12:25:49 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (82-65-240-19.subs.proxad.net [82.65.240.19])
	by laika.paulk.fr (Postfix) with ESMTPSA id 27CD5B4061D;
	Fri,  8 May 2026 12:25:43 +0000 (UTC)
Date: Fri, 8 May 2026 14:25:40 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/2] sunxi: A133: dram: Add NSI arbiter configuration
 support
Message-ID: <af3WRFvaTlhWlT8J@shepard>
References: <20260430135838.3438728-1-andre.przywara@arm.com>
 <20260430135838.3438728-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YsBgI9Fwk4KfvvSv"
Content-Disposition: inline
In-Reply-To: <20260430135838.3438728-3-andre.przywara@arm.com>


--YsBgI9Fwk4KfvvSv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andre,

On Thu 30 Apr 26, 15:58, Andre Przywara wrote:
> From: Paul Kocialkowski <contact@paulk.fr>

Actually I made a mistake when sending this initially and this should
be my work email instead:

=46rom: Paul Kocialkowski <paulk@sys-base.io>

All the best,

Paul

>=20
> The Allwinner DRAM controllers contains logic to assign priorities to
> various DRAM DMA masters. Configuring this DRAM port arbitration priority
> correctly is important to make sure that critical masters are not starved
> by other less important ones. This is especially the case with the display
> engine that needs to be able to fetch pixels in time for scanout and can
> easily be starved by CPU or GPU access.
>=20
> Add support for configuring the NSI arbiter in the A133 DRAM init code,
> using the recently refactored NSI code already used on the A523.
> The list and order of available ports are highly SoC-specific and the
> default config values are set to match the BSP's defaults.
>=20
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> [Andre: using new generic NSI function]
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Sponsored-by: MEC Electronics GmbH <https://www.mec.at/>
> ---
>  .../include/asm/arch-sunxi/cpu_sun50i_h6.h    |  4 ++
>  .../include/asm/arch-sunxi/dram_sun50i_a133.h | 23 ++++++++++
>  arch/arm/mach-sunxi/Makefile                  |  2 +-
>  arch/arm/mach-sunxi/dram_sun50i_a133.c        | 43 ++++++++++++++++++-
>  4 files changed, 70 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/include/asm/arch-sunxi/cpu_sun50i_h6.h b/arch/arm/i=
nclude/asm/arch-sunxi/cpu_sun50i_h6.h
> index b0f2d3f4656..c31437f9acc 100644
> --- a/arch/arm/include/asm/arch-sunxi/cpu_sun50i_h6.h
> +++ b/arch/arm/include/asm/arch-sunxi/cpu_sun50i_h6.h
> @@ -17,6 +17,10 @@
> =20
>  #define SUNXI_GIC400_BASE		0x03020000
> =20
> +#ifdef CONFIG_MACH_SUN50I_A133
> +#define SUNXI_NSI_BASE			0x03100000
> +#endif
> +
>  #ifdef CONFIG_MACH_SUN50I_H6
>  #define SUNXI_DRAM_COM_BASE		0x04002000
>  #define SUNXI_DRAM_CTL0_BASE		0x04003000
> diff --git a/arch/arm/include/asm/arch-sunxi/dram_sun50i_a133.h b/arch/ar=
m/include/asm/arch-sunxi/dram_sun50i_a133.h
> index 01f2214cd15..1e8e0f7ab96 100644
> --- a/arch/arm/include/asm/arch-sunxi/dram_sun50i_a133.h
> +++ b/arch/arm/include/asm/arch-sunxi/dram_sun50i_a133.h
> @@ -24,6 +24,29 @@ static inline int ns_to_t(int nanoseconds)
>  	return DIV_ROUND_UP(ctrl_freq * nanoseconds, 1000);
>  }
> =20
> +enum sunxi_nsi_port {
> +	SUNXI_NSI_PORT_CPU	=3D 0,
> +	SUNXI_NSI_PORT_GPU,
> +	SUNXI_NSI_PORT_SD1,
> +	SUNXI_NSI_PORT_MSTG,
> +	SUNXI_NSI_PORT_GMAC0,
> +	SUNXI_NSI_PORT_GMAC1,
> +	SUNXI_NSI_PORT_USB0,
> +	SUNXI_NSI_PORT_USB1,
> +	SUNXI_NSI_PORT_NDFC,
> +	SUNXI_NSI_PORT_DMAC,
> +	SUNXI_NSI_PORT_CE,
> +	SUNXI_NSI_PORT_DE0,
> +	SUNXI_NSI_PORT_DE1,
> +	SUNXI_NSI_PORT_VE,
> +	SUNXI_NSI_PORT_CSI,
> +	SUNXI_NSI_PORT_ISP,
> +	SUNXI_NSI_PORT_G2D,
> +	SUNXI_NSI_PORT_EINK,
> +	SUNXI_NSI_PORT_IOMMU,
> +	SUNXI_NSI_PORT_CPUS,
> +};
> +
>  /* MBUS part is largely the same as in H6, except for one special regist=
er */
>  #define MCTL_COM_UNK_008	0x008
>  /* NOTE: This register has the same importance as mctl_ctl->clken in H61=
6 */
> diff --git a/arch/arm/mach-sunxi/Makefile b/arch/arm/mach-sunxi/Makefile
> index 3ef0113ea43..30cce7d1784 100644
> --- a/arch/arm/mach-sunxi/Makefile
> +++ b/arch/arm/mach-sunxi/Makefile
> @@ -48,7 +48,7 @@ obj-$(CONFIG_DRAM_SUN50I_H6)	+=3D dram_sun50i_h6.o dram=
_dw_helpers.o
>  obj-$(CONFIG_DRAM_SUN50I_H6)	+=3D dram_timings/
>  obj-$(CONFIG_DRAM_SUN50I_H616)	+=3D dram_sun50i_h616.o dram_dw_helpers.o
>  obj-$(CONFIG_DRAM_SUN50I_H616)	+=3D dram_timings/
> -obj-$(CONFIG_DRAM_SUN50I_A133)	+=3D dram_sun50i_a133.o
> +obj-$(CONFIG_DRAM_SUN50I_A133)	+=3D dram_sun50i_a133.o sunxi_nsi.o
>  obj-$(CONFIG_DRAM_SUN50I_A133)	+=3D dram_timings/
>  obj-$(CONFIG_MACH_SUN55I_A523)	+=3D dram_sun55i_a523.o dram_dw_helpers.o=
 sunxi_nsi.o
>  obj-$(CONFIG_DRAM_SUN55I_A523)	+=3D dram_timings/
> diff --git a/arch/arm/mach-sunxi/dram_sun50i_a133.c b/arch/arm/mach-sunxi=
/dram_sun50i_a133.c
> index ca3e2513c69..433044e1e2b 100644
> --- a/arch/arm/mach-sunxi/dram_sun50i_a133.c
> +++ b/arch/arm/mach-sunxi/dram_sun50i_a133.c
> @@ -21,6 +21,7 @@
>  #include <asm/arch/cpu.h>
>  #include <asm/arch/dram.h>
>  #include <asm/arch/prcm.h>
> +#include <asm/arch/sunxi_nsi.h>
>  #include <asm/io.h>
>  #include <init.h>
>  #include <linux/bitops.h>
> @@ -69,6 +70,41 @@ static const u8 phy_init[] =3D {
>  };
>  #endif
> =20
> +static void nsi_set_master_priority(void)
> +{
> +	struct {
> +		unsigned int port;
> +		u8 pri;
> +		u8 qos_sel;
> +	} ports[] =3D {
> +		NSI_CONF(CPU,	LOWEST,		INPUT),
> +		NSI_CONF(GPU,	LOWEST,		INPUT),
> +		NSI_CONF(SD1,	LOWEST,		OUTPUT),
> +		NSI_CONF(MSTG,	LOWEST,		OUTPUT),
> +		NSI_CONF(GMAC0,	LOWEST,		OUTPUT),
> +		NSI_CONF(GMAC1,	LOWEST,		OUTPUT),
> +		NSI_CONF(USB0,	LOWEST,		OUTPUT),
> +		NSI_CONF(USB1,	LOWEST,		OUTPUT),
> +		NSI_CONF(NDFC,	LOWEST,		OUTPUT),
> +		NSI_CONF(DMAC,	LOWEST,		OUTPUT),
> +		NSI_CONF(CE,	LOWEST,		OUTPUT),
> +		NSI_CONF(DE0,	HIGH,		INPUT),
> +		NSI_CONF(DE1,	HIGH,		INPUT),
> +		NSI_CONF(VE,	LOWEST,		INPUT),
> +		NSI_CONF(CSI,	HIGH,		INPUT),
> +		NSI_CONF(ISP,	HIGH,		INPUT),
> +		NSI_CONF(G2D,	LOWEST,		INPUT),
> +		NSI_CONF(EINK,	LOWEST,		OUTPUT),
> +		NSI_CONF(IOMMU,	HIGHEST,	INPUT),
> +		NSI_CONF(CPUS,	LOWEST,		OUTPUT),
> +	};
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(ports); i++)
> +		nsi_configure_port(ports[i].port, ports[i].pri,
> +				   ports[i].qos_sel);
> +}
> +
>  static void mctl_clk_init(u32 clk)
>  {
>  	void * const ccm =3D (void *)SUNXI_CCM_BASE;
> @@ -1205,6 +1241,7 @@ static const struct dram_para para =3D {
>  unsigned long sunxi_dram_init(void)
>  {
>  	struct dram_config config;
> +	unsigned long size;
> =20
>  	/* Writing to undocumented SYS_CFG area, according to user manual. */
>  	setbits_le32(0x03000160, BIT(8));
> @@ -1221,5 +1258,9 @@ unsigned long sunxi_dram_init(void)
>  	      1U << config.bankgrps, 1U << config.ranks,
>  	      16U << config.bus_full_width);
> =20
> -	return calculate_dram_size(&config);
> +	size =3D calculate_dram_size(&config);
> +
> +	nsi_set_master_priority();
> +
> +	return size;
>  }
> --=20
> 2.43.0
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--YsBgI9Fwk4KfvvSv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmn91kQACgkQhP3B6o/u
lQyYIQ/+M5BM2SMhkDSsuY8Ufea6VcHwkhd+rJwnj1Pve8EyfvdX30GkzH/TyXq5
IbNG79sBXlRBVckgMwgrku6Kfpj4ofjpMN+0kU/a+TMrVn7/kWuOJGmvImIJiM8I
Skv/DgbirriefX7Ipesa51KSPWez67l9xh3Zi1RT4HWCNYW8a8KIh4ULoJy66CcD
MuScRrginImzz0owxoxtUTHOUr0IRegkCdunzkawNMqyqNsBgmF+ak1pyW1jN63w
Jmjmz8QBJ2V3DLh+3l1DUIOUTaNkAdnQEVIL7AxLiMUUyo5IEe/xgRBaQ6BK2gvC
dCmHJScMvXYpRhGQ889dzo3oz6SjL+r8Cd6L26N00irXwZusKb5emwhp4TbttZ74
RDwsDJuHV5ea9/SD1DuszTyNzl4CQ97OQzvv9euueclDDRAlyJ0OL47OfcJGt/Aq
3XmejnGqhiWO84tUyzimMb+gXFVXeS/xFRCsrBL9wRv8SFKbWznX+/tHQ2t8vxXg
oX+NgpuNfliqG6WzcJAFkWYXY/lTxLAgdIreTv8TLlwkMz9ZFxyd6UWMpftwzPRa
m76pqURTv1NI0fg8yxcr82AHQ1kLgCmAVk58fT5hhfngGHF0Z+7l1zx1pfI/OSQk
KnHg2ftL7X45cLMaJuEduQKOZpHuq0D1e8mjyx684L4K+gugKxg=
=OT8i
-----END PGP SIGNATURE-----

--YsBgI9Fwk4KfvvSv--
