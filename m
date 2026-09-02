Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072B03C1D42;
	Wed,  2 Sep 2026 19:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378030; cv=none; b=WtEfR9BQdH+itMtcvOTD+dOT2ipkJ0/d+OUHS+G3j1ePHkpqpZEHBdY3KqY9skuPtQXv3BOgHP+X3eDtHk3zuc9ea9u2byKugkGQEBqTDedAt11nIfaih9N7z4VDw6fJxYnX0AKVA9kYI7t2T9mh/UpioJ9y+c96WmZbkooacIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378030; c=relaxed/simple;
	bh=VyyuVQCI/rOb984BiwgOiMYv4BRqQ45hSL/enPtkhMQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ih0EKCS1ExQyAuYHN7/7I8lln66WbNBv6YShUMAjWhz3jAoPe3mkqU/TSDtgIlISNmEbZzwkovyAlz6dSSF4y8uXxc+tzBPLm4ZIZzGyuX27qnWfUV21YCHWpn4kGq9HAufXUVpqzhzOQiHpuqmvgxJze1OeftV1U6tu4n2x/ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TwvufhD4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TwvufhD4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF2A1F00A3A;
	Wed,  2 Sep 2026 19:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788378009;
	bh=lDtCVhN+BmczVYfnYIRa65ee5EjxZKgCtaWguqGdTlc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TwvufhD4BlEDRysXK+X6uGeioHoTsMJjJFlTilaDZl0e0dWSjSTFmGsJPVttY8LIn
	 AjXAjzgN8XP3vupfoVSHFHsBRhczzoFMhoiBxYl2bWEnK47u5bPhUd5W5hAT5FVGDn
	 AxoqEKvWrqITAOLUGpzn5K4WFuPT6mT/ONlDU/hs4L4oq2Dw20NykIC+HqD5MS0XvH
	 e48uM4XiBcwRyyTdqIDVY0F2qY5QyFndV+bEY4PDIArmDnNdNduOtsHT2uQoA8RmOL
	 Gtpf0Oz2ACusAN5G302HDc9K6TAqzuO1fkhVfzB0Io5q6vYuAIRgpCDJQPvzW3RqMP
	 SHk6WK5gIClNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] mfd: ac200: Add X-Powers AC200 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260902-submit-ac200-mfd-v8-2-2aa06720b8ac@gmail.com>
References: <20260902-submit-ac200-mfd-v8-0-2aa06720b8ac@gmail.com>
 <20260902-submit-ac200-mfd-v8-2-2aa06720b8ac@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 19:40:08 +0000
Message-Id: <20260902194008.8FF2A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unconditional global chip reset in shutdown/remove breaks RTC wake=
, Wake-on-LAN, and live PHY state.
--

commit d8592c963caa9b21487926208ea5815e059be1be
Author: James Hilliard <james.hilliard1@gmail.com>

mfd: ac200: Add X-Powers AC200 support
   =20
This commit adds support for the X-Powers AC200 mixed-signal companion IC.
It enables the shared input clock, initializes the paged regmap, and asserts
a chip reset during probe, driver removal, and system shutdown.

> diff --git a/drivers/mfd/ac200.c b/drivers/mfd/ac200.c
> new file mode 100644
> index 0000000000000..8445a460ef6c2
> --- /dev/null
> +++ b/drivers/mfd/ac200.c

[ ... ]

> +static void ac200_disable(struct regmap *regmap)
> +{
> +	regmap_write(regmap, AC200_SYS_CONTROL_REG, 0);
> +}

[Severity: High]
Does asserting a global chip reset here wipe the hardware state of all
co-packaged functions, including the RTC and Fast Ethernet PHY?

Since ac200_disable() is unconditionally called by ac200_shutdown() and
ac200_remove(), could this kill the PHY and clear the RTC during system
shutdown, breaking Wake-on-LAN and Wake-on-RTC from power-off states?

Furthermore, because the PHY is enumerated separately on the MDIO bus and
only references this MFD via a phandle, will unbinding the AC200 driver at
runtime (via ac200_remove) forcefully reset the PHY hardware out from under
the active MDIO PHY driver and lead to unpredictable network failures?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-submit-ac2=
00-mfd-v8-0-2aa06720b8ac@gmail.com?part=3D2
