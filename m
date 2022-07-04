Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE724A0A
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Jul 2022 20:15:49 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id d2so18393092ejy.1
        for <linux-sunxi@lists.linux.dev>; Mon, 04 Jul 2022 13:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zq8nwhfZFDBdfn/duNmrPIOqKRSkTctWskb5xtCNo5k=;
        b=lCYbp2cPEbm8M2iIKtY0ggEUvS2rJzHwBa/0wSQYVhYeBf1fhd6mUilSUA0/2LET5q
         1IENQ9Fv1tojeq98CTDE0jAgrLlrWXh3SvlhiOt0fhAoIVB+hUVXbmuHUuWBsqHiEn+e
         3hWMcm9x0EzoWP45559L4HjbR/vMq2JWKHZEnLr53p+TFhrfk9zu7xZfa8aPO1qAHu7j
         c0kIdsrBhD9TC7YWcpxailb4bk9jWDkJ4ZbiVoZhVmPeNs3XknojiXBBMaYtHA56EYKD
         lZvehRDguR5CmZEqXVS0O1MEUpPg49dZflyNjqU8Gf1ECoquk4U3gCey+fOzruNp1Pqk
         07Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zq8nwhfZFDBdfn/duNmrPIOqKRSkTctWskb5xtCNo5k=;
        b=YuUmuw7HGLIwDOtaB0cfLuls5IrfG7qkD9nOMuziEBaioRqNpokTs886j6HifORoJy
         FkbfCtmott9lvej0NIO2x3mSrfdRRl+pe0ZGh51ZIvmhVZ7Nsyj7fdTiurtGeIessusx
         NVoQVqEdM2dRaP7S7t4vopA9ifxQXVoyxE0+BuhAeLFNtE6F+Z28SH2DADlkLLwHcrnh
         acSMXlKY6Q3RhhTUx8Hh2YZq1LyagPhTlHs0146E+IM14EtFmQwBIJWQbTt7cAg8Ixwq
         PHemHd6Q/OFiuo/SOMnDhUH70VZOdlJQh/dKPxPnuXW/DjArPMvsVnRJ+uzZKYQrTBdC
         YHFw==
X-Gm-Message-State: AJIora9T2yVKboJaiAJZrWne0y/TYOOwQO2sL8J/zwCB5P2n/QaI5Kgr
	r08x1AbOGNFSRHJ3skO2CbQ=
X-Google-Smtp-Source: AGRyM1tqc+U2aR3adyxagbWpNJk3jHnPtRzv+1Lv5ma/FMbfuO9AWx2uN37hw3RNVSGq2Y/qU5XXww==
X-Received: by 2002:a17:907:971b:b0:72a:b002:7c87 with SMTP id jg27-20020a170907971b00b0072ab0027c87mr12113195ejc.393.1656965748104;
        Mon, 04 Jul 2022 13:15:48 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id m11-20020a50ef0b000000b0043a6c9e50f4sm1917577eds.29.2022.07.04.13.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 13:15:47 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: Re: [PATCH] arm64: dts: allwinner: a64: orangepi-win: Fix LED node name
Date: Mon, 04 Jul 2022 22:15:46 +0200
Message-ID: <3496901.R56niFO833@kista>
In-Reply-To: <21517512.EfDdHjke4D@jernej-laptop>
References: <20220702132816.46456-1-samuel@sholland.org> <21517512.EfDdHjke4D@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne sobota, 02. julij 2022 ob 21:03:14 CEST je Jernej =C5=A0krabec napisal(=
a):
> Dne sobota, 02. julij 2022 ob 15:28:15 CEST je Samuel Holland napisal(a):
> > "status" does not match any pattern in the gpio-leds binding. Rename the
> > node to the preferred pattern. This fixes a `make dtbs_check` error.
> >=20
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
>=20
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applied, thanks!

Best regards,
Jernej


