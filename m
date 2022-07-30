Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1FE23D9
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Jul 2022 09:16:27 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id z22so8299550edd.6
        for <linux-sunxi@lists.linux.dev>; Sat, 30 Jul 2022 02:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2ikzYAjzqfaF+a4GkobxDatu0soZrTXVKMloqR9b6tU=;
        b=ODVq1f1/LK9nGxTfjwXO4ssEzwk81G34edDpsOIHpHTuvnSmZevpPG/84UYDkXBv8U
         CLgbMgUZM8dS1bS1AyLYl9eEjgXp3UpwCxBos92t40mUCmBL3QUrK5RfTtU0vwM/AzDe
         gmM98LP8su2vSEdNxfnnqf5nFNmj1zOGilWCgwL/9zXisxjzzlMldbxrv42qo7OKN4nN
         27y9j7VR8dYZ9tQS/gG1Z4hMSlz1BdNwI7wotbL/IkpHLM3nNYdF72nwzeGiuQZSM/0c
         J5AvjWooDFx+mBcmo+4oeRfdmWr2nWcGaUn/UAI5dUv0Ma/OVWJCC+ckBWsKfufFtS+7
         xQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2ikzYAjzqfaF+a4GkobxDatu0soZrTXVKMloqR9b6tU=;
        b=b8d3F9o3fJqgkTY105SL31MCjz9tS6E1y10Zy67PJZ5fwYQwEi9QiIlvwB8G6enU/b
         25qJVGWkCnYMIQenwPsnk5sxjDenTViH8diengvmqidzRFh+rRkRF3qiwsvNnbGlirry
         z3rw5W/+sNE+9MAORE8/fjks5lPl6poEOIF66yk+8mlw4Zj4E+gSOy76oNGCShZzqAnM
         m81XFhp2ZcI5c/ZMncUnAprHStW417/I4Sx3LOy46ILVUKxD5/WdmydOivbupHSPkiAo
         37qv872+idVU0gxhbl2zgKcrgynW8QABED+BBx/9QwIz6nliZgpBxwebhseiUHEmDn9K
         AP7A==
X-Gm-Message-State: AJIora+gdf7xxbzdSi3KboKeSGFY0txwy6JgnNqeROj2Uuh/V8Hcuda9
	lzGPDVON2Sh2m+799Zsxyg0=
X-Google-Smtp-Source: AGRyM1vwibvRhtEPZaZcnZE0I3sovCWh/d2MGizGNAj8LqkgAI7GjPSEvzFNhCBH1UWn2jszQI2xYA==
X-Received: by 2002:a05:6402:40d2:b0:43c:5a4d:c3b4 with SMTP id z18-20020a05640240d200b0043c5a4dc3b4mr7329019edb.95.1659172585551;
        Sat, 30 Jul 2022 02:16:25 -0700 (PDT)
Received: from jernej-laptop.localnet (194-152-27-124.dynamic.telemach.net. [194.152.27.124])
        by smtp.gmail.com with ESMTPSA id p24-20020a17090653d800b0073045f26d41sm676395ejo.72.2022.07.30.02.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 02:16:25 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>, Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>, Maxime Ripard <maxime@cerno.tech>
Cc: Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>
Subject: Re: [PATCH v1 31/35] drm/sun4i: tv: Add missing reset assertion
Date: Sat, 30 Jul 2022 11:16:23 +0200
Message-ID: <1822091.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-31-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech> <20220728-rpi-analog-tv-properties-v1-31-3d53ae722097@cerno.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 29. julij 2022 ob 18:35:14 CEST je Maxime Ripard napisal(a):
> The reset line is deasserted at bind, and asserted if we ever encounter an
> error there. However, it's never deasserted in unbind which will lead to a

s/deasserted/asserted/

Once fixed:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> resource unbalance.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c
> b/drivers/gpu/drm/sun4i/sun4i_tv.c index ad6a3739bfa9..74ff5ad6a8b9 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> @@ -605,6 +605,7 @@ static void sun4i_tv_unbind(struct device *dev, struct
> device *master, drm_connector_cleanup(&tv->connector);
>  	drm_encoder_cleanup(&tv->encoder);
>  	clk_disable_unprepare(tv->clk);
> +	reset_control_assert(tv->reset);
>  }
> 
>  static const struct component_ops sun4i_tv_ops = {




