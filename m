Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4B733C9
	for <linux-sunxi@lists.linux.dev>; Wed,  8 Feb 2023 16:57:46 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id w3so21468098qts.7
        for <linux-sunxi@lists.linux.dev>; Wed, 08 Feb 2023 08:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p40yUwStxrTwrm1i0BG8hTSkPrclrhU7LySkzWtVeSQ=;
        b=pRbKeS+4nS4noT4Qu99I2I0Y52Clu2wQLmNDUbHqZt+nwUQgV5xIQ/5htCxIRuAbPc
         0ppGluqSaodYaZLq/vinXbhpO7vyWfD7CAdUgDxtonx79FW8uLZfaGwM14kFa9qvfpkT
         qxuXrCY+kW02CBSqFum24piX+jH8oRO6G+pOtS2rr8IzyQmU/nIQDxMqDzSWXLcz8mkK
         SMR0WSJe7PwY/sUPzUVxsQJVaN21QQbk2Cyqhtwx37DNGHMqPj2bwY3sTZSeWdF8961W
         EoWQcjZ+Dx6b9gifq+Wqvx+9emt2RSoIXlFcVt81BOI29L5wfYY3wWeW6FYzlluCCcPH
         iEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p40yUwStxrTwrm1i0BG8hTSkPrclrhU7LySkzWtVeSQ=;
        b=mhnNoT3nA7L5c+cm4MyFycwU6y37RP1+s55EE4NnGm0M0C4Mj/Ir92hpXjLJfKMP63
         t0p7RNWKua4ZT8MbIhwqHQC/vlSRTJcQvE942C0gm7a9S0aG7y+3M+lB44hIoN/4qnCo
         jrQMFXtGmj1DrR0gCEa/98LoxZ4QasCAlIhJ31ZlMTrZ/qo7MYqH510npQvHkEQEybEN
         R1Eem4p74E8iVwcflRaNxl5pLUXh8Bw0RhYfXIA1K3aKl4Gt9AhsIItMmom9mp3prSLl
         jAFdlHmKvJvgTIiCJl9OChH6Mup3xN5C9JolH80Cks20383Bex2WkWqPg0Ysg4EvfokM
         VXmg==
X-Gm-Message-State: AO0yUKUuhAANsRqdk9vzJIxHds4EB0ud6olSJYv53IJ6nPAVmKrA4oo3
	N9PCdGBZsf2/FMJDkji0dcI=
X-Google-Smtp-Source: AK7set93BFBKyDcDH4kf4S3mJ5vR93Pg00QiC2uzDqpaNy+0GwvHnWjHmj3pBOXax42P6YwEhDn4rg==
X-Received: by 2002:a05:622a:1008:b0:3b8:6cb0:8d28 with SMTP id d8-20020a05622a100800b003b86cb08d28mr11823600qte.6.1675875465964;
        Wed, 08 Feb 2023 08:57:45 -0800 (PST)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id x17-20020ac86b51000000b003a7eb5baf3csm11567488qts.69.2023.02.08.08.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 08:57:45 -0800 (PST)
Date: Wed, 8 Feb 2023 11:57:43 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] riscv: dts: nezha-d1: add gpio-line-names
Message-ID: <20230208165743.GA8848@localhost>
References: <20230208014504.18899-1-twoerner@gmail.com>
 <Y+PRGjn8a26pe5Dy@spud>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y+PRGjn8a26pe5Dy@spud>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Conor,

Thank you for your review!

On Wed 2023-02-08 @ 04:43:06 PM, Conor Dooley wrote:
> On Tue, Feb 07, 2023 at 08:45:03PM -0500, Trevor Woerner wrote:
> > Add descriptive names so users can associate specific lines with their
> > respective pins on the 40-pin header according to the schematics found at:
> > 
> > 	http://dl.linux-sunxi.org/D1/D1_Nezha_development_board_schematic_diagram_20210224.pdf
> 
> Dunno about the sunxi folk, but ideally that'd be a Link: tag IMO.

Okay, np.

> > 
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> >  .../boot/dts/allwinner/sun20i-d1-nezha.dts    | 53 +++++++++++++++++++
> >  1 file changed, 53 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> > index a0769185be97..33489c7619cb 100644
> > --- a/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> > +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
> > @@ -90,6 +90,15 @@ pcf8574a: gpio@38 {
> >  		gpio-controller;
> >  		#gpio-cells = <2>;
> >  		#interrupt-cells = <2>;
> > +		gpio-line-names =
> > +			"pin13 [PP0,gpio8] ",
> > +			"pin16 [PP1,gpio10]",
> > +			"pin18 [PP2,gpio11]",
> > +			"pin26 [PP3,gpio17]",
> > +			"pin22 [PP4,gpio14]",
> > +			"pin28 [PP5,gpio19]",
> > +			"pin37 [PP6,gpio23]",
> > +			"pin11 [PP7,gpio6] ";
> 
> dtbs_check does not like this:
> arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dtb: gpio@38: 'gpio-line-names' does not match any of the regexes: '^(.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
>         From schema: Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
> 
> >  	};
> >  };

Okay, I'll look for other examples of giving names to io-expanders to see
what's needed to keep dtc happy.

> >  
> > @@ -164,3 +173,47 @@ &usbphy {
> >  	usb1_vbus-supply = <&reg_vcc>;
> >  	status = "okay";
> >  };
> > +
> > +&pio {
> > +	gpio-line-names =
> > +		/* Port A */
> > +		"", "", "", "", "", "", "", "",
> > +		"", "", "", "", "", "", "", "",
> > +		"", "", "", "", "", "", "", "",
> > +		"", "", "", "", "", "", "", "",
> > +		/* Port B */
> > +		"pin5  [PB0, gpio2/twi2-sck]",
> > +		"pin3  [PB1, gpio1/twi2-sda]",
> > +		"",
> > +		"pin38 [PB3, gpio24/i2s2-din]",
> > +		"pin40 [PB4, gpio25/i2s2-dout]",
> > +		"pin12 [PB5, gpio7/i2s-clk]",
> > +		"pin35 [PB6, gpio22/i2s2-lrck]",
> > +		"",
> > +		"pin8  [PB8, gpio4/uart0-txd]",
> > +		"pin10 [PB9, gpio5/uart0-rxd]",
> > +		"",
> > +		"",
> > +		"pin15 [PB12,gpio9]",
> 
> Why not pick a consistent styling w.r.t. the space between PB#, & gpio?

I thought it looked better when doing:

	nezha-allwinner-d1:~# gpioinfo
	gpiochip0 - 224 lines:
		...
		line  32: "pin5  [PB0, gpio2/twi2-sck]" kernel input active-high [used]
		line  33: "pin3  [PB1, gpio1/twi2-sda]" kernel input active-high [used]
		line  34:      unnamed  "interrupt"   input  active-high [used]
		line  35: "pin38 [PB3, gpio24/i2s2-din]" unused input active-high
		line  36: "pin40 [PB4, gpio25/i2s2-dout]" unused input active-high
		line  37: "pin12 [PB5, gpio7/i2s-clk]" unused input active-high
		line  38: "pin35 [PB6, gpio22/i2s2-lrck]" unused input active-high
		line  39:      unnamed       unused   input  active-high
		line  40: "pin8  [PB8, gpio4/uart0-txd]" kernel input active-high [used]
		line  41: "pin10 [PB9, gpio5/uart0-rxd]" kernel input active-high [used]
		...

I guess "better" is subjective :-)

I'll do a v2, thanks!
