Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB001FD5
	for <linux-sunxi@lists.linux.dev>; Sat,  6 May 2023 12:59:50 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-50bcb00a4c2so4423239a12.1
        for <linux-sunxi@lists.linux.dev>; Sat, 06 May 2023 05:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683377988; x=1685969988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R63ySz+V7ttCFAv2NgG95z4OLLtMXFqMOA23r5CKM3s=;
        b=ZaTXIxnXuWngC2EDRE6syeFBaz/BSK6g+5+DWgtqjX0vVyDFUC5V7KXPWESgkmlQBl
         RaQH4e7ri0z5JE2HfG73a6c/CA5xV8xT3vpeZdFNyw/DCPWG5CbN8+Ra9NYec90sa2VP
         Jp/t+mr1Vlu/Q9LqjOZ2a3YfI6BRSngcc2ZoP2+WsYcrINAM77LmvNF81as/t1n8A3fb
         AoirCUNp4ehe6D3KE7ZoHf2t2OW+w8SwrYW/5mfe8GpZMemC5fI28VKXiUWSCIyBaraO
         fkIJDpc4okhQwYIK/gHpm5G+SD5IY1gBnUiN3ecr1JANwwWPZHqB0KmxzvczMG9UTPFj
         gzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683377988; x=1685969988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R63ySz+V7ttCFAv2NgG95z4OLLtMXFqMOA23r5CKM3s=;
        b=mHUyOVOscb9Ub2LEdj9kG4VK5NJsq7UOTHuycO8SloKJ7/jn3p8QwoT5uBT9Se+PVK
         V5OL30kZE3e9PHELN0VRwPQHZgSGN+mc1i/1dg9SO1LVLmRfgUHcrHyoA5tRhYrzSsYJ
         TXuc2l2/l66/Hl1wnFWJPjeNGkhxkm+doUVdJwH/ccaulWNioDlu9mB+mSKYOKDSIgdm
         epC7tSQFdt5vTb0jhgVf15XVCt2zV6Ro1OhfWIAoudEfuv63zaFWNEfNAVoXNyOgKCfT
         1sJn7OBl7P9HOhQmeKWFE353niblmXzyL0F6VUEQQViRxBbcYw5HfaLEt/4VGGDyvM3i
         UAHQ==
X-Gm-Message-State: AC+VfDw311H0z3raUUzeW1/3ECwHKGOAQK38sIUb10pRErHGz2KUJRoi
	EdwgTXg9lUidKVxpc2fwvEToh2nWpDcA4I2v6mw=
X-Google-Smtp-Source: ACHHUZ6DkTuVM4bTLPk7/b7rUBOl2lOEsBgignS7yOAg+Qy4rPo7Ev+AnOErulzJoivJRsJSH9JfWH2dEpM0tr2qvAc=
X-Received: by 2002:a17:907:168d:b0:949:55fd:34fa with SMTP id
 hc13-20020a170907168d00b0094955fd34famr3968057ejc.39.1683377988143; Sat, 06
 May 2023 05:59:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230506073018.1411583-1-bigunclemax@gmail.com>
 <20230506073018.1411583-2-bigunclemax@gmail.com> <e38cbcdf-5963-fb00-d7b2-66d4129f9fce@linaro.org>
In-Reply-To: <e38cbcdf-5963-fb00-d7b2-66d4129f9fce@linaro.org>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sat, 6 May 2023 16:59:36 +0400
Message-ID: <CALHCpMhp07DwL+cUZN8rwa1N_PHQ1KstOB+Gw_mCWFzm5rSVrQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: spi: sun6i: add DT bindings for
 Allwinner R329 SPI
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Icenowy Zheng <icenowy@aosc.io>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Maxime Ripard <mripard@kernel.org>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> Should this not be set up as a fallback compatible, per Samuel's
> suggestion here:

Ok, I'll do it in the next version.

> I wonder what is the difference of DBI compatible. You refer to "helper
> functions", which sounds like driver... do you mean some parts of SPI
> controller?

According to the D1 datasheet the SPI_DBI controller uses the same
registers layout as the regular SPI0 controller.
But also it has an additional DBI mode functionality. Support for this
mode is not yet implemented.
So there is no difference between 'sun50i-r329-spi' and
'sun50i-r329-spi-dbi' controllers types in the SPI driver.

Maybe we should drop 'sun50i-r329-spi-dbi' compatible struct from here
https://lore.kernel.org/lkml/20230506073018.1411583-5-bigunclemax@gmail.com/
for a while the DBI mode functionality will not be implemented?
