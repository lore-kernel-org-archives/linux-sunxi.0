Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795674852;
	b=v6NhC7ulN/fyiXS4mMoCGbleLAxD/GZ7hjoDgqAPwC9TwXEUg17h4v948mxPHUqkEuLA
	 AMscwbJ4qblaAXaybxonMJTQrjhZmtVeZGLnWSvFMyoSc9L9zsM8h+vFhR+Ib94/zfyGB
	 /E9SsvZdMqpiQb2gufrFzwoclLEc6FMBo/ubwlSc0kmHV3si64rsmy8bFsKs5Xu+MeDIJ
	 yzmGkHpsZkyx/dEfAZEW9Emad53fk62+Lx3W5rNvy95AvrJHqvnei0sUM63XYZbkgNfe1
	 pWF8sjqQyUIU0DuzGWGjME1edYN+yizds9heeZsbd0pdYQIjBFJ/+6Jy0TNbDrM19uA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674852;
	h=DMARC-Filter:DKIM-Signature:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:Cc:X-Mailer:References:In-Reply-To:X-ZohoMailClient;
	bh=NqJyxkyyF1EsKV7v+Tv9BOg2FJudE4UDZ7G53p9UBJo=;
	b=0ceVrjVlqGssjM4SamXQxrOOvH3Q8cIsTY1+/iZqnmv02H8WINi7etGSc+tH7+eDoQYW
	 08pVkOQVX2jsO58W7Gl1cNUBq+y5Ydv4rsOJGENJz9BIv2DadU9b9YerxuR1eE493i/Ua
	 iYWIVHwqC0wQ0YWkddSKVOK37mzkU1cFl1NRIchH9y6hEQJbuQZOOtxI+v4G4QLsfQSSn
	 4yvr2optegdrR5X/rpXWsD+ac3pf73chzaiUmLL0KiUPJLY/8q1xNm5qAbyV78vJ3ns6M
	 iIcNuYTltzS2T9SgOf7w3o/LcoAFuO5tmAHAuE2Fm2UUgVbfisjVJWeus/FOxd/bY7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pigmoral.tech;
	spf=pass smtp.mailfrom=pigmoral.tech;
	dkim=pass header.d=pigmoral.tech header.i=@pigmoral.tech header.a=rsa-sha256 header.s=zmail header.b=KZCIsc4c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.15
Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBB2606A31C
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 06:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BBB2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=pigmoral.tech header.i=@pigmoral.tech header.a=rsa-sha256 header.s=zmail header.b=KZCIsc4c
ARC-Seal: i=1; a=rsa-sha256; t=1795674826; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZQvfHIW1p7x8TG0WrjfAXdkqZsXvdtX6h/tHO84gGwweCk7FdgZY0VAsEb9+K69id4KDDbRByhI13FX+PVF0F4DYAIoXM9NccLR74dMeersTm2vOaJJyUrILHvqXT8M0s9h3Jbsm1glok/FNswImy1OSwDsezaXQwkx9ESSYce4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795674826; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NqJyxkyyF1EsKV7v+Tv9BOg2FJudE4UDZ7G53p9UBJo=; 
	b=NAIY+LYjEN+rweT8lCfaKbiVYn+uEZfd5Zwr/AdWNykhBq0yFAuJTHIyVeQMQV9BJ7vjY7Rxp5H0ZSkZbmDLQXk84PYlKRkbuBVJxW4ISVcLR8zSem3b2eJka83BJwPw76fXopgMMKoDbGDH+WQkD1EcqZt+EYQw+penQaBilXs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: a=rsa-sha256; b=KZCIsc4cdj6dVf/CubnCkDLGwAcGFTVU4PYw7PshqS4Va8YmA36ILwb2hvo4/sRmg0D5c7bc9Kqbrulaku+JiVdnSgoUSJJnimk/YjAEl0q8l2CleNJXwTy2hPs6OfIyvNf8b31lnXUnTIyS5hgkoTDYZy3pWVz1m5t4KRh6aLI=; c=relaxed/relaxed; s=zmail; d=pigmoral.tech; v=1; bh=NqJyxkyyF1EsKV7v+Tv9BOg2FJudE4UDZ7G53p9UBJo=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795674823263416.48353135502407;
	Wed, 25 Nov 2026 22:33:43 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 14:33:33 +0800
Message-Id: <DN4XLH7YJ13T.3O62DYGNJ67FQ@pigmoral.tech>
Subject: Re: [PATCH 0/5] net: stmmac: dwmac-sun55i: Add Allwinner A733
 GMAC210 support
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Alastair D'Silva" <alastair@d-silva.org>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-sunxi@lists.linux.dev>
Cc: <linux-kernel@vger.kernel.org>, "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Chen-Yu Tsai"
 <wens@kernel.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel
 Holland" <samuel@sholland.org>, "Maxime Chevallier"
 <maxime.chevallier@bootlin.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Jerome Brunet" <jbrunet@baylibre.com>
X-Mailer: aerc 0.22.0
References: <20261125130613.4191841-1-alastair@d-silva.org>
In-Reply-To: <20261125130613.4191841-1-alastair@d-silva.org>
X-ZohoMailClient: External

Hi Alastair,

On Wed Nov 25, 2026 at 9:06 PM CST, Alastair D'Silva wrote:
> This series enables Gigabit Ethernet (GMAC0) on the Allwinner A733 SoC
> and the Xunlong Orange Pi 4 Pro board.
>
> The goal is working 1000BASE-T RGMII Ethernet with mainline drivers and
> bindings. Tested on the Orange Pi 4 Pro with a YT8531 PHY (DHCP, ping,
> and iperf3 at 1Gbps/Full).
>
> Dependencies:
> This series depends on the Allwinner A733 SoC and OrangePi 4 Pro core
> bring-up series:
>   Based-on: <20261125124407.4098345-1-alastair@d-silva.org>
>
> Alastair D'Silva (5):
>   dt-bindings: net: allwinner,sun8i-a83t-emac: Add Allwinner A733
>     GMAC210
>   net: stmmac: dwmac-sun55i: Add per-compatible match data
>   net: stmmac: dwmac-sun55i: Add Allwinner A733 GMAC210 support
>   arm64: dts: allwinner: sun60i-a733: Add GMAC0 node
>   arm64: dts: allwinner: sun60i-a733-orangepi-4-pro: Enable GMAC0
>     Ethernet
>
>  .../net/allwinner,sun8i-a83t-emac.yaml        | 136 ++++++++++-
>  .../allwinner/sun60i-a733-orangepi-4-pro.dts  |  28 +++
>  .../arm64/boot/dts/allwinner/sun60i-a733.dtsi |  41 ++++
>  .../ethernet/stmicro/stmmac/dwmac-sun55i.c    | 230 +++++++++++++++---
>  4 files changed, 389 insertions(+), 46 deletions(-)

There is already a series [1] posted adding A733 GMAC210 support.
Did you check that?

I think it would be better to add Ethernet support for Orange Pi 4 Pro
based on that series.

[1] https://lore.kernel.org/all/20260923-allwinner-a733-gmac-support-v3-0-1=
5735155a789@baylibre.com/

--=20
Best regards,
Junhui Liu

