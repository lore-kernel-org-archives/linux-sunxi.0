Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC62620B54
	for <linux-sunxi@lists.linux.dev>; Wed, 10 May 2023 14:16:49 +0000 (UTC)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 23a0e2df-ef3d-11ed-b972-005056bdfda7;
	Wed, 10 May 2023 17:15:40 +0300 (EEST)
From: andy.shevchenko@gmail.com
Date: Wed, 10 May 2023 17:15:38 +0300
To: Jonathan McDowell <noodles@earth.li>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 2/5] pinctrl: axp209: Add support for GPIO3 on the
 AXP209
Message-ID: <ZFunCnXldqEMFYaE@surfacebook>
References: <cover.1681580558.git.noodles@earth.li>
 <cover.1683719613.git.noodles@earth.li>
 <f9b643ff0d0ed770f5a841111f213f8481dc920f.1683719613.git.noodles@earth.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9b643ff0d0ed770f5a841111f213f8481dc920f.1683719613.git.noodles@earth.li>

Wed, May 10, 2023 at 01:01:27PM +0100, Jonathan McDowell kirjoitti:
> The AXP209 device has a 4th GPIO which has a slightly different register
> setup, where the control + status bits are held in a single register
> rather than sharing AXP20X_GPIO20_SS with GPIOs 0-2.

...

> +#define AXP20X_GPIO3_FUNCTIONS		(BIT(2) | BIT(1))

GENMASK() ?

...


> +#define AXP20X_GPIO3_FUNCTION_OUT_LOW	0
> +#define AXP20X_GPIO3_FUNCTION_OUT_HIGH	BIT(1)
> +#define AXP20X_GPIO3_FUNCTION_INPUT	BIT(2)

Seems mixed use of decimal and bitwise values, switch to decimal, since it
makes more sense in my opinion.

...

> +	if (offset == 3) {
> +		ret = regmap_read(pctl->regmap, AXP20X_GPIO3_CTRL, &val);
> +		if (ret)
> +			return ret;
> +		if (val & AXP20X_GPIO3_FUNCTION_INPUT)
> +			return GPIO_LINE_DIRECTION_IN;

> +		else

Redundant 'else'.

> +			return GPIO_LINE_DIRECTION_OUT;
> +	}


-- 
With Best Regards,
Andy Shevchenko


