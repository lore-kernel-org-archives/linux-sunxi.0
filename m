Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DF7199931
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Nov 2025 13:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763040697; cv=none; b=i7X5pquqb7OXu/HxSSCM1yLp0So8+17A2UQZciHhBX3DKLpcHE44/PxfStX6wfEbPWL+gtVr3qb/qRDfKAClDo679eWXaDu2On93rfyA9+J2c2ZIHU7HQwQlaPQYQC42BiFvOjRQfDcIzV/2nG7TFDWL5JeeoTPr7Oy3/PUmXTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763040697; c=relaxed/simple;
	bh=ozyIZ+DRAXgcmWNPabI3QVCnzbiWETR79BPnKWOg1ac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7xJUT4VSaZXxIGbWUe8ucGDHLjwXvVqBqs+PvyUX00ePZRKl1QLIPKy6qG6n0Iz900qjjXWFpHLMrhn25VsjKKiCgqTwTWjEnEkczaiO5Lksa27NT0SSe+KvaGpgYD+Ud5krKS5YU9nplkwMv8qWuVfzl/BRIiDkTYgfEiJxPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AmffDvr6; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AmffDvr6"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59583505988so225060e87.1
        for <linux-sunxi@lists.linux.dev>; Thu, 13 Nov 2025 05:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763040694; x=1763645494; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73kr7nUrOWZMw2Xrq3JK7B68+7C7ERu+i4U/2oSeqZY=;
        b=AmffDvr6EYtYu5G+UCRUc3bgiYQqeBIacvVv8kOAqw0zpSm2FBYNw0atrEJUoVFcJL
         o96jrJGTKglmsl3C8AfM3F041eZPkCL+1sMgzrunbRgReckw7Fv/G+fD0sIb11TjAemb
         ENnGFDfEbzhGWprGf2EXW0oul5XwRHGQSkzVR5EJf/kkKxM8jra9WJCm7WdHY3kEjCuk
         kb3obf70tXAxTFE3P6FKhC91+iZZIJyN7745TPkIyjSx0XgbbioHZIJ1Xx9vD2dEY/Kz
         ROv9Hpw+pJrtGWgpltwZQOa7C1X5/KDyfIyimly3Z8wYg0tY9rIBTpur7vNRbq6iiUGU
         7G7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763040694; x=1763645494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=73kr7nUrOWZMw2Xrq3JK7B68+7C7ERu+i4U/2oSeqZY=;
        b=bupvKBzn2d6Vc7oqp24inIp2FbQRxpnOI2v6I8mNuXyQ40Vopnnmxa3Ay+YJg/LnsK
         cTYJHfdgdqHEF1cVm8G8QrtLaNXIsb6zm90T5OfrReSlznv12C/yG0dyrBZAysFdG4UF
         siCziE/1KbtVu8npsvgaLj0yxHS6jDn0njcgsHCao8qKttq3j4zTUHTJydFygwiFc84t
         excO/ezyL/xzru+gXlCkuKLWIdCt0MarwDFUyvpUMxntHeQOBgAk6jtZikLqMlxyaeu/
         JDzaBjlKvH16jOKBskSCCKSb2EaqjK4owmn0RJ+/s4UEBUvyIovcy75KJ1m3yN9fRfB5
         h0qw==
X-Forwarded-Encrypted: i=1; AJvYcCVxMWg6+EXxPPjVke0nnNKg+1eiTOI4mDdRzCxZLIC7IBtjMNR9PYic7Y5fE8wuIAGR3Nwjnz4s+7VZOA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwAGY8HITeRfOdJO5rCGmB+ByRRvaJYeSxyiPdUS8nSL84h8B+X
	e1j5wwsbMDpnCMhOoTtbGTvSv9nhTcaLxYW3iAfqNOGSIzQAs/jp4yc72IRKLEyhckMLVgoMov3
	K0HdGBb7IkADXBPa3g9+wg3YF4Vm21Tqn+H4wORihxQ==
X-Gm-Gg: ASbGncvB+PkExhLYchGlpJvtPohWiq2moP4TSruHcE4fAU3gkPleGwbMhGdmhDnUJAS
	GSZILdOvzNPylXzql5wVZCvu0UD0i3nMtrk7ZqWsmvVGM67hvMErV2o8ipFm9M42J9GnTT/YyrH
	xb/JL/ewSYX2V29TwE1IBadMqbthBc2wdDcP9OnwrB6s6/kvMOq3qsNLoFfflm23Wxwt8A2KRBP
	gp7WXEmu9yliHoqiIDxgJ9rbIc/azrfVMvYuvu1b53NyyWfa4aJzLk+WkYsHpfBfzMQP5ILVLVT
	qRNfNdLaqwItQ0Gr
X-Google-Smtp-Source: AGHT+IFmYGYaNrPxFWU0ghXUofhzNye14/5vushtgIFDWSfgA/MklzOW/JNoBE9rLO+zgbK8iJzH+WbW5agg2UGK7Co=
X-Received: by 2002:a05:6512:144d:20b0:595:7b24:d352 with SMTP id
 2adb3069b0e04-5957ececb1fmr730185e87.24.1763040694032; Thu, 13 Nov 2025
 05:31:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-3-01d3e3aaf388@linaro.org> <9805b902-95bb-4b18-b65f-f6efdfb6807a@oss.qualcomm.com>
In-Reply-To: <9805b902-95bb-4b18-b65f-f6efdfb6807a@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 14:31:22 +0100
X-Gm-Features: AWmQ_bmfo87z1zTXv8LP-M-WOLEoIFCS2S60P9_2zq_qXBjBuZTULdbiMAAMcS0
Message-ID: <CAMRc=MdWu5x5bgh4CfPsowJnF0Qh1W770KTDtTFMkGkQf4_LKg@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] net: stmmac: qcom-ethqos: improve typing in devres callback
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Matthew Gerlach <matthew.gerlach@altera.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Romain Gantois <romain.gantois@bootlin.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Shuang Liang <liangshuang@eswincomputing.com>, 
	Zhi Li <lizhi2@eswincomputing.com>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	"G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Linux Team <linux-imx@nxp.com>, Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
	Samin Guo <samin.guo@starfivetech.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Swathi K S <swathi.ks@samsung.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 7, 2025 at 11:50=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > It's bad practice to just directly pass void pointers to functions whic=
h
> > expect concrete types. Make it more clear what type ethqos_clks_config(=
)
> > expects.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/=
drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > index 8578a2df8cf0d1d8808bcf7e7b57c93eb14c87db..8493131ca32f5c6ca7e1654=
da0bbf4ffa1eefa4e 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > @@ -726,7 +726,9 @@ static int ethqos_clks_config(void *priv, bool enab=
led)
> >
> >  static void ethqos_clks_disable(void *data)
> >  {
> > -     ethqos_clks_config(data, false);
> > +     struct qcom_ethqos *ethqos =3D data;
> > +
> > +     ethqos_clks_config(ethqos, false);
>
> ethqos_clks_config() takes a voidptr too
>
> Konrad

Right. I think I had something in mind when I wrote it but I'm not
sure what anymore. Best drop this.

Bart
