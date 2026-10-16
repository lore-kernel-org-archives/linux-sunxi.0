Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE6A487CD4
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 18:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175970; cv=pass; b=b9bodELoa3EHnWKuTH6ZNe7eliIrWscJguziKl6Riupl+EeqW9ioh3dHqwCEjZNoMFFa9UmwZEuN4U1MZTWiZvBwsLzeX3dasAiKeyYrNk4/FtUma0swmM67RAuZCAU1Sq23CicEXodD3VwyNq22cxHJXjF5wreq5FT24z2IHNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175970; c=relaxed/simple;
	bh=Sp3GtbQjQSltBUfLMvfD+UGXnyKpeyYQAXg2Ddoq8mE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CoAHptE5/3QjIePiJhBohozDQeU1WdeXXrIoLTVl9dmA30XZZ0q9s5L3pRU85JF1lxli5dAgLPcwOM963zDPvayU13cbIj59PFMyE7MUcP9CtKelmjXLhS2mTnAaA/aq5PzWAQn9YKs2My9to/7qiBUVg1qLNDU26/TalHHAScw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4Wub2fJ; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4Wub2fJ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e8fe8e343fso619335ad.2
        for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 11:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792175968; cv=none;
        d=google.com; s=arc-20260327;
        b=MWc+f9I/OEcgVk8yesQ9mpPxY/ElC4OSfOAD2Liny742bffGllBMtVVXYVztwVY/4G
         M9Xhw1MVGnrG/1Z7vVXg21xJUcV/trOuNSJGMMSJTQC4SkGhtKQ2se6PisVd9et0pcEG
         os5rx0XlzF9edIMSPwwX9IAsFun4vBxvziGHEGooROQX0xk8P7Mrn1DErIB3dUUbuhlB
         qugvDKXhTw4AfLKzjcktsQe10+MTsoDZfg66e7HuzB4oBsx8Zr7CSJT2UxS8kNcHb/E8
         6tNhjClvRr1BaCh3s70i/dHeFWrM/YidWNGSC0akAJDaaa2AHSpaTEClVg+5aCC/dMQk
         o7ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tsn2jv1+4AquEB3uWtdMKLN0WBHc2D4ArXEJyaTFbiE=;
        fh=17lZYpTmUoNgK0c1LHoHDzRAgL1/7UI9WYSs0PSJGsE=;
        b=HSSUdNX3UwEvVQAgosHZFmdK83xW6X9WUgZx2Sb+xCoOORKvPkPDT3mYFy/7MMTa1o
         u/f61EdvjMY2V4fEgBGjA26dcIwT2j9QxweZI1kJfln5+nnrxv5E5jxvTfOLclqQwfjU
         AYjpPxOISoFkgJhBP2P+gmjJS6eoHzBjyARm2iXFtqAWLRBB37Dz5PVqocYSemcu5wwA
         aZ12W5Zy2eFZRMM77uc8x1W68/72IpgDEN+Qxh25DOZX9lFRj7/nX6Q/2iht46z+ZMos
         JT1hF240q7BBKDWeu3gxlpi8klmPMAI1Pexp/637ltRzvNd5BLXk8LcbFVt9N1jxjeRm
         ABVQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792175968; x=1792780768; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tsn2jv1+4AquEB3uWtdMKLN0WBHc2D4ArXEJyaTFbiE=;
        b=k4Wub2fJ9ugOyYsqd40/w62Gx6Cl2e6zX+uXCNUaWfeXpViYVWVtCr2y/ECCorNzqF
         5gxN7JTHNouB4ACyaW3ppZfBju4KTkIsrqH7L7yrw28hxEz6BtOX5tHIqBz1bsdXKqXZ
         rmZnqMFhOfWPp1INXiAFTHWZWGTumSX7/bOSrjwudjkmUZFoq708dIf8myAi7rlbrSuA
         Fzi4UfQG8NYPLKZ+f7NfHdDNRbcsuXkohz1X7Eyj+K5aROua4tzbBL8MAcV4jDH4UxdG
         dyziWcn2LBe1mFFUPWuzynL2iZ2r0LqIUQuGHLwyiKEtYXjWF0eCnriMOcNds+aJu5pP
         gdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792175968; x=1792780768;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tsn2jv1+4AquEB3uWtdMKLN0WBHc2D4ArXEJyaTFbiE=;
        b=ZG/qLGXHFbHu0Ktip712ewh66gGudp3//YhQaPa3NRNInIlyDuLxXXHTfujoW5soVp
         aMoxP7V57JaTICrPWwwCYLiliSjrIzS38Q3IOeutby6bAdjVjYkIz+RKopUx+mqBQDlf
         YI5brj3bKMMUTHh5YHeb+fjuvSj8Zy3V96EqdMVRdSv0UUaoSjSSZcSahFReddo1HZ+G
         pgIGAvZgSYOi96kI/fKmcyWX5gf3LNxhxcTw9mv7PxBeIyfimmh71ls1mz+uIUpau06/
         1D5Zn4JSvDdiGy4WSQkYpz6psSich2yzW8Cgsm0GGjLvFJ0idvVlO6eqYWkh6vQ2rAhn
         b79w==
X-Forwarded-Encrypted: i=1; AKwUvBwpS4izfje7vjrc2M/RNLrmIRJGDfjQMz5i+MZA5a5zBNwiv05yEzTfUNT2By9jeRd8i6VHRRNnpXUn7g==@lists.linux.dev
X-Gm-Message-State: AFq9FYKY9/dc8/ho9JsgR1qEb3IwZNr/bjGGlH8lGAy7TCkmZPQXuBnC
	E0gzvZAnyvJpQl4zTuI+uEWPw46GHrITjgl8pVAD+/Gzn/GtgshzRlSeaJxV+/bh2p+adz8iXoG
	D5EfYig0gdKswI6mYHkzBzWf4l9NzNWSBhobNVXt0jT9V
X-Gm-Gg: AYBFou0Gi1EHBbVFcFtZIO5E03o4uAOzHMCfKpzPsWgGPhqXXGx4Ldd0JOn92oLjaPI
	TNVGdMe9usMBJwXdSzyh2nfsXZL06hzaFcbBkcntJtQfg3W0jJ8/Po3NrSTp2fnb0RVm0umr+Ae
	ANV4CUYgokReRrBl0A8JGt2X+4u5pUUM87FFde4X3Vb3i6JFnZYgYumUrUVkTZIEnEQUhfJ5J6i
	FqaLKS18Zy1XhCxIGYTOFozWP90+3jCyCsoc/DjSJfIaFPpOtBhq21dNqd2wyUGYloG1VYEdtBX
	993Y/Dggt0iL/dNiuxT6WMax18oSA/e08Xti8EuubrwaTcVVawf0R7ghY1Q=
X-Received: by 2002:a17:903:2f88:b0:2e9:95c0:7c50 with SMTP id
 d9443c01a7336-2e9a6d358dcmr7224285ad.71.1792175968210; Fri, 16 Oct 2026
 11:39:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261016091608.121842-1-pmazzini@gmail.com> <40856b24-1767-4fda-89af-11c51d3ec816@arm.com>
In-Reply-To: <40856b24-1767-4fda-89af-11c51d3ec816@arm.com>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Fri, 16 Oct 2026 19:38:59 +0100
X-Gm-Features: AclHuK97fQdsxo-LLtpVqDB2-wEBQEN3N0WwKDkjlh95fLPNrUGFWQ5krSDQ2YM
Message-ID: <CAAxh=jsqP4UwMFt02n-dsdf7FGTg18NjmHyVVk+McQ+LQBXSTQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] sunxi: add the Allwinner B288 and the PocketBook Verse
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.u-boot-project.org, Tom Rini <trini@konsulko.com>, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

Thanks for having a look. I'll reorder the patches and move the DT
bits to dts/upstream for v2, once there's more feedback.

Pablo

On Fri, Oct 16, 2026 at 6:28=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Hi Pablo,
>
> On 10/16/26 11:16, Pablo Mazzini wrote:
> > The Allwinner B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book
> > readers. This series adds SPL and U-Boot support for it, and one board:
> > the PocketBook Verse (PB629).
>  > > The DT is still under review for Linux. Until it reaches
> > dts/upstream, the last patch carries a copy in arch/arm/dts.
>
> Thanks for sending this, much appreciated. I had a coarse look over
> this, and this looks fine on the first glance.
> As you said, this is somewhat blocked on the DT merge on the Linux side,
> which will probably not happen this year anymore (v7.5-rc1 would be the
> earliest).
> But meanwhile, in preparation for that, could you please reorder the
> patches, so you enable the devices first (clocks, pinctrl, mmc), then
> DRAM, then the general support patch, with the defconfig on top.
>
> For the DT parts: please try to emulate the future situation, so put the
> files in the directories where they would end up eventually. You can try
> to take the Linux DT binding patch (for clock and reset), and just
> change the paths in there to point to the respective dts/upstream
> directories. This is what would happen anyway, look for those
> cherry-picks and upstream references in the dts/upstream git log.
> And the patch(es) wouldn't be taken as such anyway, but they provide a
> test base and reference for other people, until the DT lands.
>
> There is no need to send a new version now, just wait until you receive
> some review or other comments.
>
> Cheers,
> Andre
>
> >
> > Tested on a PB629.
> >
> > Pablo Mazzini (7):
> >    sunxi: add support for the Allwinner B288
> >    sunxi: dram: support the Allwinner B288
> >    dt-bindings: clock: add the Allwinner B288 CCU
> >    clk: sunxi: add the Allwinner B288 gates and resets
> >    pinctrl: sunxi: add the Allwinner B288 PIO
> >    mmc: sunxi: B288 mmc0/mmc1 run off PLL_PERIPH0 2x
> >    sunxi: add the PocketBook Verse
> >
> >   arch/arm/cpu/armv7/sunxi/psci.c              |   9 +-
> >   arch/arm/dts/Makefile                        |   2 +
> >   arch/arm/dts/sun8i-b288-pocketbook-verse.dts | 114 ++++++++
> >   arch/arm/dts/sun8i-b288.dtsi                 | 292 ++++++++++++++++++=
+
> >   arch/arm/include/asm/arch-sunxi/cpu.h        |   1 +
> >   arch/arm/include/asm/arch-sunxi/cpu_sun4i.h  |  16 +-
> >   arch/arm/mach-sunxi/Kconfig                  |  14 +
> >   arch/arm/mach-sunxi/board.c                  |   4 +
> >   arch/arm/mach-sunxi/clock_sun6i.c            |   1 +
> >   arch/arm/mach-sunxi/cpu_info.c               |   2 +
> >   arch/arm/mach-sunxi/dram_sunxi_dw.c          |  97 +++++-
> >   board/sunxi/MAINTAINERS                      |   6 +
> >   configs/pocketbook_verse_defconfig           |  10 +
> >   drivers/clk/sunxi/Kconfig                    |   7 +
> >   drivers/clk/sunxi/Makefile                   |   1 +
> >   drivers/clk/sunxi/clk_b288.c                 | 101 +++++++
> >   drivers/clk/sunxi/clk_sunxi.c                |   5 +
> >   drivers/mmc/sunxi_mmc.c                      |   7 +
> >   drivers/pinctrl/sunxi/Kconfig                |   5 +
> >   drivers/pinctrl/sunxi/pinctrl-sunxi.c        |  22 ++
> >   include/dt-bindings/clock/sun8i-b288-ccu.h   |  82 ++++++
> >   include/dt-bindings/reset/sun8i-b288-ccu.h   |  45 +++
> >   include/sunxi_gpio.h                         |   1 +
> >   23 files changed, 827 insertions(+), 17 deletions(-)
> >   create mode 100644 arch/arm/dts/sun8i-b288-pocketbook-verse.dts
> >   create mode 100644 arch/arm/dts/sun8i-b288.dtsi
> >   create mode 100644 configs/pocketbook_verse_defconfig
> >   create mode 100644 drivers/clk/sunxi/clk_b288.c
> >   create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
> >   create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h
> >
> >
> > base-commit: 65a7532545336e4b73e049a69436e255da7df961
>
