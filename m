Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AB86AD9
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Mar 2023 11:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=CcQrOEUB/gHc08FDyHUmbpoI5j6Sxt29lT4DqNfsktbvGB4CYoWTU6NGm5Y+cZuTV9ju5+
	cuoSB8NLuNzi6jh0++rfYbwfGO22kfiwryBDWxs5z7KGzUdVBRyiQ/yb1ydC79sIVR0LGA
	lHgfXd605kMnf4kMXIp0mvlLzqhE+xs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-Kp0SdGGPNgS_L3j6Bw-Q4Q-1; Thu, 09 Mar 2023 06:22:08 -0500
X-MC-Unique: Kp0SdGGPNgS_L3j6Bw-Q4Q-1
Received: by mail-wm1-f72.google.com with SMTP id bi27-20020a05600c3d9b00b003e9d0925341so539146wmb.8
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Mar 2023 03:22:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360927;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=u6qwo2ucbsLYOgAswYXLSjrO0BfJz0rbapnnJwBXyHTIf6CXl3qQCi+rnc7ba2+TY8
         Mfb7414KsXEzAC+hSl7sxHoEzHRxIi9+Ew/28Bib+Xh29ITZdMPySeYXKZaEEns5v8m5
         SpxNya1Lj6Ia1heJq6TEJuLxuSXh6lx/mi2pTbXsgAOOo8A0Jxd7IwljGV3UPGVDADlb
         C9wiNky/42rwH1XYJnhk6ke+rgLYxUOPHgfO/Hp2CL++pR5toDR4cZ0YsqxdPha7sv0t
         lEaV7S3ZwNRGD9cEDySiEmFgWYSPB0PmtMUvFYouWQG2uJG8Eg37ILLbSOnZhwoEtCe6
         iUZA==
X-Gm-Message-State: AO0yUKXSpwB4liFzGO5TmnpmdOA6Z6tTrigORtyzvAbbSjmpr66DpyNl
	Yt0JW6eBGF0+0OBKpli+9sbyEVi36jgqPK9/Udbf6z3XVhRKwxfrO7qptVrSgXJtQvYYlgSGk6n
	V7MXaIz0bsc/lpITDVKl5dFs=
X-Received: by 2002:a05:600c:1909:b0:3eb:248f:a140 with SMTP id j9-20020a05600c190900b003eb248fa140mr20913751wmq.6.1678360927390;
        Thu, 09 Mar 2023 03:22:07 -0800 (PST)
X-Google-Smtp-Source: AK7set8sm+8KaUtaTToC6ewzxor62agxQaZWhIHs+6czjysLnXbg5f9mG7vIV2yLxia1B+mTwIz1AA==
X-Received: by 2002:a05:600c:1909:b0:3eb:248f:a140 with SMTP id j9-20020a05600c190900b003eb248fa140mr20913724wmq.6.1678360927112;
        Thu, 09 Mar 2023 03:22:07 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id i3-20020a05600c354300b003ebff290a52sm2051380wmq.28.2023.03.09.03.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:22:06 -0800 (PST)
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
Subject: Re: [PATCH 08/22] drm/imx: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-9-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-9-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:22:06 +0100
Message-ID: <87bkl2cgpt.fsf@minerva.mail-host-address-is-not-set>
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

