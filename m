Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821BE6AD9
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Mar 2023 11:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=dyNhlerx4KGeQzPVLdJY9VxEpDzCTyrV4VJYcaj79/bXeb17BW28rHrFQeZrrULp0wu0Nk
	Yqg+k0I23aVXEDWC6CXPOgHW4gtwm+aen/P3xovNsKwOt/Xrt2bl3CEELAYS29f9k66XjV
	UsP8oh8wPGAH/qrupd7RhTP5rXhqPbU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-NaHMc23dMXCmf_x2XvvKlQ-1; Thu, 09 Mar 2023 06:26:38 -0500
X-MC-Unique: NaHMc23dMXCmf_x2XvvKlQ-1
Received: by mail-wm1-f69.google.com with SMTP id m31-20020a05600c3b1f00b003e9de8c95easo545534wms.2
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Mar 2023 03:26:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361197;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=N/XxU1pkC05xKeZjnszp8R0IiLEfBK3tOCiEd6cDVm31E7zjGhi4f76iM+r61ErnNU
         /MD347aOP4fPR4Xx6i7E47on4qiFP2WzHUem9E3r19KL9nubsM8hTYOxQ5jq5BUMaM4c
         cz1ySPXoKj8wz05jFHb1bgz8cxKDUymDF7dUi5YvluZGSX4Ig//khmwv4790GKb9kAxN
         us1qCDYsl/AvgRNBT83p01QDMNy+SJqkQ2Ojme7gkB95yMkQZbaxBYC3G5NfvFQRQAZj
         7nagzh3CnitaBJMVP7JtBkeEjDzwJK87k94wrrOLrpE4QSXZNq8YQfSQAsdn0QxHOZ8l
         yU+Q==
X-Gm-Message-State: AO0yUKU58L7f5recPgvo8aFvY1g4+Po3s21k6MmpPbslP2JjqP+nhrBe
	NA5tggfiWbjpGGiQirmlAHdpiXeJvjEo5yNpUfD5bHn/Dy2VG3rRdPfhiS7zoJ+XKM8m8mBM51G
	gMbDCadlcCikOJjxoOhmqo9M=
X-Received: by 2002:a05:600c:19cf:b0:3db:5f1:53a5 with SMTP id u15-20020a05600c19cf00b003db05f153a5mr19369401wmq.20.1678361197631;
        Thu, 09 Mar 2023 03:26:37 -0800 (PST)
X-Google-Smtp-Source: AK7set+RyBjxyYc/phvqksZd0yr2bTO+U8qhrE/l56ozt/Hpw5EwIkObMj058GJMfnxZhhD8JebzIw==
X-Received: by 2002:a05:600c:19cf:b0:3db:5f1:53a5 with SMTP id u15-20020a05600c19cf00b003db05f153a5mr19369354wmq.20.1678361197403;
        Thu, 09 Mar 2023 03:26:37 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id k23-20020a05600c1c9700b003e21f01c426sm2647711wms.9.2023.03.09.03.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:26:37 -0800 (PST)
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
Subject: Re: [PATCH 15/22] drm/stm: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-16-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-16-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:26:36 +0100
Message-ID: <87pm9i6u8j.fsf@minerva.mail-host-address-is-not-set>
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

