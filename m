Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAE2369D5D
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Aug 2026 19:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786562233; cv=none; b=WbRg28010BJjCLaoIAyVQ+LbTraolPLSkwb8V8rdv7avJQtHsScxknifz6PSJhKYaLoWJg6UqRytvYe7j597r0YlSLGqnwShomBMlhB4pEEYOJo26Linja+nzA8rxh/A5KazBBfK1tHxDTKhYdtl7xYm7oUsvo5bgcC4ChI+IXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786562233; c=relaxed/simple;
	bh=eOKwlFn0rXXGqLQ3iyvphePz/D2yEesjxJGTD0yph7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M928J4XJ15iKdDXREzGvrBVOwiIsaTIqocfoTERl+kgJ4t5Y0GJvNvXNcPIFbvZ7RmsqoPE4/YmA7VfTQYACU77Bf3+zEBfTBoGFMnoa0VeEAaD81qDb7LvwXm7RcPnAyGAF5x5tCtBhiJS8c4dAKkgvwp8GzKtfmPSZHRPS+R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=p11HCuf2; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="p11HCuf2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1786562221; bh=eOKwlFn0rXXGqLQ3iyvphePz/D2yEesjxJGTD0yph7U=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=p11HCuf2WV2OYVA7npp2oQWMfsiCxSCdXZ7A7XBZtCYexKyprYR58TbKDM+2/iuMX
	 YSf0g3ck6aRLFlrltsdL7GOPM5EQ2/5LkT35Mf0lu4Mff+pFCCne1X++X58IGt7xY6
	 dFTkzJnjMTs2omZzDtAXw4V7oa30ECa1ZsrIg04Y=
Date: Wed, 12 Aug 2026 21:17:01 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clocksource/drivers/sun4i: Wait for pending reload
 before CTRL write
Message-ID: <p3aovubrngwpep25xdsxdklvopkqtg3cyeu5qai3iiv53u25sz@3ozm2vejnf4a>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20260725113341.2250687-1-megi@xff.cz>
 <9e9003b7-0331-4b37-9b06-5e9de887199e@oss.qualcomm.com>
 <hrm7ymjfylkhaijaxjvornxakhoss5tea6pfmt2y2jpn436lhu@2cchvasiv4mr>
 <9fb18d37-0406-46e6-8552-fb925dc14fad@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9fb18d37-0406-46e6-8552-fb925dc14fad@oss.qualcomm.com>

On Wed, Aug 12, 2026 at 01:49:18PM +0200, Daniel Lezcano wrote:
> On 8/12/26 13:09, Ondřej Jirman wrote:
> > Hello Daniel,
> > 
> > On Wed, Aug 12, 2026 at 11:56:03AM +0200, Daniel Lezcano wrote:
> > > On 7/25/26 13:33, Ondřej Jirman wrote:
> > > > From: Ondrej Jirman <megi@xff.cz>
> > > > 
> > > > The A13 manual says of TMR0_RELOAD: "After the bit is set, it can not be
> > > > written again before it's cleared automatically."  Both time_stop() and
> > > > time_start() read-modify-write the control register, so a reload still in
> > > > flight gets rewritten and the write can be dropped, leaving the timer
> > > > unarmed.  In oneshot mode this happens on every tick, and the tick
> > > > eventually stops for good.
> > > > 
> > > > Wait for the reload to clear first.  All control register updates go
> > > > through sun4i_clkevt_time_stop().
> > > > 
> > > > Without this my Allwinner A13 based Pocketbook Touch Lux 3 stops
> > > > scheduling processes during boot or within a few seconds of executing
> > > > userspace. Only sysrq+t over serial port works at this stage, which is
> > > > how I discovered the root cause.
> > > > 
> > > > Fixes: 7e14183469d8 ("clocksource: sun4i: Fix bug when switching from periodic to oneshot modes")
> > > > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> > > > ---
> > > > BTW, similar issue will likely be also in timer-sun5i.c but I don't have any
> > > > device that would exercise it. And it's possible that this triggers more easily
> > > > with CONFIG_HZ=1000 which I use.
> > > > 
> > > >    drivers/clocksource/timer-sun4i.c | 26 +++++++++++++++++++++++++-
> > > >    1 file changed, 25 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/clocksource/timer-sun4i.c b/drivers/clocksource/timer-sun4i.c
> > > > index 7bdcc60ad43c..2e7457f671c4 100644
> > > > --- a/drivers/clocksource/timer-sun4i.c
> > > > +++ b/drivers/clocksource/timer-sun4i.c
> > > > @@ -39,6 +39,9 @@
> > > >    #define TIMER_SYNC_TICKS	3
> > > > +/* The reload bit clears a couple of source clock cycles after it is set. */
> > > > +#define TIMER_RELOAD_MAX_POLL	100
> > > > +
> > > >    /*
> > > >     * When we disable a timer, we need to wait at least for 2 cycles of
> > > >     * the timer source clock. We will use for that the clocksource timer
> > > > @@ -53,9 +56,30 @@ static void sun4i_clkevt_sync(void __iomem *base)
> > > >    		cpu_relax();
> > > >    }
> > > > +/*
> > > > + * The control register must not be written while a reload is still in
> > > > + * flight, or the write can be dropped.
> > > > + */
> > > > +static int sun4i_clkevt_wait_reload(void __iomem *base, u8 timer)
> > > > +{
> > > > +	int i;
> > > > +
> > > > +	for (i = 0; i < TIMER_RELOAD_MAX_POLL; i++) {
> > > > +		if (!(readl(base + TIMER_CTL_REG(timer)) & TIMER_CTL_RELOAD))
> > > > +			return 0;
> > > > +		cpu_relax();
> > > > +	}
> > > 
> > > The loop looks correct but I'm wondering why not use the helper:
> > > 
> > > ret = readl_poll_timeout_atomic(base + TIMER_CTL_REG(timer), val,
> > > 				!(val & TIMER_CTL_RELOAD), 0, timeout);
> > > 
> > 
> > I can. The only difference would be that this would loop up to 1000 * timeout
> > times, instead of 100 times in case reload bit never returns to 0. But that
> > never happens anyway.
> 
> Sorry I don't get the 1000 * timeout

If you look at implementation of readl_poll_timeout_atomic() the timeout
parameter means that readl_poll_timeout_atomic() will do at most timeout * 1000
thight loops, so minimum timeout is 1000 loops.

> Does the documentation says anything about the duration before the register
> is cleared ?

Not directly, but for start after stop, manual says to wait at least 2 Tcycles
(input clock cycles to the timer).

Regards,
	o.

> > > > +	return -ETIME;
> > > > +}
> > > > +
> > > >    static void sun4i_clkevt_time_stop(void __iomem *base, u8 timer)
> > > >    {
> > > > -	u32 val = readl(base + TIMER_CTL_REG(timer));
> > > > +	u32 val;
> > > > +
> > > > +	sun4i_clkevt_wait_reload(base, timer);
> > > 
> > > If it fails ?
> > 
> > There's not much to do, since sun4i_clkevt_time_stop() does not return anything
> > anyway and it's used across the file quite extensively. Well, the file is small,
> > but sun4i_clkevt_time_stop is called in every function exported via timer_of
> > struct... :)
> > 
> > I can rewrite all these functions to report all errors to timer core, but in
> > practice reload always resets very quickly, and a condition where the loop even
> > loops happens once every few seconds or so. I doubt anything but return 0
> > would ever happen anyway. I'd certainly notice, because it would again cause
> > instant lockup of my e-reader. Maybe I can just return void from
> > sun4i_clkevt_wait_reload() and not pretend there are errors to report,
> > instead?
> IMO, returning void is fine along with a message, may be a WARN as it is
> really, AFAIU, not supposed to happen. It will be easy for anyone to find
> out where the issue is coming from
> 
