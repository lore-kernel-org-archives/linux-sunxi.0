Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2823435A;
	Mon, 28 Mar 2022 11:54:09 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id a8so28066115ejc.8;
        Mon, 28 Mar 2022 04:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LKPrfvGWNCgTg4TyAaxCLaMtN2+t2qHlTsa1uVOq8pM=;
        b=kw5U/JCmxslxZizV2jLlmOBcIGssYEKq78XpVjnkGPlQXwgkdWAeFftd0yoAS+p3Es
         6bwRaMEB8Zw0+KWXTqe5xSm+v3FtPxgM1RwYnyrFhzLni/EoCXXr2a4ZaW4d9wU25zbe
         eoniOgU5G4dswNrq9JJELqXGcHi7pVp1q2vyKzlG9qqT6TMzxJDxKEKbi/+Gm1DeYjXV
         3UGggeaDhqV9rH/7fzTDT4rvoqsZCz8BOdcAeH6/X0BclpVxtXas1+/6ml1BvWFhOWRe
         yfEvE0l/ifZkZqpd8ktCUvFEOWyKT3gPWwBAnqgNkhDVlu40OBzAA6dNTFKzBXUmZGp/
         emUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LKPrfvGWNCgTg4TyAaxCLaMtN2+t2qHlTsa1uVOq8pM=;
        b=zlSbxYgoUIuxup551tdVCabqPyqqfLUPhe/LBP+Ed+BrhMt38FoD8Dvn1dVOpOsRB3
         M2zbj30hyLTn7VsbApOBcA+9N2UsLkKQmAY+fbqUwvIOgP+XdLu+ZReQgDPFeTMqvGXW
         N6iEJ92WphTJ5ivKHeE81mrnPZ23M69HBiRQHwkRnoajfaoONNsnSflvmFEp7AAuRnEa
         VroyHF4N23Ig0LKHVGkSsFRy86PP/pQmk0Wn+lUfCdv2JU7qj3IsiwNzyoEKgC0LPVTl
         L6TyDxvDWYuqb2VPB1vooq2Ftm5uLRcDz9GMIOslXeWDEJBu/9v+o5wWjm2HneSNe5jW
         UdCA==
X-Gm-Message-State: AOAM532SArQ6kU+CjbcFEaXGFy011EgmXYBoO5Q6TA3OGN2FfErfes2Z
	QpFkKtQdYn8v0eNDTCkVAfM=
X-Google-Smtp-Source: ABdhPJxnuIkGxnuYGLZsxAfTPmW5TkGf54BmupZ2me5Tuu+k4VyUkun2Hg1gMwbCB0fty6ZgA/O4mQ==
X-Received: by 2002:a17:907:3f18:b0:6e0:df2d:c76a with SMTP id hq24-20020a1709073f1800b006e0df2dc76amr12117312ejc.55.1648468447864;
        Mon, 28 Mar 2022 04:54:07 -0700 (PDT)
Received: from Ansuel-xps.localdomain (93-42-69-170.ip85.fastwebnet.it. [93.42.69.170])
        by smtp.gmail.com with ESMTPSA id hs12-20020a1709073e8c00b006dfdfdac005sm5850462ejc.174.2022.03.28.04.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 04:54:07 -0700 (PDT)
Date: Mon, 28 Mar 2022 13:54:07 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
	linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com,
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-tegra@vger.kernel.org, linux-oxnas@groups.io,
	linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org
Subject: Re: [RFC PATCH 1/1] ARM/arm64: categorize dts in arm dir and fix
 dependency in arm64
Message-ID: <YkGh36h03EfUd3/q@Ansuel-xps.localdomain>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <20220328000915.15041-2-ansuelsmth@gmail.com>
 <c5eeca79-38b6-eb9f-1d78-1685aa1cca6c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5eeca79-38b6-eb9f-1d78-1685aa1cca6c@gmail.com>

On Mon, Mar 28, 2022 at 12:47:46PM +0200, Matthias Brugger wrote:
> 
> 
> On 28/03/2022 02:09, Ansuel Smith wrote:
> > - Categorize every dts in arm directory in subdirectory
> > - Fix Makefile to address for the arm subdirectory
> > - Fix any arm64 dependency
> > 
> > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > ---
> [...]
> >   arch/arm/boot/dts/mediatek/Makefile           |   14 +
> >   .../boot/dts/{ => mediatek}/mt2701-evb.dts    |    0
> >   .../boot/dts/{ => mediatek}/mt2701-pinfunc.h  |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt2701.dtsi  |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt6323.dtsi  |    0
> >   .../boot/dts/{ => mediatek}/mt6580-evbp1.dts  |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt6580.dtsi  |    0
> >   .../mt6582-prestigio-pmt5008-3g.dts           |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt6582.dtsi  |    0
> >   .../dts/{ => mediatek}/mt6589-aquaris5.dts    |    0
> >   .../{ => mediatek}/mt6589-fairphone-fp1.dts   |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt6589.dtsi  |    0
> >   .../boot/dts/{ => mediatek}/mt6592-evb.dts    |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt6592.dtsi  |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt7623.dtsi  |    0
> >   .../dts/{ => mediatek}/mt7623a-rfb-emmc.dts   |    0
> >   .../dts/{ => mediatek}/mt7623a-rfb-nand.dts   |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt7623a.dtsi |    0
> >   .../mt7623n-bananapi-bpi-r2.dts               |    0
> >   .../dts/{ => mediatek}/mt7623n-rfb-emmc.dts   |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt7623n.dtsi |    0
> >   .../boot/dts/{ => mediatek}/mt7629-rfb.dts    |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt7629.dtsi  |    0
> >   .../boot/dts/{ => mediatek}/mt8127-moose.dts  |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt8127.dtsi  |    0
> >   .../boot/dts/{ => mediatek}/mt8135-evbp1.dts  |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt8135.dtsi  |    0
> 
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Would it be possible to also script a fix for the MAINTAINERS file?
> 
> $ git grep "arch\/arm\/boot\/dts" MAINTAINERS |wc -l
> 
> 101
> 
> 
> Regards,
> Matthias

Totally forgot about the MAINTAINERS file! Yes will add to the script a
check to fix also that.

-- 
	Ansuel
