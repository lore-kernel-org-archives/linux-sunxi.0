Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E1619F12A
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Apr 2025 05:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743659539; cv=none; b=q26TnnqE1nfPS/D2qvLzFMCTLXkGEV9cFckULJHqnW+HLIddE50Dka/WznpF9Y2+ZJyDLGjpLdn6+aBGZxAm0PpCOYhouYUKwOryhzbBHiWQdmKihU0ZUmsxtax6OAIwxd8qYpBJha/8S5904cc1P2n7B0yvzqK9+qS7x4DCTWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743659539; c=relaxed/simple;
	bh=bOtOmwaf+d85oYpjpBLSTKA6Cj+ZdsJofatkPjD22No=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T9KxuOe5jqRaREhGLC2WhoFl58vENJDjkwz+Q9ls5HIeEQOtTcTCfQ92Duc6o0EwskJMy3MDcmKDsH8j50CAtKicafcRPcDW9KyvUmcv3416Fbv0BXC77fkZUJKabRKoIk1cEHtZx8OAXw49WatOlRIHrIk/BkimTIEfueUo/4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBjQ9W0v; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBjQ9W0v"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so840697a12.0
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Apr 2025 22:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743659536; x=1744264336; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKTRZmv77HTmpqOJnfj99p0xYiAgz1IADbNWkm67q0w=;
        b=DBjQ9W0vUmyHy8qTyDLba91nZ1Pe93/XVqpTrsEgM5eL4SL5cep2m31ZW8fkMSIiAZ
         qg5V6xhqcKhxBQeXflnqeKEzBMy9QUlDClG1+kYNU/jQ+j0b2zzTzwChwsCbu8GFR6oH
         fjp13B8s5fMtkm+Nv8IQzIy9f29BhWg8le7wE1ky5BA7rABl4p5aP62TcUSMan7UYSTp
         Y+FlmEiw/0cdJpn7k83eo05ZYjk1XOlX/pm/e7uL0yGMCtTOVCWVEnsmVJcff+uLsPg3
         sM8kAm7CZHqAq4soImFtXgUKyJx+3d0wY5vDSa3Voj0p2BrZPJxW1BCdUXghnZNpJ267
         vUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743659536; x=1744264336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKTRZmv77HTmpqOJnfj99p0xYiAgz1IADbNWkm67q0w=;
        b=iNRtfSGAoZX9TUjxHAyuK6TkTV5l3ozDmarReyoFELwyRKgJxESDc7bAA1uK8YAtra
         y1AH5ltBJTq3Kv1TyDF3CslmJZ3b4lV/5S39UNVkq608xQdutvRXHXHD6EmUzFVrk0b1
         ReUua984DSoGZ6/1Tu4qpC8vPqeUurSbHFadQWPGjE1ALyoc5Kfq5gT0EVW6jQwfNC63
         m01QxwIauc583ttHBl0fzgXOhqW6WPTd6wRWeKlegP+yhvuBiZrt0gP0uMgKUnA0j8xD
         UCn+R8eXPlKoq9Rxe4u8s0gQ4myvKIdEDsAk7xScv6wo5xvfrbLLTCuj+Qy2znyq1MC2
         HMwA==
X-Forwarded-Encrypted: i=1; AJvYcCXmFs3mNygMWN4c0cjHvoBbvAoCDuz7IguKOaXvYfGyChx6lOwHkRrs2I6I8nWoYNRrfFFHFVpnzVQygQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4MUNwdvB+HenUxD5u1fHjfSl3qlkJD9kTZZ/SJUMFj84VABHJ
	4aywv4ljWqFRaWfO5jXrd3nRVgZ1FJAbl1EXq6Wf74zp7s5uL2dP
X-Gm-Gg: ASbGnctHgrF1JNTH7DNN7VFziAj3Qttanp29BCavbYi+ttSa1RYwOUBEP08je+TLW6w
	9lCmUvR/mfd4z+EKYbmkz5qsZ4MatXtPEJI5c4YzErWXp/LzQShtqwd033MuMBxomBr1wZnCeWb
	/d5LK4LxIA2oVhsXVr/J2Fv2ANNZP6GZqc4bl/udrN9TDKGxmlMh54PzUbzSGWq+mtIKiNyy1E4
	YIjS+eqvlJPqEsFgHg6RkE3GIpdS4JnHq0uJ2Ee3NRHIgJjs+777qeymklrR5R2sfDBr7O0ri6F
	A7k5ZgNPGKR1nMBungQvA8ZUGOGcShLQj/Uha8P7quUDtJJGDoqKCNvTggdCFkM5IqvjeOgmldL
	rmrcbP4nteTr9gwQfm1sgc67i0KU7AY4=
X-Google-Smtp-Source: AGHT+IErNtuWo09KLUdY+qpohmLzPpx+EJwT2QrMD64lmhMArDMJQJ6Z7Gp9MWYxCImCbb3JWo9XhQ==
X-Received: by 2002:a05:6402:510a:b0:5e7:97d2:6d10 with SMTP id 4fb4d7f45d1cf-5edfdf190cdmr16383892a12.28.1743659535771;
        Wed, 02 Apr 2025 22:52:15 -0700 (PDT)
Received: from localhost.localdomain (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087714e11sm417236a12.6.2025.04.02.22.52.14
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
Subject: [PATCH v2 3/3] drm/panfrost: reorder pd/clk/rst sequence
Date: Thu,  3 Apr 2025 07:52:10 +0200
Message-ID: <20250403055210.54486-4-simons.philippe@gmail.com>
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

According to Mali manuals, the powerup sequence should be
enable pd, asserting the reset then enabling the clock and
the reverse for powerdown.

Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 38 +++++++++++-----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 93d48e97ce10..5d35076b2e6d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -209,10 +209,20 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 
 	spin_lock_init(&pfdev->cycle_counter.lock);
 
+	err = panfrost_pm_domain_init(pfdev);
+	if (err)
+		return err;
+
+	err = panfrost_reset_init(pfdev);
+	if (err) {
+		dev_err(pfdev->dev, "reset init failed %d\n", err);
+		goto out_pm_domain;
+	}
+
 	err = panfrost_clk_init(pfdev);
 	if (err) {
 		dev_err(pfdev->dev, "clk init failed %d\n", err);
-		return err;
+		goto out_reset;
 	}
 
 	err = panfrost_devfreq_init(pfdev);
@@ -229,25 +239,15 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 			goto out_devfreq;
 	}
 
-	err = panfrost_reset_init(pfdev);
-	if (err) {
-		dev_err(pfdev->dev, "reset init failed %d\n", err);
-		goto out_regulator;
-	}
-
-	err = panfrost_pm_domain_init(pfdev);
-	if (err)
-		goto out_reset;
-
 	pfdev->iomem = devm_platform_ioremap_resource(pfdev->pdev, 0);
 	if (IS_ERR(pfdev->iomem)) {
 		err = PTR_ERR(pfdev->iomem);
-		goto out_pm_domain;
+		goto out_regulator;
 	}
 
 	err = panfrost_gpu_init(pfdev);
 	if (err)
-		goto out_pm_domain;
+		goto out_regulator;
 
 	err = panfrost_mmu_init(pfdev);
 	if (err)
@@ -268,16 +268,16 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 	panfrost_mmu_fini(pfdev);
 out_gpu:
 	panfrost_gpu_fini(pfdev);
-out_pm_domain:
-	panfrost_pm_domain_fini(pfdev);
-out_reset:
-	panfrost_reset_fini(pfdev);
 out_regulator:
 	panfrost_regulator_fini(pfdev);
 out_devfreq:
 	panfrost_devfreq_fini(pfdev);
 out_clk:
 	panfrost_clk_fini(pfdev);
+out_reset:
+	panfrost_reset_fini(pfdev);
+out_pm_domain:
+	panfrost_pm_domain_fini(pfdev);
 	return err;
 }
 
@@ -287,11 +287,11 @@ void panfrost_device_fini(struct panfrost_device *pfdev)
 	panfrost_job_fini(pfdev);
 	panfrost_mmu_fini(pfdev);
 	panfrost_gpu_fini(pfdev);
-	panfrost_pm_domain_fini(pfdev);
-	panfrost_reset_fini(pfdev);
 	panfrost_devfreq_fini(pfdev);
 	panfrost_regulator_fini(pfdev);
 	panfrost_clk_fini(pfdev);
+	panfrost_reset_fini(pfdev);
+	panfrost_pm_domain_fini(pfdev);
 }
 
 #define PANFROST_EXCEPTION(id) \
-- 
2.49.0

