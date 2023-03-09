Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0AD6AD9
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Mar 2023 11:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678360827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=d1j71K7wfOiFcBlHogpxmlMQtkDBn+laXr/H/G+Ik19Du//9HJVuQLYxE4T0XyLQsdunRK
	p4XNZea43wFcmre2CnFmBK+PD9tJ4RAhAPv1vrYHRxd5Gtut38IuNETv6I3qmXUKwpgB+s
	zKB1OrHYCWHnW7my++RYp3Y6W6OTaw0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-r3fqfjJWPkGvqhcA-TT64Q-1; Thu, 09 Mar 2023 06:20:26 -0500
X-MC-Unique: r3fqfjJWPkGvqhcA-TT64Q-1
Received: by mail-wm1-f70.google.com with SMTP id l16-20020a05600c1d1000b003e77552705cso643750wms.7
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Mar 2023 03:20:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678360825;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=Bp4eoidw4UF/MR3RAIPWYP4O0j+kKhROdtO44HWyy4ZQ9GWgkMzsbMh5zDvGrKlRnw
         1sqtqXqz0vFFVRbuBoSkYjlw78JTVp4+Hil8jbQA7KJvERzYC0WIK1v3ik5gtSKclpgC
         Cem2XUCVuWOd8j7AxAhfVOLOnv/yyEH0iRzCZ4bkmSD/Ncibh2+t3iDTeIHQsiS13app
         f5B7L3v2g46ilYIwIFo8zX/d9mYFhGDI0x6OeCsPXWVNwe1kLv89kaBwRpPFpkiPIr6n
         9A4xgFeN75A8xTKdDuRUnOxCDid+AEhLHB4iQmxDhCzNZfWvRnLiaKl5f27zzcgQJABh
         HCXw==
X-Gm-Message-State: AO0yUKVTmmvH47T3BVWLbM2U2BdhuF0WrVwB79+ke3uwWXIBJFfayNq7
	1lwIpSDCEuNoZHJzbfem6ecm9sr68QfJfBKeL3L64Gm+ykz/2b1J0KL0XQREQshlSMjYaeeCkjr
	AFr9nGO7Yu9NfmhKq4FHpdMU=
X-Received: by 2002:adf:e711:0:b0:2c7:40f6:d7fe with SMTP id c17-20020adfe711000000b002c740f6d7femr14224813wrm.64.1678360825568;
        Thu, 09 Mar 2023 03:20:25 -0800 (PST)
X-Google-Smtp-Source: AK7set9k96PNTBUz0TEByIG7gapEmsch0cL8AOD17b63GFBK4F6QUKC1zqFtEdtv5cA4DKM8r6l/1w==
X-Received: by 2002:adf:e711:0:b0:2c7:40f6:d7fe with SMTP id c17-20020adfe711000000b002c740f6d7femr14224778wrm.64.1678360825289;
        Thu, 09 Mar 2023 03:20:25 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id w12-20020a5d608c000000b002c552c6c8c2sm17742706wrt.87.2023.03.09.03.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:20:25 -0800 (PST)
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
Subject: Re: [PATCH 05/22] drm/atmel-hlcdc: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-6-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-6-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:20:24 +0100
Message-ID: <87pm9icgsn.fsf@minerva.mail-host-address-is-not-set>
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

