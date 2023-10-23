Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9534213AE8;
	Mon, 23 Oct 2023 09:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3YJbI7p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CFCEC433C8;
	Mon, 23 Oct 2023 09:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698055143;
	bh=U22arOYqMfIQqu6jCSRcueYe91nxdoBeypcQss0QoDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R3YJbI7pZYVTAe06UbkqxujhKtqaah2NL9tfHTwTQEZMsSPe5agQXXuqrBJo5BoX/
	 uc4A5nbeARkimGw16qLKxy9+LevqaI85NTl0oCwZYwYXgviKEWw3wrqHYG4KXfzK9y
	 qRQkd8l20uO3aO+aEktE9dQDPhgRu/g3cGgO+di7Nt5rgJm4l7PBpVvgZDvGr439S9
	 GZuLVcUkYP1IYHw8ooUZbxWzJdKAWzJi71e3Pxhzt4yjk3UkDTMFhI0s6RrtgR+EgO
	 a8imxQ5Df23y/y57yeG3A64DslPZs8vrayt3jWFCYGXKBWw5ojm+rbCDDN0vtU6FZQ
	 PM9SETXIWJ+iw==
Date: Mon, 23 Oct 2023 10:58:55 +0100
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: Samuel Holland <samuel@sholland.org>, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [RESEND PATCH v7 2/5] leds: sun50i-a100: New driver for the A100
 LED controller
Message-ID: <20231023095855.GH8909@google.com>
References: <20221231235541.13568-1-samuel@sholland.org>
 <20221231235541.13568-3-samuel@sholland.org>
 <c3ae7d79ab81621c66e939d804ca41e97eab79fb.camel@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3ae7d79ab81621c66e939d804ca41e97eab79fb.camel@apitzsch.eu>

> Hi Samuel,
> 
> there are two more things to change, which came up recently. See below.
> 
> Regards,
> André
> 
> Am Samstag, dem 31.12.2022 um 17:55 -0600 schrieb Samuel Holland:
> > Some Allwinner sunxi SoCs, starting with the A100, contain an LED
> > controller designed to drive RGB LED pixels. Add a driver for it
> > using
> > the multicolor LED framework, and with LEDs defined in the device
> > tree.
> > 
> > Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
> > ---
> > [...]
> > diff --git a/drivers/leds/leds-sun50i-a100.c b/drivers/leds/leds-
> > sun50i-a100.c

[...]

> > +struct sun50i_a100_ledc {
> > +	struct device *dev;
> > +	void __iomem *base;
> > +	struct clk *bus_clk;
> > +	struct clk *mod_clk;
> > +	struct reset_control *reset;
> > +
> > +	u32 *buffer;
> > +	struct dma_chan *dma_chan;
> > +	dma_addr_t dma_handle;
> > +	int pio_length;
> > +	int pio_offset;
> > +
> > +	spinlock_t lock;
> > +	int next_length;
> > +	bool xfer_active;
> > +
> > +	u32 format;
> > +	struct sun50i_a100_ledc_timing timing;
> > +
> > +	int num_leds;
> > +	struct sun50i_a100_ledc_led leds[];
> 
> Annotate struct with  __counted_by(num_leds).

André, please remember to snip your replies.

-- 
Lee Jones [李琼斯]
