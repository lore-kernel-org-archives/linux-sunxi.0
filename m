Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029CF8C17
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Mar 2023 20:53:40 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-53d277c1834so265016857b3.10
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Mar 2023 13:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678740820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZpqs5siL4Ymiuu8Rnql+zUqmGWcS+ZbAUBpWJ9W4K8=;
        b=KDTS7fZaclyphgJmqC5N15uD3+Gq9l4SliqQgO+pQM5PW7JyjCgsme6Ge6zXtsqVxx
         AW1l83xNB2ZVX6w+QoQcccw87e1AscXRvCCeZLy1nzrLKUU1XU34faaYkOiDyN24nAY+
         v6AuBphGSYHv2//9OqQZjdq/Jw5V0E+1129tns66JhFazayIQv6o62288nii6Zp5HB1N
         TVhCN3L0l+bFus5xhnnmZ3CJCowu7SEkSE+SVTPEf73wBpgQuZlxkq1PIFew5GxN8BkQ
         9o66TpI9Ei8fIKOQHLzaO+QfgzHm0YuUjG7Vicxxh0QA7Gdwclqym4Dwdmdr6Txlz323
         wNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678740820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZpqs5siL4Ymiuu8Rnql+zUqmGWcS+ZbAUBpWJ9W4K8=;
        b=Wpm8YWKQBgFHthFQvePFZvu+lvDrw1rZptoccHSz2Rd5d1ZOAIpYnD4Ja/y4nI4T7j
         sfGWQlgCeg3CGLB5NLX4JWvzOCKsex8shizfXfUlLKr1sZnbAdThd99e21gFM83Y0rEp
         MBLY69OZPron+wSgtPvBJSgFFoihQmyMt/C35+CN4YdKSOxXiInF3+3vHF4nAmNgT8P0
         0o8z6EkfabXgLfq3137Az9IfjWtiFDwyO97jzAyZPgaLeMkYSr5tVy/Jmc4VyHH21E9A
         esg1X9MgiTtFfOedL80EGZVR63jAs1Dn3oZ8fOqxxFH6locxiRyPgApNhVAQ/zutmcNg
         2xdg==
X-Gm-Message-State: AO0yUKUiD4+aIbGimrek4EJXR9cvLjPLOA+uQwfTS7KXpl3iZ4iN4yCP
	McHkhE498/9wqPovthsAUjUlt4WwDAMcRFQphJE=
X-Google-Smtp-Source: AK7set+bkApoxdat3t4mM5yzrnKSLYecVccpJe9yYCQX9Rk8pbyyHXlR/QgC7cJyNYCPNbj0eloQSjFebG86/6a1CaA=
X-Received: by 2002:a81:a9c6:0:b0:52e:f77c:315d with SMTP id
 g189-20020a81a9c6000000b0052ef77c315dmr8791180ywh.3.1678740819961; Mon, 13
 Mar 2023 13:53:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org> <20230312131318.351173-11-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230312131318.351173-11-krzysztof.kozlowski@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 13 Mar 2023 20:53:13 +0000
Message-ID: <CA+V-a8sPwMax7A=k=8bz9SDbWJt7mNHG0-27UXsC=bEhAP3zQw@mail.gmail.com>
Subject: Re: [PATCH 11/28] media: platform: ti: am437x: drop of_match_ptr for
 ID table
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Joe Tessler <jrt@google.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Michael Tretter <m.tretter@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Wenyou Yang <wenyou.yang@microchip.com>, 
	Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 12, 2023 at 1:13=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).  This
> also fixes !CONFIG_OF error:
>
>   drivers/media/platform/ti/am437x/am437x-vpfe.c:2620:34: error: =E2=80=
=98vpfe_of_match=E2=80=99 defined but not used [-Werror=3Dunused-const-vari=
able=3D]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/media/platform/ti/am437x/am437x-vpfe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/med=
ia/platform/ti/am437x/am437x-vpfe.c
> index 2dfae9bc0bba..fe89b8e250e7 100644
> --- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> @@ -2629,7 +2629,7 @@ static struct platform_driver vpfe_driver =3D {
>         .driver =3D {
>                 .name   =3D VPFE_MODULE_NAME,
>                 .pm     =3D &vpfe_pm_ops,
> -               .of_match_table =3D of_match_ptr(vpfe_of_match),
> +               .of_match_table =3D vpfe_of_match,
>         },
>  };
>
> --
> 2.34.1
>
