Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795641225;
	b=nYJyJt77q5WY/Z57NQiYcoqkDE/V/ANC1HAIgwuuVImwlVuNQuHpjT+dq0jcLCppM95g
	 zLJEYkoHD3O9gIYzHsLq009yKmRFIonFr/XIKezV15VAXsCa5ZvyAPMHtLH4QXAYTDKj1
	 MQEhHZd5NedtFaUfFf6ufHL/Z5iJhjx3c7tgHmkM5evC9m4El5EAJOKuBksMsNFlSDj9a
	 l5HfVr4cLgVa8+v8VxSeIDLL/JJjVjyQWrdF/wQ6HsM/HtUekOwhJJqY06YKjvKwipiUZ
	 4O6QGTMVxdO2Qw5R2KuCSxDK9Dm1rfcPIRsdpthiwGCBfJpd81GexFJHCSB35ACeV+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641225;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4u9RAYDVp6rX5ALdhgzuKv4cfYzF3JOaIyRTtue0IPk=;
	b=I38OpSi/lUy2kKNyc2GcvCGgUCHooj0hLdn3/tGvdr+kYOJOXRYaDd1KWgaz+u6BylMz
	 Xg4sbjHdhAugzegvA3tTUaA2DJofWi1lgaavyzcN0qxQvcJtYyVF8l3sJDdCnMuc4r7RK
	 HVnIPKbLOPcazfV9nDAYMmC17SbkN4aMHoqS0DwucP54UFl/xmZu1b3ulH3jpynoGQ18d
	 1vHZau5Qe/31ZfGdecpFLtByjJHkzw9yxv3KpAL6WbxkPbI+29ro7UK4Rt4ZqTX3WF1j1
	 l/W9yZetwhqOoDmn/t8xla4PcXsMkzIUScpSTGmG95cmHmagB7uWlarLmj4sXUksxYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=xjbMIAoc;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD931606A337
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 21:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD931606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=xjbMIAoc
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id E86814C968;
	Thu, 26 Nov 2026 08:13:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795641216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4u9RAYDVp6rX5ALdhgzuKv4cfYzF3JOaIyRTtue0IPk=;
	b=xjbMIAocDTV3YlEWwmesCm6mwYgKxmNkRHIkdpUJz/FgcyIVa2/6o5Hx+yUx0rbdIWkAml
	qXtU4a5VXVZRF1Tpxb9wjfq27cQQ4KbBko8c7pRT23FtXW46oq7a9kk7NwufY7W8piv40w
	GLyjYQlg8eoFu+phawB0H32tBMozctfHcxcG7FvvbMYR/zHnUvH18CMhgwPx52RvAjPisZ
	ifVlItTADrDQ0s56SlA8v3/erq9yuQsnXnW30rDB7q3SR9BJ+gS9GM6Cm+o3m0+WL6Z8Bl
	ldFKDAoO5N8JcixhNnnB9oNxPQJiD/n9Q3gnCqlIs86dzmoTY+4WTHQPhKmnDA==
X-GPT-Reason: legitimate; the message is a personal/professional
	correspondence regarding a technical software patch (Linux kernel/device
	tree) which matches the sender's domain (d-silva.org) and the
	recipient's personal mailbox (alastair@d-silva.org); there are
	no indicators of marketing, phishing, or scam tactics; the content
	is a standard technical reply acknowledging a code review.
From: Alastair D'Silva <alastair@d-silva.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>,
	Alastair D'Silva <alastair@d-silva.org>
Subject: Re: [PATCH 5/5] arm64: dts: allwinner: sun60i-a733-orangepi-4-pro: Enable GMAC0 Ethernet
Date: Thu, 26 Nov 2026 08:13:35 +1100
Message-ID: <20261125211335.719843-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <292b18e4-dbad-42ba-9f1f-cfbe2af52148@lunn.ch>
References: <20261125130613.4191841-1-alastair@d-silva.org> <20261125130613.4191841-6-alastair@d-silva.org> <292b18e4-dbad-42ba-9f1f-cfbe2af52148@lunn.ch>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andrew,

Thank you for the review on this series (and for the nitpick on patch 3,
which I will fix in v2).

On Wed, Nov 25, 2026 at 06:30:24PM +0100, Andrew Lunn wrote:
> https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287
>
> phy-mode describes the PCB. If the PCB has no delays, rgmii-id should
> be used.
>
> The MAC/PHY pair need to decide which of the two add the delays. This
> is not decided by phy-mode.
>
> 3780 ps is also huge, much greater than the 2ns required by the
> standard. It suggests something else is going on, maybe a clock is
> inverted? Please investigate.

Your suspicion about an inverted RX clock was spot-on.

Checking Allwinner's BSP glue header, BIT(4) of the GMAC210 glue
register (0x04508000) is ERXIE (RX clock invert, ~4 ns / 180 degrees
at 125 MHz) and BIT(3) is ETXIE (TX clock invert). Testing on the
Orange Pi 4 Pro confirmed:

- With phy-mode = "rgmii" (0 PHY delays) and ERXIE = 0, RX works
  across ERXDC = 12..24 (2160..4320 ps, where 3780 ps sat).
- With phy-mode = "rgmii" and ERXIE = 1, RX works at ERXDC = 0..6
  (0..1080 ps), confirming the ~4 ns RX clock inversion.
- With phy-mode = "rgmii-id" (YT8531 PHY adding ~1950 ps TX and RX):
  - TX works with 0 ps MAC delay (tx-internal-delay-ps omitted).
  - RX with ERXIE = 0 works across ERXDC = 8..16 (1440..2880 ps,
    centered at 2160 ps), giving 936 Mbits/sec TCP RX and 723 Mbits/sec
    TCP TX in iperf3.
  - RX with ERXIE = 1 fails across ERXDC = 0..24 because 4 ns (ERXIE)
    + 1.95 ns (PHY) overshoots the valid window.

For v2, I will switch the board DTS to phy-mode = "rgmii-id" and drop
tx-internal-delay-ps so the YT8531 PHY provides the standard ~2 ns
delays, while keeping ERXIE = 0 and setting rx-internal-delay-ps = <2160>
to compensate for the RX clock phase (matching existing dwmac-sun55i
boards).

Thanks,
Alastair
