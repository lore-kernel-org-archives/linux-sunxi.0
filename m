Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07582E1F0E
	for <linux-sunxi@lists.linux.dev>; Sun, 29 Mar 2026 11:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774785233; cv=none; b=WyCMfbGd+1LTY+ihxwqOnX05VcYQSo5VrU14P76XD3MUAd9ygmB/e3UPw/w63r866WNmPfT9ChaSBCZi3+R66Jc0AK90Cn+Ko4uzmfaMz2elZH0fKNQ7qg4LCAYk2vknF0fMXIWg0Dw8aDZ5mUBLH1xXrLWjpQtVHPl+NhpLbQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774785233; c=relaxed/simple;
	bh=0uzZvIZYDJmESSspvl3mpEvCQbbAZdCXxvcd536qHqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bgIVpq9TbaockdH99Hmq5/WDtLUZCiZH/XnrwGRd/yk1BcuUkbKiyvk6iJz5iNPvtrlJSc2GJm0KdKE1UP69EeHAqQogNe2LbpTugRXbDbFitLJN8qGkDA4IEf+h/ZUJc3nmY2ikAqOxocLXExm3UjiMlHBCe9KIgk0BHCFPq4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5S0+fnO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5S0+fnO"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48538c5956bso34854805e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 29 Mar 2026 04:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774785229; x=1775390029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uU0NTK7NMSNT2kDGknARBu8N7YysrPeJ5XlwaOTRHqc=;
        b=M5S0+fnO4ZTQo4ty1Urey5JCMqIkl8oz5vC25QPwdALWD1+/lRI1K5WMeQ8jcDC0HX
         vvcC6YItrqArmKPJ0zkBVINcohvfbv1YZtcP8zW8Mx0mpc41S+K2ornV7gfdBJbRkiZK
         KiwDvTUgg/DiArGtV4GuwSNgdkjJoBBNdisVOZUxPlXpxMVMnN6JOmaxyn0GMK/kwzOW
         icgY6XVvimaFsep9AtD/BG8bELfiz2jEVdx1fVLkiTTLUx3BpsQrs9HvxUW81axovkiQ
         h/aA2nlWmhuS3wOh/Wq6e1rmUCvOTrs770Og4kg8Xa0fMM6XYezd+JrXpkxE/saNE5FU
         oCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774785229; x=1775390029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uU0NTK7NMSNT2kDGknARBu8N7YysrPeJ5XlwaOTRHqc=;
        b=ABHBdY8mniYFxIGyHrhNwXbnzVvM2sC+iwX+RNGWyEWb9Sme2qUYgypMHUGKUEPEsr
         R6Hv7JTNW2B0u3lED7ZK67YP03jo7UXtBS6RloVwsZxL6dF2jq/CeDnTK9IXS4gjBJC9
         e1XI8pGNV0UfWX0/scJWI95wswxRp0RFejxwD9cA660IRgv+2WVTF5SY0i/XqfAey2fG
         AqO3trI//aesICZNnTpxy7tjIaNvh9w+fsGY10LNx+xS4RrdGBvIHKOnXwdELfK2V3F/
         5Fa+9+ga0MLDxzt7bpo4sQ5GpnKa4qJmIEoGXwxNf9z2UY8W36TrT/Z6ZWz8BKpjjpob
         2aWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUAkJdEYTjgtsSeJx+rzMeNH1W3UDywb9+B68zC6Ztyb3qTTwGCoR2SBV6pLeM0FMW4qZlS+9rb6vL3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgMOc0rmD25CYMbjOgpJSrs/FyKnYeh+MYIiEpb4kXjiD4orit
	/InUBoj/KYCbOhRBeQ0yToFP30dNhLFEX9LU509UH/qJnAJCPrFXvCqL
X-Gm-Gg: ATEYQzxqSgT+0fqTGuXg6n9wO+arGZMgRjieNyYJaR2SRi/d/kusAuqa17c8U/zoBXZ
	oibuv2CyBsFJktiI+akmyakgSxkZeYrWVjz312LdDBbE2xIMrTXmSiVCpyAkW0lvGnrOjb1XNDG
	SBlY/T8XOwr+0ySOP9X2BbLHJGmzPCDhquCmRit0HWBczjaubEfKi7ia1btG9YFQmPv5Zza6ww5
	ifPxmwdxsKAHuZ36HCPOii/9fCV7E08ZChV3oZkT49ezFP/EVAMXKubOpmqPpPGBcK88mIzBgMp
	8XDMjxph7H8Y2DxPmJoAWLbg1YPxjM4XdFMfW3BqgKFX1er/kG4RtoqDPdasE0KfXCHj+gdBxQ7
	/nVg3LuMlIizPpSj1TAUItniftLCs5x1L3owruxDptf5JUc9Mk2Ao5O/6FWGOLn1/RJBi1Wt9M/
	CHUUM0/oUsy56rw5DVCTkRY983tCr8Nn4Jtsdr2RdlnWw5+zvhITbxSVOvXQwuesD/Z+7/TDeEC
	a/A7V9lCsI0Jn2H6g==
X-Received: by 2002:a05:600c:46ce:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-487290a929fmr129053725e9.3.1774785228954;
        Sun, 29 Mar 2026 04:53:48 -0700 (PDT)
Received: from jernej-laptop.localnet (118.red-213-98-130.staticip.rima-tde.net. [213.98.130.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872714ef38sm54949225e9.21.2026.03.29.04.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 04:53:48 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Subject: Re: [PATCH] arm64: dts: allwinner: enable h616 timer support
Date: Sun, 29 Mar 2026 13:53:45 +0200
Message-ID: <5977334.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260329-h616-timer-v1-1-5966d0420a66@mmpsystems.pl>
References: <20260329-h616-timer-v1-1-5966d0420a66@mmpsystems.pl>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 29. marec 2026 ob 13:43:04 Srednjeevropski poletni =C4=8Das je=
 Michal Piekos napisal(a):
> Add support for timer by reusing existing sun4i timer driver.
>=20
> H616 timer is compatible with earlier sunxi timer variants and provides
> both clocksource and clockevent functionality. It runs from 24 MHz
> oscillator. It can serve as broadcast clockevent for wake up from idle
> states.
>=20
> Tested on Orange Pi Zero 3:
> - timer is registered as clocksource:
> - switching clocksource at runtime works
> - timer operates as a broadcast clockevent device
> - no regression observed compared to arch_sys_counter
>=20
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
> Test results:
>=20
> Clocksource switching:
>   cat /sys/devices/system/clocksource/clocksource0/available_clocksource
>     arch_sys_counter timer
>   echo timer > /sys/devices/system/clocksource/clocksource0/current_clock=
source
>     [ 5031.105997] clocksource: Switched to clocksource timer
>=20
> Clockevent configuration:
>   cat /proc/timer_list
>     ...
>     Tick Device: mode:     1
>     Broadcast device
>     Clock Event Device: sun4i_tick
>      max_delta_ns:   178956969070
>      min_delta_ns:   1000
>      mult:           51539608
>      shift:          31
>      mode:           1
>      next_event:     9223372036854775807 nsecs
>      set_next_event: sun4i_clkevt_next_event
>      shutdown:       sun4i_clkevt_shutdown
>      periodic:       sun4i_clkevt_set_periodic
>      oneshot:        sun4i_clkevt_set_oneshot
>      resume:         sun4i_clkevt_shutdown
>      event_handler:  tick_handle_oneshot_broadcast
>     ...
>=20
> Cyclictest measurements:
>   Dominated by system scheduler latency and do not reflect clocksource
>   precision.
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h616.dtsi
> index 8d1110c14bad..bf054869e78b 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -228,6 +228,15 @@ cpu_speed_grade: cpu-speed-grade@0 {
>  			};
>  		};
> =20
> +		timer0: timer@3009000 {
> +			compatible =3D "allwinner,sun50i-h616-timer",
> +				     "allwinner,sun8i-a23-timer";

You have to add above combo to DT bindings.

Best regards,
Jernej

> +			reg =3D <0x03009000 0xa0>;
> +			interrupts =3D <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&osc24M>;
> +		};
> +
>  		watchdog: watchdog@30090a0 {
>  			compatible =3D "allwinner,sun50i-h616-wdt",
>  				     "allwinner,sun6i-a31-wdt";
>=20
> ---
> base-commit: be762d8b6dd7efacb61937d20f8475db8f207655
> change-id: 20260328-h616-timer-046e6ac3549e
>=20
> Best regards,
>=20




