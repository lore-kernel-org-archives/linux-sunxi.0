Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15916AD9
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Mar 2023 11:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=XX357ieAPtGv0Rh0t31gJ639rZi1FlWdwLgBSID3nj+NJD10X1l2n4na2LAU7v1Xpm/1G2
	uhk+kaSZcmThSWcQckbL38M0SHmEhM09fZSkEuULoNpkGPVnt/GJwbk1kEfj7P0L4xuz2j
	HUmPi/XDKoWwkGwYdzOkgunE+9cpwgo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-pHqEEVdgNiCRqo_6tTofGA-1; Thu, 09 Mar 2023 06:26:56 -0500
X-MC-Unique: pHqEEVdgNiCRqo_6tTofGA-1
Received: by mail-wm1-f70.google.com with SMTP id l31-20020a05600c1d1f00b003e8626cdd42so544854wms.3
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Mar 2023 03:26:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361215;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=Cp20WnjqyPcrBzDjHkll6TjS23d2++vNWlHh0Tc09wZrkEXM/uPlfW6HJKZ+CnDwIS
         80nVXC7UMOceibxwbXMtQDUQdnCbGcxRkTCWZH0wj4eSfNhOc3PjUtK5Vlok9oUxsYZT
         Dtaronz2T2ngR57BCVxQS2QN8tOeXFTTCoE2JdSRzDvUuedsOR55sZnCZkfX06jPcURH
         ODwjnOuZj+WbTQmIZXlYm1z/KEWDzk+BesD9dDy3Ot8xIKfaZW/TA+KRgG4m/7J68Rfw
         6aDXHSXMi8WZ5YdnpobEpMFLm8mmG/huRn6tWEVqmiCLWLVr9OcdtNUij8q/mvjUBnPA
         wUxQ==
X-Gm-Message-State: AO0yUKXyG8imj8rhxRNoI6tn1jR3oxERshWPvWXwxPibZo2fNCia/vzJ
	jvrZ/xHMIqd3C0tn8NV1sP+tzZCw1myu6sbkEi/Xb85f128li5dXnYxfwKXOSTcniZOkgc91fya
	CtPgxYqk0pqYv6j4LHctbDbU=
X-Received: by 2002:a05:600c:19d2:b0:3e7:95ba:e1c7 with SMTP id u18-20020a05600c19d200b003e795bae1c7mr19013911wmq.32.1678361214954;
        Thu, 09 Mar 2023 03:26:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+ootXMCqEk3gOIZKrqE6NGC6vCRZefQop/jJ1mx2KmfjNSeFee8+geTPWhVxDzmhIrEN6nCQ==
X-Received: by 2002:a05:600c:19d2:b0:3e7:95ba:e1c7 with SMTP id u18-20020a05600c19d200b003e795bae1c7mr19013869wmq.32.1678361214645;
        Thu, 09 Mar 2023 03:26:54 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id 5-20020a05600c230500b003db01178b62sm2249369wmo.40.2023.03.09.03.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:26:54 -0800 (PST)
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
Subject: Re: [PATCH 16/22] drm/sun4i: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-17-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-17-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:26:53 +0100
Message-ID: <87mt4m6u82.fsf@minerva.mail-host-address-is-not-set>
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

