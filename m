Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC126AD9
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Mar 2023 11:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=QGtKIkAUDfax/IoBNEytpljnWwNlAd5TGdI7mxG9OyrPt13m1KB3h8HlHEySbVuStsGkzI
	DokXitxMdSnZXYDxdJMthC8yhk1SbzwGyA9V+lZSHqxiiTbGAxsjXJedhhNmzEFygy8mPl
	99lWZ8WoYWmx3Abv1pnaKZJQPLFwXhU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-SHrC3P8tOlmTbzaF77yJCA-1; Thu, 09 Mar 2023 06:29:05 -0500
X-MC-Unique: SHrC3P8tOlmTbzaF77yJCA-1
Received: by mail-wm1-f72.google.com with SMTP id k36-20020a05600c1ca400b003eac86e4387so2248104wms.8
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Mar 2023 03:29:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361344;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=LkCdz6Bj2S33J1p+Xl2b/fwAvugKNNaZYhLpzdnCHUjg6bgRs88Rz0ka7/wr+QMdDi
         JArhON6KerxbtpZcUXYuvYU1EjBuGhX9sJkL3GeZVD6cYD/q39TBp944/PsmrrsvjhGY
         ePo9z6nmM9GmGt+ulbU5nWupfqlJaLZNLa/bghogX6j1bt9FKPegmi16EmNbtbF61Dxh
         eP5ZbcSWgZ50+DizXFgr7uOVz+kUC+p+vxI531UX51czSWDkZjE640ojsBTmHBtSV2QM
         EraIZ/P3t/LvI2WqOF/0HSEsEctiO36Uzb2a9rukw0XcTkqILB4hhxH0dKVLQf1rhnWN
         gGkg==
X-Gm-Message-State: AO0yUKVtVq21DFgV3dHCwkpIzVGV8TNLo+KkqCKb2hMxCYRD7J/g3h9b
	01vPtDN3D+vwLjVDHIliB2hHe2IbO4Q888h9NrSeZilp0+R0yTJ2uH5UbIjB+JnWILHXqDa32EG
	9i1SYQp3PXrZ4PbvG8gmqank=
X-Received: by 2002:a5d:6505:0:b0:2c6:e682:e55b with SMTP id x5-20020a5d6505000000b002c6e682e55bmr11934466wru.48.1678361344741;
        Thu, 09 Mar 2023 03:29:04 -0800 (PST)
X-Google-Smtp-Source: AK7set/SuOlGzNjzuB+/71QhRoDFVzQZ5KDl1yemHeUwxjB4OayINr1XWjAGx9mSH74oqRW7vJe0XA==
X-Received: by 2002:a5d:6505:0:b0:2c6:e682:e55b with SMTP id x5-20020a5d6505000000b002c6e682e55bmr11934447wru.48.1678361344548;
        Thu, 09 Mar 2023 03:29:04 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bg2-20020a05600c3c8200b003e214803343sm2615371wmb.46.2023.03.09.03.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:29:04 -0800 (PST)
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
Subject: Re: [PATCH 22/22] drm/xlnx: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-23-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-23-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:29:03 +0100
Message-ID: <875yba6u4g.fsf@minerva.mail-host-address-is-not-set>
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

