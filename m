Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCFF9443
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Mar 2023 11:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fOclMsW6Dcq/qmgrbzDRG9ABG8aYqQLYxxYoBc5QR74=;
	b=baxC9t6eyk3IKhfv0QWWRuL+z9o1x5ObjJinAnDevrCwiLR4J+EdPGw+aLpSTwUIJeQ33a
	+nsJObcda/838lrLS4ETkgRyacyS2GmZAX3YSLHS9U+90fpSKDwdueG6/Ynu3eiE55uaL5
	oGvY9C4cggX3fRonL50zU7kNToYeGyg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-ZU-EI2RlNNu12s4B_q8k8Q-1; Thu, 09 Mar 2023 06:14:42 -0500
X-MC-Unique: ZU-EI2RlNNu12s4B_q8k8Q-1
Received: by mail-wr1-f69.google.com with SMTP id bx25-20020a5d5b19000000b002c7ce4ce3c3so344663wrb.13
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Mar 2023 03:14:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360481;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fOclMsW6Dcq/qmgrbzDRG9ABG8aYqQLYxxYoBc5QR74=;
        b=FfFWpwnoOXTRB1BNnGxD7aYRBwB2UDqMlee+/ydkl1gTSbmRUpBnb64xXtPv/5Pwu5
         pwG6mgMA6Xf3L96NV5K4ytPnet4/5a0/j389viGZFGNq8EmfoNejvw9mH8M7t2JSvfOy
         aa4dexWeRusfdgQJaRt7n01Zg6KM62cYYTqF6fCVF4/whQvoNVxNvOyuSBw4uZE7q4mm
         Go8vHVkmBhqFreOIgV/VxJpK0oCaB+PL9R6qdGVbAxZ7L/xsNA14M/owBxVseirVAmeL
         cUVFK9H3RgCcYd0hCYRv1YVXXAxlLH3qinh1dLmFUYMRS/UggRcmM4dFFk81K1l1rF/a
         tjaA==
X-Gm-Message-State: AO0yUKVcsXOQHIY5+J+r31QWRgS7o3YvaEnqtloWZ3u/Xv19G5UhVICW
	DdJMDusETpcZgzl875kFn4yRVm1S8UpJUwDd3jBOH/9pUbFc7xnA6GAtedrC10hNJCsOEVoi7Ur
	n5qE5dlPdUE7z+qSniWzveY4=
X-Received: by 2002:a5d:52c4:0:b0:2c7:390e:163c with SMTP id r4-20020a5d52c4000000b002c7390e163cmr15389452wrv.47.1678360480890;
        Thu, 09 Mar 2023 03:14:40 -0800 (PST)
X-Google-Smtp-Source: AK7set915u9SxlnTzfz8tGdDVQASzd1E75MhTfa6AFkSAnvLaeMrUwPtQlpNR4g2GraOjyd7bJsXiA==
X-Received: by 2002:a5d:52c4:0:b0:2c7:390e:163c with SMTP id r4-20020a5d52c4000000b002c7390e163cmr15389414wrv.47.1678360480580;
        Thu, 09 Mar 2023 03:14:40 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q1-20020a1ce901000000b003eb5a531232sm2198602wmc.38.2023.03.09.03.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:14:40 -0800 (PST)
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
Subject: Re: [PATCH 01/22] drm/fbdev-dma: Implement fbdev emulation for GEM
 DMA helpers
In-Reply-To: <87o7p2p4n4.fsf@minerva.mail-host-address-is-not-set>
References: <87o7p2p4n4.fsf@minerva.mail-host-address-is-not-set>
Date: Thu, 09 Mar 2023 12:14:39 +0100
Message-ID: <871qlydvmo.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Javier Martinez Canillas <javierm@redhat.com> writes:

[...]

>> +	drm_fb_helper_prepare(dev, fb_helper, preferred_bpp, &drm_fbdev_dma_helper_funcs);
>> +
>> +	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_dma_client_funcs);
>> +	if (ret) {
>> +		drm_err(dev, "Failed to register client: %d\n", ret);
>> +		goto err_drm_client_init;
>> +	}
>> +
>> +	ret = drm_fbdev_dma_client_hotplug(&fb_helper->client);
>> +	if (ret)
>> +		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
>> +
>> +	drm_client_register(&fb_helper->client);
>> +
>> +	return;
>> +
>> +err_drm_client_init:
>> +	drm_fb_helper_unprepare(fb_helper);
>> +	kfree(fb_helper);
>> +}
>> +EXPORT_SYMBOL(drm_fbdev_dma_setup);
>
> And this one could also be shared AFAICT if drm_fbdev_client_hotplug()
> is used instead.
>

Scratch this one, you need the custom setup function to pass the 
drm_fbdev_dma_helper_funcs to drm_client_init(). But I think the
other comments this apply.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

