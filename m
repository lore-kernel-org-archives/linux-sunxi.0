Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAF43FC1
	for <linux-sunxi@lists.linux.dev>; Wed,  1 Sep 2021 23:16:39 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id e18so129561qvo.1
        for <linux-sunxi@lists.linux.dev>; Wed, 01 Sep 2021 16:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1Y+GVokmV9xV7i0Kbyl+zT81HcVIXennIBiGTGbWIfQ=;
        b=Ss78CZppoDiVB5zdMTBxQWBVResulcnOWqd8Qi3UkjhRlNgSbjSTQDveLQ4owdMFOd
         mgwlrVIyuyDeGaBwBWxBoZvXlIJfVMzhnF2/tIAtLNZqNqrIQMexqtyQHl+M/z23jDJt
         /l6kSthz2Kvx8zBGuz1IIWMUwzkcbS3DLX0UM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1Y+GVokmV9xV7i0Kbyl+zT81HcVIXennIBiGTGbWIfQ=;
        b=QvCKcAZkf4GCt5MpLDbM4tsxzn165kwJpI+jyNEmQjjpbjjin/xYAwyq8f1mZFaUl1
         0bh4EEgU4rPc4GJdguvvmYwHPmSzsv7Hq6LN6pihjQQcRPl+Olhasi8ppY5cWFnnuKtf
         m/kVFrJ7jmdKwWyeSPBuL6jRZBuy9OlW2Vf99pMd16i1biemhluccmT+JBa1/DJgTDXD
         hQxVhBj35T7WazJHYVXdCcLpAQn5yPYtlv7YGosepbVlO/PFl3rfLlPI4uz6EzvK3IUG
         Ja1gGxLtejAACmjaOCjhOOmgikuASyikuVePCGt9Mo/9X6HRtPHgYI4cNyFJD21Jidjd
         33Nw==
X-Gm-Message-State: AOAM531HRtx2FtbpRhfI+4X7/82BZ/fa47FDuM4V4a+lIH4Qdfua03/U
	UgncI1TNhRrMQLPIyd13V3ZInJh6cka+IQ==
X-Google-Smtp-Source: ABdhPJy5R9XaOKQwiOFFS0ZOLmHaU1MCIjCxgFNxc62pjQ6svA9IcxbgfhcvmarUIvOXiO53wPWQCg==
X-Received: by 2002:a0c:ac4a:: with SMTP id m10mr51646qvb.37.1630538198647;
        Wed, 01 Sep 2021 16:16:38 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id i19sm104103qka.53.2021.09.01.16.16.38
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 16:16:38 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id r21so2400qtw.11
        for <linux-sunxi@lists.linux.dev>; Wed, 01 Sep 2021 16:16:38 -0700 (PDT)
X-Received: by 2002:a02:ca0b:: with SMTP id i11mr277172jak.84.1630537827704;
 Wed, 01 Sep 2021 16:10:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210901201934.1084250-1-dianders@chromium.org>
 <20210901131531.v3.6.I02250cd7d4799661b068bcc65849a456ed411734@changeid> <CAOesGMjp4pscuxciHZo7br-acgbkZSdRA_mUWNpcz0OfF7zOSA@mail.gmail.com>
In-Reply-To: <CAOesGMjp4pscuxciHZo7br-acgbkZSdRA_mUWNpcz0OfF7zOSA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 1 Sep 2021 16:10:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WPXAUyuAHb1jKx9F_aw+JGX4MWB3or=Eq5rXoKY=OQMw@mail.gmail.com>
Message-ID: <CAD=FV=WPXAUyuAHb1jKx9F_aw+JGX4MWB3or=Eq5rXoKY=OQMw@mail.gmail.com>
Subject: Re: [PATCH v3 06/16] ARM: configs: Everyone who had PANEL_SIMPLE now
 gets PANEL_SIMPLE_EDP
To: Olof Johansson <olof@lixom.net>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Sam Ravnborg <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Linus W <linus.walleij@linaro.org>, 
	Daniel Vetter <daniel@ffwll.ch>, DTML <devicetree@vger.kernel.org>, 
	Steev Klimaszewski <steev@kali.org>, Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@linux.ie>, DRI mailing list <dri-devel@lists.freedesktop.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>, Anson Huang <Anson.Huang@nxp.com>, 
	Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Corentin Labbe <clabbe@baylibre.com>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Dmitry Osipenko <digetx@gmail.com>, 
	Emil Velikov <emil.velikov@collabora.com>, Eugen Hristev <eugen.hristev@microchip.com>, 
	Fabio Estevam <festevam@gmail.com>, Fabrice Gasnier <fabrice.gasnier@st.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Joel Stanley <joel@jms.id.au>, Jonathan Hunter <jonathanh@nvidia.com>, Kees Cook <keescook@chromium.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Lionel Debieve <lionel.debieve@st.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	=?UTF-8?Q?Martin_J=C3=BCcker?= <martin.juecker@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Olivier Moysan <olivier.moysan@st.com>, Otavio Salvador <otavio@ossystems.com.br>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Razvan Stefanescu <razvan.stefanescu@microchip.com>, 
	Robert Richter <rric@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Stefan Wahren <stefan.wahren@i2se.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Tony Lindgren <tony@atomide.com>, Tudor Ambarus <tudor.ambarus@microchip.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Vladimir Zapolskiy <vz@mleia.com>, 
	Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-omap <linux-omap@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, linux-sunxi@lists.linux.dev, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, Sep 1, 2021 at 2:12 PM Olof Johansson <olof@lixom.net> wrote:
>
> On Wed, Sep 1, 2021 at 1:20 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > In the patch ("drm/panel-simple-edp: Split eDP panels out of
> > panel-simple") we split the PANEL_SIMPLE driver in 2. By default let's
> > give everyone who had the old driver enabled the new driver too. If
> > folks want to opt-out of one or the other they always can later.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Isn't this a case where the new option should just have had the old
> option as the default value to avoid this kind of churn and possibly
> broken platforms?

I'm happy to go either way. I guess I didn't do that originally
because logically there's not any reason to link the two drivers going
forward. Said another way, someone enabling the "simple panel" driver
for non-eDP panels wouldn't expect that the "simple panel" driver for
DP panels would also get enabled by default. They really have nothing
to do with one another. Enabling by default for something like this
also seems like it would lead to bloat. I could have sworn that
periodically people get yelled at for marking drivers on by default
when it doesn't make sense.

...that being said, I'm happy to change the default as you suggest.
Just let me know.

-Doug
