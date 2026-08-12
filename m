Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454C032B13B
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Aug 2026 11:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533001; cv=none; b=qzz1vZ5E1Tws2N2wp1penLKPSXmrBBCNM2QKdLPqT9Fy9eudp4Abe2DKtBEq7T+yGOSfnc8Ja+1f6IkpcNZKGUiGoswKC3p3CPOjXOOUQBABkLoO12kEzy5n6gKBPE1Kb3YoUWaSrCYoI8l0q5mZ1Ryc5plGjLKHgpiKceifO5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533001; c=relaxed/simple;
	bh=SD43NxkphTG4QJfEO+11qTY39yGqRulO+tiLnWO6XVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fj79C9OcA1/hAF4n2GrCMA/0YEVLY8mxe4EESLCAGWXzlJwk73LTEe3LUpCUxhz4jIDLhlYpismNq53DsbsqziQtXjQLxbXQIoIvkp3ObXpcLkHCdmDJtBNKhtTnERjjIIsVUm1cKqJpnrlxiDV4rQx2uO9tE4wqQOXmRqQQ/p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=H+9vH/PD; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="H+9vH/PD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1786532988; bh=SD43NxkphTG4QJfEO+11qTY39yGqRulO+tiLnWO6XVA=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=H+9vH/PD3LSXCrW3OJ3VnB56FaN2xRLrNiX2WUJw96pyNof8Klwc2AHK9D+5w8lLJ
	 xsbFFNlj0TT38bfXUrqAehw5rPYekDmasSjm/2szLnI78mJo2e4YzSIFTrgs2kb2PM
	 1aGRB1Zeam0LUrGfTGFTnQosbrkcQsFgyMro8iPg=
Date: Wed, 12 Aug 2026 13:09:46 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clocksource/drivers/sun4i: Wait for pending reload
 before CTRL write
Message-ID: <hrm7ymjfylkhaijaxjvornxakhoss5tea6pfmt2y2jpn436lhu@2cchvasiv4mr>
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
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e9003b7-0331-4b37-9b06-5e9de887199e@oss.qualcomm.com>

Hello Daniel,

On Wed, Aug 12, 2026 at 11:56:03AM +0200, Daniel Lezcano wrote:
> On 7/25/26 13:33, Ondřej Jirman wrote:
> > From: Ondrej Jirman <megi@xff.cz>
> > 
> > The A13 manual says of TMR0_RELOAD: "After the bit is set, it can not be
> > written again before it's cleared automatically."  Both time_stop() and
> > time_start() read-modify-write the control register, so a reload still in
> > flight gets rewritten and the write can be dropped, leaving the timer
> > unarmed.  In oneshot mode this happens on every tick, and the tick
> > eventually stops for good.
> > 
> > Wait for the reload to clear first.  All control register updates go
> > through sun4i_clkevt_time_stop().
> > 
> > Without this my Allwinner A13 based Pocketbook Touch Lux 3 stops
> > scheduling processes during boot or within a few seconds of executing
> > userspace. Only sysrq+t over serial port works at this stage, which is
> > how I discovered the root cause.
> > 
> > Fixes: 7e14183469d8 ("clocksource: sun4i: Fix bug when switching from periodic to oneshot modes")
> > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> > ---
> > BTW, similar issue will likely be also in timer-sun5i.c but I don't have any
> > device that would exercise it. And it's possible that this triggers more easily
> > with CONFIG_HZ=1000 which I use.
> > 
> >   drivers/clocksource/timer-sun4i.c | 26 +++++++++++++++++++++++++-
> >   1 file changed, 25 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clocksource/timer-sun4i.c b/drivers/clocksource/timer-sun4i.c
> > index 7bdcc60ad43c..2e7457f671c4 100644
> > --- a/drivers/clocksource/timer-sun4i.c
> > +++ b/drivers/clocksource/timer-sun4i.c
> > @@ -39,6 +39,9 @@
> >   #define TIMER_SYNC_TICKS	3
> > +/* The reload bit clears a couple of source clock cycles after it is set. */
> > +#define TIMER_RELOAD_MAX_POLL	100
> > +
> >   /*
> >    * When we disable a timer, we need to wait at least for 2 cycles of
> >    * the timer source clock. We will use for that the clocksource timer
> > @@ -53,9 +56,30 @@ static void sun4i_clkevt_sync(void __iomem *base)
> >   		cpu_relax();
> >   }
> > +/*
> > + * The control register must not be written while a reload is still in
> > + * flight, or the write can be dropped.
> > + */
> > +static int sun4i_clkevt_wait_reload(void __iomem *base, u8 timer)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < TIMER_RELOAD_MAX_POLL; i++) {
> > +		if (!(readl(base + TIMER_CTL_REG(timer)) & TIMER_CTL_RELOAD))
> > +			return 0;
> > +		cpu_relax();
> > +	}
> 
> The loop looks correct but I'm wondering why not use the helper:
> 
> ret = readl_poll_timeout_atomic(base + TIMER_CTL_REG(timer), val,
> 				!(val & TIMER_CTL_RELOAD), 0, timeout);
> 

I can. The only difference would be that this would loop up to 1000 * timeout
times, instead of 100 times in case reload bit never returns to 0. But that
never happens anyway.

> > +	return -ETIME;
> > +}
> > +
> >   static void sun4i_clkevt_time_stop(void __iomem *base, u8 timer)
> >   {
> > -	u32 val = readl(base + TIMER_CTL_REG(timer));
> > +	u32 val;
> > +
> > +	sun4i_clkevt_wait_reload(base, timer);
> 
> If it fails ?

There's not much to do, since sun4i_clkevt_time_stop() does not return anything
anyway and it's used across the file quite extensively. Well, the file is small,
but sun4i_clkevt_time_stop is called in every function exported via timer_of
struct... :)

I can rewrite all these functions to report all errors to timer core, but in
practice reload always resets very quickly, and a condition where the loop even
loops happens once every few seconds or so. I doubt anything but return 0
would ever happen anyway. I'd certainly notice, because it would again cause
instant lockup of my e-reader. Maybe I can just return void from
sun4i_clkevt_wait_reload() and not pretend there are errors to report,
instead?

Best regards,
	o.

> > +
> > +	val = readl(base + TIMER_CTL_REG(timer));
> >   	writel(val & ~TIMER_CTL_ENABLE, base + TIMER_CTL_REG(timer));
> >   	sun4i_clkevt_sync(base);
> >   }
> 
