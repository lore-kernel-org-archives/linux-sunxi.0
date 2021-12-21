Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1F02CAC
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Dec 2021 10:13:30 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id a9so25801367wrr.8
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Dec 2021 02:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nTc5PZ4Wpig4VXigMSaZ0XPsk2m3HQFKiyeVvNbBNNc=;
        b=dJHKjSoEEyVDkgtyh+/qOBv2HluDHaGeirviwPCijFFsSYfAhtrw4ytbGMh5V6eqpV
         ccUrgpQQwnhNyl1FVEETH07cmfqFR5oq+3eEN2QgH5ZLA1ZiERd7bJ7/PVCc8jNSpfsz
         7ha/4NGab+1PYTf58rRiQBsLI5ucgutc66cqc2iOt9k8aDjcEfTPHkyFdwaHaYf3KSrA
         /yC0imuNG3jMSHoSAlU1pibAoiLgS+huZgX3msw/pKYg0tT5990jrKTgMR3/n3M6pbVN
         vXuLxJpKgVbm/852wjXVhog0tfoBKaeV6vKPIDdgX20pvenMvW1lh0T7u7FYQd9DyXKO
         OPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nTc5PZ4Wpig4VXigMSaZ0XPsk2m3HQFKiyeVvNbBNNc=;
        b=qLqBiaBZK8sbAaiMDyrU+u5TPm8gijIU/J1Wmz7UdbzlK5ZFaCS9wINzphZl14d8Tt
         XG3M6Ka8Octe4vaTqfTdeNKivGjsrmFYnSB64Ny/EbrwHxLrdn3vfQQjihFrJgy5MAQs
         tKRSFzRnWeA/SapGJ43iqIGmDnshRauTeDgREOLpfy1mPQs8DYsa0J0BoO1s2sq3mnHF
         bjBaQwSPPf05efTe7DWX596oBoD0gjwomRUBXsiDoRurOAy56tNt/FvdpCla7GMuGivC
         UCmztYhKSRqHaUBtPADGKSL3LbcY1fj+PhwMVlsWIHsljGMkzYj0XSZZJEdWf/OVGNBa
         XdOA==
X-Gm-Message-State: AOAM532WE+uEgexY22qf0PFcYpqcV/MIovNHjj2EnYeJNwpSAHvRxWbV
	fvSBsP9sxOsZK1PZqRJ+JwI=
X-Google-Smtp-Source: ABdhPJwWwRH/sAEV2HigzIshd3439K7j8BsMJXS05VWy3mSDd+pPK3adu3sTGg0uNpYiwEPOmgUKZw==
X-Received: by 2002:a5d:64a7:: with SMTP id m7mr1949098wrp.687.1640081608579;
        Tue, 21 Dec 2021 02:13:28 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
        by smtp.gmail.com with ESMTPSA id m21sm18012267wrb.2.2021.12.21.02.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 02:13:28 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: robdclark@gmail.com
Cc: maarten.lankhorst@linux.intel.com,
	sean@poorly.run,
	airlied@linux.ie,
	daniel@ffwll.ch,
	tzimmermann@suse.de,
	maxime@cerno.tech,
	mripard@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 1/3] drm/plane: Mention format_mod_supported in IN_FORMATS docs
Date: Tue, 21 Dec 2021 11:13:17 +0100
Message-Id: <20211221101319.7980-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221101319.7980-1-jose.exposito89@gmail.com>
References: <20211221101319.7980-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adding format modifiers without implementing the function
"drm_plane_funcs.format_mod_supported" exposes an invalid IN_FORMATS
blob with modifiers but no formats to user-space.

This breaks the latest Weston [1]. For testing purposes, I extracted the
affected code to a standalone program [2].

Make clear in the IN_FORMATS documentation that implementing
"format_mod_supported" is mandatory.

[1] https://gitlab.freedesktop.org/wayland/weston/-/blob/9.0/libweston/backend-drm/kms.c#L431
[2] https://github.com/JoseExposito/drm-sandbox/blob/main/in_formats.c

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/drm_plane.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 82afb854141b..347571f8909a 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -126,8 +126,11 @@
  * IN_FORMATS:
  *     Blob property which contains the set of buffer format and modifier
  *     pairs supported by this plane. The blob is a struct
- *     drm_format_modifier_blob. Without this property the plane doesn't
- *     support buffers with modifiers. Userspace cannot change this property.
+ *     drm_format_modifier_blob and the drm_plane_funcs.format_mod_supported
+ *     function must be implemented by the driver to determine if the given
+ *     format/modifier combination is valid for the plane. Without this property
+ *     the plane doesn't support buffers with modifiers. Userspace cannot change
+ *     this property.
  *
  *     Note that userspace can check the &DRM_CAP_ADDFB2_MODIFIERS driver
  *     capability for general modifier support. If this flag is set then every
-- 
2.25.1

