Received: from sender4-op-o18.zoho.com (sender4-op-o18.zoho.com [136.143.188.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5EE7B
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Oct 2022 08:51:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1665651082; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=amK+vACTa4eWwZNJ53R0P4WkjxsTiumTGJpJPcWNQ+0qAgiS6tREPs226X4Rr09CTdYDj9HOhOjjP1fPCQHZfO9VdWvBvNtSgiS5VsuZeBPZwdLwZG5n84T2ZBtowpOVnttwuONo8ymB/oRvNS5KetNoyre6z/n6hoWJboR/sGc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1665651082; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=2SOih9jDMl6YptCFB2WpWu7nQBPXRoD7QRK6/8sq3aU=; 
	b=BdHS88hrw9oG9z39Fh1LlCmwwVDNvgMx9LB6iFZf+fPNvTj+vr3Vc3rwJMUYgS+M8Vix8clUPRB4Xd0QkSBKczV3iPXj3bj16PS3gHtk/+kkdPmgS+SNYlxcwRZsecforYbj+ZKMptOghnVzshniKP1MktKoDYqNNnrr36/CkJo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1665651082;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=2SOih9jDMl6YptCFB2WpWu7nQBPXRoD7QRK6/8sq3aU=;
	b=Tes01Wp4PXhDfmuiLAW1lhAGR8EcGsjzRVIkW/LO5Y1J7JO/BXdadis3uxk+r+4S
	muodPfqAU6XIEKK0S/alY8L+vO0PhonxiqxHkf1aoeTuDy0z6AN1omrKcNFU396E2P4
	j9oqe5MLxMOiNu651nf/tYb9x9u4i4EnQ55vENpE=
Received: from edelgard.fodlan.icenowy.me (112.94.102.144 [112.94.102.144]) by mx.zohomail.com
	with SMTPS id 1665651080901534.8214091260292; Thu, 13 Oct 2022 01:51:20 -0700 (PDT)
Message-ID: <7b5ae696469b2a67cbcc4b8b5e91af6329ec5399.camel@icenowy.me>
Subject: Re: [PATCH 3/6] sunxi: f1c100: move SKIP_LOWLEVEL_INIT_ONLY into
 Kconfig
From: Icenowy Zheng <uwu@icenowy.me>
To: Andre Przywara <andre.przywara@arm.com>, Jagan Teki
	 <jagan@amarulasolutions.com>
Cc: Jesse Taube <mr.bossman075@gmail.com>, Yifan Gu <me@yifangu.com>, Giulio
 Benetti <giulio.benetti@benettiengineering.com>, George Hilliard
 <thirtythreeforty@gmail.com>,  Samuel Holland <samuel@sholland.org>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Date: Thu, 13 Oct 2022 16:51:16 +0800
In-Reply-To: <20221012163458.1968900-4-andre.przywara@arm.com>
References: <20221012163458.1968900-1-andre.przywara@arm.com>
	 <20221012163458.1968900-4-andre.przywara@arm.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ZohoMailClient: External

I am against using "f1c100" in commit message, because there is a chip
called F1C100 that is part of legacy sun3i instead of suniv.

Using "suniv" or "f1c100s" is better.

=E5=9C=A8 2022-10-12=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 17:34 +0100=EF=BC=
=8CAndre Przywara=E5=86=99=E9=81=93=EF=BC=9A
> So far we stated the lack of a lowlevel() init function for the
> F1C100s
> board by defining the respective SKIP_* symbol in the board's
> defconfig. However we don't expect any *board* to employ such low
> level
> code, so expect this to be never used for the ARMv5 Allwinner SoCs.
>=20
> Select the appropriate symbols in the Kconfig, so that we can remove
> them from the defconfig, and avoid putting them in future defconfigs
> for
> other boards.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> =C2=A0arch/arm/mach-sunxi/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
> =C2=A0configs/licheepi_nano_defconfig | 2 --
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-
> sunxi/Kconfig
> index 9aa66deb9fd..fc5d8bb3c19 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -185,6 +185,8 @@ config MACH_SUNIV
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select CPU_ARM926EJS
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select SUNXI_GEN_SUN6I
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select SUPPORT_SPL
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select SKIP_LOWLEVEL_INIT_ONLY
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select SPL_SKIP_LOWLEVEL_INIT_=
ONLY
> =C2=A0
> =C2=A0config MACH_SUN4I
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool "sun4i (Allwinner A1=
0)"
> diff --git a/configs/licheepi_nano_defconfig
> b/configs/licheepi_nano_defconfig
> index 14e6bcda927..09f1a19cdbe 100644
> --- a/configs/licheepi_nano_defconfig
> +++ b/configs/licheepi_nano_defconfig
> @@ -1,6 +1,4 @@
> =C2=A0CONFIG_ARM=3Dy
> -CONFIG_SKIP_LOWLEVEL_INIT_ONLY=3Dy
> -CONFIG_SPL_SKIP_LOWLEVEL_INIT_ONLY=3Dy
> =C2=A0CONFIG_SYS_DCACHE_OFF=3Dy
> =C2=A0CONFIG_ARCH_SUNXI=3Dy
> =C2=A0CONFIG_DEFAULT_DEVICE_TREE=3D"suniv-f1c100s-licheepi-nano"

