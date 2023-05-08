Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5963F111B5
	for <linux-sunxi@lists.linux.dev>; Mon,  8 May 2023 19:38:54 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9619095f479so788704066b.1
        for <linux-sunxi@lists.linux.dev>; Mon, 08 May 2023 12:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1683574732; x=1686166732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JxqPdloLojC2MiANkEpzLfG41+hupeelG9KGREc2mw=;
        b=LdKR+DvwekVyUqgb/OT5xTqhw/MViMQ2grjMX3F9EokLXqNtqQu+Yaq832aoIGmDUD
         lhFJulZucMOiVKprfDsGQg9GFm2RX72N6K4RFjcwnLALtfKYtElM4ySRQMBQ1AvOcDqt
         8P4dmntcKQTi5iP7QRCEAwIgDsBHatpoJLQksY2CBr0/CbuVNwuxoIne1er9XhoRQI+C
         Ifcf1ZXUagIN/A33dX2c5xKrqXa+QMwky6t/Mba+jSXTPJHMtanSbaWx9Uo87ctCq6Np
         FIonibR0S5vhRSKVOKruXgY14G/yJg8NCal6Ar8m/NHKoxaj1g7jRcJvWV+49tuOAONI
         5UkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683574732; x=1686166732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JxqPdloLojC2MiANkEpzLfG41+hupeelG9KGREc2mw=;
        b=MjgpuGOf9u7lz/sm2iAzUlnk4xZm/344Jnhbo095m4VVUlUYeGxkluo2ZXh9BKcucj
         Jfo9ZpWq7a/m/Cr57C3O1ueB3NDvJPjW6v0kgJGRrvef8EPyd5CxcSRyi2ztR2CTQJP1
         WbT1RaXpk1fbKnrRZT9oAGYB0HNkayfa+m0oQG4Oe8C4i1VaCAwYAjmpjbqOQzK6gkpr
         uDqI1e31a+BFgIl+2dB8HEE95imWWBLeTmO2Yhx0ECAzL5aEF/5ndeUdyY3fPPT0/qm6
         tUqqO6PYhFrAy1ATbMxIqoJvRzC8VUsTezSC56CqfDVN/HDpt2jkuzqYpmp9Gjj+d/Od
         ugdw==
X-Gm-Message-State: AC+VfDz+lGT2ns5lDRPcliwmBgJBYLAcz3+zSs6MNSeGUNUeOtax4Sf8
	P3cXz3L2eJiWDFGLky63Zwo/8qEPGiUFZpDDEso=
X-Google-Smtp-Source: ACHHUZ6dsVgo1prYYtLrJg0gIiYhBjQNx+st7OeU+cr1SkPuxS+S4CB5SSBSFTCcvBvNJKZ/6ClIl+DTCz2pkxjEmWc=
X-Received: by 2002:a17:906:dac5:b0:94a:4fc5:4c2e with SMTP id
 xi5-20020a170906dac500b0094a4fc54c2emr9330195ejb.49.1683574732223; Mon, 08
 May 2023 12:38:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de> <20230508142637.1449363-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230508142637.1449363-2-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 8 May 2023 21:38:41 +0200
Message-ID: <CAFBinCAXQywWReBbqRCgB36gKGjhX9Tx6g-8OTewt_xipdhp3w@mail.gmail.com>
Subject: Re: [PATCH net-next v2 01/11] net: stmmac: Make stmmac_pltfr_remove()
 return void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Samin Guo <samin.guo@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, 
	linux-amlogic@lists.infradead.org, linux-oxnas@groups.io, 
	linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	Simon Horman <simon.horman@corigine.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 8, 2023 at 4:27=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The function returns zero unconditionally. Change it to return void inste=
ad
> which simplifies some callers as error handing becomes unnecessary.
>
> The function is also used for some drivers as remove callback. Switch the=
se
> to the .remove_new() callback. For some others no error can happen in the
> remove callback now, convert them to .remove_new(), too.
>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c         | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c  | 9 +++------
>  drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-lpc18xx.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c    | 9 +++------
>  drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c       | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c     | 2 +-
For these two Amlogic Meson drivers:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
