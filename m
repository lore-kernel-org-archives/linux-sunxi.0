Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D091426D4CA
	for <linux-sunxi@lists.linux.dev>; Sun, 29 Mar 2026 13:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774789405; cv=none; b=JMfPenbATz2DrHjKgvy79tco22Aocg3h99qt+EflnwP2NoxozzKYBEodY9lZwgIpUEXIZwwXJLiYitD0GzhNr2RFZP5334dr65CaKNBPXUJksVH81dLiyIgb1iJsf4eQONytJP87mYOB2JzPAWMJAL3ixb0cAx1pmX1mcTzANuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774789405; c=relaxed/simple;
	bh=U/R2pAPnxIsAzZzsFQMZKmzU5HLTHhfGOlT1wA7/tYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nCNDNGmpD/lS+HZ/p9FpXtpY/pgwm2s/2KbEXbJsZpVUo6LGZXEp37RTJVdI8HUdHaqD2lSYwgqBEFpnqGtuntJULZl7+8IoGkw6zYusyAwXs5scL1V/1nnWqqVS9XF38SFlG8GSb+9LDpyykJDBv3DD4uSx+QEUWbJmxeKPHLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPX/w9on; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPX/w9on"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48374014a77so42424345e9.3
        for <linux-sunxi@lists.linux.dev>; Sun, 29 Mar 2026 06:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774789402; x=1775394202; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viDNw9XnGj7IgNiXG+l3zPbwcxnl/gxtXwY665wWLdc=;
        b=BPX/w9onP11S61P7lfZwTSlPYK0C//H9lXeshRVQtKM5bpt+lB0vwvHGKrOcxQDVgI
         +FoRwFk1Tz4gb1pmLgWjczi3DpK+u/WPiTlpKxJLMqh2htZROqe/cFvsHTE8Uyd/Wb20
         vE+AyUVxDL2m26elvVtRO4/4pfKIVaFDTaWGgVczkJheFrC6KyymXVyAX8Pr1lhjbLCT
         Gk5IXA3x0Mcijhzz3kqTMvJxKQqc9gNNjtE7Y3CuyFerKV7V/vpl4/XyJhJ/CinsUglA
         RkVwjim0K2492xNSQrht2VQH6ekrPfY73TmJ1iHSyjZalk4ram+576HEpp4g3DW2kDZ+
         GyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774789402; x=1775394202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=viDNw9XnGj7IgNiXG+l3zPbwcxnl/gxtXwY665wWLdc=;
        b=ZZg2ixO2v0K0Mp64/vYlaNpWuzzei5hrYbTvdCdbm+vIdbIzbKccmbkQ3Kbi32t/AU
         sJjjIDcfg/zEAkFPj5fM2Ws+WS19P9NT0ECVEXgyvfcvqgFiFhplUY3+69pDDACvXvfo
         YxKziu4imTWDARoqMvUpKVt7goB8HAa1n9iIkB4AlTznTWKsffVbg3UZXLnxnECnWc9Q
         iZe9YXyNLw8LH2MyehJ0Df8j1Jr04ejlwkZmUvyKlwIgL2VIq2f7oJJlWYKoqwocLtH/
         i26ETwC9xeluyIimw4yCswKHjnnaTg2d9BmOeXG9vUn7huwcHh3i1oscOZm1w91hFtsv
         Gdtg==
X-Forwarded-Encrypted: i=1; AJvYcCUV2DUymjhj5/LOxS4mnqnCprJl9C5SjV+UcvwyyUR0TSEyMwAJ3vUQfBU1Y26bReY7hjGQRBTlW+jtxA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzT0ODA5xOsyT1mFoJQjSdpOvR3CAjE8A+K6haYvzyBJSQZvWWe
	Qqwxv7dVBJo4dxAt4D4mVJ7c9ReWgmfWVJRXTBgUJVZkFrbmmiXAkjmM
X-Gm-Gg: ATEYQzx/UuiToVRsw2PYW/G3vza1WvuuUAglr9fyw1xO2tSIqddCI6c8XKnUZc2y+Rm
	3HHr8M/hZWRufcFjv2CF4hwmwLQ5uioI6rJNSYJg2KDEW8UYzUyPbPhI0BYJOSgEsiTWJfPFAFU
	XMZyJzWKX9jF4qY1sSK3DrfMrbjoDBh1WhiYSHq1uvqY8XhDLJgruXmBHPdLpzVq2ntnZbslfiH
	wGz8HhHFgymU5RXqw+BSmpjGADAEa0XIGPZqG4PvVsPfvfFJPfxbXePnMKXt6CH1abw7UN1NFBf
	4hX9H1RWASv84erBkfqTG4ZIq7ZSJPUjkQhBxI/eF2nFzxXGiF6o5HNFKwosAEJHjumaKZMkWjf
	ea5ikSswSCCTJ9VvllkXWlI7CWBRGCkQFgv9OpCdq8J8FiGjLwxBRitpJvLzldL1AlNiDYaHhts
	d7Cfr18VECl1U1Xe1vHKuT+3Z1RZm/aH3tkT6okcjhG8ccjqgqMeDjnrHCUrrHW8QjVHHkarSkH
	F5xa5zDlmBsYZMLTA==
X-Received: by 2002:a05:600c:4e15:b0:485:2ce2:4c87 with SMTP id 5b1f17b1804b1-48727d45881mr151705535e9.4.1774789401886;
        Sun, 29 Mar 2026 06:03:21 -0700 (PDT)
Received: from jernej-laptop.localnet (118.red-213-98-130.staticip.rima-tde.net. [213.98.130.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d23679sm397412475e9.9.2026.03.29.06.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 06:03:21 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: enable h616 timer support
Date: Sun, 29 Mar 2026 15:03:17 +0200
Message-ID: <4721811.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <n2bupd37br2mp7ls6c5z5ueoancr53tn4mywg2vvrlpyhmkex4@lxe6tfdhwz5e>
References:
 <20260329-h616-timer-v1-1-5966d0420a66@mmpsystems.pl>
 <5977334.DvuYhMxLoT@jernej-laptop>
 <n2bupd37br2mp7ls6c5z5ueoancr53tn4mywg2vvrlpyhmkex4@lxe6tfdhwz5e>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 29. marec 2026 ob 14:07:19 Srednjeevropski poletni =C4=8Das je=
 Michal Piekos napisal(a):
> On Sun, Mar 29, 2026 at 01:53:45PM +0200, Jernej =C5=A0krabec wrote:
> > Dne nedelja, 29. marec 2026 ob 13:43:04 Srednjeevropski poletni =C4=8Da=
s je Michal Piekos napisal(a):
> > > Add support for timer by reusing existing sun4i timer driver.
> > >=20
> > > H616 timer is compatible with earlier sunxi timer variants and provid=
es
> > > both clocksource and clockevent functionality. It runs from 24 MHz
> > > oscillator. It can serve as broadcast clockevent for wake up from idle
> > > states.
> > >=20
> > > Tested on Orange Pi Zero 3:
> > > - timer is registered as clocksource:
> > > - switching clocksource at runtime works
> > > - timer operates as a broadcast clockevent device
> > > - no regression observed compared to arch_sys_counter
> > >=20
> > > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > > ---
> > > Test results:
> > >=20
> > > Clocksource switching:
> > >   cat /sys/devices/system/clocksource/clocksource0/available_clocksou=
rce
> > >     arch_sys_counter timer
> > >   echo timer > /sys/devices/system/clocksource/clocksource0/current_c=
locksource
> > >     [ 5031.105997] clocksource: Switched to clocksource timer
> > >=20
> > > Clockevent configuration:
> > >   cat /proc/timer_list
> > >     ...
> > >     Tick Device: mode:     1
> > >     Broadcast device
> > >     Clock Event Device: sun4i_tick
> > >      max_delta_ns:   178956969070
> > >      min_delta_ns:   1000
> > >      mult:           51539608
> > >      shift:          31
> > >      mode:           1
> > >      next_event:     9223372036854775807 nsecs
> > >      set_next_event: sun4i_clkevt_next_event
> > >      shutdown:       sun4i_clkevt_shutdown
> > >      periodic:       sun4i_clkevt_set_periodic
> > >      oneshot:        sun4i_clkevt_set_oneshot
> > >      resume:         sun4i_clkevt_shutdown
> > >      event_handler:  tick_handle_oneshot_broadcast
> > >     ...
> > >=20
> > > Cyclictest measurements:
> > >   Dominated by system scheduler latency and do not reflect clocksource
> > >   precision.
> > > ---
> > >  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/ar=
m64/boot/dts/allwinner/sun50i-h616.dtsi
> > > index 8d1110c14bad..bf054869e78b 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > > @@ -228,6 +228,15 @@ cpu_speed_grade: cpu-speed-grade@0 {
> > >  			};
> > >  		};
> > > =20
> > > +		timer0: timer@3009000 {
> > > +			compatible =3D "allwinner,sun50i-h616-timer",
> > > +				     "allwinner,sun8i-a23-timer";
> >=20
> > You have to add above combo to DT bindings.
> >=20
> > Best regards,
> > Jernej
>=20
> Not sure I understand your comment correctly but binding for h616 is alre=
ady
> there:
>=20
> Documentation/devicetree/bindings/timer/allwinner,sun4i-a10-timer.yaml:21=
=2D27
>   - items:
>     - enum:
>         - allwinner,sun20i-d1-timer
>         - allwinner,sun50i-a64-timer
>         - allwinner,sun50i-h6-timer
>         - allwinner,sun50i-h616-timer
>     - const: allwinner,sun8i-a23-timer
>=20
> BR
> Michal

Sorry, sometimes tooling fails me. All good.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
> >=20
> > > +			reg =3D <0x03009000 0xa0>;
> > > +			interrupts =3D <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> > > +			clocks =3D <&osc24M>;
> > > +		};
> > > +
> > >  		watchdog: watchdog@30090a0 {
> > >  			compatible =3D "allwinner,sun50i-h616-wdt",
> > >  				     "allwinner,sun6i-a31-wdt";
> > >=20
> > > ---
> > > base-commit: be762d8b6dd7efacb61937d20f8475db8f207655
> > > change-id: 20260328-h616-timer-046e6ac3549e
> > >=20
> > > Best regards,
> > >=20
> >=20
> >=20
> >=20
> >=20
>=20




