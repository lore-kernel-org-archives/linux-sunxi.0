Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3D56AD9
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Mar 2023 11:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=Tg8tHneVRsd+W+BnvY/VHtX2lYyoBX4SgPnIf5W+ECT9GcrnsskFJ2yQCAdIIkdfKFeePc
	yReHFHMgEc4RIIHK89iYO4oR1/QeiVL4FPcQL34cpySYL8glQGD7a1aq3FlyFZeT+zOYcc
	y4n28h6SrRTOqcObSbTHR3aFl7991xM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-xKPpB6ddN-CL8WoaQRKDcg-1; Thu, 09 Mar 2023 06:27:34 -0500
X-MC-Unique: xKPpB6ddN-CL8WoaQRKDcg-1
Received: by mail-wm1-f72.google.com with SMTP id l23-20020a7bc457000000b003e206cbce8dso543991wmi.7
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Mar 2023 03:27:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361253;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=II8Fe4WxDoeC04CnHbPyRSj0wCAOlfECWC7P3Gdl/yejji+yoLKiCu8oIbNLnBlIgb
         Ey1AndAF9+Wyq04zLvuNF9aVOiir/dUHoyxCgZWNPeLK0NgB1+FgiU8tdzD1gZ6ffiwC
         HKuxT93MTB91kcFbdJ5hNNGWiwYpas5b/KXOl4YTYqCECarQPTUExY93pfJUQkGiACSS
         y/EONvzM1TWodVefgbT6ztKiQFDEfc4XQXoMZioID+gD6m+IAoBOtHMSp0j3ZLE/9jfx
         +MEkDfrnWN7/0/Er7xufAlmUF9F37R9qC3YMM8u7pdOLy0bkK0GRxODJF0ZGRXqwTv9h
         A+xg==
X-Gm-Message-State: AO0yUKUljQoowKyXQceXEUkKE2GEibi/90ZapD+Cj5JSAJZd6o2s+3jr
	+FsAGrs5ZwntrgDnoYuwN350sueGIXOW/viVEX0jvyPPJA55dz0K9jxV+Rf43kKjSZJ6xIrAE2Y
	hCuKtq4Wanw+9RYn7hsfaQrU=
X-Received: by 2002:a05:600c:1d16:b0:3df:9858:c030 with SMTP id l22-20020a05600c1d1600b003df9858c030mr18329016wms.5.1678361253089;
        Thu, 09 Mar 2023 03:27:33 -0800 (PST)
X-Google-Smtp-Source: AK7set9NkiNNv96tpY+ICOstwyMw+enkMfLxXSTreTdhPg1jdkeOeFAU5LDWK20u9ucio+cg3Xhjrg==
X-Received: by 2002:a05:600c:1d16:b0:3df:9858:c030 with SMTP id l22-20020a05600c1d1600b003df9858c030mr18328975wms.5.1678361252754;
        Thu, 09 Mar 2023 03:27:32 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id l6-20020a1c7906000000b003e2052bad94sm2217733wme.33.2023.03.09.03.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:27:32 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, andrew@aj.id.au, laurentiu.palcu@oss.nxp.com,
 l.stach@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 p.zabel@pengutronix.de, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, alain.volmat@foss.st.com,
 yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, jernej.skrabec@gmail.com,
 samuel@sholland.org, jyri.sarha@iki.fi, tomba@kernel.org,
 linus.walleij@linaro.org, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 18/22] drm/tilcdc: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-19-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-19-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:27:31 +0100
Message-ID: <87h6uu6u70.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use the fbdev emulation that is optimized for DMA helpers. Avoids
> possible shadow buffering and makes the code simpler.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

