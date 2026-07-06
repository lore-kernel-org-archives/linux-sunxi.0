Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C5041DEE9
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jul 2026 09:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331506; cv=none; b=jrX3SrJrUMMivNG2d5T+039Rz7f1LFVehGjokABK5MKpkOiA4vV8dez4i0A6IqnulbXERp6Gd7KRODYw8wdaHIVdAl3ojj3e7WBWsryPaeQgwzUfqRnfQg/zhJnl0kd/4fIpi6zj1GQQDxdq8unTUS4xrCl3/8EDtSJSUYhqtQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331506; c=relaxed/simple;
	bh=LqGj85hX4VLY6rwcZ9tS01zr1pN6tmMDjCdx98c9xwc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lE2MQhqJ5jX+DyIb79U2WAYukCnlHYRNyit+5RQGGjub4Up5nGM76sxzCNH8htRhGQMNH3bbjcaq8BYTW+SEx3m/2bvqaQ5U9gbHa5OqpnTC1+DBXAizgWZENWSe/AEfL/yPKMWGkYgHr0IyhC6Th97j5rtmp3hIBQtzdnMVq3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVE5z6rj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVE5z6rj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC6A1F000E9;
	Mon,  6 Jul 2026 09:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783331498;
	bh=80SEud9SSc5nJCoaBVMLg2nI39mL2JAnoC0LmxzoV6U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oVE5z6rjQExt9y1NQmCxeVey4T7MnRN8wrEpdbAmu6izBftqpErQNYE1ek89Map3I
	 HJxCN01xL2sPNP3M+EK+5NbP8rei1JiNQGMEYiI1DOtuBkvBx1fMcZLPjcQZo01YGQ
	 zjwStJkEFDE2kGElSD3zhJbv33E2bMxLLQqs/yI2bdXTcL2t+WYu1uMvO05n4N9CVm
	 eHhEsJzvS+k6jzmaJs1fXXnnUjg8aKeUNagBB8Ab4SFb9Rt36nUDhnfZ94JFFe4pfL
	 u1pqxpORstRJYK35d9dHw0WpccDHKHY/QEM4Uex8iIfsR6EYF1oBbb6zO0kD5inOYn
	 FMlwk/espjCtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] phy: allwinner: sun4i-usb: disable the PHY2 PMU clock
 after SIDDQ setup
Reply-To: sashiko-reviews@lists.linux.dev
To: raoxu <raoxu@uniontech.com>
Cc: olteanv@gmail.com, linux-sunxi@lists.linux.dev, vkoul@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <1368E4E3485E881C+20260706093549.867442-1-raoxu@uniontech.com>
References: <1368E4E3485E881C+20260706093549.867442-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 09:51:37 +0000
Message-Id: <20260706095138.3BC6A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Concurrent usage of PHY2 results in hardware malfunction because `=
phy2->reset` is requested as an exclusive reset control.
- [High] The clock and reset teardown order for `phy2` in `sun4i_usb_phy_ex=
it()` is inverted and asymmetric with its initialization.
--

commit 9c33e00d3375b4a5cb06dbdb11bc874c8960fcff
Author: Xu Rao <raoxu@uniontech.com>

phy: allwinner: sun4i-usb: disable the PHY2 PMU clock after SIDDQ setup

This commit fixes a clock accounting imbalance by ensuring the same PHY2
clk2 that was enabled for auxiliary PMU access is correctly disabled,
rather than disabling the current PHY's clk2.

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

[Severity: High]
This is a pre-existing issue, but since this patch deals with PHY2 resource
accounting, does the reset control for PHY2 also have a concurrent usage
issue?

In sun4i_usb_phy_probe(), the reset control is fetched exclusively:

sun4i_usb_phy_probe()
    ...
    phy->reset =3D devm_reset_control_get(dev, name);

Because it is an exclusive reset control, it does not maintain a reference
count for assertions. When multiple PHYs (like PHY0 and PHY1) independently
use PHY2, won't one PHY exiting unconditionally assert phy2->reset and
instantly break the other active PHYs?

sun4i_usb_phy_exit()
    ...
    reset_control_assert(phy2->reset);

[Severity: High]
This is also a pre-existing issue, but the clock and reset teardown order
for phy2 appears inverted in sun4i_usb_phy_exit() compared to how it is
safely initialized here in sun4i_usb_phy_init().

In sun4i_usb_phy_init(), phy2->clk is enabled before phy2->reset is
deasserted. However, in sun4i_usb_phy_exit(), the clock is disabled before
the reset is asserted:

sun4i_usb_phy_exit()
    ...
    clk_disable_unprepare(phy2->clk);
    reset_control_assert(phy2->reset);

Could asserting the reset on an unclocked hardware block leave the PHY2
block in an undefined or stuck state?

> =20
>  	if (phy->pmu && data->cfg->hci_phy_ctl_clear) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/1368E4E3485E881C+20=
260706093549.867442-1-raoxu@uniontech.com?part=3D1
