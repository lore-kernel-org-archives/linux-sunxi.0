Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A2014F92
	for <linux-sunxi@lists.linux.dev>; Sun, 30 Jul 2023 22:04:03 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3128fcd58f3so4154443f8f.1
        for <linux-sunxi@lists.linux.dev>; Sun, 30 Jul 2023 15:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690754642; x=1691359442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pahPU3wSvsqJHIDLsqPi1ulLhJMWKZSO5rvQ5dMXskQ=;
        b=q0sSR9AXHGYYmyVNDr+xpag+Dw277dZX9Y4ekqdWpmmrFAk+IkylG9pts4k/utI7SB
         zHxzRfyKPebgYRJYkunUtLvj5sS8zxKQl/rhUk5cZJQIXFjNIZ/nNClC0D6BWdCUF1kr
         fzAyd0fX7gdRjXwXHsIBljOjfQ2Pkl9bdDOji8mRYkSKOyEo1mHn2Y/99CtOUV7UOkQe
         KxzfIg/nQMircpIV0T3thGF+3HJlvdO6sZVPjU2MIA6s6Go9vK32qNngksFxfQBf571Z
         60mN9fdB21OXpFV8KY3m4hJg5j4fWeOvu585h2Cu3kZsVc1XjPt+g2fNfR9rszK7il5D
         lU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690754642; x=1691359442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pahPU3wSvsqJHIDLsqPi1ulLhJMWKZSO5rvQ5dMXskQ=;
        b=l5caaoKstMRpMonR9a04bjyaE52vOE8Ou+Dr/p4oi4RcNRHmq7FdG1GkY4jvpaqOUt
         ZxqjLhpZ8z1/X4RUOhYRC4WrjpzvU3g9g9RUR9bjSQRuDkpaWOQl7lingymzaO9hoykJ
         hePhKqek20QzrHnXCGbzGHlTwboOwqgHa1fMw2znt1oEC9IgOqo87tzLq2PNkdrcRsQK
         hXaDmNHLSUZBv7kkpGCv6skKy7GcxRyzf0Hf+n+8GLsESFXrdPAY/cY+nojDg7LawudR
         EdINbmERDpf2j5w7ylCml8KZO5qndXpI2EAZ/d6qazfoTFAhtHE54t44FYkQtOC0HMkD
         uJiQ==
X-Gm-Message-State: ABy/qLYGNi4K41rc0pi2PoddgHZYvUZ29pMhwVf59ZnujuLLGafeRArR
	XQYhEPhxJ8jIfJXRbPWHQ4Tw9Z0exW2rpExi
X-Google-Smtp-Source: APBJJlEgMsbnQlEpC7AIysBE3EqDVlDLnNG1AaWLi6MDNW/FVVcuRxpaFON35Ui2Xu5tD4xU0RLM5A==
X-Received: by 2002:a05:6000:1289:b0:313:ecd3:7167 with SMTP id f9-20020a056000128900b00313ecd37167mr5545390wrx.42.1690754641719;
        Sun, 30 Jul 2023 15:04:01 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id u13-20020a5d514d000000b003172510d19dsm11132401wrt.73.2023.07.30.15.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 15:04:01 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, John Watts <contact@jookia.org>
Cc: Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-can@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject:
 Re: [PATCH v2 2/4] riscv: dts: allwinner: d1: Add CAN controller nodes
Date: Mon, 31 Jul 2023 00:03:59 +0200
Message-ID: <5694691.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <ZLzwaQlS-l_KKpUX@titan>
References:
 <20230721221552.1973203-2-contact@jookia.org>
 <20230721221552.1973203-4-contact@jookia.org> <ZLzwaQlS-l_KKpUX@titan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 23. julij 2023 ob 11:18:33 CEST je John Watts napisal(a):
> On Sat, Jul 22, 2023 at 08:15:51AM +1000, John Watts wrote:
> > ...
> > +			/omit-if-no-ref/
> > +			can0_pins: can0-pins {
> > +				pins = "PB2", "PB3";
> > +				function = "can0";
> > +			};
> > ...
> > +		can0: can@2504000 {
> > +			compatible = "allwinner,sun20i-d1-can";
> > +			reg = <0x02504000 0x400>;
> > +			interrupts = <SOC_PERIPHERAL_IRQ(21) 
IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&ccu CLK_BUS_CAN0>;
> > +			resets = <&ccu RST_BUS_CAN0>;
> > +			status = "disabled";
> > +		};
> 
> Just a quick late night question to people with more knowledge than me:
> 
> These chips only have one pinctrl configuration for can0 and can1. Should
> the can nodes have this pre-set instead of the board dts doing this?

Yes, that's usually how it's done.

> 
> I see this happening in sun4i-a10.dtsi for instance, but it also seems like
> it could become a problem when it comes to re-using the dtsi for newer chip
> variants.

Properties can be either rewritten or deleted further down, so don't worry 
about that.

Best regards,
Jernej

> 
> John.




