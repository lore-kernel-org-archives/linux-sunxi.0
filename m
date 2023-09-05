Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDA7FC0B
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Sep 2023 21:06:06 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-991c786369cso464242966b.1
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Sep 2023 14:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693947965; x=1694552765; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XU7m3iUIhB2czTwQI5E0tsG1IdXbWVa4A+CGA62kvw=;
        b=CNDGYSwKyMbxxOi8g4Ej3IQa6HHvryDoSHtlbbw6rLbOftYYerXPJbsj8k1GaxLVig
         cI6TwesS+ySvgb9bF0J1kfLDcfGzbSkWOrJaAclavmym3fXQeWhKgn8kMu0UD4pI8hS5
         pOxY4EzL2CQBUhYZC2QT74AucJX7jupHJgEpGUCBeomy2XjgXqAXj1+GycklBAnXK0hr
         U6eALnewXBlZkgJ4fhndmLwOa3Z1E68uWI72+rphuUZxT8xaeRkUgia5Sjdec2zllMaB
         QuvBbR2ICmYYaucXObHN+eCZSp177M812HSgTZt2D0AfpHjJrPw4hiSPf8iojqA7opk0
         gerw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693947965; x=1694552765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9XU7m3iUIhB2czTwQI5E0tsG1IdXbWVa4A+CGA62kvw=;
        b=MOMRNZCN1HNiuNIiC23C8iVwu265yeBSKKrh0v6KYvsd/N+Fv/AbY+VJsa27BQulmL
         OMJVXPtDF6Wl9I3eHN6kk81CoDOB9uIfyeHTXsflI5A1NRMPGLrjx+gcrjTmNXBbxTMO
         pHegbrIRd+K67c0LPYrOWRNqSBJQMtkVyDZ+yIe/SCByJvDVHRqvynkqo6lP4eWinizp
         XEU/9VA0x4PyqsC9SNipvseGXJ16DTlCZR8r+DwXLS6E8ghrlclYxHRnjSbIBZCw7UNO
         WebifyU1Z6y3pUvfc2C4GYtuHo8hh+10KY9IDE5KP8Q2/rtNDSczzpkV0VrPEvI8RTM9
         1Low==
X-Gm-Message-State: AOJu0YwPQaFd+QivLKf4bdQeq5cNHhf4bDDxcntr4Q5ergZjujCraIPj
	QVWQCD0o9lMcY60t5YG1hfc=
X-Google-Smtp-Source: AGHT+IGkmh9tp77O9jdKZ4K1pCktyBByW4OQ7/rwivCx3acTMVK4FoRmIlgULCUgqm2i5B0cQ60LGg==
X-Received: by 2002:a17:907:762a:b0:9a1:bb8f:17d7 with SMTP id jy10-20020a170907762a00b009a1bb8f17d7mr692400ejc.12.1693947964868;
        Tue, 05 Sep 2023 14:06:04 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id kt8-20020a170906aac800b0099df2ddfc37sm8025574ejb.165.2023.09.05.14.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 14:06:04 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Douglas Anderson <dianders@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>, airlied@gmail.com,
 airlied@redhat.com, alain.volmat@foss.st.com, alexander.deucher@amd.com,
 alexandre.belloni@bootlin.com, alison.wang@nxp.com, bbrezillon@kernel.org,
 christian.koenig@amd.com, claudiu.beznea@microchip.com, daniel@ffwll.ch,
 drawat.floss@gmail.com, javierm@redhat.com, jfalempe@redhat.com,
 jstultz@google.com, kong.kongxinwei@hisilicon.com, kraxel@redhat.com,
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, liviu.dudau@arm.com,
 nicolas.ferre@microchip.com, paul.kocialkowski@bootlin.com, sam@ravnborg.org,
 samuel@sholland.org, spice-devel@lists.freedesktop.org, stefan@agner.ch,
 suijingfeng@loongson.cn, sumit.semwal@linaro.org, tiantao6@hisilicon.com,
 tomi.valkeinen@ideasonboard.com, tzimmermann@suse.de,
 virtualization@lists.linux-foundation.org, wens@csie.org,
 xinliang.liu@linaro.org, yongqin.liu@linaro.org, zackr@vmware.com
Subject:
 Re: [RFT PATCH 2/6] drm: Call drm_atomic_helper_shutdown() at shutdown time
 for misc drivers
Date: Tue, 05 Sep 2023 23:06:00 +0200
Message-ID: <5970528.lOV4Wx5bFT@jernej-laptop>
In-Reply-To:
 <20230901163944.RFT.2.I9115e5d094a43e687978b0699cc1fe9f2a3452ea@changeid>
References:
 <20230901234015.566018-1-dianders@chromium.org>
 <20230901163944.RFT.2.I9115e5d094a43e687978b0699cc1fe9f2a3452ea@changeid>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 02. september 2023 ob 01:39:53 CEST je Douglas Anderson 
napisal(a):
> Based on grepping through the source code these drivers appear to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown
> time. Among other things, this means that if a panel is in use that it
> won't be cleanly powered off at system shutdown time.
> 
> The fact that we should call drm_atomic_helper_shutdown() in the case
> of OS shutdown/restart comes straight out of the kernel doc "driver
> instance overview" in drm_drv.c.
> 
> All of the drivers in this patch were fairly straightforward to fix
> since they already had a call to drm_atomic_helper_shutdown() at
> remove/unbind time but were just lacking one at system shutdown. The
> only hitch is that some of these drivers use the component model to
> register/unregister their DRM devices. The shutdown callback is part
> of the original device. The typical solution here, based on how other
> DRM drivers do this, is to keep track of whether the device is bound
> based on drvdata. In most cases the drvdata is the drm_device, so we
> can just make sure it is NULL when the device is not bound. In some
> drivers, this required minor code changes. To make things simpler,
> drm_atomic_helper_shutdown() has been modified to consider a NULL
> drm_device as a noop in the patch ("drm/atomic-helper:
> drm_atomic_helper_shutdown(NULL) should be a noop").
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This commit is only compile-time tested.
> 
> Note that checkpatch yells that "drivers/gpu/drm/tiny/cirrus.c" is
> marked as 'obsolete', but it seems silly not to include the fix if
> it's already been written. If someone wants me to take that out,
> though, I can.
> 
>  drivers/gpu/drm/arm/display/komeda/komeda_drv.c | 9 +++++++++
>  drivers/gpu/drm/arm/display/komeda/komeda_kms.c | 7 +++++++
>  drivers/gpu/drm/arm/display/komeda/komeda_kms.h | 1 +
>  drivers/gpu/drm/arm/hdlcd_drv.c                 | 6 ++++++
>  drivers/gpu/drm/arm/malidp_drv.c                | 6 ++++++
>  drivers/gpu/drm/ast/ast_drv.c                   | 6 ++++++
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c    | 6 ++++++
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c       | 8 ++++++++
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 6 ++++++
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c         | 6 ++++++
>  drivers/gpu/drm/logicvc/logicvc_drm.c           | 9 +++++++++
>  drivers/gpu/drm/loongson/lsdc_drv.c             | 6 ++++++
>  drivers/gpu/drm/mcde/mcde_drv.c                 | 9 +++++++++
>  drivers/gpu/drm/omapdrm/omap_drv.c              | 8 ++++++++
>  drivers/gpu/drm/qxl/qxl_drv.c                   | 7 +++++++
>  drivers/gpu/drm/sti/sti_drv.c                   | 7 +++++++
>  drivers/gpu/drm/sun4i/sun4i_drv.c               | 6 ++++++

For sun4i:
Tested-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/gpu/drm/tiny/bochs.c                    | 6 ++++++
>  drivers/gpu/drm/tiny/cirrus.c                   | 6 ++++++
>  19 files changed, 125 insertions(+)



