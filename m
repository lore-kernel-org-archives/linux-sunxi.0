Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B5D1A9B24
	for <linux-sunxi@lists.linux.dev>; Sun,  3 May 2026 08:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777795631; cv=none; b=SB/AZhpqKdzxQwCut7+sa1gi2SpezYfz6Y/loZRp+EvtqiQdi0XIRi3vKW0Fz+/jp5DLJjK+jBADDvAvquFjBVXUQ7wS/NxSnT+3we+cANaznXeCLt0Zs7u4SpDUxo1q8OoRGURyi+T2EEpO8Bc9+YVgSZIMvoROJwUa1u+/L20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777795631; c=relaxed/simple;
	bh=FwIbnNrzJLiBy84qBOWrL2lvv6RyQExlWyUZ9Dw9W0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DNPH9FcoErXs6WLRDEKYLw6rt4YiZtxbAXofZwXgi/gar0mdT+wiA3HdZlu98U1wCErgiTAIDWNWmcOXnZkn+N8ueQkDHzPNJoxGppeiB1z7dz2N5ESHpsGWWX67N/4HGjWwqHFhHk4Y/MUP5FGA+8whS55pi5juz0M2wkE20gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TV7wFEyE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TV7wFEyE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so46565635e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 03 May 2026 01:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777795628; x=1778400428; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HIFm1Dev6bjk2JSnGP+PUQ4QldDloicVwhC8aXmEekk=;
        b=TV7wFEyEKqe2sJsgZxS5W97PTm4xqfGOS+4VuephkcDkMnVhp8qKg5elsufZzSyDvK
         tQPDjAhkx1BflhtzDNziKzfj4qGnGvB9BXkPmJv08tYww3uUhGOnjuqYVBV7Q5Uoq98+
         o9sKyd2sDPcrxSmuAlva+AIslq7fgDNyh2DM8hddWfj4Pxsvc9UXnGxmD1roPv4uN/iq
         NXw/KD7ZUxLxGR5kEmNtXFujWj9yT1vxAa/tvUiniNLfbkZrFOpVTZnCqcC5li9Z0o0a
         xd+LE0V/VfO/hRGMrLVScHm579P6a913Esuf6Zqf9S9tMV8l6QDfVg/uvrf6GviBFcf/
         tKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777795628; x=1778400428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HIFm1Dev6bjk2JSnGP+PUQ4QldDloicVwhC8aXmEekk=;
        b=pS9USu/R5MW4LWvty3LTcn8r64gQlw+Ib4ozNfYyhV11pXuTNlc8di8+AczjJFJ1ck
         oNcsHLfnAo1XJCPQPmvwtr3fNLizxOxKejVZNsrGm+/kdi8KUpKLM7aXljYqcZrZGd0/
         zbrVZb86TO+DCvrF9cTFq9XeaWsYP0sA2vxFpqTrQQWmle6JZi8a41MFkWsMxFdKS3uS
         UOg0vmQtXBW7H+XVRF3mQF3gCUzcrEH9Id2Ln1eL7iQFIiC30LR9B+XgPryLzp+Hhb2r
         KoBTf1Z8ZXMTaD+vueDuiZlQYh8gUoiPj7nIL9KVePy4hAgLGw6H9sJldoEi3rwUWREp
         3sOg==
X-Forwarded-Encrypted: i=1; AFNElJ/XLvL3ioUruFQh7U3ufquiOtFHcULDZ9tMtsVgrY3ow6J30/TZELlRHwtprYpZLMGI2Dlrk/PwSi012A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2euiVo82X23vacQqQJvXufnOSQIaPdDNo/kTauJ8lkplPWMd3
	pgg8fZwNMPVNjEWhMpTlnvbzz9lgxuKJyUq4z8utD75VX1g1stxlllCc
X-Gm-Gg: AeBDietbb87XnQzdHSEouFGJS16q0cBGp5IJX2fOrMYXX2/s0n2HLTphlYFJhsxMalz
	X9wrgcuL/12vldGcvtKxud3o8zY8HeTTe0wd2eLMKQHnNq4K1BJ5r85a13xIGw0D1fbil4f6WKH
	mktYD+8CoY5f5iS+zQTsxL528N2DwxevYKOJ2biWl0G9RhiRtoA2qLG4+AP+2HcbqUBO1XcDDGw
	vcOidlP/HkcITqdLcIx5acnfUxNWGuUCbzKl8uidMDmqnvIDT4FLGPTc9wSryxi+YMrQhPnSJNz
	28SbUEYD8uq1Z1KDAA4G8vw5eBKix5UmvzCJEETYpJyIc8rHMTXoyBkdb71iGMdyvl90gJ7ODg+
	sCkMAwlp9FeQE/C5p5DykCeYHFgqbFNCoNCebr3EbdY03CB07rWvg3KAzc8HWR7rtsyzLbf0+Hy
	R8hnB1WlwuVq/7eVXvxwsFTaGykLCzIf94gXOz72WojEbv2+O4485DEzU=
X-Received: by 2002:a05:600c:1386:b0:488:9e54:94c0 with SMTP id 5b1f17b1804b1-48a985391a3mr86126785e9.8.1777795627821;
        Sun, 03 May 2026 01:07:07 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c8556sm238431375e9.4.2026.05.03.01.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 01:07:07 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Paul Kocialkowski <paulk@sys-base.io>, u-boot@lists.denx.de,
 Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH v2 1/2] sunxi: A523: Move NSI init routine into generic function
Date: Sun, 03 May 2026 10:07:05 +0200
Message-ID: <7xyPQaBFQqidCfnVRGakAQ@gmail.com>
In-Reply-To: <20260430135838.3438728-2-andre.przywara@arm.com>
References:
 <20260430135838.3438728-1-andre.przywara@arm.com>
 <20260430135838.3438728-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 30. april 2026 ob 15:58:37 Srednjeevropski poletni =C4=8D=
as je Andre Przywara napisal(a):
> In previous generations of Allwinner SoCs, the memory bus (MBUS) access
> arbitration was configured as part of the DRAM top registers. This is no
> longer the case with for instance the A133 or A523, which have a dedicated
> base address for the bus arbiter that is now called NSI instead of MBUS.
>=20
> NSI appears to be a later iteration of MBUS design, with new dedicated
> registers that resemble the previous MBUS ones. Despite NSI not being
> documented in the manual, the A133 BSP includes a nsi driver with some
> description of the registers. Like previous generations, it implements
> port arbitration priority for DRAM access and also supports an optional
> QoS mode based on bandwidth limits.
>=20
> In preparation for re-using code for other SoCs, factor out the existing
> NSI init routine from the A523 DRAM code, which was a bit ad-hoc and A523
> specific, into a separate function, and abstract the settings a bit.
> No functional change.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Co-develeoped-by: Paul Kocialkowski <paulk@sys-base.io>
> Suggested-by: Jernej =C5=A0krabec <jernej.skrabec@gmail.com>
> Sponsored-by: MEC Electronics GmbH <https://www.mec.at/>
> ---
>  .../include/asm/arch-sunxi/cpu_sunxi_ncat2.h  |  1 +
>  .../include/asm/arch-sunxi/dram_sun55i_a523.h | 29 +++++++++++
>  arch/arm/include/asm/arch-sunxi/sunxi_nsi.h   | 25 ++++++++++
>  arch/arm/mach-sunxi/Makefile                  |  2 +-
>  arch/arm/mach-sunxi/dram_sun55i_a523.c        | 49 +++++++++----------
>  arch/arm/mach-sunxi/sunxi_nsi.c               | 31 ++++++++++++
>  6 files changed, 110 insertions(+), 27 deletions(-)
>  create mode 100644 arch/arm/include/asm/arch-sunxi/sunxi_nsi.h
>  create mode 100644 arch/arm/mach-sunxi/sunxi_nsi.c
>=20
> diff --git a/arch/arm/include/asm/arch-sunxi/cpu_sunxi_ncat2.h b/arch/arm=
/include/asm/arch-sunxi/cpu_sunxi_ncat2.h
> index 7cee7efe8b4..fd7d9b22058 100644
> --- a/arch/arm/include/asm/arch-sunxi/cpu_sunxi_ncat2.h
> +++ b/arch/arm/include/asm/arch-sunxi/cpu_sunxi_ncat2.h
> @@ -9,6 +9,7 @@
> =20
>  #define SUNXI_TZPC_BASE			0x02000800
>  #define SUNXI_CCM_BASE			0x02001000
> +#define SUNXI_NSI_BASE			0x02020000
>  #define SUNXI_TIMER_BASE		0x02050000
> =20
>  #define SUNXI_TWI0_BASE			0x02502000
> diff --git a/arch/arm/include/asm/arch-sunxi/dram_sun55i_a523.h b/arch/ar=
m/include/asm/arch-sunxi/dram_sun55i_a523.h
> index 08bfe462856..462d4726a21 100644
> --- a/arch/arm/include/asm/arch-sunxi/dram_sun55i_a523.h
> +++ b/arch/arm/include/asm/arch-sunxi/dram_sun55i_a523.h
> @@ -20,6 +20,35 @@ enum sunxi_dram_type {
>  #define MCTL_COM_UNK_008        0x008
>  #define MCTL_COM_MAER0          0x020
> =20
> +enum sunxi_nsi_port {
> +	SUNXI_NSI_PORT_GPU      =3D 0,
> +	SUNXI_NSI_PORT_GIC,	=3D 1,
> +	SUNXI_NSI_PORT_USB3,	=3D 2,
> +	SUNXI_NSI_PORT_PCIE,	=3D 3,
> +	SUNXI_NSI_PORT_CE,	=3D 4,
> +	SUNXI_NSI_PORT_NPU,	=3D 5,
> +	SUNXI_NSI_PORT_ISP,	=3D 6,
> +	SUNXI_NSI_PORT_DSP,	=3D 7,
> +	SUNXI_NSI_PORT_G2D,	=3D 8,
> +	SUNXI_NSI_PORT_DI,	=3D 9,
> +	SUNXI_NSI_PORT_IOMMU,	=3D 10,
> +	SUNXI_NSI_PORT_VE_R,	=3D 11,
> +	SUNXI_NSI_PORT_VE_RW,	=3D 12,
> +	SUNXI_NSI_PORT_DE,	=3D 13,
> +	SUNXI_NSI_PORT_CSI,	=3D 14,
> +	SUNXI_NSI_PORT_GMAC0,	=3D 18,
> +	SUNXI_NSI_PORT_GMAC1,	=3D 19,
> +	SUNXI_NSI_PORT_MMC0,	=3D 20,
> +	SUNXI_NSI_PORT_MMC1,	=3D 21,
> +	SUNXI_NSI_PORT_MMC2,	=3D 22,
> +	SUNXI_NSI_PORT_USB0,	=3D 23,
> +	SUNXI_NSI_PORT_USB1,	=3D 24,
> +	SUNXI_NSI_PORT_USB2,	=3D 25,
> +	SUNXI_NSI_PORT_NPD,	=3D 26,
> +	SUNXI_NSI_PORT_DMAC,	=3D 27,
> +	SUNXI_NSI_PORT_DMA,	=3D 28,
> +};
> +
>  /*
>   * Controller registers seems to be the same or at least very similar
>   * to those in H6.
> diff --git a/arch/arm/include/asm/arch-sunxi/sunxi_nsi.h b/arch/arm/inclu=
de/asm/arch-sunxi/sunxi_nsi.h
> new file mode 100644
> index 00000000000..7d41f9318b5
> --- /dev/null
> +++ b/arch/arm/include/asm/arch-sunxi/sunxi_nsi.h
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier:	GPL-2.0+
> +/*
> + * A133/A523 NSI interconnect register and constant defines
> + *
> + * (C) Copyright 2026 Arm Ltd.
> + */
> +
> +#ifndef SUNXI_NSI_H__
> +#define SUNXI_NSI_H__
> +
> +#define SUNXI_NSI_PRI_CFG_LOWEST	0
> +#define SUNXI_NSI_PRI_CFG_LOW		1
> +#define SUNXI_NSI_PRI_CFG_HIGH		2
> +#define SUNXI_NSI_PRI_CFG_HIGHEST	3
> +
> +#define SUNXI_NSI_IO_CFG_QOS_SEL_OUTPUT	0
> +#define SUNXI_NSI_IO_CFG_QOS_SEL_INPUT	1
> +
> +#define NSI_CONF(port, pri, qos_sel) \
> +	{ SUNXI_NSI_PORT_ ## port, SUNXI_NSI_PRI_CFG_ ## pri, \
> +	  SUNXI_NSI_IO_CFG_QOS_SEL_ ## qos_sel }
> +
> +void nsi_configure_port(unsigned int port, u8 pri, u8 qos_sel);
> +
> +#endif /* SUNXI_NSI_H__ */
> diff --git a/arch/arm/mach-sunxi/Makefile b/arch/arm/mach-sunxi/Makefile
> index 0bee04d660f..3ef0113ea43 100644
> --- a/arch/arm/mach-sunxi/Makefile
> +++ b/arch/arm/mach-sunxi/Makefile
> @@ -50,6 +50,6 @@ obj-$(CONFIG_DRAM_SUN50I_H616)	+=3D dram_sun50i_h616.o =
dram_dw_helpers.o
>  obj-$(CONFIG_DRAM_SUN50I_H616)	+=3D dram_timings/
>  obj-$(CONFIG_DRAM_SUN50I_A133)	+=3D dram_sun50i_a133.o
>  obj-$(CONFIG_DRAM_SUN50I_A133)	+=3D dram_timings/
> -obj-$(CONFIG_MACH_SUN55I_A523)	+=3D dram_sun55i_a523.o dram_dw_helpers.o
> +obj-$(CONFIG_MACH_SUN55I_A523)	+=3D dram_sun55i_a523.o dram_dw_helpers.o=
 sunxi_nsi.o
>  obj-$(CONFIG_DRAM_SUN55I_A523)	+=3D dram_timings/
>  endif
> diff --git a/arch/arm/mach-sunxi/dram_sun55i_a523.c b/arch/arm/mach-sunxi=
/dram_sun55i_a523.c
> index 1ffb62863e2..9fb054cea84 100644
> --- a/arch/arm/mach-sunxi/dram_sun55i_a523.c
> +++ b/arch/arm/mach-sunxi/dram_sun55i_a523.c
> @@ -15,6 +15,7 @@
>  #include <asm/arch/dram_dw_helpers.h>
>  #include <asm/arch/cpu.h>
>  #include <asm/arch/prcm.h>
> +#include <asm/arch/sunxi_nsi.h>
>  #include <linux/bitops.h>
>  #include <linux/delay.h>
> =20
> @@ -1412,40 +1413,36 @@ static const struct dram_para para =3D {
>  	.tpr10 =3D CONFIG_DRAM_SUNXI_TPR10,
>  };
> =20
> -static void sunxi_nsi_init(void)
> +static void nsi_set_master_priority(void)
>  {
> -	/* IOMMU prio 3 */
> -	writel(0x1, 0x02021418);
> -	writel(0xf, 0x02021414);
> -	/* DE prio 2 */
> -	writel(0x1, 0x02021a18);
> -	writel(0xa, 0x02021a14);
> -	/* VE R prio 2 */
> -	writel(0x1, 0x02021618);
> -	writel(0xa, 0x02021614);
> -	/* VE RW prio 2 */
> -	writel(0x1, 0x02021818);
> -	writel(0xa, 0x02021814);
> -	/* ISP prio 2 */
> -	writel(0x1, 0x02020c18);
> -	writel(0xa, 0x02020c14);
> -	/* CSI prio 2 */
> -	writel(0x1, 0x02021c18);
> -	writel(0xa, 0x02021c14);
> -	/* NPU prio 2 */
> -	writel(0x1, 0x02020a18);
> -	writel(0xa, 0x02020a14);
> +	struct {
> +		unsigned int port;
> +		u8 pri;
> +		u8 qos_sel;

What about introducing above struct in sunxi_nsi.h? I imagine same pattern
will be used in future code.

> +	} ports[] =3D {
> +		NSI_CONF(NPU,	HIGH,		INPUT),
> +		NSI_CONF(ISP,	HIGH,		INPUT),
> +		NSI_CONF(IOMMU,	HIGHEST,	INPUT),
> +		NSI_CONF(VE_R,	HIGH,		INPUT),
> +		NSI_CONF(VE_RW,	HIGH,		INPUT),
> +		NSI_CONF(DE,	HIGH,		INPUT),
> +		NSI_CONF(CSI,	HIGH,		INPUT),
> +	};
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(ports); i++)
> +		nsi_configure_port(ports[i].port, ports[i].pri,
> +				   ports[i].qos_sel);
> =20
>  	/* close ra0 autogating */
> -	writel(0x0, 0x02023c00);
> +	writel(0x0, 0x02023c00);	/* port 30 */
>  	/* close ta autogating */
> -	writel(0x0, 0x02023e00);
> +	writel(0x0, 0x02023e00);	/* port 31 */
>  	/* close pcie autogating */
>  	writel(0x0, 0x02020600);

Use SUNXI_NSI_BASE + ... above

Best regards,
Jernej

>  }
> =20
>  static void init_something(void)
> -
>  {
>  	u32 *ptr =3D (u32 *)0x02000804;
> =20
> @@ -1507,7 +1504,7 @@ unsigned long sunxi_dram_init(void)
> =20
>  	size =3D mctl_calc_size(&config);
> =20
> -	sunxi_nsi_init();
> +	nsi_set_master_priority();
>  	init_something();
> =20
>  	return size;
> diff --git a/arch/arm/mach-sunxi/sunxi_nsi.c b/arch/arm/mach-sunxi/sunxi_=
nsi.c
> new file mode 100644
> index 00000000000..3d7eb43df46
> --- /dev/null
> +++ b/arch/arm/mach-sunxi/sunxi_nsi.c
> @@ -0,0 +1,31 @@
> +#include <asm/io.h>
> +#include <asm/arch/cpu.h>
> +#include <asm/arch/sunxi_nsi.h>
> +
> +#define SUNXI_NSI_MODE_REG(i)		((i) * 0x200 + 0x10)
> +#define SUNXI_NSI_PRI_CFG_REG(i)	((i) * 0x200 + 0x14)
> +#define SUNXI_NSI_PRI_CFG_RD(v)		(((v) & 0x3) << 2)
> +#define SUNXI_NSI_PRI_CFG_WR(v)		((v) & 0x3)
> +#define SUNXI_NSI_IO_CFG_REG(i)		((i) * 0x200 + 0x18)
> +#define SUNXI_NSI_ENABLE_REG(i)		((i) * 0x200 + 0xc0)
> +
> +void nsi_configure_port(unsigned int port, u8 pri, u8 qos_sel)
> +{
> +	void *base =3D (void *)SUNXI_NSI_BASE;
> +	u32 pri_cfg;
> +
> +	/* QoS with bandwidth limits is not supported, disable it. */
> +	writel(0, base + SUNXI_NSI_MODE_REG(port));
> +	writel(0, base + SUNXI_NSI_ENABLE_REG(port));
> +
> +	/*
> +	 * QoS direction selection should not be in use, but set it nevertheless
> +	 * to match the BSP behavior (in case it has some other meaning).
> +	 */
> +	writel(qos_sel, base + SUNXI_NSI_IO_CFG_REG(port));
> +
> +	/* Port priority is always active. */
> +	pri_cfg =3D SUNXI_NSI_PRI_CFG_RD(pri) | SUNXI_NSI_PRI_CFG_WR(pri);
> +
> +	writel(pri_cfg, base + SUNXI_NSI_PRI_CFG_REG(port));
> +}
>=20




