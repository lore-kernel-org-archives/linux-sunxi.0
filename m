Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28F819BAC
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Jun 2023 18:06:29 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-54fac329a71so3329302a12.1
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Jun 2023 11:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687370789; x=1689962789;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Az2bQMNiNgvxrY9glBfDppHJtPk+FnOiirU3h5SFUmI=;
        b=GBwqsylX82eyyI6jaGm8GsagHkfo1ldmyJdiuXnqzkqc4ixPDGmBndPn+m5n78gbEX
         grQ43KpF9obw2HM0F+0Da2EX7FG1TM+0L9uhuv2VxtTTh4Shtd4OnCRuABGudvVq5VNz
         iQaWR9MzmTbR4azKVOEb4dzjdFL4zISHzQ8Xai7eC0gVhiFfJ7tVYQ5E9AAcbFn9q22k
         8Ov5oteaP4Ey9KJbsK4m7VfpYJ2OGGic9pmnWe9y4g9aXPHbx1psYi9x54FtmJyaOHTJ
         If9gncUlG0NfkZN0/Ht0Eesf6ACs38AOXcM3/k8dkmspSHj3mSTLO0ygf69hIR5HeY/c
         7xjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687370789; x=1689962789;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Az2bQMNiNgvxrY9glBfDppHJtPk+FnOiirU3h5SFUmI=;
        b=Lc4vJHbOJqlyUEvZfNrvNTfFSmj89thH2On2+fcvKsfEPOIfc3R2D+dqBSatD0187o
         7SO9TDw8eY47FihZFpWiEbJ15XsG9xi8FO5ijLc5R8tsTwPdVNUcq8iqFIqYDy3haLps
         GO3oOW0NkFAqwTnoNsH5y0FDyTe5KuHAuSUVIuoZbI2R2np++Ro8nSARcbCFaxypZh0m
         kH5T7cFnarRW9BP7RHix7vhmQxDXrxZegZzLiy3mndsrKbemTRloI11iaoy0mdVJbv+z
         XnnIIdX9AmchTkV8ISc0eW8H1ZDz26XtlabeVHU47HVAjGU6SLc33fyZqJ3OI8kIXmFG
         UR4w==
X-Gm-Message-State: AC+VfDyigyryGXusnUMLpl35hVuN8hcLUiRQMFVATJkV+nM5Pk+xHEX1
	y8bdOhG5WDexaJeG2T3YsEs=
X-Google-Smtp-Source: ACHHUZ4rfAeGFSguwikDDJBGuQb8NhqAfqZhPlTkMSahmVCwaEWtuwULvNAqRQTIu3CqkjuDrOxkMw==
X-Received: by 2002:a17:90a:bb85:b0:24d:fbaf:e0b1 with SMTP id v5-20020a17090abb8500b0024dfbafe0b1mr9657024pjr.19.1687370788961;
        Wed, 21 Jun 2023 11:06:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id gq17-20020a17090b105100b00260e7c2cedesm1762390pjb.57.2023.06.21.11.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 11:06:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 21 Jun 2023 11:06:26 -0700
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
Message-ID: <dba2090c-e6b2-4a54-a233-9e8f309a20af@roeck-us.net>
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

What happened wit hthis patch ? I still don't see it applied.

FWIW:

Reviewed-and-tested-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
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
> -- 
> 2.34.1
> 
