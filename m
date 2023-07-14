Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E414134CB
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Jul 2023 19:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19ECCC433C7
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Jul 2023 19:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689364412;
	bh=DnEjVGiuXfP3swFolvK4a+TN59hjw2gEVcLZQUXBvDY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aIPLupLCnmiJUXvWHy6NqouLuLJir5A/dM1QUVxxnNpH6FnBOUB5mdpGBT3rXkt2m
	 aUSZ/mFfRp3oFmQUD8gDydqrGd3XyV0vWnTzb9QFpRjDdRFy7EHIOrIsFRckkqURYP
	 I3j797rnAu1uLr2TbsR2Znq0qOEt3qP99q+elcv0NSMyIq5qD2grr4jjWefblqDSBF
	 BD58k3Rijh7xFRuXniyk3pwt7wsOCkPx5Seg4pjt4LSpIVV6qeVQkLQ+e6FxkEJrbt
	 dUQcKDIBo2CtAm04ghqqfNNybTQNE5T3zO7acOlsS4251uhiC+Pmz9aVB6PAgWehp2
	 ER5ex+Mqs5VLw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4fa16c6a85cso3869859e87.3
        for <linux-sunxi@lists.linux.dev>; Fri, 14 Jul 2023 12:53:32 -0700 (PDT)
X-Gm-Message-State: ABy/qLbwEKLpKRdynQ6y/jF0hq/o5ppTa580kOiD31HL1g1+wmvUFG1w
	3dcw6GudXq0UDoCtXFXpkLGjapCw2cRpOLS5qg==
X-Google-Smtp-Source: APBJJlFIVq6SSfDGp/7zlzMmel1HUM1zDWT3EoUpkE1rCFI61SUoU0+rrNxJc3PIb6p4Jh4x1E4RyP9tWO4eKUbbP0E=
X-Received: by 2002:a2e:9a8a:0:b0:2b4:765b:f6ee with SMTP id
 p10-20020a2e9a8a000000b002b4765bf6eemr4915096lji.41.1689364389871; Fri, 14
 Jul 2023 12:53:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230714175008.4064592-1-robh@kernel.org> <CAJZ5v0i-OByOSjpxrj5d9S9QHRySK-MEUo+bK_J_4ihsCBmnSg@mail.gmail.com>
In-Reply-To: <CAJZ5v0i-OByOSjpxrj5d9S9QHRySK-MEUo+bK_J_4ihsCBmnSg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 14 Jul 2023 13:52:57 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLy22S5bTFu-ZKXhSMtMPPq9z1Gdb5kJMVmhui55miDsQ@mail.gmail.com>
Message-ID: <CAL_JsqLy22S5bTFu-ZKXhSMtMPPq9z1Gdb5kJMVmhui55miDsQ@mail.gmail.com>
Subject: Re: [PATCH] thermal: Explicitly include correct DT includes
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Guillaume La Roque <glaroque@baylibre.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
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

On Fri, Jul 14, 2023 at 12:54=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.o=
rg> wrote:
>
> On Fri, Jul 14, 2023 at 7:51=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> >
> > The DT of_device.h and of_platform.h date back to the separate
> > of_platform_bus_type before it as merged into the regular platform bus.
> > As part of that merge prepping Arm DT support 13 years ago, they
> > "temporarily" include each other. They also include platform_device.h
> > and of.h. As a result, there's a pretty much random mix of those includ=
e
> > files used throughout the tree. In order to detangle these headers and
> > replace the implicit includes with struct declarations, users need to
> > explicitly include the correct includes.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> Acked-by: Rafael J. Wysocki <rafael@kernel.org>
>
> or please let me know if you want me to pick this up.

Single patch in your subsystem with no dependencies. Please pick it up.

Rob
