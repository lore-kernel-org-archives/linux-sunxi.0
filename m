Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009D96AD9
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Mar 2023 11:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=R6EWGSlBvFxksTxhhBgfGDWue2APbF3pNxltM0yUPTyOnDLYvZocUJiYjpqYbU6cZ2ldbz
	DAvTwrnBxJJ9xJbW92HU3qyTbYo75/V9i6KB/s8Kb/yrQnndOteOzBxIfBbycL6nG6qFW8
	Ttr2HRvM1j/C1N7Lua9oIt2UA8/ZSzs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-BVXr01G3Nlikuv-wF8CvFQ-1; Thu, 09 Mar 2023 06:28:28 -0500
X-MC-Unique: BVXr01G3Nlikuv-wF8CvFQ-1
Received: by mail-wm1-f69.google.com with SMTP id az39-20020a05600c602700b003e97eb80524so2256103wmb.4
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Mar 2023 03:28:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361308;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=MFFz0chBkjmIDF3wkO3G4Fkw+gBZ51CL2FfX4dlSzQxh+bSkKDNPp7Wfj1D7xrA1KW
         EoRC4A9cmH1fJxViFhkeWOrYORBkKdKyBL3MuTn2fvpxxGtveKTz3ZAwYOVl/6L9X9ku
         iOlHQ7fuJ9BFeDvl4OpqPndOXtsO9OCggZNEL79zihzI9SppO38336Rjp+RQPsAzxQ20
         m7lTEIT5cUJ/DQoMBaENzx7i+7289nGJFWDmNofcweuPi1BQwkS0OGKIDtjieLUe0yiL
         GGNGxh7TD6wx2MnWMvdYjkEQcfzsisVDLElRODgCToV2eGzOIR+tNsKsARPpo1kn+zHN
         HOfQ==
X-Gm-Message-State: AO0yUKWzomM3NRCN7T/mKPCXOtvGRwditUW7PYYIBTNZ+p7+3PAEq6s/
	x13iXEzNbgIN4GgWX3K0iZsY2XtSSbaErXPE3wpDY1CbQsZTIR55Xtv+/BBmYqK6IzNe9wQSDTR
	hmT80i4uz9s0C+2RcbPvqHDU=
X-Received: by 2002:adf:e54b:0:b0:2ce:7b14:62fa with SMTP id z11-20020adfe54b000000b002ce7b1462famr5641268wrm.18.1678361307866;
        Thu, 09 Mar 2023 03:28:27 -0800 (PST)
X-Google-Smtp-Source: AK7set9maKowzBLXhrmVUURVySuRkGf+S+tkdt6mfteqqV00Jt+aM76M3w51SKUbdQy9Rrz6LZ2GlQ==
X-Received: by 2002:adf:e54b:0:b0:2ce:7b14:62fa with SMTP id z11-20020adfe54b000000b002ce7b1462famr5641233wrm.18.1678361307645;
        Thu, 09 Mar 2023 03:28:27 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id g11-20020a05600c310b00b003eb68bb61c8sm2498550wmo.3.2023.03.09.03.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:28:27 -0800 (PST)
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
Subject: Re: [PATCH 20/22] drm/tve200: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-21-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-21-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:28:26 +0100
Message-ID: <87bkl26u5h.fsf@minerva.mail-host-address-is-not-set>
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

