Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065755A4E7
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Feb 2024 16:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706804695; cv=none; b=WahEtEXp6X/HvPm00Bj4HvfbqNFQxPa/mxcKH8CbR/71tgE5xCcvkn3zWusS8DlUiiRCguDmYNkMn+HI2ug/Br5fcdF7oChg6v3798E/UuvosTO53q+JeR36QfzRkPuYireoanideMfRBtY/s6ighFM7gDlLqTrAEpZCAbiorZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706804695; c=relaxed/simple;
	bh=vqSPhrGNoBIXBwQhQv+5TVkyc0p2acScJXny4dezS/o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uHi3/UWMOePzNnTXbGgdb0d4jRyDi9ft20enEvtg7axDWMwM3OSi3YHePWJpeeTxJ0JElTH7YkAQY1Veu4du15Bx8BSFc9MXptBpKzeRjXHtbsSwhQuOsPgd9MwMdsS9dYzKCGToszaMcgzvqaMfFvf3irvu9uRonIKkXeP5NoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16889DA7;
	Thu,  1 Feb 2024 08:25:35 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B6EF3F738;
	Thu,  1 Feb 2024 08:24:51 -0800 (PST)
Date: Thu, 1 Feb 2024 16:24:44 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Ludwig Kormann <ludwig.kormann@ict42.de>, "linux-sunxi@lists.linux.dev"
 <linux-sunxi@lists.linux.dev>
Cc: jagan@amarulasolutions.com, trini@konsulko.com, u-boot@lists.denx.de
Subject: Re: [PATCH 1/1] sunxi: sun4i: add missing sdelay() to
 clock_init_safe()
Message-ID: <20240201162444.1cf81b0b@donnerap.manchester.arm.com>
In-Reply-To: <20240201084550.200913-1-ludwig.kormann@ict42.de>
References: <20240201084550.200913-1-ludwig.kormann@ict42.de>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu,  1 Feb 2024 09:45:50 +0100
Ludwig Kormann <ludwig.kormann@ict42.de> wrote:

Hi,

> This delay is required after switching the clock source.
>=20
> See =E2=80=9CA20 Reference manual v1.4=E2=80=9D Page 50 / section
> =E2=80=9C1.5.4.16. CPU/AHB/APB0 CLOCK RATIO=E2=80=9D: =E2=80=9CIf the clo=
ck
> source is changed, at most to wait for 8 present running
> clock cycles.=E2=80=9D
>=20
> This is already implemented in clock_set_pll1(), but was
> still missing in clock_init_safe().
>=20
> Signed-off-by: Ludwig Kormann <ludwig.kormann@ict42.de>

Good catch, thanks for sending this!

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm/mach-sunxi/clock_sun4i.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm/mach-sunxi/clock_sun4i.c b/arch/arm/mach-sunxi/cloc=
k_sun4i.c
> index 8f1d1b65f0..ac3b7a801f 100644
> --- a/arch/arm/mach-sunxi/clock_sun4i.c
> +++ b/arch/arm/mach-sunxi/clock_sun4i.c
> @@ -25,6 +25,7 @@ void clock_init_safe(void)
>  	       APB0_DIV_1 << APB0_DIV_SHIFT |
>  	       CPU_CLK_SRC_OSC24M << CPU_CLK_SRC_SHIFT,
>  	       &ccm->cpu_ahb_apb0_cfg);
> +	sdelay(20);
>  	writel(PLL1_CFG_DEFAULT, &ccm->pll1_cfg);
>  	sdelay(200);
>  	writel(AXI_DIV_1 << AXI_DIV_SHIFT |
> @@ -32,6 +33,7 @@ void clock_init_safe(void)
>  	       APB0_DIV_1 << APB0_DIV_SHIFT |
>  	       CPU_CLK_SRC_PLL1 << CPU_CLK_SRC_SHIFT,
>  	       &ccm->cpu_ahb_apb0_cfg);
> +	sdelay(20);
>  #ifdef CONFIG_MACH_SUN7I
>  	setbits_le32(&ccm->ahb_gate0, 0x1 << AHB_GATE_OFFSET_DMA);
>  #endif

