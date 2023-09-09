Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E042919
	for <linux-sunxi@lists.linux.dev>; Sat,  9 Sep 2023 14:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694270252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eRcOkbLQiqXFau3Lzv+lkDuNMwp9k8LF7/IY5MKHdsU=;
	b=Ekf6PoiE+uQ9x88AYf4zRfx2CZ4HUSwTWAy6jueKhvlxWQvPU07NpxTYR4Pifoul6PvRCp
	GiAFHD4SxPQED2r3f2VACAFcB+86bf3p46XrLo6aSLKhRQyERax0G3I/JqIza5n1VqfHUR
	xKf8tK6fwiquMNSCboljOwNHaPXhXls=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-dJOyWe0tOrid_L43RGDIXQ-1; Sat, 09 Sep 2023 10:37:31 -0400
X-MC-Unique: dJOyWe0tOrid_L43RGDIXQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-401ea9bf934so23638095e9.2
        for <linux-sunxi@lists.linux.dev>; Sat, 09 Sep 2023 07:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694270250; x=1694875050;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRcOkbLQiqXFau3Lzv+lkDuNMwp9k8LF7/IY5MKHdsU=;
        b=n74ZDo4DYCWlJf/Wqfj6YriVdJf3+k6BmKhqagrK3wvrhDa4YRhQPxa4M+CdvZ+N0D
         1ZxbOB0zzJU1n1NA1iQYAcVTh8b1gx1Jr1AHfK6k0eJN7wZ7jKjrWpgIKvNdwwn8prhX
         jMYY2xJ7sc3kHkyKRYUYFgp105QUWrJvFO33iuIw609s7OYpC29Z2zPYxTX6WaOCOHCl
         YZAQfiT+LBRzluVhjd+JrgQrGFQOfXc/ruBm1kiafT+kejm6/or0KRex9P8xgjUgLGzt
         45Eg4Yin9vizIs27xBgk+LEngR+lVXMY4Z5FDYUAFwH6VB4ckUHxPT80rjiAKfXi3sXE
         6Zwg==
X-Gm-Message-State: AOJu0YwuEIyX2QHYCydX6Ll3DKkAO+Gcmff3oGWQX8pYFgop9fWXJ63j
	QIR2PIvZceEIrcSca6Sul/AM5w2M6mM6N4/Z0y3oTa2XmyKt3f3O/89Ym0dWXIHJvDhQy0TYZJn
	gAEpkhkOOPPewoqJh2gEn//E=
X-Received: by 2002:a05:600c:2483:b0:401:d2cb:e6f3 with SMTP id 3-20020a05600c248300b00401d2cbe6f3mr5088936wms.1.1694270250170;
        Sat, 09 Sep 2023 07:37:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuI0CHTrTRuHu7U+ySuZ17CrBG1YsmWNBf7nwWhsv6ytgzHpvaJlIL3zjF99nLHiP4wc2jkQ==
X-Received: by 2002:a05:600c:2483:b0:401:d2cb:e6f3 with SMTP id 3-20020a05600c248300b00401d2cbe6f3mr5088899wms.1.1694270249806;
        Sat, 09 Sep 2023 07:37:29 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id k20-20020a7bc414000000b003fd2e898aa3sm3071184wmi.0.2023.09.09.07.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 07:37:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Mali DP Maintainers <malidp@foss.arm.com>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de, Andrew Jeffery
 <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, etnaviv@lists.freedesktop.org, Alim Akhtar
 <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, Xinwei Kong
 <kong.kongxinwei@hisilicon.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 linux-mips@vger.kernel.org, lima@lists.freedesktop.org, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Steven Price <steven.price@arm.com>, Alyssa
 Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH 00/53] drm: Convert to platform remove callback
 returning void
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
Date: Sat, 09 Sep 2023 16:37:28 +0200
Message-ID: <8734znjtuf.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:

Hello Uwe,

> Hello,
>
> this patch series adapts the platform drivers below drivers/gpu/drm
> to use the .remove_new() callback. Compared to the traditional .remove()
> callback .remove_new() returns no value. This is a good thing because
> the driver core doesn't (and cannot) cope for errors during remove. The
> only effect of a non-zero return value in .remove() is that the driver
> core emits a warning. The device is removed anyhow and an early return
> from .remove() usually yields a resource leak.
>
> By changing the remove callback to return void driver authors cannot
> reasonably (but wrongly) assume any more that there happens some kind of
> cleanup later.
>
> Best regards
> Uwe
>
> Uwe Kleine-K=C3=B6nig (53):

[...]

>   drm/imx/ipuv3: Convert to platform remove callback returning void
>   drm/ingenic: Convert to platform remove callback returning void

[...]

>   drm/mediatek: Convert to platform remove callback returning void
>   drm/mediatek: Convert to platform remove callback returning void

[...]

>   drm/msm: Convert to platform remove callback returning void

[...]

>   drm/shmobile: Convert to platform remove callback returning void

Pushed these to drm-misc (drm-misc-next). Thanks!

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

