Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793073819;
	b=SvqmVuzh9p+cZatGBWE+eRWVyQ1aIEMfDecY4IOQnHb8u6fC/oM44V5mFEsYv7G9qPcR
	 CdqtwAoKHigW9rU31dNSOU67wLNUIY+uU5ucxiMyP0YZ4ow1unYhleu9da2AKyaa1ZTR7
	 0f6TTsBgsQWuqwlihxynFeU4VGcLVobcz2YZovHFdnFTghulBexoJT9Z8SM6MK7o4n/FS
	 owVaI4clpz/bEtPYVbg6MJm6AXczsEZGfQFxeYsKVx/mAtgs5dhe2WWPh8LGjD7QvDXiC
	 M9D/73+MT8q/ZI8qBPJQJvjJDcwGB2HJRoR9TqEZKhFvZJS8mubU5EvwfKL85rfjyTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793073819;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DkHTCThQXE1jX4szmvp/ieeoSUq15merithhMrLPB4k=;
	b=IPR2i2SgIlqH2GxmXFK43zX0ommQsh3tl+5yVJgbh3MJ+PLow5aBnK1FJukFzqIM2mtT
	 zjPfUMUMhIWEsIJvznTshY0rwhTk6aoIY/2bST6v+8Wq37TAtwHfr3p6U5UqGTH/6Wn3w
	 wkJDHsUhpdysCOnA+qS022L1erlCM18N6DRHCTa3AkREABjSgLD7Uoa0BD6L0R1VbMqut
	 KvLl0cI9y7ujl9E5waJHqVTYOZWexrqRhXj9joV7YJdTkptmmSI9S/+rBdpI5QsNBNdim
	 2tMHi5sS+ksUUd2Cmhm0vSdCBnwSYdRO86wV8puSSdxK5CePi1+PcM+z8UAojHe4ceg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LMks7pGC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABE8606A31A
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Oct 2026 04:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LMks7pGC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378861F01825;
	Tue, 27 Oct 2026 04:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793073818;
	bh=DkHTCThQXE1jX4szmvp/ieeoSUq15merithhMrLPB4k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LMks7pGC8Wl3pGaYaW3ye8Zf8DAY2L2WD2IdFbrAcXtOY8MFjEJA62LrnbWcg9HLE
	 9H2OZM1e4LvIAvvO3kpvNq5ui+xFJvtFAzviaAn+9Bnc1opNqIJRCBgk10sjyrKPX/
	 nwg+Sno6Y+EcU80iZb68lVWr0ugpxrgTNkd/3ptL6OoSWvpGkxVJ7gBgG6q9LE512f
	 HgcFoTo1zMP2GGjl4YGbhgA7Ttyl25bQhP+C4zSKytPk3/Dx8pw+tdVp2bVGq5Qgqd
	 jIza5lZhoLTPUNbyTtTt1+J+xDkGdIQZrxH1kqaDdyrTVThXAznaOR/sBktiRYHPAQ
	 GSmH5v1arJ69Q==
Message-ID: <sashiko-outbox-186068@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mmc: sunxi: reset the controller after an update-clock
 timeout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tam Do" <tam.do@manyhobbies.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <179307312104.39863.12372814163472848752@manyhobbies.com>
References: <179307312104.39863.12372814163472848752@manyhobbies.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 04:03:37 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mmc: sunxi: race on REG_IMASK and sdio_imask in sunxi_mmc_init_hos=
t()
--

commit 5bbf951431c455133c1e7c51cf18b994aea96bec
Author: Tam Do <tam.do@manyhobbies.com>

mmc: sunxi: reset the controller after an update-clock timeout

This commit resets and reinitializes the sunxi MMC controller in
sunxi_mmc_oclk_onoff() if a clock-update command times out, so that the
pending command is cleared and subsequent clock updates can succeed.

> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
> index fe4c0f6d73f3c..439cfa4ac4032 100644
> --- a/drivers/mmc/host/sunxi-mmc.c
> +++ b/drivers/mmc/host/sunxi-mmc.c
> @@ -688,6 +688,7 @@ static int sunxi_mmc_oclk_onoff(struct sunxi_mmc_host=
 *host, u32 oclk_en)
> =20
>  	if (rval & SDXC_START) {
>  		dev_err(mmc_dev(host->mmc), "fatal err update clk timeout\n");
> +		sunxi_mmc_init_host(host);

[Severity: High]
Can calling sunxi_mmc_init_host() here without holding host->lock while
host->irq is enabled race with sunxi_mmc_irq() and
sunxi_mmc_enable_sdio_irq() on host->sdio_imask and REG_IMASK?

Previously, sunxi_mmc_init_host() was only called from sunxi_mmc_probe()
before mmc_add_host() and from sunxi_mmc_runtime_resume() while host->irq is
disabled. In sunxi_mmc_init_host(), the controller is reset and REG_IMASK is
written without holding host->lock:

drivers/mmc/host/sunxi-mmc.c:sunxi_mmc_init_host() {
	if (sunxi_mmc_reset_host(host))
		return -EIO;
	...
	/* Unmask SDIO interrupt if needed */
	mmc_writel(host, REG_IMASK, host->sdio_imask);
	/* Clear all pending interrupts */
	mmc_writel(host, REG_RINTR, 0xffffffff);
}

At runtime, sunxi_mmc_set_ios() -> sunxi_mmc_set_clk() ->
sunxi_mmc_clk_set_rate() -> sunxi_mmc_oclk_onoff() can be reached while an
SDIO card has claimed interrupts. Although sunxi_mmc_set_ios() runs under
mmc_claim_host(), both hardirq context (sunxi_mmc_irq() ->
mmc_signal_sdio_irq() -> sunxi_mmc_enable_sdio_irq()) and sdio_irq_thread()
(which calls host->ops->enable_sdio_irq() after mmc_release_host()) update
host->sdio_imask and REG_IMASK concurrently under host->lock:

drivers/mmc/host/sunxi-mmc.c:sunxi_mmc_enable_sdio_irq() {
	spin_lock_irqsave(&host->lock, flags);

	imask =3D mmc_readl(host, REG_IMASK);
	if (enable) {
		host->sdio_imask =3D SDXC_SDIO_INTERRUPT;
		imask |=3D SDXC_SDIO_INTERRUPT;
	} else {
		host->sdio_imask =3D 0;
		imask &=3D ~SDXC_SDIO_INTERRUPT;
	}
	mmc_writel(host, REG_IMASK, imask);
	spin_unlock_irqrestore(&host->lock, flags);
}

If sunxi_mmc_init_host() races with sunxi_mmc_enable_sdio_irq(), could it
either overwrite REG_IMASK with 0 after sdio_irq_thread() re-enabled
SDXC_SDIO_INTERRUPT (leaving sdio_irq_thread() sleeping with SDIO interrupts
masked in hardware), or write a stale SDXC_SDIO_INTERRUPT bit back to
REG_IMASK after hardirq context disabled it and called
pm_runtime_put_noidle() (causing repeated disable calls and underflowing the
runtime PM usage count)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179307312104.39863.=
12372814163472848752@manyhobbies.com?part=3D1
