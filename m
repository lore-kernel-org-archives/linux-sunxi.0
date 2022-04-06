Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A783226
	for <linux-sunxi@lists.linux.dev>; Wed,  6 Apr 2022 20:46:26 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id dr20so6672851ejc.6
        for <linux-sunxi@lists.linux.dev>; Wed, 06 Apr 2022 13:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r3pN8iVk9eTtSjL65Ae9eDGs0McwPoBu0Laz3ZR/1MA=;
        b=IHXz1wUkKCmRJ1GjOREIJcNyfWmglOtNLI958+1ELRwj1TMr+UqeAJl+j6zvajmfyJ
         kDSjsLE4dAisAOmn2SF7dZAEC0yfBhK3TmN+ui24XsLhR11WuMsOEDyaFvCo5cAOiJTt
         lvf79qjM1j95pWgykfX14/CKOd7bnp135vKElX7oHmgelwQqHzdooSp4XH7D7igvJrdd
         Nov/Imj6QXxhg0uxnsislCyMWeKMnai9IqGOgtGy4STH+EJCOBXVV+iwU6REb+MGTm6C
         1SLY0948h5eAIXv9gtOHMq+G0WFLMiR9x3uW8h9SAppR8XnDQa14xYC3HDEjdNrsMdcl
         vEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r3pN8iVk9eTtSjL65Ae9eDGs0McwPoBu0Laz3ZR/1MA=;
        b=baBti5okltlSLY2V/fsvz6bIEeTmA9JvfQuAoTrA5NO2JGDho65WZawkkKIFRrVScM
         M+23nPyKP/pNmiwC/NLboszKpm+17V9TL5Dn1QgKND9ntibdaRfoDnIKZICnBMUQ8CNK
         mFjGuMW7XweBQJ9aO9vOhcfqb+Nz/OoOEFIqNXc2FA5Do+6aDEsHhsHHVaXQj9yDqP++
         nBYeTViW8p8+4lP9J1V1qpUKvK4ur1E7lASH89B2VfczA+kcjip0nXd1mANJi5T2mCCy
         82S99AgBv+p5JUJOCHRIM5oTR1mCR8D2Meq/UGQMUkE3q81GfN9rZn7hJv9YmT+9dsMo
         XHCA==
X-Gm-Message-State: AOAM533mG7icRuxyMBbd0aThq8pC319WKF42RUKbtw/Fx25u4Am7p9nV
	3kv0ksNfNED2IRfwPkM9Rq8xYU7eM81IZA==
X-Google-Smtp-Source: ABdhPJzOs3gO5TtSASWFaPiSWsHGEoBTpf1ZqwG+HSVkjfw89HKEpezUIlS1qPi5CVyHvUd+Z9sTQA==
X-Received: by 2002:a17:907:7d8d:b0:6df:f3a6:b0d9 with SMTP id oz13-20020a1709077d8d00b006dff3a6b0d9mr10371596ejc.13.1649277984635;
        Wed, 06 Apr 2022 13:46:24 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id a22-20020a50ff16000000b00410d029ea5csm8286808edu.96.2022.04.06.13.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 13:46:24 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Wan Jiabing <wanjiabing@vivo.com>
Cc: kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Subject: Re: Re: [PATCH] clk: sunxi-ng: fix not NULL terminated coccicheck error
Date: Wed, 06 Apr 2022 22:46:23 +0200
Message-ID: <5554257.DvuYhMxLoT@kista>
In-Reply-To: <2621623.mvXUDI8C0e@jernej-laptop>
References: <20220328073931.36544-1-wanjiabing@vivo.com> <2621623.mvXUDI8C0e@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne ponedeljek, 28. marec 2022 ob 18:57:28 CEST je Jernej =C5=A0krabec napi=
sal(a):
> Dne ponedeljek, 28. marec 2022 ob 09:39:31 CEST je Wan Jiabing napisal(a):
> > Fix the following coccicheck error:
> > ./drivers/clk/sunxi-ng/ccu-sun6i-rtc.c:348:1-2: sun6i_rtc_ccu_match is
> > not NULL terminated at line 348
> >=20
> > Fixes: d91612d7f01a ("clk: sunxi-ng: Add support for the sun6i RTC=20
clocks")
> > Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
>=20
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applied to sunxi/fixes-for-5.18, thanks!

Best regards,
Jernej

>=20
> Best regards,
> Jernej
>=20
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> > b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c index 8a10bade7e0d..ffb72d9a9c36
> > 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> > @@ -346,6 +346,7 @@ static const struct of_device_id sun6i_rtc_ccu_matc=
h[]=20
=3D
> > { .compatible	=3D "allwinner,sun50i-r329-rtc",
> >  		.data		=3D &sun50i_r329_rtc_ccu_data,
> >  	},
> > +	{},
> >  };
> >=20
> >  int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
>=20
>=20
>=20
>=20
>=20


