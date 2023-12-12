Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E99F81E51
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Dec 2023 19:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="o7P1qpVJ"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id E464024002D
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Dec 2023 20:27:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1702409244; bh=Fl6wWVfLLuK3aQj8q6nx+95p5nnzO8WTVvVWB4QYR/4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Disposition:From;
	b=o7P1qpVJg2/q2FVr7aQdpSrMzn8ljBmUhAgYHOjH6Z8qFqEPibBfH5X7Of+RbuKbp
	 1orl3zWoAgOu93WJaEgsmp4xAkIfYzjVTzMObpFUicW69Z1vooU+yZ+2hL+ix1rZFQ
	 H516eYZPRZhgRVGPojC8A43KqX+34D+xTFVqcG/KhyQh1ErTOT0jNXQ0vJp6oSK/gZ
	 d1i273RqE9LWcn0UDgCmXpt1ONQsap6n8m0C1cGTJD8YqNVrSrg28vm96OPtzn0nEh
	 ZXLQ/G+maa4GRBWg3Mg8m5r/iuctj92ouzdPDr0YzVDzjQm3yQlJyQ72AZKVXg3CoQ
	 a8sHD3xjcnnvw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4SqTCB3Qm6z6txZ;
	Tue, 12 Dec 2023 20:27:18 +0100 (CET)
Date: Tue, 12 Dec 2023 19:27:14 +0000
From: Anne Macedo <retpolanne@posteo.net>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: allwinner: Orange Pi One Plus PHY support
Message-ID: <axsvii25yrknfae6gdreti7lcskoscsdbsujwuispiieimsbdy@gwzm4l7mwlew>
References: <20231212122835.10850-2-retpolanne@posteo.net>
 <20231212162200.10b3868b@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212162200.10b3868b@donnerap.manchester.arm.com>

On Tue, Dec 12, 2023 at 04:22:00PM +0000, Andre Przywara wrote:
> On Tue, 12 Dec 2023 12:28:30 +0000
> Anne Macedo <retpolanne@posteo.net> wrote:
> 
> Hi Anne,
> 
> > Adds compatible values to mdio subnodes for Ethernet PHY representing
> > Realtek 8211 PHY to Orange Pi One Plus.
> 
> So can you state why this would be needed? This is the RTL8211 ID,

Apologies, I completely forgot to include some context. 

> right? Which should be autodetected via MDIO. Looking back in my inbox
> you proposed this change before, for U-Boot, specifically, but I fail to
> find a solution or explanation what really happens here. Two Renesas .dts
> files have the same compatible, and the commit message talks about the
> reset line there, is this related?
> 
> So can you please give some more background and explanation? That would be
> part of a good commit message anyway ("why", not "what").

Should I resend the commit with a more meaningful explanation? The
context is the following:

currently, ethernet doesn't seem to work on both u-boot and Linux on the
Orange Pi One Plus board. 

On the kernel, this error shows up:

Configuring network interfaces... [    5.992589] dwmac-sun8i 5020000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
[    6.000823] dwmac-sun8i 5020000.ethernet eth0: __stmmac_open: Cannot attach to PHY (error: -19)

After applying this fix, the PHY gets attached: 

Configuring network interfaces... [    6.060020] dwmac-sun8i 5020000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
[    6.069460] dwmac-sun8i 5020000.ethernet eth0: PHY [stmmac-0:01] driver [RTL8211E Gigabit Ethernet] (irq=POLL)

The previous compatible list that had ethernet-phy-ieee802.3-c22 fails
to find a PHY, so this patch includes the correct PHY ID with the
RTL8211 ID. 

The behaviour is described on [1]. U-boot fails completely if the
correct PHY ID is not correct, and in order to fix U-boot we need to fix
the upstream dts [2].

[1] https://elixir.bootlin.com/linux/v4.14/source/Documentation/devicetree/bindings/net/phy.txt#L20
[2] https://elixir.bootlin.com/u-boot/latest/source/drivers/core/ofnode.c#L1258

> 
> Cheers,
> Andre
> 
> > Signed-off-by: Anne Macedo <retpolanne@posteo.net>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts
> > index 29a081e72..7248ab72f 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dts
> > @@ -37,7 +37,8 @@ &emac {
> >  
> >  &mdio {
> >  	ext_rgmii_phy: ethernet-phy@1 {
> > -		compatible = "ethernet-phy-ieee802.3-c22";
> > +		compatible = "ethernet-phy-id001c.c915",
> > +			     "ethernet-phy-ieee802.3-c22";
> >  		reg = <1>;
> >  	};
> >  };
> 

Regards, Anne
