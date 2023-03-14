Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4454A939
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Mar 2023 19:51:51 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id eg48so7481422edb.13
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Mar 2023 12:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678823510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8AT8USwG5WyHMLzA6/8T0IUfb3m04Mgmj2Z9mkS5Q9k=;
        b=VQ1Bxxrd0PI+Y36KGSR9tvLfCRNckswniNWELVaaPvUCxWivB6ajZpVwNfQPWx/bxk
         wlyb+IDMNnHUcblddMhuEzgUKSHLuI4IYjI16P82uxBFfu+92mr4ylyALdg2BFJvB0AO
         onmyGCP+1rgPgi7D6BPokZjuqWgag+074+OsP3gh5V8/s6Ajcuo0Ix20CPS0vWa6y38n
         CxUj1yc60ELISGN+7y9S+Iv2DRIOmu8bGsTq9Aeo9AEahw49g7yGwjhT0f4XFogDgefs
         /N/wuVy/EJ9AiQTL6+rT/SW6ZaLlic2kpZM0aIBubfPL2LM3uwH4k5DAmUCIPj+m+x3r
         sfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678823510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8AT8USwG5WyHMLzA6/8T0IUfb3m04Mgmj2Z9mkS5Q9k=;
        b=q3aOF1v9PGjRkHRDKo74B+pGlWTU7J6vgRFikTtkcsmU3PP5n/gCeIcc19MosNPkiD
         4R5+LA/7iVS/UzXWDPxcI6UiDgpSMIRrLJKVLlBVPWSQ2Z/HsbxxoCE941G02VfDQM/T
         HmXfTi3h0Z2A6EnlChGb5AL1ITBm5dztFfDmLsMdy1MJJSSuHC+BjRK0QMAdg2V7M3C8
         0vdcj1YT1zw8FKYTGBDbspWEvtrGWogmNkHgBwkC7oDNjK9c0KDNz4fx0k1OchzN31i6
         FBgoxIPOkcB+N+26n893zoDKcFESb3HmS2qgpdBsuLM4TlfbDC68jXhrUwQltVJgTlw0
         K2tA==
X-Gm-Message-State: AO0yUKVgP4/ZcaRq6nDj7ubFnCF/o2jVIk+3nDhGVccFlm/UrviBb3C8
	tEBNxwpbpLe1PpJscrPD+kc=
X-Google-Smtp-Source: AK7set/tzuvE7xTzdstMMoDin2Jn1A93J29XnBrFLWGatjpCIuLb3twRybszlAVT52/X8b7+AM6KfA==
X-Received: by 2002:a17:906:a249:b0:92b:b4d9:3f07 with SMTP id bi9-20020a170906a24900b0092bb4d93f07mr3722129ejb.14.1678823509909;
        Tue, 14 Mar 2023 12:51:49 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id z4-20020a170906714400b008e53874f8d8sm1509261ejj.180.2023.03.14.12.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 12:51:49 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Joe Tessler <jrt@google.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Wenyou Yang <wenyou.yang@microchip.com>,
 Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Yong Deng <yong.deng@magewell.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject:
 Re: [PATCH 16/28] media: platform: sun6i-csi: drop of_match_ptr for ID table
Date: Tue, 14 Mar 2023 20:51:46 +0100
Message-ID: <2671303.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230312131318.351173-16-krzysztof.kozlowski@linaro.org>
References:
 <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
 <20230312131318.351173-16-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne nedelja, 12. marec 2023 ob 14:13:06 CET je Krzysztof Kozlowski napisal(=
a):
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).  This
> also fixes !CONFIG_OF error:
>=20
>   drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c:401:34: error:
> =E2=80=98sun6i_csi_of_match=E2=80=99 defined but not used [-Werror=3Dunus=
ed-const-variable=3D]
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c index
> e3e6650181c8..187a2419da96 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> @@ -429,7 +429,7 @@ static struct platform_driver sun6i_csi_platform_driv=
er
> =3D { .remove	=3D sun6i_csi_remove,
>  	.driver	=3D {
>  		.name		=3D SUN6I_CSI_NAME,
> -		.of_match_table	=3D=20
of_match_ptr(sun6i_csi_of_match),
> +		.of_match_table	=3D sun6i_csi_of_match,
>  		.pm		=3D &sun6i_csi_pm_ops,
>  	},
>  };




