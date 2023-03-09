Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D92C6AD9
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Mar 2023 11:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=Mb36jRGuC/o/ac716W/VeetYSkISJ0LRdvXaBeIiBaVoNmsX6X+1EXv9Vv8dRfo7eIIqmr
	KCVCseyRgCwqi3mrqn1fC/DOx+7n1PZNw3SuQdEC5JebE7zc2P3gmXQekVmbm3dboIqpkE
	OQZbsLPkY7e6Faa6Q/GSAx3c9kKygxo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-5X9_l4OUP12tYLx-zHGrFA-1; Thu, 09 Mar 2023 06:21:46 -0500
X-MC-Unique: 5X9_l4OUP12tYLx-zHGrFA-1
Received: by mail-wr1-f69.google.com with SMTP id c30-20020adfa31e000000b002c59b266371so346375wrb.6
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Mar 2023 03:21:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360905;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=uwyo+ns3CZLtBVBf48fPk4PBHmWOV0PVMrDJ5a9TesICCpiZqWTNcIHFchEBKgqacz
         76L3Opfrcfkx61ToYOTP47B+5CvvDPiVhF+XXZP/rBKjhGADfaThyPf+RbMpMea2QA6R
         OvEGAF1l7Bry9HGY7dtDVtPgiq2lnJjYuwQ4cgS6tzHoAHBE3xcWHcPwz8r6K05TevjV
         CPw/45xbPhX+0Jfd9s8dj+RCOBQhwKmQ/GtQfqCZe6cBbj00CeHlViNK0VaGb+C0zPX6
         W3m7Jd5CU5BFVqEvVItXAcL3dDqpvZYIEI8h5TDArPGszgObjif9MUCXvH3KF9N/yS2D
         kmWg==
X-Gm-Message-State: AO0yUKU4ibl523WKXhuZH65V2sLjI6yi/cG/6/0CLX9CjeuVZ9yJzceN
	j3xrg5aDD/JduTKgjHben+as63G4jrdVc/ROqW9K0zqP14fd5zBUsmMEfPaCEydxpFaW64E6FED
	Ck5LHG5U4C3fr5CkpHmMu2IU=
X-Received: by 2002:adf:da47:0:b0:2c9:f488:5f54 with SMTP id r7-20020adfda47000000b002c9f4885f54mr12321053wrl.57.1678360905536;
        Thu, 09 Mar 2023 03:21:45 -0800 (PST)
X-Google-Smtp-Source: AK7set/T4C0dgvSGGMpJs8/32CGlr56CYDRn+YAtD8UDvYRDVE6ywdBnZAiSainv+9e2TUJLz767pg==
X-Received: by 2002:adf:da47:0:b0:2c9:f488:5f54 with SMTP id r7-20020adfda47000000b002c9f4885f54mr12321033wrl.57.1678360905258;
        Thu, 09 Mar 2023 03:21:45 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id d1-20020a5d4f81000000b002c54e26bca5sm17503473wru.49.2023.03.09.03.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:21:45 -0800 (PST)
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
Subject: Re: [PATCH 09/22] drm/kmb: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-10-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-10-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:21:44 +0100
Message-ID: <87edpycgqf.fsf@minerva.mail-host-address-is-not-set>
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

