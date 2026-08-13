Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD5947A879
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Aug 2026 13:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786627358; cv=none; b=k67lT6XPtVNqwACAgtF+pfhrvD0Ni0TYhvhmsk0kBFaSOf2fDLlXbh3pVfTnjEa8STe8VVA5/gIQJHDhbcV5XJ4adDAQcKKqZTBZUDhpDhTELFjvrSuohLOwtiZxEl6RDtAiacJQmhD7YtsDER0DmoZQkG/6aiU5GKEOH2A4fUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786627358; c=relaxed/simple;
	bh=goW3Jo8FWbRPHypsnEuTVhiLUVBYX8hSplvYTa41r6o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=St+Q08q/cJkyCGxIKzl2eY+2blEyBRtGMJnj83rnS0H3B6FU9Baj2JJ/7ITevvdBiUuYGjb0MOJxuYAurtDEWfPfKfqxPOabcaAMosBBUlnc1Ncu0E4ooMMmrcXKoYGzfAlFvNPCKJehct0JYgO0WdGjmlTgp4CrFpwjn9qpFmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/wzr7b2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/wzr7b2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1B81F000E9;
	Thu, 13 Aug 2026 13:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786627357;
	bh=/eS5IE93h1RF9KAkrqwZ8t3bdYVzHbWDhiw/iJFxM0E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V/wzr7b2rdnaBPl7qHs4kePlgfwCECwV/b5hox0sw/izEHmCr0N+6huAr8t30HrJP
	 E7nRELTDUCHsZGaGswF+VTvVZ9Rs3RnEbpzDEUblOqrnzIeJVoiVVXGqMngxWvC3Cy
	 IYxGBHUexSVOvNI4LE/6/5DGpCfAOcp+cI379KeQNq9/ulBaCWwgn7SO6K+QremLwm
	 DXzCOMSXCYr/kkXqqftafzhURFoM3bNhYheLjNF2duPA1xUGKtvlzUUH4QRZWIFV64
	 1DV+xVb6WL6/g0m1C/L6Xui3lfJ0WEvrKDsTbSr3bFzvUXlflShWC9VshKBv2M1WW/
	 hd1LMV+xsI20Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] phy: allwinner: sun4i-usb: disable the PHY2 PMU
 clock after SIDDQ setup
Reply-To: sashiko-reviews@lists.linux.dev
To: raoxu <raoxu@uniontech.com>
Cc: neil.armstrong@linaro.org, linux-sunxi@lists.linux.dev, olteanv@gmail.com, vkoul@kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <CE85F490F5646A2C+20260813130542.2425068-1-raoxu@uniontech.com>
References: <CE85F490F5646A2C+20260813130542.2425068-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 13:22:36 +0000
Message-Id: <20260813132236.AB1B81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Exclusive reset `phy2->reset` is forcefully asserted on exit, brea=
king other concurrently active PHYs that rely on the shared PHY2 hardware.
- [Medium] Incorrect teardown order for `phy2` in `sun4i_usb_phy_exit()` di=
sables the clock before asserting the reset.
--

--- Patch [1]: [PATCH v2] phy: allwinner: sun4i-usb: disable the PHY2 PMU c=
lock after SIDDQ setup ---
commit c3b10e6864aadde53d10b7e0b2a5fcb7d0d76e08
Author: Xu Rao <raoxu@uniontech.com>
Subject: phy: allwinner: sun4i-usb: disable the PHY2 PMU clock after SIDDQ =
setup

This patch fixes a clock enable leak in sun4i_usb_phy_init() by properly
disabling PHY2's clk2 instead of the currently initialized PHY's clk2. It
corrects an unmatched clk_prepare_enable() for the auxiliary PMU access.

> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinne=
r/phy-sun4i-usb.c
> index e2fbf8ccf99e1..839856c09e305 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -318,7 +318,7 @@ static int sun4i_usb_phy_init(struct phy *_phy)
>  			writel(val, phy2->pmu + REG_HCI_PHY_CTL);
>  		}
> =20
> -		clk_disable_unprepare(phy->clk2);
> +		clk_disable_unprepare(phy2->clk2);
>  	}
> =20
>  	if (phy->pmu && data->cfg->hci_phy_ctl_clear) {

[Severity: Medium]
This isn't a bug introduced by this patch, but looking at how PHY2 is torn
down later in sun4i_usb_phy_exit():

drivers/phy/allwinner/phy-sun4i-usb.c:sun4i_usb_phy_exit() {
	if (data->cfg->needs_phy2_siddq && phy->index !=3D 2) {
		struct sun4i_usb_phy *phy2 =3D &data->phys[2];

		clk_disable_unprepare(phy2->clk);
		reset_control_assert(phy2->reset);
	}
[ ... ]
}

Is the clock and reset teardown order correct here?

The teardown order disables the clock before asserting the reset, which
reverses the initialization order.

Asserting a hardware reset without the IP block's clock running can sometim=
es
fail to propagate the reset state or cause a bus lockup.

[Severity: High]
This is also a pre-existing issue, but does asserting this shared
phy2->reset line on exit break other concurrently active PHYs that rely on
PHY2?

Because phy->reset is requested in sun4i_usb_phy_probe() as an exclusive
reset:

drivers/phy/allwinner/phy-sun4i-usb.c:sun4i_usb_phy_probe() {
[ ... ]
		snprintf(name, sizeof(name), "usb%d_reset", i);
		phy->reset =3D devm_reset_control_get(dev, name);
[ ... ]
}

The reset framework won't refcount it, so unconditionally calling
reset_control_assert(phy2->reset) will force the hardware line into reset
immediately.

This could tear down the shared hardware resource regardless of other active
PHYs using it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/CE85F490F5646A2C+20=
260813130542.2425068-1-raoxu@uniontech.com?part=3D1
