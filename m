Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED802F30
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 15:26:42 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id j7so19819956ybg.4
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Mar 2023 08:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1680103601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jV2lyvl8ub+2VPRjeHlb+sHmzhDe5z+36U7u39h187Y=;
        b=koSCDXLrsYInsfC1e0e5FcEjzTsnis9tfFB1SzdjyHQMOpeNNAOVeSjuT0ne4OK/TV
         qMcGvU5Gyrtt+ebsaKD9jX74i1kdtld413I9Dr3TcitiHoDN/lRfAMYjFubAAx9LKkhK
         PcTCqvadVbXLItVKNU2nu7tyQRa+LNpEB+5d4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680103601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jV2lyvl8ub+2VPRjeHlb+sHmzhDe5z+36U7u39h187Y=;
        b=vBptDgWM+sQrfGZoF8494n2YsVV8XAKFeFODKr7YG1YE2batuf5GoumFQC0hEjD6ab
         bGs0bVHbgTnFcJyfSdXPgv68S3tB+vnN6SF7Dgsa8C1oh0TD2SSenc1Qb4VSF/Jx9N69
         P3rHxGD5FR9WIIFhwK0fsHyCxhfksnea/q+6thjX6rmr2xpB3mg1nD3TtFxKVc5IOWqS
         G5jZ+tTZEuG3MdwOkoNxEfkJYMchDcV3gewsUBoSkg0AbBG8N7vA+eMN9d4TPLFxdFTS
         tFLSF2q2M0I9UpnQuG+qWSZqB+T81KwdwL9nOV6BIuSeBWwnzCyYYsWLVGKl/SuyLfOU
         8BmA==
X-Gm-Message-State: AAQBX9eRhQcfc2RK17hZBFD9+ogUN3z+9ckhWwlC0ngyvkK9hKh6Lw5g
	uPGcTxVALs+d7bOIORFA8lCJco+HtLAqKu3cxOUtuQ==
X-Google-Smtp-Source: AKy350YMi/rjLaY2uUQ+82h4Hy78c0V90uLZLhiQBJOJ1GZntnfQTG+thdjlp3NT14dkSuRr6AAWA3nZWRje990ICFg=
X-Received: by 2002:a05:6902:1204:b0:b3b:fb47:8534 with SMTP id
 s4-20020a056902120400b00b3bfb478534mr10616056ybu.5.1680103601331; Wed, 29 Mar
 2023 08:26:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230329131615.1328366-1-jagan@amarulasolutions.com>
 <20230329131615.1328366-3-jagan@amarulasolutions.com> <20230329150337.ua6qz7rvupk6vizl@penduick>
In-Reply-To: <20230329150337.ua6qz7rvupk6vizl@penduick>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 29 Mar 2023 20:56:29 +0530
Message-ID: <CAMty3ZAEb+ws_9jbdSM1ngfk=N7tePw_pEcALDAMNwzoNvbW3g@mail.gmail.com>
Subject: Re: [PATCH v7 02/12] drm: bridge: panel: Implement
 drmm_of_dsi_get_bridge helper
To: Maxime Ripard <maxime@cerno.tech>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>, 
	linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023 at 8:33=E2=80=AFPM Maxime Ripard <maxime@cerno.tech> w=
rote:
>
> On Wed, Mar 29, 2023 at 06:46:08PM +0530, Jagan Teki wrote:
> > Implement a DRM-managed action helper that returns the next DSI bridge
> > in the chain.
> >
> > Unlike general bridge return helper drmm_of_get_bridge, this helper
> > uses the dsi specific panel_or_bridge helper to find the next DSI
> > device in the pipeline.
> >
> > Helper lookup a given downstream DSI device that has been added via
> > child or OF-graph port or ports node.
> >
> > Upstream DSI looks for downstream devices using drm pointer, port and
> > endpoint number. Downstream devices added via child node don't affect
> > the port and endpoint number arguments.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> If you intend to use it with the sun4i driver, then don't. The sun4i
> driver is barely using drm-managed resources, so chances are all its
> resources will be freed by the time this action will run.

Any idea how to check all resources will be freed before this
DRM-managed action helper runs? I did test the panel insertion and
removal at runtime and I can see that the action helper
(drmm_drm_panel_bridge_release) is triggered at removal time.

Here is the log for it.
# insmod panel-bananapi-s070wv20-icn6211.ko
[   11.411894] sun4i-drm display-engine: bound
1e00000.display-frontend (ops 0xc0951eb4)
[   11.420253] sun4i-drm display-engine: bound 1e60000.display-backend
(ops 0xc0951620)
[   11.428128] sun4i-drm display-engine: bound 1e70000.drc (ops 0xc0951150)
[   11.435574] sun4i-drm display-engine: No panel or bridge found...
RGB output disabled
[   11.443484] sun4i-drm display-engine: bound 1c0c000.lcd-controller
(ops 0xc094fdb0)
[   11.451264] sun4i-drm display-engine: bound 1ca0000.dsi (ops 0xc0952f04)
[   11.462479] [drm] Initialized sun4i-drm 1.0.0 20150629 for
display-engine on minor 1
[   11.963246] Console: switching to colour frame buffer device 100x30
[   12.046329] sun4i-drm display-engine: [drm] fb0: sun4i-drmdrmfb
frame buffer device
[   12.082641] sun6i-mipi-dsi 1ca0000.dsi: Attached device s070wv20-ct16-ic=
n62
# rmmod panel-bananapi-s070wv20-icn6211.ko
[   16.306388] Console: switching to colour dummy device 80x30
[   16.466963] drmm_drm_panel_bridge_release: In

Thanks,
Jagan.
