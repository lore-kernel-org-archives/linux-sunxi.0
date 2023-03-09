Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAD36AD9
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Mar 2023 11:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=X9elkJ+oG+F43/92K4ZY+JBB40u81XDmDcsMocP1CMNF64HH3NGjy+IeuuGmXL4aWlGXJB
	Uy1TFl1uRU4JKj/93K99rWIz/SzD74lzhAm1zeygmHguyG+jf4gDK2PpGxbHZ/xOQuSiGm
	Usxu387OziyY+uQcthN3DEFQQjVsKA0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-GkMVrzEZN0SBrrDRthz19Q-1; Thu, 09 Mar 2023 06:28:08 -0500
X-MC-Unique: GkMVrzEZN0SBrrDRthz19Q-1
Received: by mail-wm1-f72.google.com with SMTP id 4-20020a05600c024400b003eb2e295c05so553219wmj.0
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Mar 2023 03:28:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361287;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=n4HZgenpG5mn5TLltGza5sIdC/1gZ7cnPzp8i5fZsUVGtTDZPjwOQ3KcoNMt5WPyqZ
         KvNDJE0HmaO0fe/IE7kpVQ7PL+nTjC79UIfbshYwzyAwGru5dVG0iUmq8oek/OLpEpoO
         IMSPsMvDkMSHebZ0m1x8a/CkWIozxa0DILhiYbtupGcK2etSh4BTDvB2y62l1g0mZICS
         f/Q+v3QgCsNqA9JERgrdOs0jEuJXuztnSMPiWfTOBpEMEV44WXVgB019VGbGiVfNuv+y
         gwqhmNgTUjVfjG5ApGFJ6xduF9rVp+kXTv6xIBBlWj/92m3LqzZcmBMUixgeUaMZhG63
         rSfQ==
X-Gm-Message-State: AO0yUKVoWjmQI9rB6pWFaxGHXevAR5e0tqxn8fiBum3dv9nmEqnIjyr1
	2AAQFUUFuFgfCYEW/B1X4XieCfSJrvDsKgEWFRCxsIK1PGLMhAZAvvMndDhOFMXAzRUkRcZAuNE
	HN5ltYbQDUzqmCkuxDd9AZ5k=
X-Received: by 2002:a05:600c:45c6:b0:3eb:2e1e:beae with SMTP id s6-20020a05600c45c600b003eb2e1ebeaemr18094358wmo.25.1678361286859;
        Thu, 09 Mar 2023 03:28:06 -0800 (PST)
X-Google-Smtp-Source: AK7set/WVkqnZjpkmSmEiWhaQK18CsrOsasLB6GMCz1AC0uyDvVk4dRPtB1UV7OYFbDbrMsIDiabKA==
X-Received: by 2002:a05:600c:45c6:b0:3eb:2e1e:beae with SMTP id s6-20020a05600c45c600b003eb2e1ebeaemr18094343wmo.25.1678361286535;
        Thu, 09 Mar 2023 03:28:06 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f10-20020a5d4dca000000b002c70bfe505esm17395825wru.82.2023.03.09.03.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:28:06 -0800 (PST)
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
Subject: Re: [PATCH 19/22] drm/arcpgu: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-20-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-20-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:28:05 +0100
Message-ID: <87edpy6u62.fsf@minerva.mail-host-address-is-not-set>
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

