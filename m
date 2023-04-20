Received: from the.earth.li (the.earth.li [93.93.131.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72BB8F68
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Apr 2023 19:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
	s=the; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:
	Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=TRyyzeUqKdaTnqrBucZ3TkmfveNP8li2ctk9FYv0/ms=; b=aF8iWtfV0ZpqH+2RoF9PSmZLZc
	vRZNwV3F/wGCFBvHyolVlMrdfFSu5Mt1FGWS1sj/9NQE3xe9/YbaGPGWgeiEh/WbWcP6NiWAe2aRn
	vGVO8z8QX8BWdjt6O2djnE/Y2DUDRV2aDUuAJjxtsoi0XrlG/i5Pi6/BrX9HRrvL//mOr0AXiRyRj
	dradurzGI01KfKrxqeG7HXwdeHhF/T2fGH0xHTV7hsKNS8PW2hOHj5c9CSOL08pqA5GrVKjacLfsF
	jF72L7iUj68Fw4xBxPopF9VwXWVHPgv22CjJXywUGOej9N9flst+j/RdWN+En4QfGjbmtzz8SPoX4
	v4gj/PBQ==;
Received: from noodles by the.earth.li with local (Exim 4.94.2)
	(envelope-from <noodles@earth.li>)
	id 1ppZib-002Tk7-TH; Thu, 20 Apr 2023 20:13:21 +0100
Date: Thu, 20 Apr 2023 20:13:21 +0100
From: Jonathan McDowell <noodles@earth.li>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] ARM: dts: sun5i: Add port E pinmux settings for mmc2
Message-ID: <ZEGO0SbkBoPqV7kA@earth.li>
References: <cover.1681580558.git.noodles@earth.li>
 <00d37ef9bf70785d05fb446ee6d0060c4a8d521a.1681580558.git.noodles@earth.li>
 <20230416014756.2270af13@slackpad.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230416014756.2270af13@slackpad.lan>

On Sun, Apr 16, 2023 at 01:47:56AM +0100, Andre Przywara wrote:
> On Sat, 15 Apr 2023 18:46:24 +0100
> Jonathan McDowell <noodles@earth.li> wrote:
> 
> Hi,
> 
> > These alternate pins for mmc2 are brought out to the 40 pin U14 header
> > on the C.H.I.P and can be used to add an external MMC device with a 4
> > bit interface. See
> > 
> > https://byteporter.com/ntc-chip-micro-sd-slot/
> > 
> > for further details on how.
> > 
> > Signed-off-by: Jonathan McDowell <noodles@earth.li>
> > ---
> >  arch/arm/boot/dts/sun5i.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
> > index 250d6b87ab4d..e4922506ce22 100644
> > --- a/arch/arm/boot/dts/sun5i.dtsi
> > +++ b/arch/arm/boot/dts/sun5i.dtsi
> > @@ -517,6 +517,14 @@ mmc2_4bit_pc_pins: mmc2-4bit-pc-pins {
> >  				bias-pull-up;
> >  			};
> > 
> 
> As this seems to be a highly non-standard and rare modification, that
> doesn't even get used in the mainline DT, please add a:
> 			/omit-if-no-ref/
> line, so we don't get this into every sun5i board.

Neat, will add in v2.

> Otherwise looks good, though I don't know if that should belong into
> the same DT overlay that is probably used to also enable the MMC2 node.

I pondered that, but we already have the mmc2-4bit-pc-pins definition
here so it seemed helpful to add the pe-pins too.

> > +			mmc2_4bit_pe_pins: mmc2-4bit-pe-pins {
> > +				pins = "PE4", "PE5", "PE6", "PE7",
> > +				       "PE8", "PE9";
> > +				function = "mmc2";
> > +				drive-strength = <30>;
> > +				bias-pull-up;
> > +			};
> > +
> >  			mmc2_8bit_pins: mmc2-8bit-pins {
> >  				pins = "PC6", "PC7", "PC8", "PC9",
> >  				       "PC10", "PC11", "PC12", "PC13",
> 

J.

-- 
    "Where the f**k is all this    |  .''`.  Debian GNU/Linux Developer
  water coming from?" -- Captain   | : :' :  Happy to accept PGP signed
          of the Titanic           | `. `'   or encrypted mail - RSA
                                   |   `-    key on the keyservers.
