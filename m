Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F42C1F1524
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Mar 2025 23:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741821804; cv=none; b=c9AApcSFVnS8iyc978ET9iYOWVNxac8Yfi+LG0mgf2Z5Mt6J2TysXO6VDLdtqivIJFDU9GajySOHXJ1gO0QDLzBvTfJN0W/w/2ukSjya4BPHv3SblkOhSiVRsGHhJLr8oQ8crday26MqgxdaLCnsHHnQgYseUxyxRgM4TiXPiZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741821804; c=relaxed/simple;
	bh=AlMyTKDEpt5SFnEfiL/4Y+fTEsmXPpNzUT5Ac4vNIlY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MyuYLIWBjpNxjV8QMbsMf8yygeaAdoMCVdap2IOJyUNSwKxb36CFclr1RdUI5Upo2cnyJ7kAGxzZj6QszK8KbjtFoXlgTHl3WNBdHRplK2WG02lpZTKj8hjozFJiDzkFE8eI+cUSfIg38uvDgqXwN+jCWRGbL4RWhJhNblICDyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WhnMemqH; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WhnMemqH"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e6ff035e9aso700735a12.0
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Mar 2025 16:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741821800; x=1742426600; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N5XiRjmmSEl/27WyQtk9B76hARduq1iukuO2DeaA0TI=;
        b=WhnMemqHvNBjSMmd1/wJbH4hIT9KJjjc2BonK1PBFieBtISDcACqnq2dExQUGj/kRg
         2D10DXb/lfNuP1pQ6wX67RnnVZL9SdxetTAEbO1FzVfmeMxnGbr3IWXPkLs06mvd+oJg
         Be72uramvkBifUGWnalPo7sOclmIDGK4E6hatsqrCheeoTEa4qrbWLUWVGXueeoupWql
         JDXpAwEv3UT4As7xyz+7lfUQiOpi+6oYtxgudGszPsjdhkQxQTz11fkYpka0eZFGPa+d
         CELL2ZwANL+WUndrBbi8AOuCQSViHexS3hEn1QdYeUMwm2PvyXYn9Ssi0kVlhicwWt21
         B77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741821800; x=1742426600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5XiRjmmSEl/27WyQtk9B76hARduq1iukuO2DeaA0TI=;
        b=SriHfB2N8dtKJMJVYwoVizRqkhOnm4uvVvviBO48NE85pKzNbb2XsHkYSSVjj5D248
         aBgvGxsjrWIIYoHpyXy31skeoWdXo/qZ+oPJ4G3BIR2jpbuYK4wkVrasMHruKkbQZuFb
         XbZGnf3lXWewPB2Ifq/u18tygr4JwBLAOhb5YNRzHK0DPe3slVS7LmjxMMh1J+n7kMZk
         krcfU5WhwEzd969XfUeZsfgDqhxTF+LqXOyPjR/MxDvfhd0/+U0t4SRuz8msXh1sWL9C
         pdeg7qFdbV74kri0X9A8ZJHTsgbzUrTWMdIYwRWiipjjVvSo6v2Ea/SpdM2krSLV+P+b
         eO+w==
X-Forwarded-Encrypted: i=1; AJvYcCVF9NWi7VOAW7B+Cd6CBHS3ObzbpMto/1BfrRUzUUd7iZlNu+In48pyX4pSIuqTco23WykemxtqOrKMjA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzwwDDYVkFQMX80GXERnu9j7WcieemFFqQFMU8p7EgSb/+tctMn
	08L9x8QN216RT6x+bl4IN4dMuHdO87YoZNXb3VR5hwDIhudc6/6R
X-Gm-Gg: ASbGnctKIu2fnL0lOFEGtAXLijmUb4qGhQj+Qi57pLJTmOHO8tINhVeGkUvpqofzZoi
	qezpo12GzqCLVhee+/Td3F1E2DIeBh1n4Gm/+eg7ktBpM3RmYmU/PHvfycKa+/yEjmRByXau9JK
	TXR93NMZmo/j9qmTIJJoMr+NpLv83PHqEoQawJGFElhyuZbIQxGZwNfoVOkJQPEz+dUDa1iHWi5
	gA95InmDDMC289S9BLLKoGRF+7oS47uT7PxaY4kgV1ed+Ny3oauRS+a4U/knbV6bm/wehWkQccs
	HhczE+fHHGvRYnlizaeqLrQMQV+fR9tm491XONMHkOzr0eeu6P/Ty/V/dZ2kZlyAP4bJ/U2HkDe
	/HnSEEKV00cEdEgLCZSNkQbJ5O4bBNMlacf18XXSULQ==
X-Google-Smtp-Source: AGHT+IGHCuvkKN2Hnl4IIftTv7iSM7L6WhcdJmI8aN2Zt/SmXrCXjIxp9Wwtgzg+MHajHiqjVl+fZA==
X-Received: by 2002:a05:6402:d08:b0:5e6:60da:dc45 with SMTP id 4fb4d7f45d1cf-5e75f987950mr11542688a12.31.1741821800333;
        Wed, 12 Mar 2025 16:23:20 -0700 (PDT)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816afe223sm26732a12.70.2025.03.12.16.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 16:23:20 -0700 (PDT)
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
Subject: [PATCH 0/2] drm/panfrost:
Date: Thu, 13 Mar 2025 00:23:17 +0100
Message-ID: <20250312232319.25712-1-simons.philippe@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allwinner H616 has a dedicated power domain for its Mali G31.

Currently after probe, the GPU is put in runtime suspend which 
disable the power domain.
On first usage of GPU, the power domain enable hangs the system.

This series adds the necessary calls to enable the clocks and
deasserting the reset line after the power domain enabling and
asserting the reset line and disabling the clocks prior to the
power domain disabling.

This allows to use the Mali GPU on all Allwinner H616
boards and devices.

Philippe Simons (2):
  drm/panfrost: Add PM runtime flags
  drm/panfrost: add h616 compatible string

 drivers/gpu/drm/panfrost/panfrost_device.c | 37 ++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_device.h |  4 +++
 drivers/gpu/drm/panfrost/panfrost_drv.c    |  8 +++++
 3 files changed, 49 insertions(+)


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
prerequisite-patch-id: eb8a11e2b24bb282970d8b8528834dea7ee392cc
-- 
2.48.1

