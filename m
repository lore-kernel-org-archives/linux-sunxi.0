Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4456AD9
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Mar 2023 11:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=Y0w9WY0anRnaOp5s5PVvSnqnK0gUmSfQDPj5w7KRjHBA9isrVwZCevt0G13wpgMz5zKWs5
	u+hrjU8ksyk/DJxBACl24ZHXKRoZltK9pOdOjn3sn/zpPvvhNsdYIwAXpYnd41d/Vy6yBa
	xTqWMM3TgbGklMK0X2X4eODs1ytlQJk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-nrGaabjkOtGcD4fgfjrxdg-1; Thu, 09 Mar 2023 06:28:43 -0500
X-MC-Unique: nrGaabjkOtGcD4fgfjrxdg-1
Received: by mail-wm1-f70.google.com with SMTP id u19-20020a05600c00d300b003eb24ce58ceso544475wmm.9
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Mar 2023 03:28:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361322;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=bv0pAE1kjZjADIcV9ZVV0+LlKBLwVyuPRTYlBqCGmr7zFBWRfbtfIu7aTiGahSFv0G
         oLpHF6nEApmlunqFbQAYKr+Lxauj2oOO1P/OWm9UaZq2d1S0ypDneXqmjsCY2OFPwQvY
         e2oIimARalZ8xSYpq+L6iN8vagOIWOHjdawQF3lkqUPvHFwNq3Z90BC6P7uUT8WXUt3b
         Vh1qHp2IIxdNxYKutcloK1uTn3gJadUEHD9odA0tcthE7eT6tsOc0wJ4HxIbJoC98Z9R
         TY/Nb/t8C8AZhGP9f0f/WaVgmd+gdEvENJ1ymAyxr75oLKX0zOz9EcKCmBLZSW8l7Vyy
         5d9g==
X-Gm-Message-State: AO0yUKXzOTnR0UyTyfafxGE7SRxY9c4wgPmsGn0mlAskaKJ15uYDiRGA
	u9NWM1C7bzDwMnQGwHUwN+DSBDlPa/GeUplBYP+dg6xXjFUN1oqTUEre8ON4ldIrKHfKUcKulcV
	nZP/qhTfwX8FYaNUf3L5CtYs=
X-Received: by 2002:adf:fb51:0:b0:2ce:7219:42b8 with SMTP id c17-20020adffb51000000b002ce721942b8mr7244755wrs.32.1678361322366;
        Thu, 09 Mar 2023 03:28:42 -0800 (PST)
X-Google-Smtp-Source: AK7set8Mn2JIY54bbfAArMm1jwHLD5d38GNHioh3xaVKkpiDjrBseSSAAHghi7SxByPhaXqMV5nmpg==
X-Received: by 2002:adf:fb51:0:b0:2ce:7219:42b8 with SMTP id c17-20020adffb51000000b002ce721942b8mr7244719wrs.32.1678361322054;
        Thu, 09 Mar 2023 03:28:42 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id c22-20020a7bc856000000b003dc4a47605fsm2372395wml.8.2023.03.09.03.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:28:41 -0800 (PST)
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
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, Thomas Zimmermann
 <tzimmermann@suse.de>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 21/22] drm/vc4: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-22-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-22-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:28:41 +0100
Message-ID: <878rg66u52.fsf@minerva.mail-host-address-is-not-set>
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

