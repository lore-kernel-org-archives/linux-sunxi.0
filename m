Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464ED442D
	for <linux-sunxi@lists.linux.dev>; Sun,  2 Apr 2023 14:41:20 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id q19so23758364wrc.5
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Apr 2023 07:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680446478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZrZkQDilPn1vacJZvzA6Nj9qCFTdPg8cOLsQDyidsM=;
        b=AWiAEpgmtq1ABmkIlHJMb3ekqLp/o5PBApXYHaUJd6fMBgINSst8BmJ/pgShbKKOeS
         k8wBFhY8/TOYGeGJnneNHpDQP3X0kyBdLdEufd36IBRxu5BjW+r4ms5yZy3oQpbROla+
         HuK0LSYtls5NDlBQiaKRY6pjE12QvLR0gdxZvzJPCpW0i1hfsep+nLFMs1KEs4LJMcoz
         MsllhAHbGZPXJN1p8RKV2TlnjCVbftkHvtY88q6n5HKQ0gQVYOf2Bwz+KuEPeA/ZRo7n
         AEdvOz6fpYyC8XMB9IgZpTx0TkjyMuthpPmYX+kcLN7IfSIMZNA86JgEs0+mJQRN69Nx
         1AzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680446478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZrZkQDilPn1vacJZvzA6Nj9qCFTdPg8cOLsQDyidsM=;
        b=hdbjA4entJFg4HJmI81IqKKk23SLRX8fVg0L9Cx7FRWBWAe5sMN2vI8AgFzfHrnYoO
         KiRa0qmtW1l4LXaCc2uPZ0w93rG/bTJ8hjavyAid0O7hWDQoGFOFdEVooMYbY+q0b7un
         j0mIYuzkCVkYe11faFVtpMPGa+u7afDalAfS3upJNV16HCfSW3P3e0oEun9IJYn4T1fI
         eiWg043GOvzOMTIVFif6It2CIw1jKtO2X5RijI4UkGeBSQfYU5ibwIvKFvIkdgw46de3
         Im0VccEiwAx5fbKePezNgyKGAShsnagkRkfGwve9X3dBmuFBMtB0Bd6+XjxkvT0XLwsA
         fqyg==
X-Gm-Message-State: AAQBX9dAs7G079apYoQ+DEkQ7mGZoXAa2UyUxYF5R0FrA+EGKMcC4e3K
	0vKyfHFDeppWkJItLqsBd5A=
X-Google-Smtp-Source: AKy350blBuOVV+IjEZR9/y8oar0G5BwMskydAcUw+0jw7gSYoEmOmZAUU8e+M2Tp1dBCe1Rkl1g83g==
X-Received: by 2002:adf:f38e:0:b0:2dc:c9c0:85cc with SMTP id m14-20020adff38e000000b002dcc9c085ccmr26600215wro.59.1680446478145;
        Sun, 02 Apr 2023 07:41:18 -0700 (PDT)
Received: from jernej-laptop.localnet ([209.198.137.155])
        by smtp.gmail.com with ESMTPSA id q10-20020a056000136a00b002c6e8cb612fsm7363100wrz.92.2023.04.02.07.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 07:41:17 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 linux-amlogic@lists.infradead.org, linux-oxnas@groups.io,
 linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org
Subject:
 Re: [PATCH net-next 01/11] net: stmmac: Make stmmac_pltfr_remove() return
 void
Date: Sun, 02 Apr 2023 16:41:14 +0200
Message-ID: <2674462.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230402143025.2524443-2-u.kleine-koenig@pengutronix.de>
References:
 <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
 <20230402143025.2524443-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne nedelja, 02. april 2023 ob 16:30:15 CEST je Uwe Kleine-K=F6nig napisal(=
a):
> The function returns zero unconditionally. Change it to return void inste=
ad
> which simplifies some callers as error handing becomes unnecessary.
>=20
> The function is also used for some drivers as remove callback. Switch the=
se
> to the .remove_new() callback. For some others no error can happen in the
> remove callback now, convert them to .remove_new(), too.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
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
>  drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c       | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 5 ++---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c       | 2 +-

=46or sunxi:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c    | 4 +---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c   | 4 +---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h   | 2 +-
>  17 files changed, 22 insertions(+), 33 deletions(-)



