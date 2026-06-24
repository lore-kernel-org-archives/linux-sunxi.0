Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F0A29E0E5
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Jun 2026 22:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782339303; cv=none; b=exSaZpeps/B3bCZB9u9a3nitqd3CWFE3jsiDoGLEzgf4aB3uVhtOXmsZaXHXFXhx5JbMFWkRDkrvLMb0I/hUorLrCGpvSLdrQAWoVZNg/LxOVAAA6PGDuKNyGgLzv2uS4Zw3OARr2y/doeo7WRaRdyqzZa4BZVuXjKd4BnaTAhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782339303; c=relaxed/simple;
	bh=pxEooHBuiouIbczQE2ronmu2uMx24d9wIwXX3gNKlNA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t5OFhbMYuojI1pW5lraoqAYb97D1LBzVjOg1fnJMDQhTZv1P6a5kV+ViGwPrTferZnrtMtmCq/ngBgrLApSdtWWDs6q4KZwsMq67PCpIBxTLVJVLcMweagiQ5N2v3Tx5Gm+mXv53mQ601WXcnU2e1Xxt0ltN9JzQWXtRzjcXEz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PSsVmMfl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PSsVmMfl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1355D1F00A3F;
	Wed, 24 Jun 2026 22:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782339300;
	bh=kC9XrQwXvE+AGf5pVhC3HDyT+Lw/EKciuZlz8JwgL2c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PSsVmMfluRp/rJA517gMz9DrGJUXMkCaF4lQDz1jHH6gJjdTPVaD6G6jSdBmOHCw/
	 hcRLsrDJLZ9Xx7jLqcfV0cIErX+fZkg8DkgsCYmFqt63zLy+CsRwYDx2EpXwy1AIk+
	 v0XhJMs4xgOJEGMW2mnKUkT9fo/ZvVfiTxYWV4b3hceNczJBGz333vYzaTqxfvBj/I
	 fXRA9wjZPqxfCO6NVfN2KIh7z8midBufqabzYMTAAaJqOe8kTmP+FgidOpQFHER3qD
	 Wqwry23ozFvCZwKLJUBJjsO8N2ga5woEgXZfaMT5R6CKbF6lui3wp31xxeubaoa+iH
	 fWg9O0hjHt1zA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clocksource/drivers/timer-sun4i: Advertise a real
 minimum delta
Reply-To: sashiko-reviews@lists.linux.dev
To: "Felix Yan" <felixonmars@archlinux.org>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260624220434.4183732-1-felixonmars@archlinux.org>
References: <CA+fTLhgLmTY+exGujKf8OYYQvcEW5X5NJ_5sLq2AYL6zER2c0A@mail.gmail.com>
 <20260624220434.4183732-1-felixonmars@archlinux.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 22:14:59 +0000
Message-Id: <20260624221500.1355D1F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The exact same zero-tick interval bug fixed in timer-sun4i.c is pr=
esent and unfixed in the sibling driver timer-sun5i.c.
- [High] The tick_resume callback can cause an infinite loop and hard locku=
p if the timer IP loses state during suspend.
- [High] sun4i_clkevt_set_oneshot() enables the hardware timer without prog=
ramming a safe interval, which can cause a boot hang if the hardware interv=
al register defaults to zero.
--

commit 58b9ac36774c7659ade7328ca0fd561f9759e49e
Author: Felix Yan <felixonmars@archlinux.org>
Subject: clocksource/drivers/timer-sun4i: Advertise a real minimum delta

This commit modifies the sun4i timer driver to advertise one extra tick for
the minimum delta. This prevents the clockevents core from requesting a
next event of exactly TIMER_SYNC_TICKS, which would result in programming a
zero-tick interval and hanging the hardware on Allwinner D1.

Link: https://lore.kernel.org/linux-riscv/CA+fTLhgLmTY+exGujKf8OYYQvcEW5X5N=
J_5sLq2AYL6zER2c0A@mail.gmail.com/

> diff --git a/drivers/clocksource/timer-sun4i.c b/drivers/clocksource/time=
r-sun4i.c
> index 7bdcc60ad43cb..c2d04ab7cf2d3 100644
> --- a/drivers/clocksource/timer-sun4i.c
> +++ b/drivers/clocksource/timer-sun4i.c
> @@ -208,7 +208,7 @@ static int __init sun4i_timer_init(struct device_node=
 *node)
>  	sun4i_timer_clear_interrupt(timer_of_base(&to));
> =20
>  	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
> -					TIMER_SYNC_TICKS, 0xffffffff);
> +					TIMER_SYNC_TICKS + 1, 0xffffffff);

[Severity: High]
This is a pre-existing issue, but the exact same zero-tick interval bug
appears to be present in the sibling driver timer-sun5i.c.

In drivers/clocksource/timer-sun5i.c:sun5i_setup_clockevent(), the device
is registered with a minimum delta of TIMER_SYNC_TICKS:

    clockevents_config_and_register(&ce->clkevt, rate,
                                    TIMER_SYNC_TICKS, 0xffffffff);

When the clockevents core requests exactly this length,
sun5i_clkevt_next_event() subtracts TIMER_SYNC_TICKS, resulting in 0:

    sun5i_clkevt_time_setup(ce, 0, evt - TIMER_SYNC_TICKS);

Should timer-sun5i.c be brought up to parity to prevent an identically
triggered hang there?


[Severity: High]
This isn't a bug introduced by this patch, but could this zero-tick hardware
hang also trigger via the oneshot configuration path in timer-sun4i.c?

When the clockevents core switches the timer state,
sun4i_clkevt_set_oneshot() calls:

    sun4i_clkevt_time_start(timer_of_base(to), 0, false);

This enables the timer without programming a valid non-zero interval, which
reloads the current uninitialized value of TIMER_INTVAL_REG(0).

If this defaults to 0 (the power-on reset default), does this risk the exact
same hardware hang?


[Severity: High]
This is a pre-existing issue, but can the timer sync logic cause a hard
lockup during system resume?

In drivers/clocksource/timer-sun4i.c, the tick_resume callback is mapped to
sun4i_clkevt_shutdown:

    .tick_resume =3D sun4i_clkevt_shutdown,

This calls sun4i_clkevt_time_stop() followed by sun4i_clkevt_sync(), which
spins infinitely waiting for Timer 1 to advance:

    while ((old - readl(base + TIMER_CNTVAL_REG(1))) < TIMER_SYNC_TICKS)
            cpu_relax();

If the timer block lost power during system suspend, Timer 1 will be
disabled upon resume. Since there is no suspend/resume hook to restart
Timer 1, the counter will never change.

Will this result in a deadlock?

> =20
>  	/* Enable timer0 interrupt */
>  	val =3D readl(timer_of_base(&to) + TIMER_IRQ_EN_REG);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624220434.4183=
732-1-felixonmars@archlinux.org?part=3D1
