Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409641875
	for <linux-sunxi@lists.linux.dev>; Sat, 13 May 2023 21:00:27 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4f13ef4ad91so13161196e87.3
        for <linux-sunxi@lists.linux.dev>; Sat, 13 May 2023 14:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684011625; x=1686603625;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zV8NgaKI21AYQDcwSfLTQKxLM+XHKCDcxx81oVOTUWw=;
        b=Jytbx05Cm4hRTOEvxNhKpkt2EycSPOAApYX5iEcq1PaJuvy6ICXIOO9Db6B51iIxY4
         VY5Yqc35txmob86hBt2gP1ryznD2AQ4DiAkSqscaosGywE9/Ph9/tRXfFMd/Qs1SHfOR
         YETIirJvPgjmShxeiMhmTNAAKbSrBOgWuVoC63XvbrHsV76QKFzjXG8E7wkTmdrBAb0J
         mSBE5PrfXG1/f+Ode8WFbFkNDeZeREiXMrkaYfChmihjannARS01AbzBkJHAAH9Ny4W4
         VYAe4lgrla69MbHTPurn3FzG80xSLa7GdVzjHEd364HSVJCITe9a0CNEuIQPtOJD3vUt
         LimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684011625; x=1686603625;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zV8NgaKI21AYQDcwSfLTQKxLM+XHKCDcxx81oVOTUWw=;
        b=fu5pCm1DJ+rsr8xHkdx4fgtOrYjkz+bUBLhX18xB7LfX5Q5kTr/GLd4dQP+Ts8kKkw
         +i39O9lQlZX9iEUK25cHvFjOAjqDH1Var5AiOttbErdpAChsnT8AMtipcyDloa6g5vGV
         YxVjD0BwrYxIfzWo/0VwoWq4BYhQmL6t8A/ne3pIBDnWUGIgU1tmm9yOVe4k69c+Vqr9
         4UEPzpApwyQPc68anhMsa8+5mdX9INc/AeiIsxZpplNt6Bf6Yvs62hUMf6UiiKvNNTCw
         lHz3W4GExN+Kk8JUnLVNwiRDz/czvuQc+F9rPgxXGOCG1eXtSA9qToXjcNef83oxUde+
         VWog==
X-Gm-Message-State: AC+VfDxohSPo2HDePby9k6OaKgl1xLy79NAkPv1xdoqtbqKl0115JyDE
	0pMQs3W6FGD8a2gORa+jAmA=
X-Google-Smtp-Source: ACHHUZ490C1IMSfYMBIJPIBdjHu0hQd16yeY8REgzrulETc0r/zO1YtaBnR0pzf3SHx8vnFcg/YI2Q==
X-Received: by 2002:ac2:5d2d:0:b0:4e9:bf83:11a4 with SMTP id i13-20020ac25d2d000000b004e9bf8311a4mr4392216lfb.7.1684011624891;
        Sat, 13 May 2023 14:00:24 -0700 (PDT)
Received: from mobilestation ([95.79.140.35])
        by smtp.gmail.com with ESMTPSA id o1-20020a05651238a100b004d8546456c6sm1927815lft.195.2023.05.13.14.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 14:00:24 -0700 (PDT)
Date: Sun, 14 May 2023 00:00:21 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	"open list:LIBATA SUBSYSTEM" <linux-ide@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] ata: libata: Make ata_platform_remove_one return void
Message-ID: <20230513210021.gver7ibozrmmbm4j@mobilestation>
References: <20230512204646.137746-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230512204646.137746-1-u.kleine-koenig@pengutronix.de>

On Fri, May 12, 2023 at 10:46:46PM +0200, Uwe Kleine-König wrote:
> The function returned zero unconditionally, so the function returning an
> int is something between useless and irritating. With the goal to make
> platform drivers' remove function return void, it's helpful to convert
> the function accordingly. This converts several drivers to the new
> .remove_new callback that was introduced to smoothen the platform driver
> conversion.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

[...]

>  drivers/ata/ahci_dwc.c         | 2 +-

[...]

> diff --git a/drivers/ata/ahci_dwc.c b/drivers/ata/ahci_dwc.c
> index 4bfbb09cdc02..9604a2f6ed48 100644
> --- a/drivers/ata/ahci_dwc.c
> +++ b/drivers/ata/ahci_dwc.c
> @@ -478,7 +478,7 @@ MODULE_DEVICE_TABLE(of, ahci_dwc_of_match);
>  
>  static struct platform_driver ahci_dwc_driver = {
>  	.probe = ahci_dwc_probe,
> -	.remove = ata_platform_remove_one,
> +	.remove_new = ata_platform_remove_one,
>  	.shutdown = ahci_platform_shutdown,
>  	.driver = {
>  		.name = DRV_NAME,

For DWC AHCI SATA
Acked-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

[...]

> -- 
> 2.39.2
> 
