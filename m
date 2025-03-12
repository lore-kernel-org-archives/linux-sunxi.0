Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6223E1F1536
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Mar 2025 23:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741821806; cv=none; b=Foaf2s4DjYQyy5xc4AJ/Q/HbnqqNcBYtU+l52FwVi5P/cpcQ4Ml6mjFUWq+IypUoy2hqTXdwc0RkROCp/sAYTAdpxpegY6Qj75dVusxJ7rCK0n2me5pvDRcioV3DtfrwGfPGwpxlRdKIbnPpcQrvtb8Uc7l//QVKhezqPOczPnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741821806; c=relaxed/simple;
	bh=4YZluZGJ4DEMVE+2SA7gUODIucELBWly4WYu8TV+KoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EnPVjH3T592Mg77QjlSO+VtrhPuFYeQp/dhgm2eZnoPHfdG4dyj/gf6eHRgSn7mRQt3yCHJkuBSQh3KjXDz2XOICv6S0bgnXt4CJNShdxtgZvfGbPdp6GF4I0TY5MT2WjcEsn/799NmNjUGUL+bd7Sopjh5HtGqnGld0lOAYt4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUQQZA43; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUQQZA43"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5e1a38c1aso384526a12.2
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Mar 2025 16:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741821802; x=1742426602; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zrV7lfXICcs3l0g4L6oSOhAbz0Vn05AYlZgbp4rDoM=;
        b=IUQQZA43c9RNMztay5ZfolfGlExckrb2nDBMJV6n+LwZer9prnJsaKa2P/rti4eCFC
         uYZ0S1gNXK8+bg7f3d4w/9/x/u3OBFbeGYFi9yiFq2MRO2Op6tl2XqcLm7pasEwWuF4Q
         jjkS/vlWA20gNB8keO8OnAr6LjGxfjLQipaJtX7P9KSDeXgEOpRZ4vblkOHIEJJDaMEh
         uMgId1H3aYDQuPVLBV3sILyIMo8dGapvFCBEhFUe1o33XgWfAsz9MXrj7Ae9ewB5b9OS
         MhZt6q7hRooEAeUVng1JZnelIAIzi9UNt2PWSRoQmRnSnbndYrzODDS3IahIaZ33DyAB
         sbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741821803; x=1742426603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6zrV7lfXICcs3l0g4L6oSOhAbz0Vn05AYlZgbp4rDoM=;
        b=Quyyal+6lfI5arr9JEMAaaWbTF2hBEsWN9OARS3JGQvpyFYtdxIm93t9rKcyrQ1L4Y
         BpmaDznfinZAzCKy+hwGC5d6zShCwvQ5LJ8c5nLA3VUBJd68ro+cIBMsSagGunYi3omK
         /B9bTro6CWbpCA+KuLb3bNUYh7ZiUlDxYv078pmSgLYBqTH8dmqlEQ4HVkp0ci+hZ0Zz
         KuKt4mHGcsCcX1634tghGPjc7ZB4bGpFfBSXIR5XAMO25pqiWMxtTmGDfBvtfnQMK+87
         skEPdY7xInJAD2ILL0LrHzwjycERtQqdZ4NSS8aX8UQWo+ZbwJ5Ps76gYDY8qnujT+RG
         GeVA==
X-Forwarded-Encrypted: i=1; AJvYcCX18KyHymJX67WhgEFN3f+EtcP6/PGk4HaPjq2pCecX7GuCO1ULYeXZpoU/gSOorFC58z64uaRSJS2tEw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3NqfNQdAweis9Q5RwcUmpgkTxA0Gp/DZAtOOuuEjPMpGBjRvo
	UA6A0Sg1MX599y/kTxK5/akSWG7u9ub2hwnmsR19hiC+0jOuRXKI
X-Gm-Gg: ASbGnculkh+ln84eovcvujt8HSdW/2ObQL0bXlg/OrL1KvT53q/+ugFGPZaJqmd7bqK
	dtQKH5MgBPhRC74pb4CRNHQrPOUgNR8W/OxAjeEp9oKg6yUWok6S+4ImaQm5xK6BrqJ3Hf3kk59
	FyHBbiJLzQh8gJ7C7wSZ1V2SYTxtZHCmRiyR+3FWvh3IoYiviSwA8nuRVTV38kyRgjF+CH3+bZX
	w2F0Y0rlQmbAZW2QX1f/v0evpgqk476o9OXKG4Tigc8tuS8TPwSrCshyI8HC1qorPJjT6qd9qrv
	1YGo0KyzbuUl6u/OmXeuNV5dlIfiW8IITkYWpyZ2xP/zS1NlA47uD6IFIeEBRra/1d9THtFyvOp
	q8x6RGoTFoO6sB4v1IEiPAUyaYCACazw=
X-Google-Smtp-Source: AGHT+IE/HS7pBbJiG0dtxqr09NjUVWMflt711bAAkhk0a2Jd0FhTvLGrwUMbdOg+tiQiWKRSLoGTNQ==
X-Received: by 2002:a05:6402:430b:b0:5df:25e8:26d2 with SMTP id 4fb4d7f45d1cf-5e5e22a79ccmr49699585a12.5.1741821802314;
        Wed, 12 Mar 2025 16:23:22 -0700 (PDT)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816afe223sm26732a12.70.2025.03.12.16.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 16:23:21 -0700 (PDT)
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
Subject: [PATCH 2/2] drm/panfrost: add h616 compatible string
Date: Thu, 13 Mar 2025 00:23:19 +0100
Message-ID: <20250312232319.25712-3-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312232319.25712-1-simons.philippe@gmail.com>
References: <20250312232319.25712-1-simons.philippe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tie the Allwinner compatible string to the two features bits that will
toggle the clocks and the reset line whenever the power domain is changing
state.

Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 0f3935556ac7..f13743fe6bad 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -776,6 +776,13 @@ static const struct panfrost_compatible default_data = {
 	.pm_domain_names = NULL,
 };
 
+static const struct panfrost_compatible allwinner_h616_data = {
+	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
+	.supply_names = default_supplies,
+	.num_pm_domains = 1,
+	.pm_features = BIT(GPU_PM_RT_CLK_DIS) | BIT(GPU_PM_RT_RST_ASRT),
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
2.48.1

