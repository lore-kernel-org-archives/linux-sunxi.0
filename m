Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337226AD9
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Mar 2023 11:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=G2zxcM5XFvPOogQgAGhDYLPFj6iK2DQb/QIqJxf2mAsgto0qflhs0OoQ0IXuT/oLwOIPUt
	1bAsgPyflJLaEkqonW6oY7WfG/sL6b87tQh5XOm6ZG1u5QjUopYqJCJDkbc6w6jH/rh2KN
	o9UYHuz23jYsj4eC4+yq//yWych3usE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-rQqkJ1C-Ph2n_2mhzGqSFA-1; Thu, 09 Mar 2023 06:25:52 -0500
X-MC-Unique: rQqkJ1C-Ph2n_2mhzGqSFA-1
Received: by mail-wm1-f72.google.com with SMTP id bi21-20020a05600c3d9500b003e836e354e0so651615wmb.5
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Mar 2023 03:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361151;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=rRUcKq3alwWSsZ66HXsrInSs+JvTGe93HMBU76Vsd6sI8nLZ4+v6JrPIXnUnnTgYT7
         26Azya49ZVr5fIyyrTXwZwzdDnC4uaWpLm9lXC64CCSSSNlDMAaBVO8fRkKDXV2kTo4f
         rNW9CR1B5GjgYJWVqU2A4EoMG4UxUOc+FK7dKljBtjsEOzQZkWGsDE8+Fso6QK0Knsw+
         OzwIkRN5do7waDunbis4EPsfNrss24TTH8q/rEIvrVX4qRlinFOXpxmn+XOAjaPDZh4q
         YihGAdEFLFWtT6MGGAZdB2N8yQvCVR73LopQ/73PQlpEOdrlU0SS9AlkIpqPruWcghF0
         jLPA==
X-Gm-Message-State: AO0yUKUN2/Ey/3zWk4r4lPUY2k6ophTOo2GAOuN965unIMJHNuFG8/qy
	XdSEfu9HQjeTqE558CZr3JAEjZBhIOV6Ko01Cs4pPMitjyfpk1Nj7l5Vna7E55S2lsL2aHpBQzh
	uI3Rxjv0eBfdjBblCwXqhSq8=
X-Received: by 2002:a05:6000:1a54:b0:2ca:6cb1:c9c5 with SMTP id t20-20020a0560001a5400b002ca6cb1c9c5mr14672892wry.30.1678361151280;
        Thu, 09 Mar 2023 03:25:51 -0800 (PST)
X-Google-Smtp-Source: AK7set+fKWERQDzcgswyQf9IdMUANe41W2TE3VA84WcXGdem8/aR/1UT8t++iE4upU8MSOqw2VB+mg==
X-Received: by 2002:a05:6000:1a54:b0:2ca:6cb1:c9c5 with SMTP id t20-20020a0560001a5400b002ca6cb1c9c5mr14672854wry.30.1678361151005;
        Thu, 09 Mar 2023 03:25:51 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id b3-20020a5d40c3000000b002ce37d2464csm13808052wrq.83.2023.03.09.03.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:25:50 -0800 (PST)
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
Subject: Re: [PATCH 13/22] drm/mxsfb: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-14-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-14-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:25:50 +0100
Message-ID: <87v8ja6u9t.fsf@minerva.mail-host-address-is-not-set>
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

