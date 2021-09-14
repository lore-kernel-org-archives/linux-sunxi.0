Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA76C3FC3
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Sep 2021 22:12:35 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id a4so1606877lfg.8
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Sep 2021 15:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LAvaIUH5OlRWAZQfOb+bWm3uVreewxT3eR+cClts1uI=;
        b=VLrCs/+hNIGuWHNfFM8FPpo9MdASxRdZfjTQbnUJQyNoarhnB48pzOHj92Uv+amr9p
         ixzRcYtYvH4tHeMTkq392YF521gX9qRP6RXpjY/MbnIpiM/U1DAP4rT3mhItZ+smgYPC
         HAnvOKCP691XE//yBgTqBGfOzo3Xk8LHh+rXW30yKTdtiIQEgJZOMlPkWV+fJ3uxpW4R
         nToOeYf0EHRW6z3YX/fLoUtleulbtYB1Liz6pppbcIZmFmkKstGWGpmXGDPpdxxXQDOO
         To6zI2pt1uDGWX1qSHzdUDUBiwjbHPMgxHrVOk9ocyyjcFoQBRhXrj0omC1wbF+Moi96
         n6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LAvaIUH5OlRWAZQfOb+bWm3uVreewxT3eR+cClts1uI=;
        b=O8u9aBlLX2/q2XoPr3PFo6HTQMMMz7Pk+9uYB4Adhe0OxRJSX7eTVCRNYPRJtMaRYu
         zr0ApmaJQ1KXIYQx2mA0Fqs7u4x3SjNEaorrpW2cSYfnuvsF5knjDBe4Crqi9Kv+khxy
         CDOZelRz2NNP7vdiSy14MH/zMNUjmpxMiugegMXH0wJX/uX6jjhsVHcTMr+oqEZV4HD6
         K3lqtXTtYeW1dfklXLdFY8Z18dSOZ0c2OzzLdTXo0A08OOiMKLjQohheQbVU8R78NDgT
         aSv4LwbZSM3rzi4d1eJdZ82fQEq/hOeL1R2Go//NbLo7BSv1DnpTh6Lb4w59p6I5OQ1P
         YFfA==
X-Gm-Message-State: AOAM531EsMYibEITwI+9cy3CxoGN2ChZTcl3eSwqH/oOMhjQP1Xmruw8
	XPxAMeqVgw9GwqiIU3VM0VZqlrHxlvP9dRCcPKf+wg==
X-Google-Smtp-Source: ABdhPJwu3ztXRgAHEffeDYZFOfptVugQFO781IvsJ0Ym9L4qfm8T9QJBx3b1mwEoJsYA+Z6NYJX/ewEtSqtF71Fz60g=
X-Received: by 2002:a05:6512:132a:: with SMTP id x42mr14797863lfu.291.1631657553855;
 Tue, 14 Sep 2021 15:12:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210914202202.1702601-1-dianders@chromium.org>
In-Reply-To: <20210914202202.1702601-1-dianders@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Sep 2021 00:12:22 +0200
Message-ID: <CACRpkdaTb4_UfFzCqw=fiAnQhHD+1sDDua529KdGQbgMVfjYBw@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] eDP: Support probing eDP panels dynamically
 instead of hardcoding
To: Douglas Anderson <dianders@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Sam Ravnborg <sam@ravnborg.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>, 
	"open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, MSM <linux-arm-msm@vger.kernel.org>, 
	David Airlie <airlied@linux.ie>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>, Adam Ford <aford173@gmail.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>, Anson Huang <Anson.Huang@nxp.com>, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Chen-Yu Tsai <wens@csie.org>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Corentin Labbe <clabbe@baylibre.com>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Dmitry Osipenko <digetx@gmail.com>, Emil Velikov <emil.velikov@collabora.com>, 
	Enric Balletbo i Serra <enric.balletbo@collabora.com>, Eugen Hristev <eugen.hristev@microchip.com>, 
	Fabio Estevam <festevam@gmail.com>, Fabrice Gasnier <fabrice.gasnier@st.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
	Jagan Teki <jagan@amarulasolutions.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Joel Stanley <joel@jms.id.au>, Jonathan Hunter <jonathanh@nvidia.com>, Kees Cook <keescook@chromium.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
	Lionel Debieve <lionel.debieve@st.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	=?UTF-8?Q?Martin_J=C3=BCcker?= <martin.juecker@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Michael Walle <michael@walle.cc>, 
	NXP Linux Team <linux-imx@nxp.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Nishanth Menon <nm@ti.com>, Olivier Moysan <olivier.moysan@st.com>, 
	Otavio Salvador <otavio@ossystems.com.br>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Razvan Stefanescu <razvan.stefanescu@microchip.com>, Robert Richter <rric@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Tony Lindgren <tony@atomide.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Vladimir Zapolskiy <vz@mleia.com>, Will Deacon <will@kernel.org>, 
	William Cohen <wcohen@redhat.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-sunxi@lists.linux.dev, 
	linux-tegra <linux-tegra@vger.kernel.org>, =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 14, 2021 at 10:22 PM Douglas Anderson <dianders@chromium.org> wrote:

> Version 5 of this series just fixes the panel ID encode macro to be
> cleaner and adds Jani's review tags.
>
> It could possibly be ready to land?

Definitely IMO, the kernel look so much better after this change,
so for the series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
