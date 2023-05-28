Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA83F7C
	for <linux-sunxi@lists.linux.dev>; Sun, 28 May 2023 15:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7219C433EF;
	Sun, 28 May 2023 15:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685286402;
	bh=LbDY2zbsfIjm0Fwv8lZSBUxpS5rnVCIa3G2XSqeSeLQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UJFSDM9kRLTJOeQsVA3aCbLjXHJpmtVR7qVhWpUFmtU+tu3gG+HzRqlIxAe4O5gTc
	 d7Wd3biimCw2t9KjhbhZCpJfFbe+hHTqy0wKY4LSixzOLnrb8Zd7Zg7bVQ41jHCKCo
	 Ez55QoMjyhDfmhjYdIOVaGq/NNll1HwOlxqz3jN8Yig9OUPSR9hKr0TrsnSrP2C+wI
	 BZp9rzd2Pm0bcbkHBjkYaXbZXMvESofq3mhcR9TgksMbMwkI8u8P+aTXdmEQ9RbFT3
	 0Eqjtga9+buFSdHivJKdYpwHneD1RtB8/zZuIAUAb+OhjfgrWLa0MCXZhHRv3xkNf4
	 Hd3g1LJkRBdXQ==
Date: Sun, 28 May 2023 16:22:57 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Maxim Kiselev <bigunclemax@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-iio@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Conor Dooley <conor@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Heiko
 Stuebner <heiko.stuebner@vrull.eu>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Cosmin Tanislav
 <demonsingur@gmail.com>, Mike Looijmans <mike.looijmans@topic.nl>, Haibo
 Chen <haibo.chen@nxp.com>, ChiYuan Huang <cy_huang@richtek.com>, Ramona
 Bolboaca <ramona.bolboaca@analog.com>, Ibrahim Tilki
 <Ibrahim.Tilki@analog.com>, Caleb Connolly <caleb.connolly@linaro.org>,
 William Breathitt Gray <william.gray@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Leonard =?UTF-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hugo
 Villeneuve <hvilleneuve@dimonoff.com>, ChiaEn Wu <chiaen_wu@richtek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v1 0/4] Add support for Allwinner GPADC on
 D1/T113s/R329 SoCs
Message-ID: <20230528162257.7e8932b9@jic23-huawei>
In-Reply-To: <CALHCpMh2sZSCrFMMT13kYbsu+C2bC2xY3coB_fv0mZom_g=oPQ@mail.gmail.com>
References: <20230524082744.3215427-1-bigunclemax@gmail.com>
	<20230524103431.50c6a2fd@donnerap.cambridge.arm.com>
	<CALHCpMh2sZSCrFMMT13kYbsu+C2bC2xY3coB_fv0mZom_g=oPQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 24 May 2023 14:36:28 +0300
Maxim Kiselev <bigunclemax@gmail.com> wrote:

> Hi Andre,
> 
> thanks for you comments
> 
> > This may sound kind of obvious, but wouldn't it be easier to model this
> > with one compatible string, and have the number of channels as a DT
> > property?  
> 
> Yes, I completely agree that using separate config for each SoCs is looks
> overcomplicated because the only difference is the number of channels.
> I thought about a DT property with channels number but I didn't find
> another ADC driver with the same approach (except i2c ADC's with child nodes).
If you are 100% sure that that devices are either
1) Detectable at runtime
2) Identical in functionality.

So that in neither case will any changes on driver support expose differences
in the future then a single compatible is fine.

The back up is that you use fallback compatibles - list more than one.
Whilst it doesn't matter (as no differences found) the driver can use
the first one.  If differences become apparent later, others may be used.

I'm not however keen on a simple channel count parameter.  If you want
to go that way, it's better to provide the fine control of individual channel
child nodes (see Documentation/devicetree/bindings/iio/adc/adc.yaml)

That way the control is on which channels are wired to something useful, rather
than whether the device can read them or not (which is pointless if no one
wired them up.


> 
> > Or, alternatively, using iio/multiplexer/io-channel-mux.yaml, since it's
> > only one ADC anyway?  
> I'm sorry, I didn't quite understand what you're suggesting.

That's normally only used for a separate MUX where we need a separate driver
to handle it.  If used on a device like this it would expose additional complexity
to userspace with no benefits in generality etc.

> 
> > And btw: it seems that the T507 (the H616 die with a different pinout) has
> > the same IP, with four channels:
> > http://dl.linux-sunxi.org/T507/  
> 
> Oh, thanks for pointing that. I'll add it to the list in the next version.

