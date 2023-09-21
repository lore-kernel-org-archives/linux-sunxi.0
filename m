Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056E09CA4C
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Sep 2023 18:46:56 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50307acd445so2242999e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Sep 2023 11:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695322015; x=1695926815; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SgMdBTw9y+aSwwtmwk5xQ1ZAPfF4LIv2yTZ0dNleis=;
        b=hfCcggf1WztHJT8kMhIxqpBQ4GvX9wUN+6PPU/2rOACEhHVPD2Mgi5OqddmwbvxYWW
         Mk8Q0Ye+zlurMcW5GaB8yurBPvV0WzytLRo+I9b2BFORjBEG8j4D9ERM38FM/Gcapt10
         kC1V0dN1daGZGPreQJPRqRN7MbyJOJ/zxDCQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695322015; x=1695926815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+SgMdBTw9y+aSwwtmwk5xQ1ZAPfF4LIv2yTZ0dNleis=;
        b=WRpa3Ijj+NaF3FhuMOeuNTCBD4C4t4TmlXNHhwBq95gGHftpIpZHQhYvP0IykYMkCe
         gGiImuOW7gp5BQQqQuUnc0xPy2lnVpaCLg17pOvEymLiqj53tZ79WQqJRHuaHA14ub0V
         ZrvTk5KH3o/p9YyuVtQfG22tBTTM6mgYhv02hau5yo761/k3+WJGcwN07GUEpp/dNfM/
         x1BR5VVjEI1aH6lmaeBffdMvMVb+OEIRRZscR0GtbTmJTQE9gzIJCM3Emtj43OWizBDm
         +aEuU97YNoVmoZGTH0IWBb0u7thF8OGcoeS7kAcbQsPydl2mH6GTFge3oWr/NO4Mzknr
         Ec2Q==
X-Gm-Message-State: AOJu0YxtbUfflqys1/E0pip5JTBY0ezQUz+1BBvUt/oKZ2jqUg0y3I4L
	V8FpwN7/at1gD5oB2gYX+VE40svmmqIjY2qM/dzjXbMi
X-Google-Smtp-Source: AGHT+IEIh2FKuXpRGeW4FeB+TmXNbd79Povn3VQgt8HaSAICk0DNdHgz3FJ+wkUxoeYoenmWoLCGOQ==
X-Received: by 2002:a05:6512:3caa:b0:4fb:89e2:fc27 with SMTP id h42-20020a0565123caa00b004fb89e2fc27mr7524622lfv.54.1695322015080;
        Thu, 21 Sep 2023 11:46:55 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id c7-20020a197607000000b005008c11ca6dsm387108lff.184.2023.09.21.11.46.54
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 11:46:54 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-502f29ed596so661e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Sep 2023 11:46:54 -0700 (PDT)
X-Received: by 2002:a05:600c:1ca4:b0:405:320a:44f9 with SMTP id
 k36-20020a05600c1ca400b00405320a44f9mr98844wms.5.1695321993367; Thu, 21 Sep
 2023 11:46:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230901234015.566018-1-dianders@chromium.org> <20230901163944.RFT.2.I9115e5d094a43e687978b0699cc1fe9f2a3452ea@changeid>
In-Reply-To: <20230901163944.RFT.2.I9115e5d094a43e687978b0699cc1fe9f2a3452ea@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Sep 2023 11:46:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WRqe7twJ+eLb3DavumknCxWFK5ey007fLuWkCBrzzyPQ@mail.gmail.com>
Message-ID: <CAD=FV=WRqe7twJ+eLb3DavumknCxWFK5ey007fLuWkCBrzzyPQ@mail.gmail.com>
Subject: Re: [RFT PATCH 2/6] drm: Call drm_atomic_helper_shutdown() at
 shutdown time for misc drivers
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Cc: airlied@gmail.com, airlied@redhat.com, alain.volmat@foss.st.com, 
	alexander.deucher@amd.com, alexandre.belloni@bootlin.com, alison.wang@nxp.com, 
	bbrezillon@kernel.org, christian.koenig@amd.com, claudiu.beznea@microchip.com, 
	daniel@ffwll.ch, drawat.floss@gmail.com, javierm@redhat.com, 
	jernej.skrabec@gmail.com, jfalempe@redhat.com, jstultz@google.com, 
	kong.kongxinwei@hisilicon.com, kraxel@redhat.com, linus.walleij@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	liviu.dudau@arm.com, nicolas.ferre@microchip.com, 
	paul.kocialkowski@bootlin.com, sam@ravnborg.org, samuel@sholland.org, 
	spice-devel@lists.freedesktop.org, stefan@agner.ch, suijingfeng@loongson.cn, 
	sumit.semwal@linaro.org, tiantao6@hisilicon.com, 
	tomi.valkeinen@ideasonboard.com, tzimmermann@suse.de, 
	virtualization@lists.linux-foundation.org, wens@csie.org, 
	xinliang.liu@linaro.org, yongqin.liu@linaro.org, zackr@vmware.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 1, 2023 at 4:40=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:
>
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
>  drivers/gpu/drm/tiny/bochs.c                    | 6 ++++++
>  drivers/gpu/drm/tiny/cirrus.c                   | 6 ++++++
>  19 files changed, 125 insertions(+)

This has been about 3 weeks now and it feels like that's enough bake
time and several people have managed to test it (thanks!). Landing in
drm-misc-next:

ce3d99c83495 drm: Call drm_atomic_helper_shutdown() at shutdown time
for misc drivers
