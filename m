Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C12A8C17
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Mar 2023 22:01:45 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id h7so7689997ila.5
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Mar 2023 15:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678744904;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DMLvNFiF6A+cLlm+Md6S//7sOrhzSCiOnPwGbda9MTs=;
        b=aWXb3DK3A5HljkDmtHfJIax0Z4RexrlgcAXu6rc5w2LBmdFm0ZhzhLWq9rUOZmDdp2
         qjfynGlY/ln39BF9ghwsOTTnx2ty5W57Izt1vktIL66IwFpZ/SXIeL7yDa5HJPkJlCYF
         NuKPKFxU3VSN9QKyNg+xaVoMZ5ANKIiFT49KWS508WvyJUv1PSNLqT36iEIBajXHYKM2
         acqHQd4/vdBLJ+TdQuHL6ydeVF/R7kSdyCG95wHm3s6ebS7yK6DpiZc5sxZdrmyjrlR3
         Jyx/d7UvLyTcSFtZrbuWKS9R4+hA1qJSfOEOf/z7YJ4IiYDiNLA5Q6zZJgMbK8TX/7NT
         YeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678744904;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DMLvNFiF6A+cLlm+Md6S//7sOrhzSCiOnPwGbda9MTs=;
        b=QX8JM3LM75bY5q/f0PszzJq4t0e+SQX9DnCLN5wKVYwKR75iMQlM5o8/pxFkt+vZae
         3y9/6mq1oFhGFiExAnVAh2nWkkVcyc7ptWXjW74BouPyhUZYqg4D2vjuGsDoZLasfejv
         Qa+VVaDU6GXQN2Pvt98LSq+q5MR34ILTx7/QkRRshX+S2IvIBPUmc+bO9fX5a02v7PtO
         4bX+bHVrvENSDeRMP942Iqq2tyvVA+k+bG71ery0p/myQ+sh+IKoVj7gHUu/go/8Z6h9
         aB0B8qaHtmeL6tDBbuDTJAtGavHQkciHWg/LxnvTiYCWF3/yqab/fUO6ApOgA3dj40Ki
         UtsA==
X-Gm-Message-State: AO0yUKW+5GZQVsZvEapG8syIT8t5c/k92NsfPf+fSpfW7T7k+ZEShYU7
	6vGGLzCZ5a9DJDG80iibfVc=
X-Google-Smtp-Source: AK7set/CnpGrRNOlgdLP6A3PzpsbmZdrv5qoYIZVsXl6Lk7tiSYIV4Z0CbZ7o/CqEdQmrdQf0Yh05w==
X-Received: by 2002:a05:6e02:dc1:b0:315:5467:4a3f with SMTP id l1-20020a056e020dc100b0031554674a3fmr720344ilj.30.1678744904090;
        Mon, 13 Mar 2023 15:01:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d19-20020a056e020bf300b00316e3a38becsm282388ilu.18.2023.03.13.15.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 15:01:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 13 Mar 2023 15:01:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Joe Tessler <jrt@google.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Wenyou Yang <wenyou.yang@microchip.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
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
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 01/28] media: cec: ch7322: drop of_match_ptr for ID table
Message-ID: <b83d6b81-c4ec-4fb8-b626-84af80d1c4a3@roeck-us.net>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>

On Sun, Mar 12, 2023 at 02:12:51PM +0100, Krzysztof Kozlowski wrote:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).
> 
>   drivers/media/cec/i2c/ch7322.c:583:34: error: ‘ch7322_of_match’ defined but not used [-Werror=unused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

FWIW: There is also
https://patches.linaro.org/project/linux-media/patch/20230215214724.3798917-1-linux@roeck-us.net/

The lack of ACPI support is a real problem and very relevant.

Guenter

> ---
>  drivers/media/cec/i2c/ch7322.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/cec/i2c/ch7322.c b/drivers/media/cec/i2c/ch7322.c
> index 34fad7123704..3c6e6496a001 100644
> --- a/drivers/media/cec/i2c/ch7322.c
> +++ b/drivers/media/cec/i2c/ch7322.c
> @@ -589,7 +589,7 @@ MODULE_DEVICE_TABLE(of, ch7322_of_match);
>  static struct i2c_driver ch7322_i2c_driver = {
>  	.driver = {
>  		.name = "ch7322",
> -		.of_match_table = of_match_ptr(ch7322_of_match),
> +		.of_match_table = ch7322_of_match,
>  	},
>  	.probe_new	= ch7322_probe,
>  	.remove		= ch7322_remove,
