Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7F4AD53
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Sep 2023 23:40:44 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1c1e780aa95so18058325ad.3
        for <linux-sunxi@lists.linux.dev>; Fri, 01 Sep 2023 16:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693611644; x=1694216444; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n/wC93ts+Uw6CTnKmnF0FM5HAH/s/Jjcati4UEbYR+M=;
        b=UEEhSp9JQ8aSTFTwxYH09QYYreAddD/9MQKKWjad4Qn4fi/VOqmgZFocI1gsn0yMyi
         qUq5N4EMB0kepDrOd15TB+HWO9foYeLm9aRFlpvO4C5R0m22xrEJUT81MDWMXkBjxfKe
         ipol5A9LfcYsEZHeqdJS8/1jrAP1NGKsvNkr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693611644; x=1694216444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/wC93ts+Uw6CTnKmnF0FM5HAH/s/Jjcati4UEbYR+M=;
        b=eaoBpj4o/D5cdVdrAmoULtNgFfuXs3veAtLe0tSQ7GlnoNCU0n8SAp5E87F/RB/UCn
         HE+eoM7j5EW0FDaNJ3XcK3JeMn70u2QcZ8KhXAfUkotk61x/AZJUCzuEWole4jbmrhxk
         iChtCPir81jLHkMZVmds86FirX9dXMVc35lVl4YCOxJ0MfkjsQwrCOudfVfvanv9955L
         I/syElCNia6ugRfu8Oc67z7iqRifewIdze5kdB4TXtNrLpGR1ZH/SOwomsnaPsYewrnq
         hBvp6rwrt92vaEe/JaT5r/obwHW47A1QEOW7IFR+cEWk4J2oNas3ZOab0R0b12P8cHbQ
         Swdw==
X-Gm-Message-State: AOJu0YwgvSTuzUb1xmZE0elyHAcsNGr4qLXPYI8LMWaCOoc+WFaIJtav
	ngdrHXAQXexmIy6IRSlEuDpM4g==
X-Google-Smtp-Source: AGHT+IGvD6INAbenp2grAfWcBj4pkX0Rwdi+mFd4l74epgbtZUP930lbGB/73TFpiWMGlrv965H/4A==
X-Received: by 2002:a17:90a:a58f:b0:267:7743:9857 with SMTP id b15-20020a17090aa58f00b0026777439857mr4020109pjq.17.1693611643599;
        Fri, 01 Sep 2023 16:40:43 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
        by smtp.gmail.com with ESMTPSA id 5-20020a17090a1a4500b0026b4ca7f62csm3773488pjl.39.2023.09.01.16.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 16:40:43 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	airlied@gmail.com,
	airlied@redhat.com,
	alain.volmat@foss.st.com,
	alexander.deucher@amd.com,
	alexandre.belloni@bootlin.com,
	alexandre.torgue@foss.st.com,
	alison.wang@nxp.com,
	andrew@aj.id.au,
	bbrezillon@kernel.org,
	christian.koenig@amd.com,
	claudiu.beznea@microchip.com,
	daniel@ffwll.ch,
	drawat.floss@gmail.com,
	emma@anholt.net,
	hdegoede@redhat.com,
	javierm@redhat.com,
	jernej.skrabec@gmail.com,
	jfalempe@redhat.com,
	joel@jms.id.au,
	jstultz@google.com,
	jyri.sarha@iki.fi,
	kong.kongxinwei@hisilicon.com,
	kraxel@redhat.com,
	linus.walleij@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	liviu.dudau@arm.com,
	maarten.lankhorst@linux.intel.com,
	mcoquelin.stm32@gmail.com,
	nicolas.ferre@microchip.com,
	paul.kocialkowski@bootlin.com,
	philippe.cornu@foss.st.com,
	raphael.gallais-pou@foss.st.com,
	robh@kernel.org,
	sam@ravnborg.org,
	samuel@sholland.org,
	spice-devel@lists.freedesktop.org,
	stefan@agner.ch,
	steven.price@arm.com,
	suijingfeng@loongson.cn,
	sumit.semwal@linaro.org,
	tiantao6@hisilicon.com,
	tomi.valkeinen@ideasonboard.com,
	tzimmermann@suse.de,
	u.kleine-koenig@pengutronix.de,
	virtualization@lists.linux-foundation.org,
	wens@csie.org,
	xinliang.liu@linaro.org,
	yannick.fertre@foss.st.com,
	yongqin.liu@linaro.org,
	zackr@vmware.com
Subject: [RFT PATCH 0/6] drm: drm-misc drivers call drm_atomic_helper_shutdown() at the right times
Date: Fri,  1 Sep 2023 16:39:51 -0700
Message-ID: <20230901234015.566018-1-dianders@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


NOTE: in order to avoid email sending limits on the cover letter, I've
split this patch series in two. Patches that target drm-misc and ones
that don't. The cover letter of the two is identical other than this note.

This patch series came about after a _long_ discussion between me and
Maxime Ripard in response to a different patch I sent out [1]. As part
of that discussion, we realized that it would be good if DRM drivers
consistently called drm_atomic_helper_shutdown() properly at shutdown
and driver remove time as it's documented that they should do. The
eventual goal of this would be to enable removing some hacky code from
panel drivers where they had to hook into shutdown themselves because
the DRM driver wasn't calling them.

It turns out that quite a lot of drivers seemed to be missing
drm_atomic_helper_shutdown() in one or both places that it was
supposed to be. This patch series attempts to fix all the drivers that
I was able to identify.

NOTE: fixing this wasn't exactly cookie cutter. Each driver has its
own unique way of setting itself up and tearing itself down. Some
drivers also use the component model, which adds extra fun. I've made
my best guess at solving this and I've run a bunch of compile tests
(specifically, allmodconfig for amd64, arm64, and powerpc). That being
said, these code changes are not totally trivial and I've done zero
real testing on them. Making these patches was also a little mind
numbing and I'm certain my eyes glazed over at several points when
writing them. What I'm trying to say is to please double-check that I
didn't do anything too silly, like cast your driver's drvdata to the
wrong type. Even better, test these patches!

I've organized this series like this:
1. One patch for all simple cases of just needing a call at shutdown
   time for drivers that go through drm-misc.
2. A separate patch for "drm/vc4", even though it goes through
   drm-misc, since I wanted to leave an extra note for that one.
3. Patches for drivers that just needed a call at shutdown time for
   drivers that _don't_ go through drm-misc.
4. Patches for the few drivers that had the call at shutdown time but
   lacked it at remove time.
5. One patch for all simple cases of needing a call at shutdown and
   remove (or unbind) time for drivers that go through drm-misc.
6. A separate patch for "drm/hisilicon/kirin", even though it goes
   through drm-misc, since I wanted to leave an extra note for that
   one.
7. Patches for drivers that needed a call at shutdown and remove (or
   unbind) time for drivers that _don't_ go through drm-misc.

I've labeled this patch series as RFT (request for testing) to help
call attention to the fact that I didn't personally test any of these
patches.

If you're a maintainer of one of these drivers and you think that the
patch for your driver looks fabulous, you've tested it, and you'd like
to land it right away then please do. For non-drm-misc drivers there
are no dependencies here. Some of the drm-misc drivers depend on the
first patch, AKA ("drm/atomic-helper: drm_atomic_helper_shutdown(NULL)
should be a noop"). I've tried to call this out but it also should be
obvious once you know to look for it.

I'd like to call out a few drivers that I _didn't_ fix in this series
and why. If any of these drivers should be fixed then please yell.
- DRM driers backed by usb_driver (like gud, gm12u320, udl): I didn't
add the call to drm_atomic_helper_shutdown() at shutdown time
because there's no ".shutdown" callback for them USB drivers. Given
that USB is hotpluggable, I'm assuming that they are robust against
this and the special shutdown callback isn't needed.
- ofdrm and simpledrm: These didn't have drm_atomic_helper_shutdown()
in either shutdown or remove, but I didn't add it. I think that's OK
since they're sorta special and not really directly controlling
hardware power sequencing.
- virtio, vkms, vmwgfx, xen: I believe these are all virtual (thus
they wouldn't directly drive a panel) and adding the shutdown
didn't look straightforward, so I skipped them.

I've let each patch in the series get CCed straight from
get_maintainer. That means not everyone will have received every patch
but everyone should be on the cover letter. I know some people dislike
this but when touching this many drivers there's not much
choice. dri-devel and lkml have been CCed and lore/lei exist, so
hopefully that's enough for folks. I'm happy to add people to the
whole series for future posts.

[1] https://lore.kernel.org/lkml/20230804140605.RFC.4.I930069a32baab6faf46d6b234f89613b5cec0f14@changeid


Douglas Anderson (6):
  drm/atomic-helper: drm_atomic_helper_shutdown(NULL) should be a noop
  drm: Call drm_atomic_helper_shutdown() at shutdown time for misc
    drivers
  drm/vc4: Call drm_atomic_helper_shutdown() at shutdown time
  drm/ssd130x: Call drm_atomic_helper_shutdown() at remove time
  drm: Call drm_atomic_helper_shutdown() at shutdown/remove time for
    misc drivers
  drm/hisilicon/kirin: Call drm_atomic_helper_shutdown() at
    shutdown/unbind time

 .../gpu/drm/arm/display/komeda/komeda_drv.c   |  9 +++++
 .../gpu/drm/arm/display/komeda/komeda_kms.c   |  7 ++++
 .../gpu/drm/arm/display/komeda/komeda_kms.h   |  1 +
 drivers/gpu/drm/arm/hdlcd_drv.c               |  6 ++++
 drivers/gpu/drm/arm/malidp_drv.c              |  6 ++++
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  7 ++++
 drivers/gpu/drm/ast/ast_drv.c                 |  6 ++++
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  6 ++++
 drivers/gpu/drm/drm_atomic_helper.c           |  3 ++
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |  8 +++++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  6 ++++
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  9 +++++
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c       |  6 ++++
 drivers/gpu/drm/logicvc/logicvc_drm.c         |  9 +++++
 drivers/gpu/drm/loongson/lsdc_drv.c           |  6 ++++
 drivers/gpu/drm/mcde/mcde_drv.c               |  9 +++++
 drivers/gpu/drm/mgag200/mgag200_drv.c         |  8 +++++
 drivers/gpu/drm/omapdrm/omap_drv.c            |  8 +++++
 drivers/gpu/drm/pl111/pl111_drv.c             |  7 ++++
 drivers/gpu/drm/qxl/qxl_drv.c                 |  7 ++++
 drivers/gpu/drm/solomon/ssd130x.c             |  1 +
 drivers/gpu/drm/sti/sti_drv.c                 |  7 ++++
 drivers/gpu/drm/stm/drv.c                     |  7 ++++
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  6 ++++
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           | 11 +++++-
 drivers/gpu/drm/tiny/bochs.c                  |  6 ++++
 drivers/gpu/drm/tiny/cirrus.c                 |  6 ++++
 drivers/gpu/drm/tve200/tve200_drv.c           |  7 ++++
 drivers/gpu/drm/vboxvideo/vbox_drv.c          | 10 ++++++
 drivers/gpu/drm/vc4/vc4_drv.c                 | 36 ++++++++++++-------
 30 files changed, 217 insertions(+), 14 deletions(-)

-- 
2.42.0.283.g2d96d420d3-goog

