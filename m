Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3B82019C
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Aug 2023 22:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F55FC433C7
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Aug 2023 22:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692743950;
	bh=U15eYY76gsnD/RHRrRp2WW4I4OCWvlLasJey1YPS3bA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LptG0CQopdZ1GLfjhwk4NXk/NlJL/8yi6rWXX2Pcj8j79iGWyXUSITlvOZQycjSLh
	 prFjO4ia91ZqEKkGYJOIgCLPcL3sICW5KrdkfaUqViQtzQaSxpLqytOZ+iAjxzTd+e
	 GXg4CIOAmMlCRSF3Xg6cYlpR/6UIANTtwnQHhVdNdheZsoX4HFlD0aSY5ZxYIhNxe6
	 69V1QhSvY9M+lBURI+axdwpEVAXO2ocDua3SvXnkQph0sF/tb5km9O2wlY0087hCRi
	 tnDtHvLWWRPrEHNQcHK7QDQn424KSFkhUiBEUf0n4wdTqr4ohnqGszFZRvUUsCsk1D
	 8e+Fr6LZqezbA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50078e52537so4837671e87.1
        for <linux-sunxi@lists.linux.dev>; Tue, 22 Aug 2023 15:39:10 -0700 (PDT)
X-Gm-Message-State: AOJu0YwXCrS8z7nYe/OdGlT6jtul3oWpSjs4Gx/ig7Yvk5QbNiue1uiT
	dwcvo26Ae6jYOQsQ/BrWLhrBr54IgPADo5AFDA==
X-Google-Smtp-Source: AGHT+IF0JLsyZnXZQBcgCFuF2kEmLMhxys3SoS78ueuZDPswTtorzz1H8NCRQqi/aO+jact/25/WQ07MKCBccdqUsKI=
X-Received: by 2002:a2e:9919:0:b0:2bb:8d96:6041 with SMTP id
 v25-20020a2e9919000000b002bb8d966041mr7975933lji.45.1692743927592; Tue, 22
 Aug 2023 15:38:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230714175008.4064592-1-robh@kernel.org> <CAJZ5v0i-OByOSjpxrj5d9S9QHRySK-MEUo+bK_J_4ihsCBmnSg@mail.gmail.com>
 <CAL_JsqLy22S5bTFu-ZKXhSMtMPPq9z1Gdb5kJMVmhui55miDsQ@mail.gmail.com> <CAJZ5v0hM63nVphwkYK1bL4uf_dXSew2+LBuG9kuhvvLdrhLxAw@mail.gmail.com>
In-Reply-To: <CAJZ5v0hM63nVphwkYK1bL4uf_dXSew2+LBuG9kuhvvLdrhLxAw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 22 Aug 2023 17:38:32 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJGoDPLKgu8awJfuWpqzg8HOuruDa1z4s-Swb7Cm5OaJw@mail.gmail.com>
Message-ID: <CAL_JsqJGoDPLKgu8awJfuWpqzg8HOuruDa1z4s-Swb7Cm5OaJw@mail.gmail.com>
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

On Thu, Jul 20, 2023 at 1:50=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.or=
g> wrote:
>
> On Fri, Jul 14, 2023 at 9:53=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> >
> > On Fri, Jul 14, 2023 at 12:54=E2=80=AFPM Rafael J. Wysocki <rafael@kern=
el.org> wrote:
> > >
> > > On Fri, Jul 14, 2023 at 7:51=E2=80=AFPM Rob Herring <robh@kernel.org>=
 wrote:
> > > >
> > > > The DT of_device.h and of_platform.h date back to the separate
> > > > of_platform_bus_type before it as merged into the regular platform =
bus.
> > > > As part of that merge prepping Arm DT support 13 years ago, they
> > > > "temporarily" include each other. They also include platform_device=
.h
> > > > and of.h. As a result, there's a pretty much random mix of those in=
clude
> > > > files used throughout the tree. In order to detangle these headers =
and
> > > > replace the implicit includes with struct declarations, users need =
to
> > > > explicitly include the correct includes.
> > > >
> > > > Signed-off-by: Rob Herring <robh@kernel.org>
> > >
> > > Acked-by: Rafael J. Wysocki <rafael@kernel.org>
> > >
> > > or please let me know if you want me to pick this up.
> >
> > Single patch in your subsystem with no dependencies. Please pick it up.
>
> Done, thanks!

I'm not seeing this in linux-next.

Rob
