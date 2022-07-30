Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCCA23D9
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Jul 2022 09:15:22 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id gk3so82679ejb.8
        for <linux-sunxi@lists.linux.dev>; Sat, 30 Jul 2022 02:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rwWtE2tS+sQfxC0TkYkw+6LysHn8HM6so6RxZNUEwWQ=;
        b=cUuJZ0nzayLtd8sD1yqDO+l52EhIAyWq6fLaHZagbbZVJKKCUYyqC0sLoFqK5i10zC
         OiQN+JhbXIBEd+ifQUUou0Xm4CHUyrEtDHAFIfsJ/thybpafFsKAGPc+zRW8drWcD/2y
         MbcptzAARs9f2bw9vbEiLNPGkXipLLlozKnC8B+j1/A0VCwDPynRlCFADJymcs/nZQMq
         0r+PNxvDlrSlp8SkpMFbTyC2zaG1kGz6VKlhT0BnkbvQfXkLmm9augDHwmRVcE0vsk27
         xIUv8XBlV3TzjiCAoD1ucUi3DHMqMiTxaxbG+/0huI6IfOY2cXOfRUJCzDSSbZHbPWt6
         B20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rwWtE2tS+sQfxC0TkYkw+6LysHn8HM6so6RxZNUEwWQ=;
        b=CQOH/x+mH/L1hF5xzSaWlxIP7KxmG7vMjSErPgE6jRgna3j4wvm9prYFY09HWRn6hA
         NemQmz8LCNgo4QQ92tGnabazlvwdcnFOEUyFA4Hkw/7Wfz6pJxH3H4uvpM58PSzAvYuQ
         GjJs34uHl+J8u8oqiZazVaCpamR8xkYKo6ifHKyuQpAhi39TbDnnjmVP26iAwxaS+Mka
         lAxE8b2x89aoFTlZEUcti4jremJ61rjH/EGxh0YQOJ/OmoxhDge0BV9zDx16SEpj3po4
         uMfTV16xuuwNy4Wx2SMfRuQIAM4J0wZOtyI2b6mDz7Gu2e58B/maMC1hrI9wkxJ9BqFw
         SKhg==
X-Gm-Message-State: AJIora9KuJF17/37zZlhcL0t9Tp/rqhG3rTKg3M0VOr6na+QpznNOCC6
	VgXR5sa5JuygiyLSWUYoe8M=
X-Google-Smtp-Source: AGRyM1uUUQf/u0gQ0J3VcW2S6C2L6ixaRhj3FiMEXuT1uyjb9VsBFnqW3+WGYV9mlP57pVmny/vcAA==
X-Received: by 2002:a17:907:7638:b0:72d:f11b:5ebb with SMTP id jy24-20020a170907763800b0072df11b5ebbmr5799655ejc.647.1659172521175;
        Sat, 30 Jul 2022 02:15:21 -0700 (PDT)
Received: from jernej-laptop.localnet (194-152-27-124.dynamic.telemach.net. [194.152.27.124])
        by smtp.gmail.com with ESMTPSA id g5-20020a056402114500b0043cf0d56a61sm3623915edw.8.2022.07.30.02.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 02:15:20 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>, Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>, Maxime Ripard <maxime@cerno.tech>
Cc: Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>
Subject: Re: [PATCH v1 30/35] drm/sun4i: tv: Rename error label
Date: Sat, 30 Jul 2022 11:15:19 +0200
Message-ID: <2245985.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-30-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech> <20220728-rpi-analog-tv-properties-v1-30-3d53ae722097@cerno.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 29. julij 2022 ob 18:35:13 CEST je Maxime Ripard napisal(a):
> The other error labels in sun4i_tv_bind() are named after the task they
> perform (err_disable_clk to call clk_disable_unprepare for example).
> 
> However, the err_cleanup_connector is named after the calling site
> (drm_connector_init failing) and will actually cleanup the encoder. Let's
> rename it to err_cleanup_encoder to be consistent.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c
> b/drivers/gpu/drm/sun4i/sun4i_tv.c index 6d7e1d51569a..ad6a3739bfa9 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> @@ -580,7 +580,7 @@ static int sun4i_tv_bind(struct device *dev, struct
> device *master, if (ret) {
>  		dev_err(dev,
>  			"Couldn't initialise the Composite 
connector\n");
> -		goto err_cleanup_connector;
> +		goto err_cleanup_encoder;
>  	}
>  	tv->connector.interlace_allowed = true;
> 
> @@ -588,7 +588,7 @@ static int sun4i_tv_bind(struct device *dev, struct
> device *master,
> 
>  	return 0;
> 
> -err_cleanup_connector:
> +err_cleanup_encoder:
>  	drm_encoder_cleanup(&tv->encoder);
>  err_disable_clk:
>  	clk_disable_unprepare(tv->clk);




