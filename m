Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9D16AD9
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Mar 2023 11:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678361235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
	b=HhBx59K5GRUTCv/uIxtSHIcPIHuPCFoJ/9xwZQxosXBM2eBadYSGK7ubJ2JFpFsxZnHpq3
	JXjd4HemQspSgFZvSbgQQR71XXXwt3U4VEKX40S/nABPhbnE7zc0zTJIn6liK4/UrtY5U6
	KgX/Hg+CZlIln7pPJQfZTUH2AGuwwQg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-rtfqtlHNOjOBkFUDQC3G_A-1; Thu, 09 Mar 2023 06:27:14 -0500
X-MC-Unique: rtfqtlHNOjOBkFUDQC3G_A-1
Received: by mail-wm1-f72.google.com with SMTP id m28-20020a05600c3b1c00b003e7d4662b83so2273964wms.0
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Mar 2023 03:27:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678361234;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE/7iJwefnAXFkAm0lKDfvx+6HRiN8eOH8p7Wvai0wo=;
        b=WrHZLtLM/w55ihElpUW4D4VrkZOOH+X99E8bAeYTO9Ot2iz1ZfDuBGOmbIPiM7RL4U
         4WME/mW4XpN0Q0hEOONnBeSCDb2BcorZYvr9zrioPJ5S1k25kBTz2lqj+aOVay+VtnEz
         Bl0RtwI69UBfy7C8igwKFEjNF3Isu7zx6XraXygET4Mfd0WhWEf2NPDuLZVI3ocmyvRz
         v+M65QO60s/GkvXa6je/SuBypydxSzG5lUKmP8e2JZ5uWcZwmE2RDUNEbQxd9z2hK7Dr
         aMnx6zfZT+E9lQQ88fkGTalO7Uf/Lg0q0R2OMjkfZmO4BRtiha+jM0FWtBnLiiGqIQOS
         G7yQ==
X-Gm-Message-State: AO0yUKV2ABLye7Gv25abxbxTAJPoCDSx9PICEP7/T/A2o+m8OF/bV/Ey
	IXqsL6m5gli2nJjy+vospQkUoWhz83LLrxI54R3poNmbJ8JyeUlM3IJ8C64HDt3QXBQkCcfl6bh
	grkkR38ysN2S3XTq8guUaPNk=
X-Received: by 2002:adf:eec2:0:b0:2c5:8d06:75c2 with SMTP id a2-20020adfeec2000000b002c58d0675c2mr16143005wrp.35.1678361233892;
        Thu, 09 Mar 2023 03:27:13 -0800 (PST)
X-Google-Smtp-Source: AK7set8ARdxfkcrK23hiLLxHMM+1xly+a483wuNbL82OhsV1hVbBQRT5MxfXfizo4EESj/6UVgIYTA==
X-Received: by 2002:adf:eec2:0:b0:2c5:8d06:75c2 with SMTP id a2-20020adfeec2000000b002c58d0675c2mr16142965wrp.35.1678361233574;
        Thu, 09 Mar 2023 03:27:13 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id z16-20020adfdf90000000b002c707785da4sm17592422wrl.107.2023.03.09.03.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 03:27:13 -0800 (PST)
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
Subject: Re: [PATCH 17/22] drm/tidss: Use GEM DMA fbdev emulation
In-Reply-To: <20230301153101.4282-18-tzimmermann@suse.de>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <20230301153101.4282-18-tzimmermann@suse.de>
Date: Thu, 09 Mar 2023 12:27:12 +0100
Message-ID: <87jzzq6u7j.fsf@minerva.mail-host-address-is-not-set>
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

