Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CECE525F
	for <linux-sunxi@lists.linux.dev>; Fri, 24 Mar 2023 11:09:42 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id d17so1361480wrb.11
        for <linux-sunxi@lists.linux.dev>; Fri, 24 Mar 2023 04:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679656180;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :references:from:to:cc:subject:date:message-id:reply-to;
        bh=KKGzHAjESOwY5CJ6aIkXRblEUT9vcmLWXQ+M0lRFaT8=;
        b=hzyILuXnSZ7lMaDYB5rhB/bnNUkufwU6fB5inzHRnGwGUpJquemA3X84Lzp++Y2YJ+
         xX92fJNLk8xQHwS1+YxTda7OSm5DtCOvp4pDLhNSgUC+z/fJXup9nphjXvyJHgvtZySv
         Ing1oEJUNGaC5fkPShiXmhVhP4ZVm14D3SAO1J3Mw26nhpiPZuGPtANkaXRqnth94OzX
         eWmkntp/5aW21aNCDZJKirG9vn5GmZabE2CYZSk/g1dEY9qxrgIgg/yw5kqOFSzwoNBS
         JwX3UeufEHb7ANEt7KtJeAKptHBPlTmLr2bfmp8WEFpNkr4PD3Q/FNi6OhewGezr1Z61
         Chlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679656180;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :references:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKGzHAjESOwY5CJ6aIkXRblEUT9vcmLWXQ+M0lRFaT8=;
        b=Jf0g8RzPD1wGxXwF7jd5eZZd0iur1Xz1Yt+TuVFSEZ0kFwrTA1xcwiZi0uaoQF2g5f
         0MlnuVnLexZs7xWd14udDL2mxYs4beTSwbWQg6GzZ6yKuVTUNcwSQBWsOmZ0RckxOKKJ
         1/IDqMBo5XJ5apypri1lLjSf6ZkVfkhNoIF/9gOFYnMbumvYJRizZWhTMpiYksh72y1P
         peMDvnNexh+GWaxy41PIad7vU70qWdYGmlXxtrYRM60FWwTGA/SLE23E145MEYSo7H6e
         3aLI2hvNi9K6Id2Bp+bzaltpuVb9CL/j8J9DqfdxCSA+nihimwnKDl6+Qyavvbrup1nc
         PqCw==
X-Gm-Message-State: AAQBX9c0ztGrU/TPEM9AfSypZUNxUlPsPa3v4vCZHi4QX2ndZiG6/9w5
	jFzr4OPpjFsbxUQ417Ap/Cw=
X-Google-Smtp-Source: AKy350ZmBQJTJNYHdzNhp0Qvsm2ha5bci7Pffhjn47i2N4HkGJnSU/0GajVbD8LVTLhlg10uq2ysNw==
X-Received: by 2002:a5d:6290:0:b0:2da:53e3:57cf with SMTP id k16-20020a5d6290000000b002da53e357cfmr1959487wru.71.1679656180460;
        Fri, 24 Mar 2023 04:09:40 -0700 (PDT)
Received: from localhost (188.28.8.105.threembb.co.uk. [188.28.8.105])
        by smtp.gmail.com with ESMTPSA id a8-20020a056000100800b002d8566128e5sm9760336wrx.25.2023.03.24.04.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 04:09:39 -0700 (PDT)
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-56-f6736dec138e@cerno.tech>
 <80VTKR.CE8RVN8M3ZYK3@crapouillou.net>
 <20221104145946.orsyrhiqvypisl5j@houat>
 <cp7Yh29ndlOOi1yW8KwCcpzoLPLxm1vR@localhost>
 <20221107085417.xrsh6xy3ouwdkp4z@houat>
 <ucJ6KSBqdPTxfxUQqLUr9C9RGiQRnY1I@localhost>
 <20221109110045.j24vwkaq3s4yzoy3@houat>
 <06a293adc75990ed3e297b076fc38d8a.sboyd@kernel.org>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Maxime Ripard <maxime@cerno.tech>, Paul Cercueil <paul@crapouillou.net>,
    Maxime Coquelin <mcoquelin.stm32@gmail.com>, Chen-Yu Tsai
 <wens@csie.org>,
    Daniel Vetter <daniel@ffwll.ch>, Nicolas Ferre
 <nicolas.ferre@microchip.com>,
    Thierry Reding <thierry.reding@gmail.com>, Jaroslav Kysela
 <perex@perex.cz>,
    Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
    Ulf Hansson <ulf.hansson@linaro.org>, Claudiu Beznea
 <claudiu.beznea@microchip.com>,
    Michael Turquette <mturquette@baylibre.com>, Dinh Nguyen
 <dinguyen@kernel.org>,
    Chunyan Zhang <zhang.lyra@gmail.com>, Manivannan Sadhasivam
 <mani@kernel.org>,
    Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Jonathan Hunter
 <jonathanh@nvidia.com>,
    Abel Vesa <abelvesa@kernel.org>, Charles Keepax
 <ckeepax@opensource.cirrus.com>,
    Alessandro Zummo <a.zummo@towertech.it>, Peter De Schrijver
 <pdeschrijver@nvidia.com>,
    Orson Zhai <orsonzhai@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
    Prashant Gaikwad <pgaikwad@nvidia.com>, Liam Girdwood
 <lgirdwood@gmail.com>,
    Alexandre Belloni <alexandre.belloni@bootlin.com>,
    Samuel Holland <samuel@sholland.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
    Richard Fitzgerald <rf@opensource.cirrus.com>, Vinod Koul
 <vkoul@kernel.org>,
    NXP Linux Team <linux-imx@nxp.com>, Sekhar Nori <nsekhar@ti.com>,
    Kishon Vijay Abraham I <kishon@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>,
    Takashi Iwai <tiwai@suse.com>, David Airlie <airlied@gmail.com>,
    Luca Ceresoli <luca.ceresoli@bootlin.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>,
    Pengutronix Kernel Team <kernel@pengutronix.de>,
    Baolin Wang <baolin.wang@linux.alibaba.com>, David Lechner
 <david@lechnology.com>,
    Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
    Max Filippov <jcmvbkbc@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>,
    linux-stm32@st-md-mailman.stormreply.com, alsa-devel@alsa-project.org,
    linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
    linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
    linux-actions@lists.infradead.org, linux-clk@vger.kernel.org,
    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
    patches@opensource.cirrus.com, linux-tegra@vger.kernel.org,
    linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
    linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
    dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 56/65] clk: ingenic: cgu: Switch to determine_rate
Date: Thu, 23 Mar 2023 15:35:30 +0000
In-reply-to: <06a293adc75990ed3e297b076fc38d8a.sboyd@kernel.org>
Message-ID: <xpKMzGb1sOsucWMTlJIMzrT5KjLlZ7JP@localhost>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


Stephen Boyd <sboyd@kernel.org> writes:

> Quoting Maxime Ripard (2022-11-09 03:00:45)
>> On Mon, Nov 07, 2022 at 08:57:22PM +0000, Aidan MacDonald wrote:
>> >
>> > Maxime Ripard <maxime@cerno.tech> writes:
>> >
>> > > Hi,
>> > >
>> > > On Fri, Nov 04, 2022 at 05:35:29PM +0000, Aidan MacDonald wrote:
>> >
>> > Assigning the parent clock in the DT works once, at boot, but going off
>> > what you wrote in the commit message, if the clock driver has a
>> > .determine_rate() implementation that *can* reparent clocks then it
>> > probably *will* reparent them, and the DT assignment will be lost.
>>
>> Yes, indeed, but assigned-clock-parents never provided any sort of
>> guarantee on whether or not the clock was allowed to reparent or not.
>> It's just a one-off thing, right before probe, and a clk_set_parent()
>> call at probe will override that just fine.
>>
>> Just like assigned-clock-rates isn't permanent.
>>
>> > What I'm suggesting is a runtime constraint that the clock subsystem
>> > would enforce, and actively prevent drivers from changing the parent.
>> > Either explicitly with clk_set_parent() or due to .determine_rate().
>> >
>> > That way you could write a .determine_rate() implementation that *can*
>> > select a better parent, but if the DT applies a constraint to fix the
>> > clock to a particular parent, the clock subsystem will force that parent
>> > to be used so you can be sure the clock is never reparented by accident.
>>
>> Yeah, that sounds like a good idea, and CLK_SET_RATE_NO_REPARENT isn't
>> too far off from this, it's just ignored by clk_set_parent() for now. I
>> guess we could rename CLK_SET_RATE_NO_REPARENT to CLK_NO_REPARENT, make
>> clk_set_parent handle it, and set that flag whenever
>> assigned-clock-parents is set on a clock.
>>
>> It's out of scope for this series though, and I certainly don't want to
>> deal with all the regressions it might create :)
>>
>
> This sounds like a new dt binding that says the assigned parent should
> never change. It sounds sort of like gpio hogs. A clock-hogs binding?

Ideally we want the clock driver to be able to reparent clocks freely
to get the best rate. But we also need some control over that to stop
consumers from being reparented in undesired ways. Eg. you might want
to make sure the GPU gets its own PLL so it can be reclocked easily,
and putting another device on the GPU's PLL could prevent that.

The only way to achieve this today is (1) never do any reparenting in
the clock driver; and (2) use assigned-clock-parents in the DT to set
up the entire clock tree manually.

Maxime said that (2) is basically wrong -- if assigned-clock-parents
provides no guarantee on what the OS does "after boot" then the OS is
pretty much free to ignore it.

My suggestion: add a per-clock bitmap to keep track of which parents
are allowed. Any operation that would select a parent clock not on the
whitelist should fail. Automatic reparenting should only select from
clocks on the whitelist. And we need new DT bindings for controlling
the whitelist, for example:

    clock-parents-0 = <&clk1>, <&pll_c>;
    clock-parents-1 = <&clk2>, <&pll_a>, <&pll_b>;

This means that clk1 can only have pll_c as a parent, while clk2 can
have pll_a or pll_b as parents. By default every clock will be able
to use any parent, so a list is only needed if the machine needs a
more restrictive policy.

assigned-clock-parents should disable automatic reparenting, but allow
explicit clk_set_parent(). This will allow clock drivers to start doing
reparenting without breaking old DTs.
