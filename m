Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C689137F729
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Sep 2026 23:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789254856; cv=none; b=XFA42CYjxlw6zBE2bvXGmNifzBqpWgLSrU21jrPqxm3dAbWzPP8Qa1E8k9PWvfq5nqqEFkmq2+j5QbQHq6UFFwkiBuHXm5ygqWcrzryuz6eLtPnsgODOZirvAIwP4DOjXkoJhEOh69hwrHJSANbaGxrC6FM0Kr1bbJPD+g68Gu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789254856; c=relaxed/simple;
	bh=xdAfinPPZqWIbj2mK1fMt+pUTm8xSnloR3oLZlpQeQ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jdA/gCMVH5NeZilDrrzZd/BBpCQXaG+gmV+7FmuTbs94QA1184oPjk4CsocF00ChBcCXvw5nbOebsrIAaCnTb8wMtov9o3mNlwU/9iLE9n8ExYMvaFOUt4VFOaeLI/qVUikSMzPX38Nn8Z3fnqQElWipSKndR3LsnwlIs1nA5j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cl/naFjj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cl/naFjj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61621F000FF;
	Sat, 12 Sep 2026 23:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789254854;
	bh=WURPUXwfMyOk1tDqQ7jZG2/IAQ0pEIarCU7hJnY+sjU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cl/naFjjBk8WFXHFmWZx457vM+WBXBslw26KNZeQJgdMMwp+E5Y06LnrxY1SUPzyv
	 VICtZ9JrdYTB2w7c8kH7BJhpwIYwJ3eojnAjORiO8xZBX3Hb0HIS4LaO0c1D5+1Sfd
	 t7DXpR2PjN4l4G3CafYtn7EQFW5IXAzoQ3hcrA5++aPrHtzx9w0H1j0eMpxfxITMMv
	 SG6tczCJNFlmiNZP1rJNNMDq+5Brj0RIG3Csu89S+mq02DMYZq1dRaCigk8cJoep9h
	 BmLC6qDDEMb3EGoh8l9qi18i2mMU1J4iktdZvw32VKlOUSa/Gei19QO4iulq/sEhKr
	 BRVoX+vYkxOQQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v7] arm64: allwinner: add TrimUI Smart Pro (A133)
 board support
Reply-To: sashiko-reviews@lists.linux.dev
To: leow149 <leow149@lucidmail.xyz>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260912230131.109229-1-leow149@lucidmail.xyz>
References: <20260912222429.107809-1-leow149@lucidmail.xyz>
 <20260912230131.109229-1-leow149@lucidmail.xyz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 23:14:13 +0000
Message-Id: <20260912231413.E61621F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] First frame kick is permanently lost if the hardware is busy at th=
e first timer tick, deadlocking the display.
- [Medium] TCON TOP DSI clock gate is leaked because it is never disabled.
- [Low] DT schema validation bypass due to missing compatible strings in co=
nditional blocks.
--

commit 17cfa6c0fbcb618f9439977751e662fb57699cdd
Author: leow149 <leow149@lucidmail.xyz>

arm64: allwinner: add TrimUI Smart Pro (A133) board support

This commit adds board bring-up support for the TrimUI Smart Pro handheld
device, implementing the display pipeline, panel driver, and PWM backlight.
It introduces the A133 DE2 mixer configurations, TCON TOP quirks, and handl=
es
the CPU/8080-interface DSI output.

> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a8=
3t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun=
8i-a83t-de2-mixer.yaml
> index cbd18fd83e527..ce72c1ba71f15 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-=
mixer.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-=
mixer.yaml
> @@ -23,6 +23,8 @@ properties:
>        - allwinner,sun20i-d1-de2-mixer-1
>        - allwinner,sun50i-a64-de2-mixer-0
>        - allwinner,sun50i-a64-de2-mixer-1
> +      - allwinner,sun50i-a133-de2-mixer-0
> +      - allwinner,sun50i-a133-de2-mixer-1

[Severity: Low]
Is this missing from the conditional if: properties: compatible: contains
blocks further down in the schema?=20

By adding these new compatible strings to the global enum without integrati=
ng
them into the generation-based if-then conditional blocks, device trees with
invalid configurations for the A133 mixer may bypass variant-specific
validation checks and silently pass.

[ ... ]

> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/s=
un4i_tcon.c
> index bf405a2aa3249..8b7dff89070dd 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
[ ... ]
> @@ -713,11 +1054,31 @@ void sun4i_tcon_mode_set(struct sun4i_tcon *tcon,
[ ... ]
>  	case DRM_MODE_ENCODER_DSI:
[ ... ]
>  		sun4i_tcon0_mode_set_cpu(tcon, encoder, mode);
>  		sun4i_tcon_set_mux(tcon, 0, encoder);
> +		sun4i_tcon0_set_dsi_gate(tcon, true);
> +		sun4i_tcon0_set_de0_port(tcon);
>  		break;

[Severity: Medium]
Does this code leak the TCON TOP DSI clock gate?

The gate is explicitly enabled here via sun4i_tcon0_set_dsi_gate(tcon, true=
),
but it doesn't appear that sun4i_tcon0_set_dsi_gate(tcon, false) is ever
called during DPMS OFF or teardown logic (e.g., in sun4i_tcon_set_status).
This could leave the clock permanently enabled after the first modeset.

[ ... ]
> +static enum hrtimer_restart sun4i_tcon_dsi_retrigger_timer_fn(struct hrt=
imer *timer)
> +{
> +	struct sun4i_tcon *tcon =3D container_of(timer, struct sun4i_tcon,
> +						dsi_retrigger_timer);
> +	unsigned int cpu_if_before;
> +	unsigned int tick =3D tcon->dsi_retrigger_ticks;
> +	u32 dsi_int;
> +	bool busy;
> +
> +	regmap_read(tcon->regs, SUN4I_TCON0_CPU_IF_REG, &cpu_if_before);
> +	busy =3D cpu_if_before & SUN4I_TCON0_CPU_IF_TRI_START;
> +
> +	if (tick && (!busy || tcon->dsi_irq_retriggered)) {
> +		/*
> +		 * Either TRIGGER_START self-cleared, or (see the comment on
> +		 * dsi_irq_retriggered in sun4i_tcon.h) sun4i_tcon_handler()
> +		 * already re-triggered a frame on its own -- either way the
> +		 * IRQ path has taken over from here.
> +		 */
> +		return HRTIMER_NORESTART;
> +	}
[ ... ]
> +	if (tick =3D=3D 0 && !busy) {
> +		sun6i_dsi_tri_start(tcon->dsi);
> +		regmap_update_bits(tcon->regs, SUN4I_TCON0_CPU_IF_REG,
> +				   SUN4I_TCON0_CPU_IF_TRI_START,
> +				   SUN4I_TCON0_CPU_IF_TRI_START);
> +	}
> +
> +	tcon->dsi_retrigger_ticks =3D tick + 1;
> +	hrtimer_forward_now(timer, ms_to_ktime(2));
> +	return HRTIMER_RESTART;
> +}

[Severity: High]
Can this deadlock the display if the hardware is busy at the first timer ti=
ck?

If a previous DPMS OFF interrupted an active frame transfer, the hardware m=
ight
transiently or permanently remain busy (SUN4I_TCON0_CPU_IF_TRI_START =3D=3D=
 1)
at tick 0.

Because the initial sun6i_dsi_tri_start kick is specifically guarded by
if (tick =3D=3D 0 && !busy), being busy at tick 0 causes the kick to be dro=
pped.
On subsequent ticks (tick > 0), the timer bypasses the kick entirely and
will continue returning HRTIMER_RESTART endlessly, waiting for the hardware
to become not busy. However, if the DSI engine remains idle without the kic=
k,
busy evaluates to true forever, permanently losing the frame.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912230131.1092=
29-1-leow149@lucidmail.xyz?part=3D1
