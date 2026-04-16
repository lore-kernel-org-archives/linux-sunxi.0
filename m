Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3896E2F6910
	for <linux-sunxi@lists.linux.dev>; Thu, 16 Apr 2026 22:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776377463; cv=none; b=JgbIEAPqmphQ9+oKnLGybvbPZoLIXfhzLTOOqnerMrwzEHVYdR2JqvcjC5WdPYydZslrwq4BXjtZIR9t2FVz8kRNqiXmIYjczxgvV+WPlbQVLTkb29DQb0eyzCb6cLWKGrnriTVwVIWVmi1DyV5dXshYZBvCCcP41hOGs8b+DII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776377463; c=relaxed/simple;
	bh=vCOt/kUHacZnTmt54w+Pu+3p3vr/u03wTAqlzPGEU9k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gVzmx7xtthHi4yL1A6BVHIVd9vyvspnUOC907/V7hsN5eeqzceZMVbS1StY5wIjoSOb+JXYvK1fsoHMdzRamrrCZR7Q75axUjVjg6KP5/UN+82G4WQVHpVacpvpqIpaYTUMO+RWL0aOSQ6/+HnO2T+fSfL3eTeBtMQno/7gX/50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=sQJgQGsJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="sQJgQGsJ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3FF3244C;
	Thu, 16 Apr 2026 15:10:54 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68DA03F7B4;
	Thu, 16 Apr 2026 15:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776377460; bh=vCOt/kUHacZnTmt54w+Pu+3p3vr/u03wTAqlzPGEU9k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sQJgQGsJGDDEexDg/5V6P/6ZNxrLUlqlhpg2L/PSHdUhwV9iP/I/gPGoQZmbCa+Cv
	 FuO7KIJ+7nEQDT95nw0yk0X+NDDhg7kT9ZdWAozy31w4iXlejRW4ajcHMALTSZdVL7
	 qQou6X7biVZShrjMeD/aepDTsXOgMm16THgx63iM=
Date: Fri, 17 Apr 2026 00:10:43 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: qianfanguijin <qianfanguijin@163.com>
Cc: linux-sunxi <linux-sunxi@lists.linux.dev>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, samuel <samuel@sholland.org>, wens
 <wens@kernel.org>
Subject: Re: [RFC] Allwinner T536 initial support & pinctrl register layout
 redesign
Message-ID: <20260417001043.18ce12ca@ryzen.lan>
In-Reply-To: <202604161857186497478@163.com>
References: <202604161857186497478@163.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 16 Apr 2026 18:57:20 +0800
qianfanguijin <qianfanguijin@163.com> wrote:

Hi,

> Hi everyone,
> 
> I'm reaching out to see if there's any interest in supporting the Allwinner T536, an industrial-grade SoC featuring a quad-core Cortex-A55. I'm currently working on an upstream Linux kernel port for this chip.

Many thanks for doing this and reaching out!

> Progress so far:
> 
>     Basic CCU support
>     pinctrl (GPIO and IRQ)
>     UART console
>     Successfully boots a minimal initramfs
> 
> The T536 introduces a redesigned GPIO register layout that is incompatible with the register mapping used by currently supported Allwinner SoCs. To accommodate this, I've refactored relevant register-related information into the pinctrl ops structure.

I have just skimmed over this, but I guess that's the same new layout
as the A733? PortA starts at 0x80, there are set/clear registers after
the data register, other registers move, IRQ register inside each GPIO
bank and so on? If so, you should just piggy back on my patches, that
already introduce support for this new layout:
https://lore.kernel.org/linux-sunxi/20250821004232.8134-1-andre.przywara@arm.com/

This uses a different approach than you, please have a look and see how
you like this. If you think yours is better, please let me know.

> Andre, I heavily referenced your recent work on the A523 during development. Could you confirm whether GPIO interrupts are currently functional on A523? In my testing on the T536, I noticed that when irq_read_needs_mux is configured, the IRQ multiplexing mode is incorrectly set to 6, which breaks interrupt handling. I don't have access to A523 hardware for verification, but it appears this logic may need adjustment. Any insights or testing feedback would be greatly appreciated.

Yes, this is indeed broken, which was recently discovered. I tried to
fix this for v7.0 still, but this didn't happen :-(
The quick fix for the A523 is here:
https://lore.kernel.org/linux-sunxi/20260327113006.3135663-1-andre.przywara@arm.com/T/#u
There is a more elaborate version, but this has some issues and needs
more work:
https://lore.kernel.org/linux-sunxi/20260323110151.2352832-1-andre.przywara@arm.com/T/#u

For a new SoC it's simple to address: just don't use
irq_read_needs_mux (it's not needed anyway), and make sure the IRQs are
correct, including potentially non-implemented banks.
 
> Due to the GPIO subsystem redesign, I've made several modifications
> to the sunxi-pinctrl driver. A work-in-progress tree is available for
> review here: https://github.com/qianfan-Zhao/linux/tree/t536
> 
> I would appreciate your review and guidance on the upstreaming
> strategy:
> 
>     Should the pinctrl/register layout changes be submitted and
> merged first as a foundation?

Well, they should be part of the series. While refactoring is indeed
somewhat independent from the full SoC support, and could be
upstreamed separately, the motivation for the refactor needs to be
there, so we need to see the full picture. Compare my A733 pinctrl
series referenced above: you do the refactoring first, then add support
for the new SoC on top. But all within one series.
Also splitting this up in independent series creates nasty and
confusing dependencies, which are also a moving target. So keep things
in one series.

>     Or is it preferred to hold off until broader T536 support is complete?

I tend to do the following splitup:
- One series with pinctrl support. Contains binding patch(es),
  potentially refactoring, then the SoC specific driver boilerplate.
  Basically what you have, but just the pinctrl parts.
- One series with clock support. I understand it's tempting to do this
  with just a few clocks, but in the past we always did the full clock
  tree. You can split this up by clock types, purely for review
  reasons. Compare the current A733 clock series:
https://lore.kernel.org/linux-sunxi/20260310-a733-clk-v1-0-36b4e9b24457@pigmoral.tech/
- One series with new PMIC support, if needed. The PMIC is needed to
  keep the kernel forwards and backwards compatible with new DTs. If say
  Linux v7.2 contains basic driver support, but not the PMIC, then
  future DT, now referencing the PMIC, would no longer boot on v7.2,
  since that doesn't know the PMIC. Which is a regression. So we need
  PMIC support from the very start. If T536 boards use already
  supported PMIC, there wouldn't be anything to do here.
- The same is true for RTC support. The actual calendar functionality
  doesn't matter, but on Allwinner the RTC provides essential clocks.
  Again if older kernels wouldn't know about the RTC, then newer DTs
  might break the boot on older kernel, thus introducing a regression.
  So we need the RTC from day one.
- The final series with the DT support. Introduce the trivial bindings
  for the new SoC names, otherwise relying on the driver bindings
  introduced with the series above. This would be the series really
  adding support, even though it typically contains no code.

> Any feedback on the code structure, IRQ handling, or submission workflow would be extremely helpful. I'll format and send proper patches via git send-email once the direction is confirmed.

So yes, I'd say try to rebase the pinctrl part on top of my A733
pinctrl series. I will try to send an updated version after -rc1,
incorporating the A523 IRQ fixes. Ideally your submission would be
just the DT binding, plus the per-SoC "driver file", which is now rather
simple.

Then check the PMIC and RTC situation, maybe you are lucky and it's
simple. The nasty and tedious part is the clock support, and I am afraid
there is no easy way out there. Some things are just complicated and
complex. ;-)
Good thing is those series can go in parallel, since there are no
dependencies between them. It's just that the final DT support
series needs to wait for everything else to land, before it can be
merged.

Cheers,
Andre

> Thanks in advance for your time and guidance.
> 
> 
> 
> 
> 

