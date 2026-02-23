Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363DB2853E0
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 20:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771877682; cv=pass; b=ZS6A/yDK/WiIenMzOqJuDpilrJ0nfxnajLwzBdmiEH7RoPTpoCYdAPEomRIgRL/2Y3+jT3i73BCHkML7wzCV3nKxdHyW9GqjX5PwiABycmymuIPDU4Kty8Cd22/6rFADZHDvyTIy8Vi3B11tLwghlLa5SPZkbwbrRG+iXf5rseM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771877682; c=relaxed/simple;
	bh=nA16AXtOAnzAMKQXT0kCHh4QEsWPir743Z8UnTfui7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YGj+O8aLhE5Sb6WwCrBQd59qM8G4mo/XicFhPP4jS428nf5G5UlamYnr/8T6vFvQ5rVatLfWXFkjighf5yqP7D/5bJ9ZNrAbehfM6F8KspmaVvEWXtbkTbuLHoPdw1lgC1fqtz005V2HUz7qNcm1ItRAybeztKgESoAV1nQoygQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CfuBtahr; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CfuBtahr"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8fbe5719ceso789472166b.1
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 12:14:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771877679; cv=none;
        d=google.com; s=arc-20240605;
        b=jKxHjt+ZhAvo79FOd21c+CBQ55Y5Y1iLNYdzV2eFLS/1FA0uWY6FPqZNG3yitbt8zI
         ShoWXmbDT67/LeCqNGWUCHEa6cVSMHBbvaX2bwq3z0rp2ugbmItdrzZdAwq/rnt+JELS
         WT3hvwbmOkpBxWn0Y/Z43hQi0ix+e/CxeJtqoLPdLD2eS5LXEDedSSNrvOlwSyKZile7
         N+oX2qXnnfl6T9y6BjPovSsBil51szldxyS/CnQQ5HUI2W0zHqSF5QT+ESSQCU6TtFHA
         dH27GlgpWOU0q/DNV0HAsnGq+BSh9BrTgiYlS+8FIrUWGtF90NP7cz0YAwJ7/RUAlaR6
         lVSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s5RZgQiN9LRRPBUwx9tg90lOISfa/rsQmb3YEFiGi18=;
        fh=tGFWihEXKvkDjIBXAgpgnbM9Fd/YvR0LzcVY1qe6W80=;
        b=OjHIEopAHhkJ+A3PJ/6ASf6Xi3cOyFr8zRZvMNYYClt4fSNxqBZz2q7B7bKUPJv43A
         l6yXaB/9NIrhMXyr9mG3Br96++ebBrhwx8VQXxks5vKtC2GowzPgEcfC7qseO9CSm39I
         xIAkGiMV1MUnNwoHY1ykjvB8HtSbjcJ+sOadN7Y/SPplN6I6dRaWTNTE8jAiTYE6W0dG
         OJarjgRm8kJs5wsyAzcxWtxy1dpfBw2l7tQtbmxzZbIFV4qdWgp+XxTKn36+RDZYyXmy
         EZq5VbGmxqDhk+r+ssRFFJl1fwhkGFiGDJGhM19RJUGqy/uVnutFRE4IV6ljetzP4NUZ
         3iHQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771877679; x=1772482479; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5RZgQiN9LRRPBUwx9tg90lOISfa/rsQmb3YEFiGi18=;
        b=CfuBtahrlCTKK9X23CNmGBBrGWL2/pgJbretQMnw+1rq59fljg5xSQd0ZinjC6uGLP
         8dv7llrbrEkxIZEr68xXhGmGLs3XSCJWd/i/XuqcMQGo6B2ctpQNfPAgaAjIViNf5Ot6
         vKeDTQFrp8z8FRqqx4+/jhICF4xuE4leiVl33RADYP6knGkTux7AFed49EEXMgiG4dsu
         7+ntI9DGe1ybhn4fhs7//AcYshyBo7qBGg/ExjJnFhxIrYUIZCNMk1SDhTxtbAwcIQot
         EpMGILOuXlwhKqXAw/ocG/AlshBLc8heC7bhCcSGQH8JsRwl5+9jAJOoyTgi+pDjVnKt
         V0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771877679; x=1772482479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s5RZgQiN9LRRPBUwx9tg90lOISfa/rsQmb3YEFiGi18=;
        b=XzDnvkLo2WNZjCCSvKgIrZQFa0TfynA+aUstcMLVEiYdLDuRcCnX8+t8KIlUG/mYPi
         fv7USVtdbMI5DRuX1wBejrsQPCUiym48pY7Sg9RWfoblHdU1u/yCo1oWT0Q/j353iT57
         ZHsu59olxZelRU2KrWjmZwaZOJe8BQaTkDx4OashaqWj/uDlU6tKEdqK1rg1OY7oQBre
         qq1gFltztFjpB+Pf+9qg2oGHxq6NOvAqS+tjcgkJRmUJxndmR6xKu0PUhIOFEo4egVj1
         MKoWijojcvqmae3kL2bngoxGwP+zKt4Osa3a1Ds/IO2vF3VnKcPe2GFbLPz8heZAo+tD
         nbOw==
X-Forwarded-Encrypted: i=1; AJvYcCXU/dqB1GHyW7SpvH4yCge3aBoh8pGptOeRPMyiGYdVENS4Vc4YML8vg7M5tbA0dh1F0Yq8hHuG7t5F8g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzM28K8ieWbtislamuo5esCD+ZYfjk0rfSEDLE1fxnkZxLKPQ+I
	ir74YcySfl4sWQDDcqe6577ijtfVrISqExtTV9U48cQU2tYgeKimbcu4ZsmyAIij6/Kt/8QHcat
	az9kXOPYurFxiFVSP3lGEZGJtZPAXnMiuxIbwSz0=
X-Gm-Gg: AZuq6aKkOQZRNCyfA1MJ9zTliX9MiCiBYDqPwFn9iXrZB7mvQf8JnonelXXnZAG5Y7Z
	EodCHwvEs6eUonBg/VDY/GOLscfbUNr5s2SbW7ay4cn5DoGt3YWNazbxHbc2LVcXJWvYWqHxJs0
	w8q7/ya8Xo+s36RuCnrhGh3IG9xKcStJcl2nzhmeL/jTP4eatvLVVsI9cPKhya2zxL7YRsXZQdL
	P7kxhzH9bQvgaeXqmTTAoVP8l0WVL7nVatmKDnCT/mfl7OXsfgSS0gKd0s9xP6v+BxEuz5Cjey8
	1o6vzoWn5OwL730FJQFlVMdGvjE0WvMp9WZP
X-Received: by 2002:a17:906:eec4:b0:b91:949a:721 with SMTP id
 a640c23a62f3a-b91949a077emr32138766b.50.1771877678105; Mon, 23 Feb 2026
 12:14:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260123093322.1327389-1-richard.genoud@bootlin.com>
In-Reply-To: <20260123093322.1327389-1-richard.genoud@bootlin.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 23 Feb 2026 12:14:26 -0800
X-Gm-Features: AaiRm50Ga4oMdcVdPVuyNBi2IGP1JlBI-F2cv9ZWk5n7MHWt5lEEKQ1itdDrDwA
Message-ID: <CANDhNCrSjp1F0PifJXmxrAbRiTC=d_ZXeiiT5kGuM=gNke7ebA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Introduce Allwinner H616 PWM controller
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Kocialkowski <paulk@sys-base.io>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 1:33=E2=80=AFAM Richard Genoud
<richard.genoud@bootlin.com> wrote:
>
> Allwinner H616 PWM controller is quite different from the A10 one.
>
> It can drive 6 PWM channels, and like for the A10, each channel has a
> bypass that permits to output a clock, bypassing the PWM logic, when
> enabled.
>
> But, the channels are paired 2 by 2, sharing a first set of
> MUX/prescaler/gate.
> Then, for each channel, there's another prescaler (that will be bypassed
> if the bypass is enabled for this channel).
>
> It looks like that:
>             _____      ______      ________
> OSC24M --->|     |    |      |    |        |
> APB1 ----->| Mux |--->| Gate |--->| /div_m |-----> PWM_clock_src_xy
>            |_____|    |______|    |________|
>                           ________
>                          |        |
>                       +->| /div_k |---> PWM_clock_x
>                       |  |________|
>                       |    ______
>                       |   |      |
>                       +-->| Gate |----> PWM_bypass_clock_x
>                       |   |______|
> PWM_clock_src_xy -----+   ________
>                       |  |        |
>                       +->| /div_k |---> PWM_clock_y
>                       |  |________|
>                       |    ______
>                       |   |      |
>                       +-->| Gate |----> PWM_bypass_clock_y
>                           |______|
>
> Where xy can be 0/1, 2/3, 4/5
>
> PWM_clock_x/y serve for the PWM purpose.
> PWM_bypass_clock_x/y serve for the clock-provider purpose.
> The common clock framework has been used to manage those clocks.
>
> This PWM driver serves as a clock-provider for PWM_bypass_clocks.
> This is needed for example by the embedded AC300 PHY which clock comes
> from PMW5 pin (PB12).
>
> Usually, to get a clock from a PWM driver, we use the pwm-clock driver
> so that the PWM driver doesn't need to be a clk-provider itself.
> While this works in most cases, here it just doesn't.
> That's because the pwm-clock request a period from the PWM driver,
> without any clue that it actually wants a clock at a specific frequency,
> and not a PWM signal with duty cycle capability.
> So, the PWM driver doesn't know if it can use the bypass or not, it
> doesn't even have the real accurate frequency information (23809524 Hz
> instead of 24MHz) because PWM drivers only deal with periods.
>
> With pwm-clock, we loose a precious information along the way (that we
> actually want a clock and not a PWM signal).
> That's ok with simple PWM drivers that don't have multiple input clocks,
> but in this case, without this information, we can't know for sure which
> clock to use.
> And here, for instance, if we ask for a 24MHz clock, pwm-clock will
> requests 42ns (assigned-clocks doesn't help for that matter). The logic
> is to select the highest clock (100MHz) with no prescaler and a duty
> cycle value of 2/4 =3D> we have 25MHz instead of 24MHz.
> And that's a perfectly fine choice for a PMW, because we still can
> change the duty cycle in the range [0-4]/4.
> But obviously for a clock, we don't care about the duty cycle, but more
> about the clock accuracy.
>
> And actually, this PWM is really a PWM AND a real clock when the bypass
> is set.

During my free/personal time this weekend I was tinkering with Orange
Pi Zero 2w and was able to use this patch series (along with an
hdmi-phy patch and some dts changes) to get HDMI working on the
device.
I'm eager to see these land!

Tested-by: John Stultz <jstultz@google.com>

thanks
-john
