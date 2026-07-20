Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E5143D4EA
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jul 2026 22:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784585642; cv=none; b=t115fcnhqHN/VD1L0RTZHWYwOqdE+59tt8rVK+T16SGgHw+Oeula/oKQPFjbTsFyou7Ti3ruulEA1hVTGOlhPcVGhePDTxnSqbTDE877PX9FEq7URa29tRLDIhOAJGnLfkd8Qptvn+I2aAkX+Tx5mLRiFzlWZeAsqCl91Tgu3kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784585642; c=relaxed/simple;
	bh=ugORXLPoCg7HxmDLv5zB9ba/JX4bsARykuJh+0iHx+k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o+FpIqLVkPkz4m/DLmzCu8++1eqWXTXsyvZpqDvrVaSelS7kArutgOLk+ZPGVvRkfXTtTtvff6ibhNh7RbuMk5LXG+KPTf777mXETh6manR6HJajw5AHfcWp5Z9GIilWXx0UYRWi51hAFmCffLhOjCZLgoY9M2k/4CUqrQdg9Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=I0CvJpkL; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="I0CvJpkL"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89EF8143D;
	Mon, 20 Jul 2026 15:13:55 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B46D23F86F;
	Mon, 20 Jul 2026 15:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784585639; bh=ugORXLPoCg7HxmDLv5zB9ba/JX4bsARykuJh+0iHx+k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I0CvJpkL+csZaM6jcjviIRXPjndHba4uOFDPe5mZW+N8CZGx5gUx1Z+pU+EA/R1yk
	 w2ZDzkjeieiG4IQiJzabIVGTdK3oz9WCCc+iLOPzz3EuY2+M9ca9MOLSnFQysXia56
	 /MnTA8iqx+4PQBjt+2tCP4WmndON/IFKBtlamx0k=
Date: Tue, 21 Jul 2026 00:10:12 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Juan Manuel <juanmanuellopezcarrillo@gmail.com>
Cc: linux-sunxi@lists.linux.dev
Subject: Re: Orange Pi 4A (T527/A523) mainline bring-up on 6.18.38
 =?UTF-8?B?4oCU?= patch series for review
Message-ID: <20260721001012.7bd0eb1a@ryzen.lan>
In-Reply-To: <CA+c=wxX_iv4QtTQNBYYD1Ptmyp_vPgTazG05F-6bsZy0uoivHw@mail.gmail.com>
References: <CA+c=wxW6t+dSgTOpmOoE=PHisV-fSCfFWtJdhxeNAvm-LX6eSg@mail.gmail.com>
 <CA+c=wxX_iv4QtTQNBYYD1Ptmyp_vPgTazG05F-6bsZy0uoivHw@mail.gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 Jul 2026 16:09:02 +0200
Juan Manuel <juanmanuellopezcarrillo@gmail.com> wrote:

Hi Juan,

thanks for reaching out to the list - though I'd have been better to do
this *before* you start all the work. Many things you did need some
changes, and sometimes work in the wrong direction, so getting advice
before you start avoids wasted efforts (or tokens).
Also please consider joining the IRC channel #linux-sunxi on OFTC, this
often allows much quicker problem solving or directions.

> I've put together a mainline bring-up for the Orange Pi 4A (Allwinner T527,

But the OrangePi 4A is already supported in mainline, as far as the SoC
support goes. And typically specific *board* support is less of a
problem: the vast majority of the work is on *SoC* drivers, getting a
particular board to run is then mostly a matter of enabling peripherals
in the specific DT. And we typically do this for all mainlines DTs, if
applicable.
So saying "mainline bring-up for for Orange Pi 4A" is at least
confusing, you might "fix up Orange Pi 4A operation" or "improve A523
support".

> A523 family / sun55iw3) on top of vanilla 6.18.38, and I'd like to share the

I guess it's 6.18.38 because it's an LTS kernel? Please note that
this is a common misunderstanding: stable kernels are just for distros,
where testing a kernel takes a long time, so they can't easily catch
up in time. With this effort here you are a developer, and mainlining
*always* happens on the very latest kernel tree, often even on
"tomorrow's tree" (linux-next). So 6.18 is irrelevant for mainline,
your patches must apply on 7.2-rc1 (at the moment), or more general on
the latest -rc1.

> patch series for review and feedback before I start splitting parts of it for
> proper upstream submission.
> 
> Repo (git format-patch series + defconfig + board dts):
>   https://github.com/ut-slayer/orangepi-4a-mainline

Please use a proper git tree, based on what you forked off, then have
the normal patches in a branch. Those "patch files in a repo" are really
twisted, and hard to review, adapt to and rebase.

> Up front: I'm not a kernel developer by trade, and I leaned heavily on the
> Allwinner 5.15 BSP as the hardware source of truth (register semantics,

You probably know this, and I won't elaborate here, since the BSP makes
me quite angry: Please be very careful with what you use from there: the
Allwinner BSP is misguided in so many ways, and is quite far from
containing mainline quality code. Looking up undocumented registers is
fine, though.

> calibration and DT values taken from it, not invented) and on AI coding
> assistance. Everything in the "works" list is validated on real hardware, but
> I would very much appreciate people who know these subsystems telling me what's
> wrong or hacky before any of it goes to the lists.
> 
> Working on hardware: HDMI KMS (DE33/DE3.5 + TCON-TV + DW-HDMI 2.0 + Inno PHY),
> Mali-G57 (Panfrost), HDMI audio, GMAC1 ethernet (YT8531), AP6256 WiFi
> (brcmfmac/SDIO), the 4 USB 2.0 host ports, native HDMI HPD/hotplug, AFBC
> scanout, reboot/poweroff, and A523 THS + CPU cpufreq (480 MHz-1.8 GHz) + GPU
> devfreq (150-600 MHz) with thermal throttling.
> 
> The README groups the ~106 patches by intended destination. The parts most

Sorry, but with 106 patches you will not make friends here: we already
have a review bottleneck. So please try to group them into
smaller, isolated parts. Try to group by subsystem, for instance
(pinctrl, clocks, etc).

> relevant to this list:
> 
> - Generic sunxi fixes I believe are upstreamable on their own: pinctrl (PIO
>   bank withstand, inverted POW_MOD_SEL polarity on A523/T527), watchdog restart
>   priority vs PSCI, AXP717 poweroff, a RESET_GPIO/mmc-pwrseq-simple bug that
>   breaks any sunxi board with SDIO WiFi when #gpio-cells=3, and a sunxi-ng
>   ccu_div set_rate_and_parent ordering fix.

If you think that there are things which are wrong in the existing
mainline A523 or OPi 4A support (in v7.2-rc and in
linux-sunxi/for-next), please make proper patches, with English
commit messages and your Signed-off-by: tag, then send them to the
mailing lists suggested by scripts/get_maintainer.pl. We can help you
with the details. Just be warned that the approach you chose to solve
the problems might be not the right one ...

> - A523 CPU CCU + THS (clk/thermal), ported/adapted from the BSP, with OPP
>   tables, cooling maps and asymmetric CPU topology.

There are already THS patches on the list. Please have a look at them,
and respond on the list (with issues you see, or with a confirmation):
https://lore.kernel.org/linux-sunxi/20260704171411.1413349-1-iuncuim@gmail.com/

> 
> - The HDMI KMS display series is largely a port/adaptation of the minimyth2 /
>   Justin Suess H728 work to the A523; original authorship is preserved in the
>   patch headers (Justin Suess, Jernej Skrabec). On top of that, the A523
>   specifics: IOMMU (sun50i) PHYS_OFFSET/PTE fixes, DE v35x RCQ backend, VSU8,
>   the MBUS "wedge" fix, and AFBC decode.

Anything display related is probably more complicated than you think,
and the BSP deviates quite heavily from mainline here, so BSP derived
patches are even less usable for upstreaming.

I'd say focus on the fixes and support for simpler features, and get
some experiences with the process. We would need to wait for the H616
DE support to be merged first anyway, then A523 can follow, so it's not
super urgent.

> 
> - A few patches are pure BSP-U-Boot workarounds (it doesn't fill /memory,

The BSP U-Boot is often far worse than BSP Linux, even. It's mostly
*severely* outdated, and general approaches are even more far from
mainline than they are in the kernel.
So please make it work with mainline U-Boot, and either fix things
there or adjust your Linux changes to work with mainline U-Boot.
We never did and probably never will support running mainline Linux
kernels from Allwinner BSP U-Boot.

Cheers,
Andre

>   injects display nodes into the FDT). Those are explicitly NOT for upstream.
> 
> I'd be happy to break the generic fixes out as individual, properly-formatted
> patches to the list if that's the most useful next step - tell me the order
> you'd prefer. Also glad to open an armbian/build PR for the board integration.
> 
> Credits: minimyth2 / Justin Suess for the H728 display groundwork, Jernej
> Skrabec's H616 patches it builds on, and the linux-sunxi community's docs.
> 
> Thanks for taking a look.
> 

