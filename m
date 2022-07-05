Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8886022
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Jul 2022 20:28:35 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id r133so12245451iod.3
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Jul 2022 13:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=SaypPa2UN7YAKRNdvopBZ88Wz+LgeGmrvVofkpjWV/M=;
        b=5ytRABqqDzQApdAwg+thn6IxsrnRoyEiDP8XYSlljXY4qULtmEY3a/l9SctUnV2QVj
         gncDa7/ARdBGr9VolVX06AxMSdibdJRSV4BxABeZKR0+ZSi92BSdDhUnmz8WXbXQ2cWI
         3y1hYRfcILtkHjNuWTj3L49i12MXNuxv39sUsfacD62HWxTuFjTG2FdZehmrEq8M2UQ+
         TFQcGAUbhaMwkoCB25ebEVdDG9GEepr9KivocePv4/dah9XtKI5OPwoT+43Acg3hOUKp
         rRHz7VPLBX3qvKvZ/ufTNTJZQj39eicRcCyArdO7vo2l7IiPPIz+wpqYj0Mh64N6Urbs
         uzhg==
X-Gm-Message-State: AJIora9+NiRfAez2WWJPE9lu7eFLqPP+/8bjYvv3F4/4+pwRAgLFJ08N
	E1q+yuMcer5m/TIgI6OS6g==
X-Google-Smtp-Source: AGRyM1s10kfU9RWJJPfL6HqFC30mwyWv5jIBxtvyb4UhOhX1Ds2bGKDJOeRnPv4JmBoCUjuE502fOw==
X-Received: by 2002:a02:9f09:0:b0:339:e88d:f9bd with SMTP id z9-20020a029f09000000b00339e88df9bdmr23494080jal.298.1657052914263;
        Tue, 05 Jul 2022 13:28:34 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id o7-20020a056e02114700b002dc258e3093sm1016417ill.64.2022.07.05.13.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 13:28:33 -0700 (PDT)
Received: (nullmailer pid 2569771 invoked by uid 1000);
	Tue, 05 Jul 2022 20:28:31 -0000
Date: Tue, 5 Jul 2022 14:28:31 -0600
From: Rob Herring <robh@kernel.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: dma: allwinner,sun50i-a64-dma: Fix min/max
 typo
Message-ID: <20220705202831.GA2566864-robh@kernel.org>
References: <20220702031903.21703-1-samuel@sholland.org>
 <22696538.6Emhk5qWAg@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <22696538.6Emhk5qWAg@jernej-laptop>

On Sat, Jul 02, 2022 at 09:34:41PM +0200, Jernej Škrabec wrote:
> Dne sobota, 02. julij 2022 ob 05:19:02 CEST je Samuel Holland napisal(a):
> > The conditional block for variants with a second clock should have set
> > minItems, not maxItems, which was already 2. Since clock-names requires
> > two items, this typo should not have caused any problems.
> > 
> > Fixes: edd14218bd66 ("dt-bindings: dmaengine: Convert Allwinner A31 and A64
> > DMA to a schema") Signed-off-by: Samuel Holland <samuel@sholland.org>
> > ---
> > 
> >  .../devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml       | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
> > b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml index
> > ff0a5c58d78c..e712444abff1 100644
> > --- a/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
> > +++ b/Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml
> > @@ -67,7 +67,7 @@ if:
> >  then:
> >    properties:
> >      clocks:
> > -      maxItems: 2
> > +      minItems: 2
> 
> These specific variants have exactly 2 clocks. Having both limits seems right.

You do. The main section has 2 for the max.

Rob
