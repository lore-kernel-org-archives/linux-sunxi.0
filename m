Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA6934CDD
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Aug 2026 09:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786180320; cv=none; b=mHZ3w2eXMMv+lI9zhS3R0BGwggDD1ReyK4Rny7atWDF9kzwleIiJvqTH+ftmtbqXlpLoJ0MWa82bap2Rb1T1MzqLWuUdIZB+CINvUK4vFMKOLWgUsPi7Zr6bpanK6YzZQH4087sM2y3sIFOc/CWDx8unTfbX6KOd4GAVV0tFv04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786180320; c=relaxed/simple;
	bh=oJ42448NVLVzg/Jd4WQT7WZLZMZvxVSOD0A/N+s45qY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RAxG6EvU3zo0ymSzz2ifV1bTlNWCDS2rCiMSYd1mzNjGOFKyVUspPRGGfh5bzE/sdToUaRz0M9ho1d2BVWYDqc/F/WLxmOigBEXgvVjrQFbG/v992fUo6pdCLeLIJBkkPa1IB9xA/0BCBSPFGMlj/VTebOLYFphByMCncAFG+CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qju57IRI; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qju57IRI"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cacb8416a1so3414555ad.1
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Aug 2026 02:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786180319; x=1786785119; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BveM5cMWSJ3TieKfU41UkYe+p2SvuBRd6rFqa8L96gE=;
        b=qju57IRIjp5Sv6Mc9I9L5KgigsX6Hd0dLhQwpfhDNGDkxdryIyc0PCCIsb4oiJpqBB
         QdQjnsVQv+902VLMKcFCdX9HfKszSP3gcfao2r8SgphFYWJGMSlGGEeb2S2fFqS13eic
         AqQG8C2xS9Z5qGQyMqdq4Qd7ahCkRLJtyXwTfkWrirmtSU26XQWPpaNqcuxabFBpyA69
         0kLbq3t0pjbTYho50IQl/ElB2OZViUV9YFkWlirl07NzL0BdejEfwRfgsq5GSDuXzd09
         sr16I8b7Eg++ilp6MyWQo14WbSm6P0tUXZE7QH/nbaQsoV6Hzf1dvH3bD8fjLdvfBOsz
         o2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786180319; x=1786785119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BveM5cMWSJ3TieKfU41UkYe+p2SvuBRd6rFqa8L96gE=;
        b=Hlbluo5ObBSPczClvgdmwuxgIh9em9NLXkg8Moy4fPE70mxsgbUqX+oS2QmZtpyNVW
         4+e+EHSH1YMJamiEvup5VW59D6GBNu76WQcjG+sjjb/ZSZrE+vvM8DBC3+YheqvbbvSa
         QMQ8e6eNuKOkJEK5XwxkuyozXxtDDwisUA8cVK5oM4O+gTjRh2fbm7zkYPQRb5IU/Vnl
         2MEytRvaJLcDyCGNADlnw8yC9G+1B7+xbm9MuhJpQ/mer6KHugGbj81icpaClu+hj9wb
         v6ZmvxysQx+G1u4IbAjkfdutuS8Ky/2rvW7AvOHZPc6PfdiQhoqg56W/pN2k/59Qtlrz
         Vc4w==
X-Forwarded-Encrypted: i=1; AHgh+Rrp9OrLI1J7Oj1vUzvAp5qok5j6QAD+Lxw+6yGVg0VTNGcISd/BWEjSnprn8NlTFBD03HrbE1iFAIuZ8A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyojqqRwVj8XW/iTzpgZj9oszZsj0IwjYGXac17ugW75JNwUFsv
	1q0MwRHntK8L9q6Wosaab4393cUC/wYMNIluZOAxF/oV25MI51jMoRcA
X-Gm-Gg: AR+sD13vreIuWN/r2N/VIa41k4edCmvPa9JtqSxj5hCGinROTtEYPGWp6N7efEX828B
	6/btcv8UXCJ+iAEt5s7UkHU7F+77tgrG9r9CTDE5BcmC15WhCUQ3fZRGbLcnRJK1XH9qZoLDHpv
	siY6qoh2rJRa7jVhlSLQCfMPkQahRjMZWdBEUm6w3LzRN+TqPtz5sXEzG73coUs4yU3I4FE3D+Z
	I0M5uW0C+lCxVrexMZM/XTEd74AFL3jCD93RHN4z7e1VN+HYVeLlEmH5MvcWSfEDgWMHzzRA/Br
	f3gbpwgBIXCFCufspZXHaTxZDKKsYfMhZqhf9Q35c6eWgqMaozj1iyhJ/QBJEtWuFJ0BeOPidLe
	t50N3zXtpaCHuIM5qj8UW7DmzzUTGaBSiIBKXgeMP9jOeGhrgQF09s6CGlh/B1G8GAcqXQTUKyG
	euuwsUdxNrrMELcRP+bY0ubr6t/4/C4f2tPZJJOT14ttSKAUHEwZ4LX/xocU+SMB1kn1zWw/jgR
	mDXag==
X-Received: by 2002:a17:902:f709:b0:2ca:1b97:70c5 with SMTP id d9443c01a7336-2d2a8458b93mr88228315ad.4.1786180318914;
        Sat, 08 Aug 2026 02:11:58 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde308sm17126060eec.20.2026.08.08.02.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:11:58 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: sun4i-csi: fix async connection leak when notifier registration fails
Date: Sat,  8 Aug 2026 16:11:51 +0700
Message-Id: <20260808091151.2691482-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sun4i_csi_notifier_init() adds a v4l2_async_connection to the notifier's
waiting list with v4l2_async_nf_add_fwnode_remote(). If the subsequent
v4l2_async_nf_register() then fails, probe jumps to err_unregister_media,
which never calls v4l2_async_nf_cleanup(). The core does not free the
waiting list on a failed registration, so the async connection is leaked.

Add an err_clean_notifier label that cleans up the notifier on the
registration-failure path, matching the teardown done in
sun4i_csi_remove(). The notifier-init failure path adds nothing to the
notifier and continues to skip the cleanup.

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index e53a07b770b7..a8db851ab5a5 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -255,13 +255,15 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	ret = v4l2_async_nf_register(&csi->notifier);
 	if (ret) {
 		dev_err(csi->dev, "Couldn't register our notifier.\n");
-		goto err_unregister_media;
+		goto err_clean_notifier;
 	}
 
 	pm_runtime_enable(&pdev->dev);
 
 	return 0;
 
+err_clean_notifier:
+	v4l2_async_nf_cleanup(&csi->notifier);
 err_unregister_media:
 	media_device_unregister(&csi->mdev);
 	sun4i_csi_dma_unregister(csi);
-- 
2.25.1

