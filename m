Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEF82FA2E
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Jul 2023 18:50:31 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-98e1fc9d130so34611566b.0
        for <linux-sunxi@lists.linux.dev>; Thu, 20 Jul 2023 11:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689879029; x=1690483829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Ri7fimkcHumz6u7/WZYeGYX85HXnNnQ+B/CYo4XrX0=;
        b=mCUywKButJafrVMItF46wzRZOBO2EEEM+sjEUU49xKx+1mbJcIH1TqELqwDDjW+kW/
         O4xObB1N8loCcOayXdtjJHjmXgzsYR13yADnne+WbjPBbR3IDczghnysZNy8KJQfTydl
         XOp19kxDl6qn/+3odZMxrWAuSNczu9mf6O8euJLnH4tka3UTeqDhL4x5yMrH/T1wDVsX
         O/2RrLzI0jH4HcbSZqh/JC97+56yJpnaTl4RBu0lzQA5CywiMyB15WJKt/V94/ZwVBMU
         qfYr932fmBKgDheZn5AuzUwo5ZMDt0cu3i2zcDsUHv7sifXr1BB7fX0r29SXEWcCg/XC
         qBJA==
X-Gm-Message-State: ABy/qLZpTEO+7q2WsAbVbIGwDViMAbdKvlT+rwaK1J2fAzK13M+koiTv
	gn7c8ISZb368FqKEKPeA7Z8qi3FuJ/8TKEmK6K0=
X-Google-Smtp-Source: APBJJlHi91lqNeNV5b3NsqRozieOcqVx3nEK9H5IGaNOQgSl+w6cuVzQPslNMDSGV1xCPVo92lepZZT6y5Duc+GvbWI=
X-Received: by 2002:a17:906:7a11:b0:993:d90e:3101 with SMTP id
 d17-20020a1709067a1100b00993d90e3101mr2893837ejo.1.1689879029584; Thu, 20 Jul
 2023 11:50:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230714175008.4064592-1-robh@kernel.org> <CAJZ5v0i-OByOSjpxrj5d9S9QHRySK-MEUo+bK_J_4ihsCBmnSg@mail.gmail.com>
 <CAL_JsqLy22S5bTFu-ZKXhSMtMPPq9z1Gdb5kJMVmhui55miDsQ@mail.gmail.com>
In-Reply-To: <CAL_JsqLy22S5bTFu-ZKXhSMtMPPq9z1Gdb5kJMVmhui55miDsQ@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 20 Jul 2023 20:50:18 +0200
Message-ID: <CAJZ5v0hM63nVphwkYK1bL4uf_dXSew2+LBuG9kuhvvLdrhLxAw@mail.gmail.com>
Subject: Re: [PATCH] thermal: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Guillaume La Roque <glaroque@baylibre.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Markus Mayer <mmayer@broadcom.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 9:53=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Fri, Jul 14, 2023 at 12:54=E2=80=AFPM Rafael J. Wysocki <rafael@kernel=
.org> wrote:
> >
> > On Fri, Jul 14, 2023 at 7:51=E2=80=AFPM Rob Herring <robh@kernel.org> w=
rote:
> > >
> > > The DT of_device.h and of_platform.h date back to the separate
> > > of_platform_bus_type before it as merged into the regular platform bu=
s.
> > > As part of that merge prepping Arm DT support 13 years ago, they
> > > "temporarily" include each other. They also include platform_device.h
> > > and of.h. As a result, there's a pretty much random mix of those incl=
ude
> > > files used throughout the tree. In order to detangle these headers an=
d
> > > replace the implicit includes with struct declarations, users need to
> > > explicitly include the correct includes.
> > >
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> >
> > Acked-by: Rafael J. Wysocki <rafael@kernel.org>
> >
> > or please let me know if you want me to pick this up.
>
> Single patch in your subsystem with no dependencies. Please pick it up.

Done, thanks!
