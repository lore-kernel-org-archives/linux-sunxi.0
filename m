Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099E61B7E
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Feb 2022 22:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E27C340EB
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Feb 2022 22:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644965687;
	bh=vp0AA5rWNWbwH+h7RrfOW+1FW77YNO31CyLQUGfkQek=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O7YmiHdRN42sM4gvL2lbM6ClrcRD+cTL7w57yMliGe4DAMEipI+vuAnCb55nPmcZR
	 fzbuwyxgelCSrtKvWAhYndOsyzcEL1SDfwGeGAKrthpCkrpLG31+QnbBoZWQqNxuc3
	 4tO/1MH/RCx0Yb66mE9UVgwLcok/4ntQB7Zhy3RaIqL2mNSti2u95TOj5A7UoNGBMr
	 CdEhfaNVgtUR27Hnk/Ke9LDbcxTd7Fe4gZbYj9um6/+Ic0e5Mh2j7iqm7G7sLu6+io
	 TJOwAqy8sUzCuAWexlPQlJWyzOAW1ZWmfDUJviEDpgnoaMisi0YGVwZPXpJRuXT5AT
	 4A3UOmhufMWkQ==
Received: by mail-lj1-f176.google.com with SMTP id bx31so736190ljb.0
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Feb 2022 14:54:47 -0800 (PST)
X-Gm-Message-State: AOAM5326culfsXi6vSzff4i6yeQql1FiZgrPe471MM1AC7SchdCpCC5z
	IE6lPFNw4R6LImSGRu0eAmwZus/Kgd+kDcVcBg==
X-Google-Smtp-Source: ABdhPJwIhjgFezkhGh/JThuKg8ThIEnytIpHYE2ZFs4zMkn1bSCelwpeUJLERmuj2x6h/ToJGmqArMx73XuAI+0Vol0=
X-Received: by 2002:a05:6402:5242:b0:40f:6a4f:ff33 with SMTP id
 t2-20020a056402524200b0040f6a4fff33mr126833edd.30.1644965675039; Tue, 15 Feb
 2022 14:54:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 15 Feb 2022 16:54:23 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+bfr=csxzKN3T=tBY7bZ6Gny+sm5xtMP8nmyiD3joNFg@mail.gmail.com>
Message-ID: <CAL_Jsq+bfr=csxzKN3T=tBY7bZ6Gny+sm5xtMP8nmyiD3joNFg@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] pwm: dt-bindings: Include generic pwm schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Lee Jones <lee.jones@linaro.org>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	"maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Heiko Stuebner <heiko@sntech.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>, Rahul Tanwar <rtanwar@maxlinear.com>, 
	Jeff LaBundy <jeff@labundy.com>, Sagar Kadam <sagar.kadam@sifive.com>, Vignesh R <vigneshr@ti.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Linux PWM List <linux-pwm@vger.kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 14, 2022 at 3:22 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Hi,
>
> Changes since v1:
> 1. Add tags.
> 2. Adjust subject (Uwe).
>
> Best regards,
> Krzysztof
>
> Krzysztof Kozlowski (15):
>   dt-bindings: pwm: allwinner,sun4i-a10: Include generic pwm schema
>   dt-bindings: pwm: imx: Include generic pwm schema
>   dt-bindings: pwm: intel,lgm: Include generic pwm schema
>   dt-bindings: pwm: iqs620a: Include generic pwm schema
>   dt-bindings: pwm: mxs: Include generic pwm schema
>   dt-bindings: pwm: rockchip: Include generic pwm schema
>   dt-bindings: pwm: sifive: Include generic pwm schema
>   dt-bindings: pwm: renesas,pwm: Include generic pwm schema
>   dt-bindings: pwm: toshiba,visconti: Include generic pwm schema
>   dt-bindings: pwm: brcm,bcm7038: Do not require pwm-cells twice
>   dt-bindings: pwm: intel,keembay: Do not require pwm-cells twice
>   dt-bindings: pwm: samsung: Do not require pwm-cells twice
>   dt-bindings: pwm: tiecap: Do not require pwm-cells twice
>   dt-bindings: pwm: tiehrpwm: Do not require pwm-cells twice
>   dt-bindings: pwm: renesas,tpu: Do not require pwm-cells twice

For the series:

Reviewed-by: Rob Herring <robh@kernel.org>
