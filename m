Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0F69447
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Mar 2023 11:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=Je2CZyGuW41jE5Wzc6LKq8bk/71VIENRL2Iv+q1jbxdatNNYwfggHmo+B4b5wwF9oIRJON
	1vbwsOCxv8d0YNt9dT+4/Emp8ehOGqOG+iFdxUKjFd4EnxjvsniKCPqCqkvtKkL6EYttBi
	fdiyrAl8AbFy1meOHFsrAa35yUjhH8c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-wfWm_XaBPNm_0YOydZ-UHA-1; Thu, 09 Mar 2023 06:24:26 -0500
X-MC-Unique: wfWm_XaBPNm_0YOydZ-UHA-1
Received: by mail-wm1-f70.google.com with SMTP id n15-20020a05600c500f00b003dd07ce79c8so658467wmr.1
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Mar 2023 03:24:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361065;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=Z+aPxONLnQbpY2YYykenO6y4RA3jzpOYRHqg2N98IgYCXP5fZkGMgpe01B5QyxhVHQ
         /Y/bXh2jiMqA5HElHBbkGe6LDZ6ctRRH93zomSdUCT3w8uNTv7T3f3U/GCy1ETDHsnh6
         S6fMMHP2hDNyi3stQca9GPZnvuWvxm8k6bd3mwbWHwoR+wxfPJJ6oZrRSFRXq8UV5IpV
         f6ebVp4txRTePf6gSBgM+48HUfFRYvSqsEBzZdN0f7HfOrM3+7rLDl7viVj5WGR+ZHCH
         jU3a0kbFybqFwXh6xLsUXuOF1c625n2QWi7moxE9PSKN3TkADfa3KuQJaSlWwpreDbf9
         FFpw==
X-Gm-Message-State: AO0yUKV2Y1719Hv6ddXB9rFxPxbsjuo+DzbrENtpHWP7k8JoNDKzVyV2
	dOF3NgEvqFydF8p4MIuZYjmjCSSwoIQ9gEicyVAG1pmYVDmmYpCqQXBduzIdVy6dpmyw1KTnp1A
	/HrKiO4gkQBAR2mXHhCNsvlo=
X-Received: by 2002:a05:600c:45d3:b0:3e7:cee4:f8a with SMTP id s19-20020a05600c45d300b003e7cee40f8amr19365861wmo.29.1678361065659;
        Thu, 09 Mar 2023 03:24:25 -0800 (PST)
X-Google-Smtp-Source: AK7set9lVCuiT3oH2S4c0dL4PFGWn3m73Ldrm4xd1nwgxerYQstdGiySSUAK65ix4kHFEogJnnnnZQ==
X-Received: by 2002:a05:600c:45d3:b0:3e7:cee4:f8a with SMTP id s19-20020a05600c45d300b003e7cee40f8amr19365828wmo.29.1678361065371;
        Thu, 09 Mar 2023 03:24:25 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id r1-20020a05600c35c100b003dfe5190376sm2436712wmq.35.2023.03.09.03.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:24:25 -0800 (PST)
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
Subject: Re: [PATCH 12/22] drm/mxsfb/lcdif: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-13-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-13-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:24:24 +0100
Message-ID: <87356ecglz.fsf@minerva.mail-host-address-is-not-set>
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

