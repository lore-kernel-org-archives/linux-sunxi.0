Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59307201033
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Nov 2025 13:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763041320; cv=none; b=VxgajFBruwsoObLBrA9dTy4YAycj7Zbwp0Wbyjef4F4u+ewCQwo1nLjEHSN/N2BLoP1op1zLJ0rHk4OzpZZyiE+6zkCxiOTuLtPKtl67Bwq+LFsfa23uqxOEuhYIezbfmyrCsMrQIfOVS/rXqwQ7ufjIEYA7bac5mkKl+X41gdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763041320; c=relaxed/simple;
	bh=GLqncc5/5zGkwI1+bv2pb78gB9RyxcsUzYNiDGa3NKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OdvNW8qMd7bBn4WL+W6daXDCSU1vn3WOrhhjGFbWkZ5VNbHgYhqlbiUQQGOJYbjt2wvGA0rZ3FgPKqtbrTEKZRo4FZTCZmCQL5U3miHZUHyTEQvEOKIJI/wERKzJkMi1kcRZMeuFFmf9s3LIw7GR+lSKrB19yWF1ph2ChNnnlOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Q/eWlEY8; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Q/eWlEY8"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5943d20f352so880212e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 13 Nov 2025 05:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763041316; x=1763646116; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6YFPbYQaXtcm5LdD7/GneIOXBdjWXCgrgn8VVQE3So=;
        b=Q/eWlEY8rYsnw6zJoL1IjUxFTiePCoGWS9fdZE7n2E+pQ40QqgwXbMq7pR4jxSKiJb
         TwJY9rilzEpErcuoy9BgSjXzumalTUiVkVQiHuXUKwLywLcJPgjeeW4g95RGiN0huZtw
         dS8icS3jV/8qivqFpblBrnL2tWJ6o5IaDsNol9NEOtGdicfNV3ngEQksQ75OgMFo/KTm
         stMb/m5SaU2ML68wyXnsQXp5+F9UjsD5o6P1NbgI/tRhOEnN0SPZ143Rqe0tpDNXMj1A
         Hzsbno1tB8KfSlIqOCuzdeqPXrANmkqL1i+uru2FyUYHjDVa4QgHjUuEj6MAUXUE0FxQ
         QPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763041316; x=1763646116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e6YFPbYQaXtcm5LdD7/GneIOXBdjWXCgrgn8VVQE3So=;
        b=SECi1rroeDLm1JSIVsxnijtwHwMT8iLELIQnvALT4S3Do0SyzQTAny9eHpUHqa2t7N
         ZGSXI5twG6cEG2QGgbqDQqyyPpYJ5nUAJo2WBkNrywCn/55NogXXMoCuYtIe6VfI49tq
         dPwxIA9QCYKADW/4lAzq+D9WcihjRs65V3LFN60qwMZdOEAhnoU4jINSq/ESjWffMmyl
         3ErdwaSQnfpHKeT9QrH4xaBGH65Fm5h8hT+Buu74P9126QeP0Msbnygr2b0KRNY64Zt0
         lU0y+/E1V0ti+DiP4DM2faWbcxyltmxZO1GoBOTWavqt2B8LM0SVVsGwWQIWpLx34q0R
         NKuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhNGBybsPjZHr9F4501jbBN4rV848Z2uCQ6HBnNcgygKqpIAsfCh4RdetaJpA9UhjhdbmRM/fUW69EHA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywgqyhff5tZlK/XytYA4uB+oaqE536hKg+TP07QLSe8tqnFdA8+
	3v/gra9LqpX9vSLMMAdLc5Vs8yovrUahCnlcPf7044tk9BD+Ph+D8/bqokftZJA5dEkR8fX81Qk
	4kzjx/r8xW7ftxJ89n0dwUXZ1Or7e4y1bjRB56tDWyg==
X-Gm-Gg: ASbGncscRomn2V+xxsB6Gd5Ov4RErKSb9D3vtnXQAfav0exzM5vqIsce/zkeCE4g0iB
	FNkCTZ9hzx7XzqM9jbur9Sz9YBtYOLRS7E9UeADyU0t46yHY8Qw3L2Ecx8iVFES3IASoXbycDZP
	0AFogJFZzvVuYHgGCcxtGJLiyfKQo1XTHkxiAXJ/6fEejrxacfS9gaS9yNPAWNHEVsCU822aVM9
	wIzZWxul7Erug9AySgcthTlKJf0eMuuXjlRXTm5V7rAWqCg4ckKgr/O9nusJaxNHi4PR+Hz9wRX
	cPGMPxAlowq3HczK
X-Google-Smtp-Source: AGHT+IGgWlCG9kIv5RM7lpIk9LC7ddziZ8QniI5XBDNtHyHFdpWvdUKYxGgON08x+t3awJ+Cz4M6eIo1aCJcpUc2eyg=
X-Received: by 2002:a05:6512:3c8c:b0:594:2fde:a159 with SMTP id
 2adb3069b0e04-59576e552camr2521011e87.43.1763041316428; Thu, 13 Nov 2025
 05:41:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org> <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
 <CAMRc=MexMn_GSC2EtMek5hDRLjGYA5HKM8ge9vrxw1pYDqPJgw@mail.gmail.com> <cd7c0490-a2d6-4885-aa36-ee1492f107b8@oss.qualcomm.com>
In-Reply-To: <cd7c0490-a2d6-4885-aa36-ee1492f107b8@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 14:41:44 +0100
X-Gm-Features: AWmQ_bk13TVZ2MEYPAt7pfoLg7e0lkaPcfsA9km-tpYIh11AXtLgw1MABlXNgK4
Message-ID: <CAMRc=MeuByh=N_-F2+zPiqnh+Qp9u97kiMheLJ-xxcSZSy+_tw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] net: stmmac: qcom-ethqos: use generic device properties
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

On Thu, Nov 13, 2025 at 2:33=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/13/25 2:18 PM, Bartosz Golaszewski wrote:
> > On Fri, Nov 7, 2025 at 11:49=E2=80=AFAM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
> >>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>
> >>> In order to drop the dependency on CONFIG_OF, convert all device prop=
erty
> >>> getters from OF-specific to generic device properties and stop pullin=
g
> >>> in any linux/of.h symbols.
> >>>
> >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>> ---
> >>
> >> [...]
> >>
> >>> -     if (of_property_read_bool(np, "snps,tso"))
> >>> +     if (device_property_present(dev, "snps,tso"))
> >>
> >> This is a change in behavior - "snps,tso =3D <0>" would have previousl=
y
> >> returned false, it now returns true
> >>
> >
> > This property is a boolean flag, it cannot have a value.
>
> Every DT property may have a value, so this is not as obvious as we'd
> like it to be (IIUC - unless that changed recently)
>

That's new to me. I thought that if a property is a
/schemas/types.yaml#/definitions/flag then only its boolean form is
allowed. The fact that the dtc can compile it with a value doesn't
matter as the bindings are the higher authority for DT sources?

I don't mind changing it to device_property_read_bool() but I'm not
sure if we really should.

Bartosz
