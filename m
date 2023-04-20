Received: from the.earth.li (the.earth.li [93.93.131.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2A98F68
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Apr 2023 19:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
	s=the; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:
	Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XcF8YitubdrlVVq61vFiY7n8l4J1XfxeL5mXCzPntYY=; b=EPHwvB3GslDJ+Sn+7RhDg0+EVC
	F7mwGVAR48099+1uUizWmamElC50qVWut9o9KHoCdkXUYM48f1RxCgfbSJJhHW64smRpPw+KZOL5f
	edyzb/KW/nxzQYbDhrebvVM79AJBJboMNdr2DTFgR2yvgxrBglAhGVYjRMb1pdVXIOYMRUxLzO/Iu
	0wOAOqWEqH5RiiNudJF9MMjFS/3IoF7Ol5nyyx2WG6sZ9Ae61PoZHNuFsDD4PQbt66Gw1yCeRjdqc
	Ip3Lvf05kHM/J4QstwjK6LPVVucxcoqqyooNVXsBXq4LAm2vOczh1Rs1yjbU81sSHGK1BazdBqQxS
	teQg4muA==;
Received: from noodles by the.earth.li with local (Exim 4.94.2)
	(envelope-from <noodles@earth.li>)
	id 1ppZbd-002TL6-RO; Thu, 20 Apr 2023 20:06:09 +0100
Date: Thu, 20 Apr 2023 20:06:09 +0100
From: Jonathan McDowell <noodles@earth.li>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: axp209: Add iio-hwmon node for internal
 temperature
Message-ID: <ZEGNIQdmf8NSUs7+@earth.li>
References: <cover.1681580558.git.noodles@earth.li>
 <a40b6d46209f9b5626cd5a147c31daf5d19c9439.1681580558.git.noodles@earth.li>
 <25a8dcf9-fd1b-0eb3-eced-7a1e158ca7fc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25a8dcf9-fd1b-0eb3-eced-7a1e158ca7fc@linaro.org>

On Sun, Apr 16, 2023 at 09:27:46AM +0200, Krzysztof Kozlowski wrote:
> On 15/04/2023 19:47, Jonathan McDowell wrote:
> > This adds a DT node to hook up the internal temperature ADC to the
> 
> Do not use "This commit/patch", but imperative mood. See:
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
> 
> > iio-hwmon driver. The various voltage + current ADCs are consumed and
> > exposed by their respective drivers, but this is not and is always
> > available. Naming chosen to match the axp20x_ prefix the power sensors
> > use.
> 
> Weird choice.

You think? I didn't choose the axp20x_ prefix for the others, but it
made sense to me that all the sensors from the same device would be
identifiable as such. From your comment below it sounds like you'd
prefer I use the more generic pmic-temp as the node name? Will do for
v2.

> > Signed-off-by: Jonathan McDowell <noodles@earth.li>
> > ---
> >  arch/arm/boot/dts/axp209.dtsi | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/axp209.dtsi b/arch/arm/boot/dts/axp209.dtsi
> > index ca240cd6f6c3..f00b5a7ec106 100644
> > --- a/arch/arm/boot/dts/axp209.dtsi
> > +++ b/arch/arm/boot/dts/axp209.dtsi
> > @@ -48,6 +48,13 @@
> >   * http://dl.linux-sunxi.org/AXP/AXP209%20Datasheet%20v1.0_cn.pdf
> >   */
> >  
> > +/ {
> > +	axp20x_temp {
> 
> No underscores in node names.
> 
> Node names should be generic.
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> > +		compatible = "iio-hwmon";
> > +		io-channels = <&axp_adc 4>; /* Internal temperature */
> > +	};
> > +};
> > +
> >  &axp209 {
> >  	compatible = "x-powers,axp209";
> >  	interrupt-controller;

J.

-- 
"My house has this new innovation called "windows".  Even my bedroom
has them. " -- Paul Tomblin
