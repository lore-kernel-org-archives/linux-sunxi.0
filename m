Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D2319AD48
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Apr 2025 05:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743659537; cv=none; b=P2Q5olWOSWzIU/Q83iBTecH4T5Vj7tV5KpsXWtQJ1q9LxYX9QZHJ3WjqpxTVbyZzyu2u+EkKaydGeiQGTC0W3hniCdbNbw/5lDQkwLHwgFCZv2CoVxQG6uZtDUP9ZY72qDR8CBdJpaU5O4qqYeFnrzn9I5VPKW+I4Fg41YbjqZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743659537; c=relaxed/simple;
	bh=gVoy6WCduQRkgG/3KKBACPXiVSY21KM18PUYkLJzIvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CbC72279cRLVnjN53D9ohXyAMf6Fdmeo5k4Q4vSCkY6QChB4f+l/BIc09Sn2OdOqvup9yX1Va/xzbabuXouLIlcSJ8NKUp9ULQ0Qok8pU9/6Rf6DWCcNGy+LcmuzkqOnMOH48nmx36zsSyaMI7JH848C9bTIOxxqHnG298MNk0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bETfd2lL; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bETfd2lL"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso983019a12.0
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Apr 2025 22:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743659534; x=1744264334; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2Xsn95gZDOG35Cm+QZTKl3yuSSikANGmud/WPdVRhI=;
        b=bETfd2lLuY5FfTxc1nre7uLI3ulo/qho3shis88ROXh29qPFlzgUJdEde/elN0e0yj
         //CTuuXflQ178Z8024UUowrZoK24MYrzlV7Di3viexmVLMqkzSJ65GX3s0HO5vmvPICz
         FPugkLgwl7Lnl0eY/fL5idoP+ygq/pQI08rRbzZM4WDxQr8TOPo71A5VCfS8tDVJLvGP
         66Dz7O3wDRKxfPK7BJHG07iljYU7330qIA3ACDm+6XvR/73xRpxe+ZtBCcYKZ9PcvYHN
         4A7HBLl7CH+dmr/dZlrmoNtV0Dhr3RkqFBKwgGWfjCJYGarqCrSrxZRDuAJf6qyFX8S2
         X+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743659534; x=1744264334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2Xsn95gZDOG35Cm+QZTKl3yuSSikANGmud/WPdVRhI=;
        b=WqdRaIvVzgREFdlyW6suDoJm9zHqS6UEAM3ux7LH4em49DUbV9P9uOBORxPvQgPIP+
         Fm0Gx9GJLVg0vc8TECZszhAcLncb0vtAxKUa8R3hcwxlKgH0+hay4W1vdslZCxL2ouIN
         WnVAME2MLYWQePsL0SE0HUIK0gb9wkkMqOGlVpdp0QjbiL4Z9QsGSNiJGNCxUft5wyhE
         AM9X1bbgXpwF7D1nwWn+MyX0cbAP6hRUfWIktHJt0QSoR56htccwL0LVzywpIGDGPwfp
         t50/k6IBpnwmVph9m92z1zOOd/pVsTHgTFKeappqRvRi+K2hvr86ktEAyi+CDR/0aYDr
         vVWA==
X-Forwarded-Encrypted: i=1; AJvYcCWiScvyAUejptlucr/7lJtNtq4jEb914gIN8NnpyUGsCpqBH2L/VPZqMhdQJphU4O7nGahiv7HTbjmuyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyaikNFhNHHMuBknIVCOVb7r5O6cfqIQjNWCwmCrs+TrMecbfeD
	2d5l5iTR+oABWhh1u4KLqjz53FvnJbom1k83+lQ15fHmEqDjVEmZ
X-Gm-Gg: ASbGncuhsXfSVn4wvE/sfeKem+J2Nc+cFFJBl94tsisQG0hWlnHbsC+6NYW7PdnoNPI
	KEq9VhyL+4HDc9w+mDpDReCgZ7YhQZ/eTcgAKvmDgRS+ASPYU7V8J/pKUuhOCiz7ESMNmfxsQXV
	m6e76cnqe95odC+CD9pd1G0yt77eq4LM6MHI72zqWrCldn96G15w1+qY5CB12i/lpe/0ice3zqv
	NoaKvBlLWU7kysMnLkZJj8Q6umMgE2jVxz/6amyQkEFSJ9rpgOCZZmrWh7vWsJreGVySZkZ3byo
	uEHCPgF/Vf+LmslFnEKTbIJCCPT0NAZsRNN23pGnRW4t2gj8hlX5PRdQAhmYYXpc5bsbyid84dD
	dEVwsEllhy3cGcEAzhqyR82sv/T9iZiprGC1rygbbHQ==
X-Google-Smtp-Source: AGHT+IGhaJ1nXDxsTQs36HHprHNbaRYD6p+r/EKASCCtnfsEVG7w5Y6wfGcvj7xTLu9oHHGrxOP0lw==
X-Received: by 2002:a05:6402:34c9:b0:5e4:d402:5c20 with SMTP id 4fb4d7f45d1cf-5f086f84cbamr958962a12.0.1743659534359;
        Wed, 02 Apr 2025 22:52:14 -0700 (PDT)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087714e11sm417236a12.6.2025.04.02.22.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 22:52:14 -0700 (PDT)
From: Philippe Simons <simons.philippe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	=?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: [PATCH v2 2/3] drm/panfrost: add h616 compatible string
Date: Thu,  3 Apr 2025 07:52:09 +0200
Message-ID: <20250403055210.54486-3-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403055210.54486-1-simons.philippe@gmail.com>
References: <20250403055210.54486-1-simons.philippe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tie the Allwinner compatible string to the GPU_PM_RT feature bits that will
toggle the clocks and the reset line whenever the power domain is changing
state.

Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 0f3935556ac7..9470c04c5487 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -776,6 +776,13 @@ static const struct panfrost_compatible default_data = {
 	.pm_domain_names = NULL,
 };
 
+static const struct panfrost_compatible allwinner_h616_data = {
+	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
+	.supply_names = default_supplies,
+	.num_pm_domains = 1,
+	.pm_features = BIT(GPU_PM_RT),
+};
+
 static const struct panfrost_compatible amlogic_data = {
 	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
 	.supply_names = default_supplies,
@@ -859,6 +866,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
 	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
 	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
+	{ .compatible = "allwinner,sun50i-h616-mali", .data = &allwinner_h616_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.49.0

