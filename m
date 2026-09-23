Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A912645629E
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 10:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160756; cv=none; b=SHwQR8KtgH/R6whwHfZFZNBHH8nDZBgIjL3QnS0V4mFQe4rueMjTm9xu3O+y1UnzIRD7EPJKepfXc/Va0eVx2+Pb3cRFmys7tpnPXApP4DhsnhKeLceaLI2lqnE99h/8jZe8ziNoJ8phA8dHt0zHRSv7lwXuUymOSgaZL0oS+Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160756; c=relaxed/simple;
	bh=xrHgSFEJMs78mvMQZzVM9Z+570q3BIZmlyKkhqlhnVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PFzbaXmXJ5CkMgbmaWUlUjBCxBDcX1FCQ9sRC56/507lxKyYBB52rmZvzjiyH2Zk9WYo1Pw92zHufRp58WyPyhdi1TEV88mlywx71Du9JdIHFzw8HLmad/b4w6fSqfksQ1/Tz6Y+jGjF2Jk37H0kKR3H4kX91JoZlmUWu5YOi0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTx0q0a2; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTx0q0a2"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1744fso899791e87.2
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 03:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160739; x=1790765539; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zKBPC/HUfOeYNRheVRrqScAzgVBluDo4sVjYT3kJwDs=;
        b=TTx0q0a27LIYJDdD0h2Y/D9jJNXX0pL/I6scrWv0sB0kPEgPLLu3/TxFeA5ezH32YL
         zfioO9xQ80YfR+sq/bfsqY9T8ktuh7PrDLiybUWyBR6pjG7r7hUrTnwwGSx0wx9JUTcp
         JhyWxW0TAcPVtvlHXyY26Y0eCfeFLy4XxiMkLR/LfblpO1+DYReh2znXkhodnpH+ev4h
         TJhXCgt4OwNkjGgf87Z0kx9JdAeYHd8TvLuRPvJWMWriXHXCNwDjUvY+ZHn1k1xa7Lq7
         R7VaJN/ELcE2LvatE3o6poLSC8FLKGfD2GTIHiW2ELdWp8xViek4z1f5XplvibcvT4A0
         EbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160739; x=1790765539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zKBPC/HUfOeYNRheVRrqScAzgVBluDo4sVjYT3kJwDs=;
        b=WzNuiH3osoFm0fqZ+uzNTO0Eq258U5/04SoH1sPt13EuLovocwL/gKZOF0jkYQPZRJ
         y/dLUJwduofKJDh17OM+NNtIJsOtbpibrjKBuj99gGGIscwKDwcPhHgwxgq/RucouA/O
         dVtJdwIpHjQs1+oMdR0uwPAtA24JUqWwY29Cqm3IRLSRbuc/ylxfnELUCInw7gPYPceg
         Q9aBF521f3vpiTPq8oD/rHU5kbjfIajeKKWL4OClzArOOFpAKHVwJelG/V1phUIGqGJZ
         uv81TBlBvSE15QQL98ATcGpzQi20IXFWrcHCCoH1fj3ChJwR/B3uNVsG9r6k/GIWb7Mc
         fTdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwLxzBtg2giCO7qPxvn0g9VfEKDm3lCo6+mdmlIRQw3C0JlgrkvZj3FrVUDfgqFZlXCVwfS6v1s/YuTA==@lists.linux.dev
X-Gm-Message-State: AFuF++le6kvx1uRFks5AecmdjGUAPRCP9nFmBnFileRaiIQ5PYbynx8Q
	9bB8MBpL96pWXrRgTdloe9tc6xvtz4AqSsLimo7fpM4dgOTCZWlbGJ44oBwyQhHJGpnBfA==
X-Gm-Gg: AYBFou09wXgs/ccS22SlVl+Q810DeLl0tHa83KjvKAXes5lvLPCS9Kfo9CKupN6rgN3
	KRWLVun24UT5H9nrXdz2S/NdrAhm4GOJrAzIHtn1XULnYxGr9WhqZsp8msPz02auRjLlQFjhDOy
	2/Rm6dfrPZxGtpzt7KDy+oNSNSA18oCF5VjCWSAxlKcyYd2SVowekKn3vItt4gZGs3V0Z/wVTGt
	wSniEjW7hxLQXBJOCo1pdL01idPtoLu9K415U9NPMqRwNnr6S7rqotwT7U3v2ojmC1OgtEo4e8p
	AdxjeC2sKOkzUYrPDstNL33pQW7ofANT+pxl4ylaTgNwgKFsiqVprvGxoq+hk7CNg9uXLudhaDl
	DUAN9YELLMvZ/6XpHN7Jj5RMMgDqiLAcdEtedqIGj+oX2MTRFo4vwbK51ESWZeGkYF/MQ93bamH
	0Fj91VkXNyEHdUj6oJ84oEQGRfJVJ3ReLelVQlXj5bFqJq52JuM6GlGVvOgGwfIusWdtsxn4H7v
	Um3xH0uU4ij98yBHvppppmeMmhsMA==
X-Received: by 2002:a05:6512:b1d:b0:5b5:e66f:2ac2 with SMTP id 2adb3069b0e04-5b8d8952ef2mr759840e87.6.1790160738756;
        Wed, 23 Sep 2026 03:52:18 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8589e1csm503208e87.54.2026.09.23.03.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:52:18 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-input@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Vladnwx <vladnwx@users.noreply.github.com>
Subject: [PATCH] Input: axp20x-pek - add AXP313a support
Date: Wed, 23 Sep 2026 15:52:14 +0500
Message-ID: <20260923105215.1633-1-anykey196@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vladnwx <vladnwx@users.noreply.github.com>

The AXP313a MFD driver registers its power button cell as "axp313a-pek",
but the axp20x-pek platform id table only matches "axp20x-pek" and
"axp221-pek". The power button therefore never probes on boards using the
AXP313a PMIC (e.g. the OrangePi Zero 2W).

Add the missing id table entry. The register layout used by the driver
matches the AXP313a, so the generic axp20x_info is reused.

Tested on: OrangePi Zero 2W (Allwinner H618 + AXP313a), kernel 7.1.13.

Signed-off-by: Vladnwx <vladnwx@users.noreply.github.com>
---
 drivers/input/misc/axp20x-pek.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20x-pek.c
index 24f9e9d89..d4e2fc9a9 100644
--- a/drivers/input/misc/axp20x-pek.c
+++ b/drivers/input/misc/axp20x-pek.c
@@ -393,6 +393,10 @@ static const struct platform_device_id axp_pek_id_match[] = {
 		.name = "axp221-pek",
 		.driver_data = (kernel_ulong_t)&axp221_info,
 	},
+	{
+		.name = "axp313a-pek",
+		.driver_data = (kernel_ulong_t)&axp20x_info,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, axp_pek_id_match);
-- 
2.53.0

