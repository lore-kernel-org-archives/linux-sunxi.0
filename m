Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52104279917;
	Fri,  3 Jul 2026 15:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092819; cv=none; b=mqp811NjKKiXVdW98MBmpOVnJfLHDokep7bIQW/gKeVW3aZcgoHt+J9bnb95ykvhO2Wwq1s62InSx010XlME6ZHkWNLLxl1C5qKGdJ/PCXsQDo2ss8hHy41BHbX8VU97GyUfXv9qE0bQz+ZBl0xKSOLvuP/TnsL5R1nYehKoqu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092819; c=relaxed/simple;
	bh=Kqx9wUCFM9/qBWSQCRYrQ/6Nmh3G78kJwf4apec+VQY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rPyw20i5LvXGzUVUs9rDjW2K4L46gJUs+PWG5bvKYy8/TEg/kEeiRb4NxjDDtg79dZWqnPVP7AGwhd8PFMgwaLtI50Mvwm+bn095YBW2mBrTwFE27cpHispS7NU/SfbTadGnZgKhfkXlner8Udkwycw0B0XRH7yHDkJXMWj8oEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c2Q8yKTb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c2Q8yKTb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5AFF1F000E9;
	Fri,  3 Jul 2026 15:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783092818;
	bh=EP6db0OmqHcY3WIp3R5BB2pZGmx1sQSCAis9bZ4x3vs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c2Q8yKTbdY2TItKN6Mko/CZCOuS/WWais9AY2lx7eyRMpCQ3R0Ivna3koCmkqflGd
	 lldPHrloQssSZnZcodixz0aXiFiFYNUKHDJLSaC41k0zmJxkw9g6pz/zbkBN+lP+QZ
	 2Z1XdX9oJGoQdNv7Y0d3oe0pVuaxWTkJMj/IuzxuqdgmwJKULMv8BD0zcqmktHMQgC
	 UfBFy7CwIOyE6Vl2uS8VhiNC9EOPUgEzz1xhiiAjH/nxmbCaADK3Xvp6iHD6siZu6q
	 HHv4Q60/NslYV0hZg4dnEoGThHvhypRPW2oJvR0XfIkMhgHshURi+9MF7Ooo4Hxr9Y
	 ascqc5CNpohww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/4] pwm: sun8i: Add H616 PWM support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Genoud" <richard.genoud@bootlin.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260703152215.192859-3-richard.genoud@bootlin.com>
References: <20260703152215.192859-1-richard.genoud@bootlin.com>
 <20260703152215.192859-3-richard.genoud@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 15:33:37 +0000
Message-Id: <20260703153337.B5AFF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] Insufficient memory is allocated for the `parent_names` array, cau=
sing a heap buffer overflow when the clock has multiple parents.
- [High] The driver mutates statically allocated global clock templates dur=
ing probe, causing MMIO address corruption and Use-After-Free.
- [High] Computed PWM duty cycle suffers from integer truncation, resulting=
 in a 0% duty cycle when 100% is requested at the maximum period.
- [High] Composite clocks manually registered during probe are leaked on er=
ror paths.
- [High] The driver registers clocks with the CCF before deasserting the ha=
rdware reset control, risking MMIO accesses to a reset block.
- [High] Error in `sun8i_pwm_request` leaks channel state, and `sun8i_pwm_f=
ree` has a data race.
- [High] Direct hardware modification inside the clock framework's `of_xlat=
e` callback.
- [High] Missing error check for `clk_round_rate()` return value assigned t=
o an unsigned variable.
- [High] Shared parent clock rate can be arbitrarily modified by sibling ch=
annels, disrupting active waveforms.
--

commit 0552ac994a2720884880e2f7a90a1ceb9b7e36e6
Author: Richard Genoud <richard.genoud@bootlin.com>

pwm: sun8i: Add H616 PWM support
   =20
Add driver for Allwinner H616 PWM controller, supporting up to 6
channels.
Those channels output can be either a PWM signal output or a clock
output, thanks to the bypass.

[ ... ]

> diff --git a/drivers/pwm/pwm-sun8i.c b/drivers/pwm/pwm-sun8i.c
> new file mode 100644
> index 0000000000000..8f1023e3a2e5a
> --- /dev/null
> +++ b/drivers/pwm/pwm-sun8i.c
> @@ -0,0 +1,938 @@

[ ... ]

> +static int sun8i_pwm_request(struct pwm_chip *chip, struct pwm_device *p=
wm)
> +{
> +	struct sun8i_pwm_chip *sun8i_chip =3D sun8i_pwm_from_chip(chip);
> +	struct sun8i_pwm_channel *chan =3D &sun8i_chip->channels[pwm->hwpwm];
> +
> +	scoped_guard(spinlock_irqsave, &sun8i_chip->clk_pdata->lock) {
> +		if (chan->mode =3D=3D SUN8I_PWM_MODE_CLK)
> +			return -EBUSY;
> +		chan->mode =3D SUN8I_PWM_MODE_PWM;
> +	}
> +
> +	return clk_prepare_enable(chan->pwm_clk);
> +}

[Severity: High]
If clk_prepare_enable() fails and returns an error, does this leave the
channel permanently marked as SUN8I_PWM_MODE_PWM? This could prevent future
use of the channel.

> +static void sun8i_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
> +{
> +	struct sun8i_pwm_chip *sun8i_chip =3D sun8i_pwm_from_chip(chip);
> +	struct sun8i_pwm_channel *chan =3D &sun8i_chip->channels[pwm->hwpwm];
> +
> +	clk_disable_unprepare(chan->pwm_clk);
> +	chan->mode =3D SUN8I_PWM_MODE_NONE;
> +}

[Severity: High]
Is there a data race here?

The chan->mode state is modified without holding clk_pdata->lock, but it is=
=20
read and written concurrently under the lock in sun8i_pwm_request() and=20
sun8i_pwm_of_clk_get().

[ ... ]

> +static int sun8i_pwm_write_waveform(struct pwm_chip *chip,
> +				    struct pwm_device *pwm, const void *_wfhw)
> +{
> +	const struct sun8i_pwm_waveform *wfhw =3D _wfhw;
> +	struct sun8i_pwm_chip *sun8i_chip =3D sun8i_pwm_from_chip(chip);
> +	struct sun8i_pwm_channel *chan =3D &sun8i_chip->channels[pwm->hwpwm];
> +	unsigned long flags;
> +	u32 val;
> +	int ret;
> +
> +	ret =3D clk_set_rate(chan->pwm_clk, wfhw->clk_rate);
> +	if (ret)
> +		return ret;

[Severity: High]
Since the channel clocks are registered with the CLK_SET_RATE_PARENT flag,
they share paired parent clocks. If clk_set_rate() changes the frequency of
the shared parent to satisfy this request, will it transparently corrupt the
active PWM waveform output of the sibling channel?

[ ... ]

> +static int sun8i_pwm_round_waveform_tohw(struct pwm_chip *chip,
> +					 struct pwm_device *pwm,
> +					 const struct pwm_waveform *wf,
> +					 void *_wfhw)
> +{

[ ... ]

> +	max_rate =3D clk_round_rate(chan->pwm_clk, U32_MAX);

[Severity: High]
Since clk_round_rate() returns a long that can contain a negative error
code, will assigning it directly to the unsigned long max_rate cause issues=
?=20

If an error is returned, this would cast to a massive unsigned value and
corrupt the subsequent period_ratio calculations.

[ ... ]

> +	wfhw->duty_ticks =3D mul_u64_u64_div_u64(calc_rate, duty_cycle,
> +					       NSEC_PER_SEC);
> +
> +	if (wfhw->duty_ticks > wfhw->period_ticks)
> +		wfhw->duty_ticks =3D wfhw->period_ticks;

[Severity: High]
Does this calculation suffer from integer truncation?

The wfhw->duty_ticks field is declared as a u16. If the period is at its
maximum (65536) and a 100% duty cycle is requested, the 64-bit calculation
yields 65536. When assigned to the u16 field, this will silently truncate
to 0.

The subsequent bounds check:
    if (wfhw->duty_ticks > wfhw->period_ticks)

would evaluate as 0 > 65536, which is false, resulting in the hardware
being programmed with a 0% duty cycle instead of 100%.

[ ... ]

> +static struct clk_hw *sun8i_pwm_of_clk_get(struct of_phandle_args *clksp=
ec,
> +					   void *data)
> +{

[ ... ]

> +	if (IS_ERR(ret_clk))
> +		goto out;
> +
> +	sun8i_pwm_set_bypass(sun8i_chip, idx, true);
> +out:
> +	return ret_clk;
> +}

[Severity: High]
Is it safe to directly mutate hardware registers via sun8i_pwm_set_bypass()
inside the clock framework's translation callback?

Clock translation can happen speculatively or multiple times (for example,
when a client driver defers probe). Mutating hardware state during
translation bypasses standard clock lifecycle semantics (prepare/enable)
and might leave the hardware in an unexpected state if the translation
doesn't proceed to activation.

[ ... ]

> +static int sun8i_add_composite_clk(struct clk_pwm_data *data,
> +				   void __iomem *reg, spinlock_t *lock,
> +				   struct device *dev, struct clk_hw **hw)
> +{
> +	const struct clk_ops *mux_ops =3D NULL, *gate_ops =3D NULL, *rate_ops =
=3D NULL;
> +	struct clk_hw *mux_hw =3D NULL, *gate_hw =3D NULL, *rate_hw =3D NULL;
> +	struct device_node *node =3D dev->of_node;
> +
> +	if (data->mux_hw) {
> +		struct clk_mux *mux;
> +
> +		mux_hw =3D data->mux_hw;
> +		mux =3D to_clk_mux(mux_hw);
> +		mux->lock =3D lock;
> +		mux_ops =3D mux_hw->init->ops;
> +		mux->reg =3D (uintptr_t)mux->reg + reg;
> +	}

[Severity: High]
Does this code mutate statically allocated global clock templates during pr=
obe?

The pwmcc_data array and its referenced clock component objects (like
mux_xy_01) are globally static. Modifying these instances with per-device
state (such as adding the current MMIO base via mux->reg) means if the
driver probes multiple instances, or unbinds and rebounds, the global MMIO
pointers will be offset multiple times, leading to bad memory accesses.

[ ... ]

> +	/*
> +	 * Retrieve the parent clock names from DTS for pwm-clk-srcxy
> +	 */
> +	if (!data->parent_names) {
> +		data->num_parents =3D of_clk_get_parent_count(node);
> +		if (data->num_parents =3D=3D 0)
> +			return -ENOENT;
> +
> +		data->parent_names =3D devm_kzalloc(dev,
> +						  sizeof(*data->parent_names),
> +						  GFP_KERNEL);
> +		for (unsigned int i =3D 0; i < data->num_parents; i++)
> +			data->parent_names[i] =3D of_clk_get_parent_name(node, i);
> +	}

[Severity: High]
Is there a heap buffer overflow here if the device tree specifies multiple
clocks?

The allocation size is sizeof(*data->parent_names), which evaluates to the
size of a single pointer (8 bytes on 64-bit systems). However, the loop
writes data->num_parents pointers into this allocation.=20

Also, as mentioned above, modifying data->parent_names mutates the static
global template. If the device unbinds and rebounds, data->parent_names
will hold a dangling pointer to freed devm memory, leading to a
use-after-free on the next probe.

[ ... ]

> +static int sun8i_pwm_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	ret =3D sun8i_pwm_init_clocks(pdev, sun8i_chip);
> +	if (ret)
> +		return ret;
> +
> +	for (unsigned int i =3D 0; i < data->npwm; i++) {
> +		struct sun8i_pwm_channel *chan =3D &sun8i_chip->channels[i];
> +		struct clk_hw **hw =3D &sun8i_chip->clk_pdata->hw_data->hws[i];
> +
> +		chan->pwm_clk =3D devm_clk_hw_get_clk(dev, *hw, NULL);
> +		if (IS_ERR(chan->pwm_clk)) {
> +			ret =3D dev_err_probe(dev, PTR_ERR(chan->pwm_clk),
> +					    "Failed to register PWM clock %d\n", i);
> +			return ret;
> +		}
> +		chan->mode =3D SUN8I_PWM_MODE_NONE;
> +	}
> +
> +	ret =3D devm_of_clk_add_hw_provider(dev, sun8i_pwm_of_clk_get, sun8i_ch=
ip);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add HW clock provider\n");
> +
> +	ret =3D devm_add_action_or_reset(dev, sun8i_pwm_unregister_clk,
> +				       sun8i_chip->clk_pdata->hw_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add devm action\n");

[Severity: High]
Are the composite clocks leaked on early return paths?

sun8i_pwm_init_clocks() manually registers clock objects with the CCF, but
the teardown action (sun8i_pwm_unregister_clk) is only hooked up to devres
much later. If an error occurs in the interim (like devm_clk_hw_get_clk()
or devm_of_clk_add_hw_provider() failing), the probe routine returns early
and the registered clocks are permanently leaked into the CCF.

> +	/* Deassert reset */
> +	sun8i_chip->rst =3D devm_reset_control_get_shared_deasserted(dev, NULL);
> +	if (IS_ERR(sun8i_chip->rst))
> +		return dev_err_probe(dev, PTR_ERR(sun8i_chip->rst),
> +				     "Failed to get reset control\n");

[Severity: High]
Is it safe to register the clocks with the CCF before deasserting the
hardware reset control?

The CCF may read hardware registers immediately upon registration to query
clock parents or rates. Accessing a peripheral's MMIO space while it is
held in reset can cause synchronous external aborts, bus stalls, or kernel
panics.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703152215.1928=
59-1-richard.genoud@bootlin.com?part=3D2
