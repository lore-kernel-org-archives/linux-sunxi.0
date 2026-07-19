Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268A113A3ED;
	Sun, 19 Jul 2026 21:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784496933; cv=none; b=PFhEo7n4SzfPMQfNWvYRaqoxD9duPDgzaZeIfWEYJmxRaoMqSCPla4h1Z/vGKdAYOeXjp34o19CvFZpJYTlZ6xUzXsO0rkltCNuIO1o5aDkPTUJCeLu0b+N7Y1coJQTsUeKHqHc2EEiexpNwZdulr4AH9k/jrN/mOg/edBYIz+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784496933; c=relaxed/simple;
	bh=LOZAf4gzbHZAMF5+nb80HdCvN9xQpuayGHr4MIJ8L4M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qgPzm2l08SJ95vsMkOeW9Lyh6xDjtcYxAKTV14CXcusKDYkENrJEGMIx6URGbo2JGMmEd5wj10sgL7MleUmDPAKiNkaWQjoGR8oHU//REFIubpl/NaOMGGf4JtW27pR85oKeMJVChfzMx3MZNOH3XvMScEKmUs4x+P5vx/7U5sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGdEYnXd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGdEYnXd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D12661F000E9;
	Sun, 19 Jul 2026 21:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784496931;
	bh=UTCI6KwmV4uy+DIYghH0ujWWhoionoXmbWvlUtDNWHE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oGdEYnXd02go/VA5CnV2AhmJYILBUsXxlBKIEMqnQvuMJwvJX8/cxcM3nm8/WZ36T
	 Q1pd7fMehuh0iTWCAZUP/qRDprGTZQ8/7ReL88TIcozq41yv5Gvy97qMKxIS7iOJHl
	 tm4ZVCw29IALKUGf96zZMrNChKeVJ7YJc57GiWSAyLrBAEV55x7asNgc0pfF20qfX6
	 uaVz3zRj+5pkL8zw9bQ9iDoB+q5hJ9E0XJqQA5c+XAtAT7ZzVArsPYy/6ws5SXQxQd
	 P9i458JKDeXey1rnnytXAniI84+r98KffM01ztJJtwxKsXO4EsY8jyIF69NU9E1Nph
	 fdrXyuMz3/R7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/4] clk: sunxi-ng: sun55i-a523: reparent GPU while
 pll-gpu changes rate
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SnVhbiBNYW51ZWwgTMOzcGV6IENhcnJpbGxv?= <juanmanuellopezcarrillo@gmail.com>
Cc: linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260719211319.982285-4-juanmanuellopezcarrillo@gmail.com>
References: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
 <20260719211319.982285-4-juanmanuellopezcarrillo@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 21:35:30 +0000
Message-Id: <20260719213530.D12661F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] The `pll_gpu_clk` retains the `CLK_SET_RATE_GATE` flag, which comp=
letely prevents the intended dynamic rate changes while the GPU is active.
- [High] Missing `clk_notifier_unregister()` on driver unbind/module unload=
 leads to a Use-After-Free.
- [Medium] The return value of `ccu_mux_notifier_register()` is silently ig=
nored.

Pre-existing issues:
- [High] Unhandled `ABORT_RATE_CHANGE` event in the mux notifier callback p=
ermanently parks the GPU on the bypass clock.
- [Medium] Out-of-bounds array read on `gpu_mux_table` via `ccu_mux_helper_=
set_parent()`.
--

--- Patch [3]: [PATCH v1 3/4] clk: sunxi-ng: sun55i-a523: reparent GPU whil=
e pll-gpu changes rate ---
commit faed0fa03ac4f89885fa0cb42878fa743f6eb4a4
Author: Juan Manuel L=C3=B3pez Carrillo <juanmanuellopezcarrillo@gmail.com>

clk: sunxi-ng: sun55i-a523: reparent GPU while pll-gpu changes rate

This commit registers a mux notifier on pll-gpu to park the GPU mod clock
on a fixed output while the PLL is being reprogrammed. This is intended to
allow glitch-free rate changes for higher speed-bin operating points.

> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-n=
g/ccu-sun55i-a523.c
> index 979e53e635228..4341eb66c0b75 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c

[ ... ]

> @@ -1698,6 +1709,10 @@ static int sun55i_a523_ccu_probe(struct platform_d=
evice *pdev)
>  	if (ret)
>  		return ret;
> =20
> +	/* Reparent the GPU during pll-gpu rate changes */
> +	ccu_mux_notifier_register(pll_gpu_clk.common.hw.clk,
> +				  &sun55i_a523_gpu_nb);
> +

[Severity: High]
Does pll_gpu_clk still have the CLK_SET_RATE_GATE flag set?

Looking at drivers/clk/sunxi-ng/ccu-sun55i-a523.c, pll_gpu_clk is defined
with:

    .hw.init =3D CLK_HW_INIT_PARENTS_DATA("pll-gpu", osc24M,
                                        &ccu_nkmp_ops,
                                        CLK_SET_RATE_GATE),

The core clock framework enforces this in clk_core_set_rate_nolock():

    if (clk_core_rate_is_protected(core))
        return -EBUSY;

If the GPU driver calls clk_set_rate() while the clock is active, will the
core framework return -EBUSY and prevent the rate change from happening,
rendering this new notifier unused?

[Severity: Medium]
What happens if ccu_mux_notifier_register fails and returns an error?

If there is a low memory condition and clk_notifier_register returns
-ENOMEM, the registration will fail but the probe continues. Will this
leave the GPU clock without the mandatory glitch-free bypass protection
during rate changes?

[Severity: High]
Is it possible this introduces a use-after-free during module unload?

sun55i_a523_ccu_driver does not appear to have a .remove callback to
unregister this notifier.

If the module is unloaded (e.g. via rmmod), the statically allocated
sun55i_a523_gpu_nb is freed. If a clock rate change occurs on pll-gpu
afterwards, or if the global clock notifier list is traversed, could this
crash the system?

[Severity: High]
This is a pre-existing issue, but how does the notifier handle an aborted
rate change?

In drivers/clk/sunxi-ng/ccu_mux.c, ccu_mux_notifier_cb only handles
PRE_RATE_CHANGE and POST_RATE_CHANGE:

    if (event =3D=3D PRE_RATE_CHANGE) {
        ...
    } else if (event =3D=3D POST_RATE_CHANGE) {
        ...

If a clock rate change fails downstream after PRE_RATE_CHANGE, the core
emits ABORT_RATE_CHANGE. Since this event is dropped, will the GPU clock
remain permanently stuck at the bypass rate of 600MHz?

[Severity: Medium]
This is a pre-existing issue, but can ccu_mux_helper_set_parent read out of
bounds during POST_RATE_CHANGE?

If the bootloader leaves the hardware mux register with an unmapped value
like 6 or 7, ccu_mux_helper_get_parent returns this raw index. Later,
during the notifier callback, ccu_mux_helper_set_parent blindly uses it:

    if (cm->table)
        index =3D cm->table[index];

Since gpu_mux_table only has 5 elements:

    static const u8 gpu_mux_table[] =3D { 0, 2, 3, 4, 5 };

Could this result in an out-of-bounds read and write junk back to the
hardware register?

>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719211319.9822=
85-1-juanmanuellopezcarrillo@gmail.com?part=3D3
