Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C570314D13;
	Sun, 29 Mar 2026 12:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774786045; cv=none; b=K7fsWjejDbrQ10V9W4A3tggrxDcF8rUFcOCJ28cQP3vhKJE8usNjIvsKIS6nSlLdKyn/4VJ1kURqqFtsEimAEL/b6G1yhsUynNIj21sLO2rydhmfRQJQeKCzgYpeAh5mpmQvtoTUMK87cWt9OT36ZwBcFJeokyLgMGsBKhc2lRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774786045; c=relaxed/simple;
	bh=PZobRuR+CpQ4zAaQIuK7lpUD2WIu+wGFCVwUXMmbxoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YyvvPyA2iuy/foVJ08mUKz5JiRAFDLdyWVXDOACeODpb91IcdDkTrM/8o9HWYUXebNF0AjxsDtFCTM/rKOmV02i6OgUyNG7wH5vsXTWgBmfMdYda2zxl7qDl81eeOql/QnRHKMltzWGZ3zCr78LN1wAJz1TIbP/wk9eRiFPlEEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=q/Ydot2M; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="q/Ydot2M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JOlBMggKOzDX9Ye5XiGyMCn6XgPjZaJN4792ud0dJuc=; b=q/Ydot2MmGM3Wr1NwgXeCzbhAI
	KDATv3TNIU1rDjD/oWiqFLoEO9rR5KUXiRqLTbtF0oAUbPwTif529V5+bEF0YrH4Wmq4RPVg3h7BY
	EA31XWiN373S1oR+VQLT+jYQC7TZgMsStVl0EtDVeyX7kiPLs7c3Dvkq3sow6ZJ270jh6U0U77AuC
	1Rb7LZKMuwhhhNLyMwXp4jpvWtQexynwhf5WVeTSQUSquSvYzaqLVgi3n5G9URF8nNQh3+0gmNyAj
	JneMxxA6EmP8nrS6X7iH06sfzqk7JN17ISdZXA7Dewgbilc0PCA4nyBaVVgnlHNz6KOw/ydwoZngE
	gdx0ofww==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w6ovI-0000000GxJ9-0wwi;
	Sun, 29 Mar 2026 14:07:20 +0200
Date: Sun, 29 Mar 2026 14:07:19 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: enable h616 timer support
Message-ID: <n2bupd37br2mp7ls6c5z5ueoancr53tn4mywg2vvrlpyhmkex4@lxe6tfdhwz5e>
References: <20260329-h616-timer-v1-1-5966d0420a66@mmpsystems.pl>
 <5977334.DvuYhMxLoT@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5977334.DvuYhMxLoT@jernej-laptop>
X-Authenticated-Id: michal.piekos@mmpsystems.pl

On Sun, Mar 29, 2026 at 01:53:45PM +0200, Jernej Škrabec wrote:
> Dne nedelja, 29. marec 2026 ob 13:43:04 Srednjeevropski poletni čas je Michal Piekos napisal(a):
> > Add support for timer by reusing existing sun4i timer driver.
> > 
> > H616 timer is compatible with earlier sunxi timer variants and provides
> > both clocksource and clockevent functionality. It runs from 24 MHz
> > oscillator. It can serve as broadcast clockevent for wake up from idle
> > states.
> > 
> > Tested on Orange Pi Zero 3:
> > - timer is registered as clocksource:
> > - switching clocksource at runtime works
> > - timer operates as a broadcast clockevent device
> > - no regression observed compared to arch_sys_counter
> > 
> > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > ---
> > Test results:
> > 
> > Clocksource switching:
> >   cat /sys/devices/system/clocksource/clocksource0/available_clocksource
> >     arch_sys_counter timer
> >   echo timer > /sys/devices/system/clocksource/clocksource0/current_clocksource
> >     [ 5031.105997] clocksource: Switched to clocksource timer
> > 
> > Clockevent configuration:
> >   cat /proc/timer_list
> >     ...
> >     Tick Device: mode:     1
> >     Broadcast device
> >     Clock Event Device: sun4i_tick
> >      max_delta_ns:   178956969070
> >      min_delta_ns:   1000
> >      mult:           51539608
> >      shift:          31
> >      mode:           1
> >      next_event:     9223372036854775807 nsecs
> >      set_next_event: sun4i_clkevt_next_event
> >      shutdown:       sun4i_clkevt_shutdown
> >      periodic:       sun4i_clkevt_set_periodic
> >      oneshot:        sun4i_clkevt_set_oneshot
> >      resume:         sun4i_clkevt_shutdown
> >      event_handler:  tick_handle_oneshot_broadcast
> >     ...
> > 
> > Cyclictest measurements:
> >   Dominated by system scheduler latency and do not reflect clocksource
> >   precision.
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > index 8d1110c14bad..bf054869e78b 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > @@ -228,6 +228,15 @@ cpu_speed_grade: cpu-speed-grade@0 {
> >  			};
> >  		};
> >  
> > +		timer0: timer@3009000 {
> > +			compatible = "allwinner,sun50i-h616-timer",
> > +				     "allwinner,sun8i-a23-timer";
> 
> You have to add above combo to DT bindings.
> 
> Best regards,
> Jernej

Not sure I understand your comment correctly but binding for h616 is already
there:

Documentation/devicetree/bindings/timer/allwinner,sun4i-a10-timer.yaml:21-27
  - items:
    - enum:
        - allwinner,sun20i-d1-timer
        - allwinner,sun50i-a64-timer
        - allwinner,sun50i-h6-timer
        - allwinner,sun50i-h616-timer
    - const: allwinner,sun8i-a23-timer

BR
Michal

> 
> > +			reg = <0x03009000 0xa0>;
> > +			interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&osc24M>;
> > +		};
> > +
> >  		watchdog: watchdog@30090a0 {
> >  			compatible = "allwinner,sun50i-h616-wdt",
> >  				     "allwinner,sun6i-a31-wdt";
> > 
> > ---
> > base-commit: be762d8b6dd7efacb61937d20f8475db8f207655
> > change-id: 20260328-h616-timer-046e6ac3549e
> > 
> > Best regards,
> > 
> 
> 
> 
> 
