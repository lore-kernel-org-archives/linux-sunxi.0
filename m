Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C8D6AD9
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Mar 2023 11:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=Vt2gC16v0SYRVdeuX48YxzPxRCsDLtF8zNlWCdwEtD17qOtmKENhnIIfTvbvmev3U9uPVF
	RzbctMyGNs0JM1n/yBlZr4R1Lwz/1sUm1vJXlXl+LGTEwBOwrZJKCAVpLWtEr53sGo2XvK
	tBEHpm8FpPirUJ+DM+i9CsZ6h86QAxM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-jpt0gQeZPGyKEAJ46PXpXQ-1; Thu, 09 Mar 2023 06:23:47 -0500
X-MC-Unique: jpt0gQeZPGyKEAJ46PXpXQ-1
Received: by mail-wm1-f72.google.com with SMTP id n15-20020a05600c500f00b003dd07ce79c8so657783wmr.1
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Mar 2023 03:23:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361026;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=7xEfLO0claI31ATzyd9gYyfHUxFmMKj6+bwlHF7x8s1GxjIM4g3VMMhbVwLYPembCb
         DXUm4mjgRW8BGlfzM0Khp9dlpyr/eVMySfSDF4zkJAyHCeCAfYlLl7D5TmN49gWFAD07
         XlDKO3IUy3grB1WJrg8tXfUOhehkcpsgbJGuAb2b1Jvu9haunWfOwVgf4Tdm6m6e/mxE
         +tIvi5Ys/dK2rtIk6uX30Igk6UjOFTe72OQPTgM0zsWOXR3NMnXxtRIuQA2JuPdI8FGU
         0fDGPbMvHqWObIKuqgg87Ajg4Yqg5lq042mjj05cAoi+KgNJ+W7Qna1BeDFbXSLJISmV
         oe8w==
X-Gm-Message-State: AO0yUKW2BTim21RiisB+w50oGJKWJDQWP4xgRI04rFDy9oY5WaYS1lJQ
	uQReQTkGWl05Yp52rlXyTgizMFBZV4KRh6uy70tqQgpY+J8mMuebNTFQz4MeG6KL5vtXebOHXLx
	4KoyXWlC9vEnp6uaBJ+O7jWo=
X-Received: by 2002:a5d:6789:0:b0:2c8:dc70:ab13 with SMTP id v9-20020a5d6789000000b002c8dc70ab13mr14211732wru.18.1678361026293;
        Thu, 09 Mar 2023 03:23:46 -0800 (PST)
X-Google-Smtp-Source: AK7set/SH5LP3JdoN3TXJ/TYCOAs9QXCd0H2gq8nSZeQO9vW4n5twpVp9hXlg9qp/3ZX39KGtC3WSg==
X-Received: by 2002:a5d:6789:0:b0:2c8:dc70:ab13 with SMTP id v9-20020a5d6789000000b002c8dc70ab13mr14211721wru.18.1678361026031;
        Thu, 09 Mar 2023 03:23:46 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id d18-20020a5d6452000000b002c71dd1109fsm17321700wrw.47.2023.03.09.03.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:23:45 -0800 (PST)
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
Subject: Re: [PATCH 10/22] drm/logicvc: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-11-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-11-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:23:45 +0100
Message-ID: <875ybacgn2.fsf@minerva.mail-host-address-is-not-set>
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

