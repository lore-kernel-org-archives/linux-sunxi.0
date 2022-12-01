Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911047C
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Dec 2022 03:45:59 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id n205so805421oib.1
        for <linux-sunxi@lists.linux.dev>; Wed, 30 Nov 2022 19:45:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykrUdgnpt//KI390EfyviTWw7fKUM7t8IqT8KivZw44=;
        b=2kRxShHQvu3UmhUmM7yLqeIf1ZQl9MkGVhXBQheSm08Tg2dX6r4j0zImpAcyic2el+
         58pFpgfLCEp9m49QT8vy+zNZpl14WIQSZe7r8O90VmP1/Bsn05pU0ui7t68UvbI746sE
         icoW2EZFAYbEmQQTYaqX08PFombcGd5IxTnIiYW+LmHEzbfxfE2uEKBhLpgB53oWtdqt
         OwQLY+VtWQzbiMFI6sp3tlp4jB6AnIofjwYP+lWD3yCqSW2oAozmZbbq+COYqFlX7sGB
         oP0AZofeY4xh82FMUiAMwbsgCCQzJ6x+m5Cd/tt2Go05jDjXkqyOz8DpzDua90S4Pxrf
         ZDFA==
X-Gm-Message-State: ANoB5plGgZygWfURVY/EkUuEtNnV/Hh03TFVVd5RXrUxZcc9Pa0PaKWK
	FIeAvDAEP3QJC1uWekQXhA==
X-Google-Smtp-Source: AA0mqf5WCmFLREdSlYC9qzJRKrm7hw0V931v+JMD58V5b6VI64AQhK6aDD8+l29/3c1aTaLsQwxYJg==
X-Received: by 2002:aca:2201:0:b0:354:fe21:a47c with SMTP id b1-20020aca2201000000b00354fe21a47cmr32279869oic.10.1669866358423;
        Wed, 30 Nov 2022 19:45:58 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 17-20020a9d0611000000b006605883eae6sm1630945otn.63.2022.11.30.19.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 19:45:58 -0800 (PST)
Received: (nullmailer pid 3605657 invoked by uid 1000);
	Thu, 01 Dec 2022 03:45:57 -0000
Date: Wed, 30 Nov 2022 21:45:57 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: net: sun8i-emac: Fix snps,dwmac.yaml
 inheritance
Message-ID: <20221201034557.GA2998157-robh@kernel.org>
References: <20221125202008.64595-1-samuel@sholland.org>
 <20221125202008.64595-3-samuel@sholland.org>
 <5b05317d-28cc-bfc8-f415-e6acf453dc7c@linaro.org>
 <20221126142735.47dcca6d@slackpad.lan>
 <99c3e666-ec26-07a0-be40-0177dd449d84@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99c3e666-ec26-07a0-be40-0177dd449d84@linaro.org>

On Sat, Nov 26, 2022 at 03:48:33PM +0100, Krzysztof Kozlowski wrote:
> On 26/11/2022 15:28, Andre Przywara wrote:
> > On Sat, 26 Nov 2022 14:26:25 +0100
> > Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> > 
> > Hi,
> > 
> >> On 25/11/2022 21:20, Samuel Holland wrote:
> >>> The sun8i-emac binding extends snps,dwmac.yaml, and should accept all
> >>> properties defined there, including "mdio", "resets", and "reset-names".
> >>> However, validation currently fails for these properties because the  
> >>
> >> validation does not fail:
> >> make dt_binding_check -> no problems
> >>
> >> Maybe you meant that DTS do not pass dtbs_check?
> > 
> > Yes, that's what he meant: If a board actually doesn't have Ethernet
> > configured, dt-validate complains. I saw this before, but didn't find
> > any solution.
> > An example is: $ dt-validate ... sun50i-a64-pinephone-1.2.dtb
> > arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.2.dtb:
> >   ethernet@1c30000: Unevaluated properties are not allowed ('resets', 'reset-names', 'mdio' were unexpected)
> >   From schema: Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> > 
> > Why exactly is beyond me, but this patch removes this message.
> 
> I don't think this should be fixed like this. That's the problem of
> dtschema (not ignoring fully disabled nodes) and such patch only moves
> from one correct syntax to another correct syntax, which fixes dtschema
> problem, but changes nothing here.

Humm, it looks to me like the 'phy-mode' required in snps,dwmac.yaml 
causes the problem, but I can't get a minimized example to fail. 
Something in 'required' shouldn't matter. Definitely seems like an issue 
in the jsonschema package. I'll keep looking at it.

Rob
