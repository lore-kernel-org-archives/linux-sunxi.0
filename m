Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BC56AD9
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Mar 2023 11:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=Dghzts1KQfEJn117b+D+nIsLd5JNUVZxacPTW+thvMS+bZCpeL/Kk2LnfiNO0OdOJkbCcH
	KCkYj3L2d/LUOtcMjAksgiA0glofBTMHqnuDJJl0yMuBSOMTLihGq600Hg5GH6mUHvqxk1
	T5lDDvYaievRtWIJpsuOV51mH2r7Gps=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-4039PCKRNh-57qoaJ5BoIg-1; Thu, 09 Mar 2023 06:22:44 -0500
X-MC-Unique: 4039PCKRNh-57qoaJ5BoIg-1
Received: by mail-wm1-f70.google.com with SMTP id az12-20020a05600c600c00b003e8910ec2fdso540855wmb.6
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Mar 2023 03:22:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360963;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=EXX9JrKgXE5AekPaKOjR0GovBu+GUwgxEFnlCqefv6W+NVmnB2sIQEdSqtBerxqHuX
         o3tpuzZu432oepKop9h7aLUix47FiskVyDA8a+eOIAvItpKaeb49K47X2DZDsIi1ypdi
         RPWu001Gl8+Yr0biqc7CUP+ft8IKZfnqjbuaw7OjrP1PeKBG/xCJ5lNeQdoRY+hbwZu8
         QNJFo/5NXX+5PycpCBDa4QTi40/VwE0vMi6acSbBwuSd7y4Ab0WVL4RNjc3zKKnyD/NS
         4a3j25hQp+p8a1PVZufNXgB6+5KXoasg07Wq+/kfNTPzdN5eMp6yWYNMKHchC9mAMZ19
         35Ng==
X-Gm-Message-State: AO0yUKWv6oZwq6xPYeSkweIq8lCL/QihbzAtZaNnhh1Bh9RYxSB0FCYv
	7Pd5KsLxGRGlq+7AWSxSUvkLmuiSApVSFqi026wB3L9djpSjrMSaghtdeg9dH23RTOlcGqF3R5X
	MIBB1oA2eTkHrHOFKPByksb8=
X-Received: by 2002:a05:600c:1c05:b0:3eb:4501:6c60 with SMTP id j5-20020a05600c1c0500b003eb45016c60mr15506185wms.5.1678360963366;
        Thu, 09 Mar 2023 03:22:43 -0800 (PST)
X-Google-Smtp-Source: AK7set+bXzeTIl7Irwfxa7/DXky+Tf4Fs2Oix8AFpHgk72LnoLDINFW1m3YZeFk72iyLEtfOHY0o9w==
X-Received: by 2002:a05:600c:1c05:b0:3eb:4501:6c60 with SMTP id j5-20020a05600c1c0500b003eb45016c60mr15506159wms.5.1678360963195;
        Thu, 09 Mar 2023 03:22:43 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c458700b003eb966d39desm2539921wmo.2.2023.03.09.03.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:22:42 -0800 (PST)
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
Subject: Re: [PATCH 11/22] drm/meson: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-12-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-12-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:22:42 +0100
Message-ID: <878rg6cgot.fsf@minerva.mail-host-address-is-not-set>
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

