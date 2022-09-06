Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637B117D1
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Sep 2022 14:35:13 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1279948d93dso8806957fac.10
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Sep 2022 07:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=/kxQ4Wf8GnR3MVwBOujAJ+Hv9NvGQDMILNpayVx9ZUo=;
        b=zs7vitXpupqDgmnUYEwBZaGbzGHcZPxtOQkVwH3U+7tnvWROqJJz5JUt6qLnxJhkoT
         /LRxp2mb5oRPhQmRwd7+zbD9WSc4PHEYYQv/I2YjFycaI3Nf1p+YD5bdapl5jEJRBTnx
         47ZQ4M38eHdjlJcKx35q7B53OFZ1b0U64y3IJ8VvAaySMNlBmz6bI+1oafsxsVbJ2udu
         eAROXPA+bn6TENFfFIB3ACrCVe8LSIN5/2IFsdRt8t1mwxE7ulj4JQi6z0IWD7+e8AtG
         MK/bfLN7Lke1gjLog3KpU5ZpgW3suE30xFMTJc4JzY4ddRtbRvhQrSOSrC1w8Ge6tR/v
         t+gw==
X-Gm-Message-State: ACgBeo1Lxtkak8+EyvKFMQzp6oz38gkXJQEkelNgGR3545PKIpxWevWS
	KZ6wwBZ1GjgPcF/ScdN1Pw==
X-Google-Smtp-Source: AA6agR6/8rkfV5hK1hzRmCIqS5PFSgyizUYdaaaJmNYKCFgBxD4OCF+1PwIGz3teG7GN32hHgOxiaw==
X-Received: by 2002:a05:6870:6314:b0:10b:9595:62db with SMTP id s20-20020a056870631400b0010b959562dbmr11632116oao.128.1662474912399;
        Tue, 06 Sep 2022 07:35:12 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a3-20020a056870a18300b001278a63bfc9sm2169288oaf.1.2022.09.06.07.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 07:35:11 -0700 (PDT)
Received: (nullmailer pid 456502 invoked by uid 1000);
	Tue, 06 Sep 2022 14:35:10 -0000
Date: Tue, 6 Sep 2022 09:35:10 -0500
From: Rob Herring <robh@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Tim Harvey <tharvey@gateworks.com>, 
	Robert Jones <rjones@gateworks.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Heiko Stuebner <heiko@sntech.de>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Ripard <mripard@kernel.org>, 
	- <patches@opensource.cirrus.com>, Steve Twiss <stwiss.opensource@diasemi.com>, 
	Chris Zhong <zyw@rock-chips.com>, Zhang Qing <zhangqing@rock-chips.com>, 
	Alistair Francis <alistair@alistair23.me>, Amelie Delaunay <amelie.delaunay@foss.st.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Renner Berthing <kernel@esmil.dk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] dt-bindings: mfd: Add missing
 (unevaluated|additional)Properties on child nodes
Message-ID: <20220906143510.GA454672-robh@kernel.org>
References: <20220823145649.3118479-4-robh@kernel.org>
 <YxYH+POIURB9RO7T@google.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxYH+POIURB9RO7T@google.com>

On Mon, Sep 05, 2022 at 03:37:15PM +0100, Lee Jones wrote:
> On Tue, 23 Aug 2022, Rob Herring wrote:
> 
> > In order to ensure only documented properties are present, node schemas
> > must have unevaluatedProperties or additionalProperties set to false
> > (typically).
> > 
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../mfd/allwinner,sun6i-a31-prcm.yaml         | 40 +++++++++++++++++++
> >  .../mfd/allwinner,sun8i-a23-prcm.yaml         | 10 +++++
> >  .../bindings/mfd/cirrus,lochnagar.yaml        |  5 +++
> >  .../devicetree/bindings/mfd/dlg,da9063.yaml   |  7 ++--
> >  .../bindings/mfd/gateworks-gsc.yaml           |  5 ++-
> >  .../bindings/mfd/maxim,max14577.yaml          |  1 +
> >  .../bindings/mfd/maxim,max77843.yaml          |  1 +
> >  .../bindings/mfd/rockchip,rk817.yaml          |  2 +
> >  .../bindings/mfd/silergy,sy7636a.yaml         |  1 +
> >  .../bindings/mfd/st,stm32-lptimer.yaml        |  4 ++
> >  .../bindings/mfd/st,stm32-timers.yaml         |  3 ++
> >  .../devicetree/bindings/mfd/st,stmfx.yaml     |  1 +
> >  .../bindings/mfd/stericsson,ab8500.yaml       | 22 ++++++++++
> >  .../devicetree/bindings/mfd/ti,tps65086.yaml  |  1 +
> >  .../bindings/mfd/x-powers,axp152.yaml         |  1 +
> >  15 files changed, 100 insertions(+), 4 deletions(-)
> 
> What are your plans for this set?
> 
> Want me to merge it?

Yes, please.

Rob

