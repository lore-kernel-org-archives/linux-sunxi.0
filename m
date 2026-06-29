Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A87423164
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Jun 2026 15:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745219; cv=none; b=LhdhBsy3blRX/+MhCugklCBwxD2LRDiFeIhl5OYbcDBRyMCjTWweeE3ka+aMyU9YfHvqbi6jnP49iIuJwx54Z5EAu0p+gfyFbF5UblyLUxPPgaLmapF2PrG6s1/LjYrI5HhIOSKpkj6c3n/FcKHn3mwyqaIWvnGWW+fLE/N8gQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745219; c=relaxed/simple;
	bh=LAoZJqVfdU9+V8F5hBZtY//uWnuQHis0eN8ii8DLed0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWevI2TgjHrFJdELEvizf9HhEd0+01Az389riD4++j46UzEAMPmYASddd/75YuZBquhr5OaoFW6FhQhc4kO5oR3I/JLjWHIAQyiKcvSe0Vu0sTPshV/ShyuVgBeP8X1vZ3iaAaufKwJodNwO1oCKgPZa0CjVW3Bd1fn4xQXlN0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7e9b4f8ade0so1697746a34.2
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Jun 2026 08:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782745217; x=1783350017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrA9ccFaco9J2BZQ3eRpFjtGI3CKCK/xF2koXbFr26M=;
        b=JD+SHc5axCVA2b0Q66M3NaOclLDAZmX80XsN0FH6deFroQ599+wFpmCSMDu1l9Bj+J
         +EmNh0nGCBJkURlDkt9hbgPloQXcJIXlR6vJD3DKgMrp/iJXTfS/fpB0wP4sZwGSg3EH
         gttn9/jaPJwGt3qNPDuqcdq0Qhj27O2Hvr6pjj6U6CL5d5iArjiqiZtMOgejk0kyfGyX
         apjMwLj3Twfun5N75Glg2UCI34u70B9IqEQ4fpLh0W7oTbIqFPMXlMjLy4yq3QPna3CK
         6HLpwcTz+zQfS41ekD3HkczbNlPZ4O2mOSMRfLqq+tWU2dhZC3eUYQuPEhnwhRibuEOp
         R+lw==
X-Forwarded-Encrypted: i=1; AFNElJ/kG0MOa2yKGFsdoCqkE37UsnuP5dk5z1CyCcLTG0v9GBsXKPMYA7noGAID5D/PoPakFq49VwvoqU7usA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+rdG5Z5RoHTpj/0tJ9RYS9p7nscuXtnfuYhXhl15L81mxOhgx
	w28liuiCJ5CuNXpHr9zuKSLOrFIzMyT/rMBCXVeMKqDrBt7DiyPVF1oWCCyao5l7
X-Gm-Gg: AfdE7cksDqXDaTpgYbWsCWNwH7ScrQYVRAPHeqqozmtkGyIhXy1jpwP3pU1D87I8naV
	s8uO3+4C1Ersh6xIIuB/6Gvi0UuLvAbKpx7RRhb0T2vjxufWgLEwJu0RR59CGFJSR5ZMafTWXrO
	xGnQIzAiuLaZ72y8kMgUH4v72ZCjqwl0SjTG/7Kdapni2z9r5f8Z+lht+BNNeX0GwMNv+tXcJ5D
	8YIMxoN3zeX1RaKVJACyp6rUT6gYNB5J8/VE0o1ZHIvaH5g2jU9rHkaqFMrwbO62LyFMGhhLBeL
	PdX3MxxNmPazb6ayZnxU79dZnZKwco+7Yk5rIR0yY/okLbcJj0zvFSyA0m0IXBnQThsgynQFXap
	fczKcxTc52uXWNpy2I3bPDnk/wq+c2iuH5jRdGxB0VY1u2PgiiQKuNUxpUojrl7ZpKWepMGsxyJ
	LOItzPVILGYHWjIn3bEaPnZ900gMrzcPB48qogyflg1ev7Je8xWw==
X-Received: by 2002:a05:6830:82fa:b0:7e6:f482:df36 with SMTP id 46e09a7af769-7e99c187428mr15457535a34.15.1782745216603;
        Mon, 29 Jun 2026 08:00:16 -0700 (PDT)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com. [209.85.160.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ebfd1c94sm12530a34.9.2026.06.29.08.00.16
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 08:00:16 -0700 (PDT)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-43fc82b52afso2019581fac.1
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Jun 2026 08:00:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro1OI2HlmjSNoTMsCmTJQsCxOE3hasp+AdnTAW4d9ax911BWx6pG65z99UxJ8z7WmkvrpshJnUDvN4B7w==@lists.linux.dev
X-Received: by 2002:a05:6102:c86:b0:738:ecd7:198e with SMTP id
 ada2fe7eead31-738ecd71defmr1394925137.19.1782744721048; Mon, 29 Jun 2026
 07:52:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com> <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
In-Reply-To: <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 16:51:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
X-Gm-Features: AVVi8CdkJoaQviVQ7ltoNYHwA2g-kW32TDsBBJn2QkEKdC-zwJrV4O3to75iJ6g
Message-ID: <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Mon, 29 Jun 2026 at 16:07, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Mon, 29 Jun 2026 15:51:31 +0200, Geert Uytterhoeven
> <geert@linux-m68k.org> said:
> > On Mon, 29 Jun 2026 at 13:29, Bartosz Golaszewski
> > <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
> >> This is essentially the same hardware as sa8775p rev3 but the PHY is
> >> managed by firmware over SCMI.
> >
> > So why can't it be reuse the DT bindings, and be compatible with
> > qcom,sa8775p-dwmac-sgmii-phy?
> >
> >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
> >
> >> +  power-domains:
> >> +    maxItems: 1
> >> +
> >> +  power-domain-names:
> >> +    items:
> >> +      - const: serdes
> >
> >> +examples:
> >> +  - |
> >> +    phy@8901000 {
> >> +        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
> >> +        reg = <0x08901000 0xe10>;
> >> +        #phy-cells = <0>;
> >> +        power-domains = <&scmi7_dvfs 0>;
> >> +        power-domain-names = "serdes";
> >
> > Ah, this uses power-domains, while the existing bindings for
> > qcom,sa8775p-dwmac-sgmii-phy use a clock.
> > I guess the clock is the correct hardware description?
> >
> > Adding to my list of examples for backing a hardware-to-SCMI remapping
> > driver...
> >
>
> Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
> driver instead of the MAC driver where it was previously. Instead of cramming
> both HLOS and firmware handling into the same driver, I figured it makes more
> sense to have a dedicated, cleaner driver as the two share very little code (if
> any).

I think you are mixing up DT bindings and driver implementation?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
