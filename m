Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281789443
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Mar 2023 11:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=VcaBdZhCNdA2qk6UngItWJM2Zsy2DJgYqGVMFCWRvl2uWu5Gf6grEEm8MtDqgnEQOVVCSZ
	6lPELiORVZeOuFVO5ki1VzOQEEKPUqb0hmKe8AcxVHfoKFJFKu1elPmlfWzx8ZlnctBgds
	bD7pwk4/dRg+d/FRy30yDu9hm+zGeZc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-HtMgEzEyOAypF5wUvuPFFQ-1; Thu, 09 Mar 2023 06:20:41 -0500
X-MC-Unique: HtMgEzEyOAypF5wUvuPFFQ-1
Received: by mail-wm1-f72.google.com with SMTP id az12-20020a05600c600c00b003e8910ec2fdso538804wmb.6
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Mar 2023 03:20:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360840;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=pCe8Eung+cAnu7+J3DWYKe4z3ov1vDM1pnYAaNLGjhCHpjyPgODCMQU1cRCbDWo54n
         dN7FnCYrbkloRGrZhO3cHdU1uS+RS+0JGAFjYNuih+KDwNQNuvgQTzdXlKbtA5tvABrB
         lTjylIOd5FrMG2yZj8hb00cTdM7bdaUPYGCaaek35ZKwlMfV/baqsfp0IHpPE4XMgZqg
         YYIWrYD3ATtx0WzTKqYYrcpS9NUWjgswNW+0gAgRpRObuKnfe+KJkpaoIu39G3wMv6Ot
         R7SD/Wf8yMBRCD3MyVUy9NQ2Jf9BZUC/YXyHOSa7nrrzikpK66wWtphbhNSQ/AaFIEMQ
         KFow==
X-Gm-Message-State: AO0yUKWo+pNINlZyBT+/Gr91ukbV9Xg0mp2PxXYr3/eKry1Cjv9t9SOR
	CMiVhz6pZB6iyg0AAHOGxDSyxyN5SQ4o3cQtchFSo/LJeAMCUJhW98U/0ix4j3vRLv5FQ2yJXlH
	plf3qoO4wvIDZTXHoGnjz9Ro=
X-Received: by 2002:a05:600c:4449:b0:3df:e659:f9d9 with SMTP id v9-20020a05600c444900b003dfe659f9d9mr17924786wmn.34.1678360840091;
        Thu, 09 Mar 2023 03:20:40 -0800 (PST)
X-Google-Smtp-Source: AK7set90uCM0Kw514Efx0RC1JOWrOFPoY3H9ZtCG8DZJ7CZ4XdZwaIBFGLtcMSgQBx3eBGbTb1Y4bA==
X-Received: by 2002:a05:600c:4449:b0:3df:e659:f9d9 with SMTP id v9-20020a05600c444900b003dfe659f9d9mr17924778wmn.34.1678360839923;
        Thu, 09 Mar 2023 03:20:39 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id az5-20020a05600c600500b003eaf666cbe0sm2386747wmb.27.2023.03.09.03.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:20:39 -0800 (PST)
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
Subject: Re: [PATCH 06/22] drm/fsl-dcu: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-7-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-7-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:20:39 +0100
Message-ID: <87mt4mcgs8.fsf@minerva.mail-host-address-is-not-set>
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

