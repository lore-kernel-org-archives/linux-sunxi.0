Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7FE2374E
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Dec 2023 11:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="ovI9kRR2"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 9960E240101
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Dec 2023 12:02:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1702465370; bh=Xn11GfJCgZ19WHONmDGEs0lStFSo2QPNdFNP92RVqOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Disposition:From;
	b=ovI9kRR2zf5MQRLepWAGGopPB4nh3rSpYbdIODMHFOiG+VpcqnXOBOMM2OMiG8BHb
	 eoO7hy3BFmHIEtBKk8eBYk1pKrywfomYk0kvXDVXPAePZ3u5nL2ZiPaR2SNk8hIQRj
	 sUppfBzC+meUzPCXDg6nOIJQ9AJ0ivoPEPJuuqq4dsLkJBs9iLoP0CCbRyLoNwrplU
	 imUajjGn02yKz9wQPVmPbBzjUorFxA6w02gio3tRta3Ot13rkcOF/m5fTE0SJ6GkU5
	 XcoBVDVcmrj3/spVZ1LHgh+tdrxLO1PPK9PIGYpJ7lx/lDS17wtL0pPctY49JV2kfa
	 vf3FpySCoZn8Q==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4SqsyW26CGz6tvr;
	Wed, 13 Dec 2023 12:02:42 +0100 (CET)
Date: Wed, 13 Dec 2023 11:02:39 +0000
From: Anne Macedo <retpolanne@posteo.net>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	Corentin Labbe <clabbe@baylibre.com>
Subject: Re: [PATCH] arm64: dts: allwinner: Orange Pi One Plus PHY support
Message-ID: <ceuoq3xxgb5kkel7e7wqpslcg7h6dde3wgdqhyo7jgop6owovk@5a76ks5fiun4>
References: <20231212122835.10850-2-retpolanne@posteo.net>
 <20231212162200.10b3868b@donnerap.manchester.arm.com>
 <axsvii25yrknfae6gdreti7lcskoscsdbsujwuispiieimsbdy@gwzm4l7mwlew>
 <20231213013544.2fc7e0d1@minigeek.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213013544.2fc7e0d1@minigeek.lan>

On Wed, Dec 13, 2023 at 01:35:44AM +0000, Andre Przywara wrote:
> On Tue, 12 Dec 2023 19:27:14 +0000
> Anne Macedo <retpolanne@posteo.net> wrote:
> 
> Hi Anne,
> 
> > On Tue, Dec 12, 2023 at 04:22:00PM +0000, Andre Przywara wrote:
> > > On Tue, 12 Dec 2023 12:28:30 +0000
> > > Anne Macedo <retpolanne@posteo.net> wrote:
> > > 
> > > Hi Anne,
> > >   
> > > > Adds compatible values to mdio subnodes for Ethernet PHY representing
> > > > Realtek 8211 PHY to Orange Pi One Plus.  
> > > 
> > > So can you state why this would be needed? This is the RTL8211 ID,  
> > 
> > Apologies, I completely forgot to include some context. 
> > 
> > > right? Which should be autodetected via MDIO. Looking back in my inbox
> > > you proposed this change before, for U-Boot, specifically, but I fail to
> > > find a solution or explanation what really happens here. Two Renesas .dts
> > > files have the same compatible, and the commit message talks about the
> > > reset line there, is this related?
> > > 
> > > So can you please give some more background and explanation? That would be
> > > part of a good commit message anyway ("why", not "what").  
> > 
> > Should I resend the commit with a more meaningful explanation? The
> > context is the following:
> > 
> > currently, ethernet doesn't seem to work on both u-boot and Linux on the
> > Orange Pi One Plus board. 
> > 
> > On the kernel, this error shows up:
> > 
> > Configuring network interfaces... [    5.992589] dwmac-sun8i 5020000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
> > [    6.000823] dwmac-sun8i 5020000.ethernet eth0: __stmmac_open: Cannot attach to PHY (error: -19)
> > 
> > After applying this fix, the PHY gets attached: 
> > 
> > Configuring network interfaces... [    6.060020] dwmac-sun8i 5020000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
> > [    6.069460] dwmac-sun8i 5020000.ethernet eth0: PHY [stmmac-0:01] driver [RTL8211E Gigabit Ethernet] (irq=POLL)
> > 
> > The previous compatible list that had ethernet-phy-ieee802.3-c22 fails
> > to find a PHY, so this patch includes the correct PHY ID with the
> > RTL8211 ID. 
> > 
> > The behaviour is described on [1].
> 
> So this is all an observation, but no real explanation, isn't it?

I've made some analysis on [3] on this bug, but it was based solely on
u-boot. I was having trouble with the regulator and on u-boot nothing
would trigger the GPIO PD6 and the vcc-gmac-3v3 regulator, so the NIC
was completely dead. Next I did an analysis based on [2] because the
u-boot PHY initialization was flaky.

> To cite [1]: "If the PHY reports an incorrect ID (or none at all) ...".
> I am pretty sure this is not the case here, instead we are looking at
> some missing platform bits, like a missing clock, reset, or most likely
> regulator. Or one of the existing resources is wrongly assigned or

As I mentioned, PHY initialization is flaky on u-boot, so maybe that
assumption is correct. 

> configured? If the PHY is not (yet?) powered correctly when the code
> does the auto-detection via the MDIO bus, then the initialisation would

If I recall correctly (I don't know if I kept it in my notes :c), that
could be the case. regulator-boot-on makes the NIC work (LEDs blink, at
least) but it doesn't get initialized. 

> fail. But since it works when overriding the auto-detection, I feel
> like we are papering over something here.
> Do you have the schematics for this board? I can only find the one for
> the Orange Pi Plus 2E, and I don't know how similar those two are. This
> shows *two* regulators, but both are activated by the same GPIO.

I do. It's available on [4]

> It would also be interesting to see if any of Corentin's work for the
> Orange Pi 3 helps here?

Adding [5] for reference here, thanks! Will check it out. 
> 
> Cheers,
> Andre
> 

[3] https://blog.retpolanne.com/hardware/embedded/2023/07/07/embedded-phy.html
[4] https://linux-sunxi.org/images/7/7c/OrangePi_OnePlus_Schematics_v2.0.pdf
[5] https://lore.kernel.org/netdev/20220509074857.195302-1-clabbe@baylibre.com/

Regards, Anne
