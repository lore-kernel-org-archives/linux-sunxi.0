Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7FA4028EB;
	Mon, 29 Jun 2026 13:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738776; cv=none; b=Q0TVFEWY2lji1dYpgR4i3rhfwd3pMMtBnMUpXYOYPyhmBNwyMYPb7x990t80Y7LxqA2mvteEu7Hs0PIE7mjJFg+9kULPGVYzOtfcXn9ASNW8IoG8yKTl3uk5DHL3jL8NTwgMtG3y6cJp8ScZe2R3ZDFQXowG3tAcxcMg9N3NKXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738776; c=relaxed/simple;
	bh=74fa101d5VfzDR+NNQbEmtt6IXvUKUOywn4LlStebtQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aL5y7waCvECv3vpq07CRE8HY9CmiffSUAWFnpNy67ZDgv/E+hGX+XhW4sTUWGsW+EpaeuzRXE4eLGvqvX3XuuCIKkshsBNf+XmhfCMGWgxJQBPwOQ8DMcLvok2hPzBoEktwAhlGnwf0qVFqazyoyCZuQ6kf2R8myExtBfi+yMBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZ+gmekl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZ+gmekl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E34C1F00A3A;
	Mon, 29 Jun 2026 13:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782738774;
	bh=NWnmCOCCWpzNnnQvW+0GV3/Zmops9kF59qEyoy47a/w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QZ+gmeklcPL4C4J7w7sfGUYMRrYgr1+/2S+e4JRUQxx2l6sc+q0mLl1f46QSr+nmY
	 vVcE4/qKx+BAuLycg4JT07JJYSo8lQuDilPcMokyLwtxB+M9iZtZNrUsP5YxYjsIad
	 Alz20kN882IRU+AY0aVSQbDtZnWfCZlypagvKrd5MY/V3F878Gaz4BeubkcQZiJzPm
	 f/3ANkUriEl3VMELMnr9MTx7jYssLJ4CqlPdim3YQGXnHVdSlYlmphYdDPQeXShIYq
	 m4Mrt2rxs2NAXR5UBNgem+jt9Ug/zsu+H/EGPNtSu0yXjsEytyOqg6jvaMrlfORgRo
	 V88EYTxLUpvPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] clk: sunxi-ng: sun6i-rtc: split main oscillator
 div and gate.
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: linux-sunxi@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260629-a733-rtc-v2-5-7b72112784f8@baylibre.com>
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
 <20260629-a733-rtc-v2-5-7b72112784f8@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 13:12:54 +0000
Message-Id: <20260629131254.7E34C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the error path i=
n `sunxi_ccu_probe` unregisters clocks using the wrong loop limit, causing =
either memory leaks or out-of-bounds array reads depending on the struct ar=
ray sizes of the specific CCU driver.
--

commit fe4850822f9e2e522aaac703e02ecb786fb47f26
Author: Jerome Brunet <jbrunet@baylibre.com>

clk: sunxi-ng: sun6i-rtc: split main oscillator div and gate.

This commit splits the oscillator divider and gate into two separate clock=
=20
entities to support the A733 SoC. It introduces a new read-only divider=20
based on the oscillator rate to replace the fixed 750 divider.

> diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/=
ccu-sun6i-rtc.c
> index b24c8b196e664..25dd87e78eb7a 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c

[ ... ]

> @@ -286,6 +287,7 @@ static struct clk_hw_onecell_data sun6i_rtc_ccu_hw_cl=
ks =3D {
>  		[CLK_EXT_OSC32K_GATE]	=3D &ext_osc32k_gate_clk.common.hw,
>  		[CLK_OSC24M_32K]	=3D &osc24M_32k_clk.common.hw,
>  		[CLK_RTC_32K]		=3D &rtc_32k_clk.common.hw,
> +		[CLK_OSC24M_32K_DIV]	=3D &osc24M_32k_div_clk.hw,
>  	},
>  };

[Severity: High]
This isn't a bug introduced by this patch, but does adding an extra clock
here expose an issue in the error handling path of sunxi_ccu_probe()?

In drivers/clk/sunxi-ng/ccu_common.c:sunxi_ccu_probe(), the err_clk_unreg
path unregisters clocks using a loop limit that appears incorrect:

err_clk_unreg:
	while (--i >=3D 0) {
		struct clk_hw *hw =3D desc->hw_clks->hws[i];

The variable 'i' incorrectly retains the value of 'desc->num_ccu_clks' from
the preceding loop, rather than using the correct bound 'desc->hw_clks->num=
'.

For drivers where num_ccu_clks < hw_clks->num (such as sun6i-rtc after this
patch), will this skip unregistering the extra clocks if probe fails? And f=
or
drivers where num_ccu_clks > hw_clks->num, could this read past the end of
the hws array?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-a733-rtc-v=
2-0-7b72112784f8@baylibre.com?part=3D5
