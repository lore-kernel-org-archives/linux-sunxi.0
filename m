Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F52B11706
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Sep 2023 15:04:36 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b703a0453fso77072251fa.3
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Sep 2023 08:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694444674; x=1695049474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODyJnPcImRel5P1Ykm7VeqTt2o5yZaj1e00zNOQ+VYI=;
        b=O3NgJhDvskhm58L5aROkNODtaOndNEaV38zNG42uEoVskRm9RUfKH/q01SByqLJ+1w
         3tCRQ+8oxmes6dufAcu7oDuHuqebHJoRMf214ARIIvYl9KAXGlDOv/RlbZp+2GANr+oj
         uktMcKxpmXnvM8gr9yma+w9Q9Nx+dKCW/ouV9zkeyV3wZj/ixAwBV0YfcWB6z3AxcW/E
         G+p6Vz0MW1XCxCQZ2sOnM/HY13jKJjVeetD8EHj9HrotNdGxwwaHz84unO9ygKjfflwc
         OKgkzOMuXmQ7vI4I1VK6IDA4aFmi37l7+GEUCiMQbEkB/+tFqMo1nF3Dk3vV/jHyLJox
         jHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694444674; x=1695049474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODyJnPcImRel5P1Ykm7VeqTt2o5yZaj1e00zNOQ+VYI=;
        b=un2GlCh9dgJLhSxPqjxnLqHDjRK3Puf3lgilEyZMfYByZRY/xgdrraq4IQLxxiX9Jg
         dcasJj6AxJj294mowQe/taEmRWWOzadsjl6tpMNxyvPPeqBZUofd2xbEA2BHdoVTrQP8
         tmKxUDbyUDYoxZpXvdL8k9j1ecDWX7pbx4oC/btwycX4pEK7oitZ56ccLTCNmxVMQWFV
         KDhphhNaIX86qKMw9wYYoObi+Zgc3xU2J+ZR9Ji3qAKINcibvBdvC7G7yH5VO+tyEpS9
         46zrqqNb7iBszGEe9Q7xFf2y6FfP6vdSM9Zvnvm3KH6ofQAkbCSowExNheOTk9dk48/v
         U7hA==
X-Gm-Message-State: AOJu0Yzf/3jP6GgmpKnpHkGoIqTMyMj3ylYPrM9oDIOoLiGm9M5O+1iw
	OxWXa6naRQzWn3oQw3mxdHw=
X-Google-Smtp-Source: AGHT+IF9ImvK5dW/GQLmY/Bl6WL9W44EGZzNuF3w6dcH5dzQKdEZgs4EZk2VmEgketwPJBzPBOxNDQ==
X-Received: by 2002:a2e:9609:0:b0:2bc:fd50:573a with SMTP id v9-20020a2e9609000000b002bcfd50573amr8796822ljh.6.1694444674200;
        Mon, 11 Sep 2023 08:04:34 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id z19-20020a170906715300b00992e14af9b9sm5426153ejj.134.2023.09.11.08.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 08:04:33 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: longqi <longqi90@gmail.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
Subject:
 Re: [PATCH] fixes the pin settings of two LEDs on board nanopi neo plus2
Date: Mon, 11 Sep 2023 17:04:34 +0200
Message-ID: <1862064.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20230911155418.330e2334@donnerap.manchester.arm.com>
References:
 <20230911140959.2046340-1-longqi90@gmail.com>
 <20230911155418.330e2334@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 11. september 2023 ob 16:54:18 CEST je Andre Przywara 
napisal(a):
> On Mon, 11 Sep 2023 22:09:59 +0800
> longqi <longqi90@gmail.com> wrote:
> 
> Hi,
> 
> please add a few lines here saying why you fix this: it looks like the red
> LED wasn't working at all, because of the wrong GPIO, and the colours were
> actually swapped? This would be good to know for everyone reading this
> patch.

Additionally, add "Fixes" tag, since it's a bug in DT.

In any case, go through
https://www.kernel.org/doc/html/latest/process/submitting-patches.html
so your patch will be correctly formatted.

Best regards,
Jernej

> 
> In general this is a good catch, so thanks for sending this!
> 
> More below:
> > Signed-off-by: longqi <longqi90@gmail.com>
> > ---
> > 
> >  .../boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
> > b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts index
> > 4c3921ac236c..0cb7a07ab1de 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts
> > @@ -26,14 +26,15 @@ leds {
> > 
> >  		compatible = "gpio-leds";
> >  		
> >  		led-0 {
> > 
> > -			label = "nanopi:green:pwr";
> > -			gpios = <&r_pio 0 10 GPIO_ACTIVE_HIGH>;
> > -			default-state = "on";
> > +			label = "nanopi:red:pwr";
> 
> label is now a deprecated property. That's fine for existing DTs, but I
> guess touching this node means you should update this, by using "function"
> and "color", as described in:
> Documentation/devicetree/bindings/leds/common.yaml
> 
> > +			gpios = <&r_pio 0 10 GPIO_ACTIVE_HIGH>; /* 
PL10 */
> > +			linux,default-trigger = "default-on";
> > 
> >  		};
> >  		
> >  		led-1 {
> > 
> > -			label = "nanopi:red:status";
> > -			gpios = <&pio 0 20 GPIO_ACTIVE_HIGH>;
> > +			label = "nanopi:green:status";
> 
> Same thing with label here, please use "function" and "color".
> 
> > +			gpios = <&pio 0 10 GPIO_ACTIVE_HIGH>; /* 
PA10 */
> > +			linux,default-trigger = "heartbeat";
> 
> I don't think we assign default triggers for LED merely labelled "status",
> as people might have different use cases for this. For instance I'd find
> a USB or eMMC trigger more useful. So you can just drop that line.
> 
> Cheers,
> Andre




