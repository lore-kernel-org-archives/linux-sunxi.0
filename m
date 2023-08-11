Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DBD8468
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Aug 2023 19:40:43 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-76af2cb7404so174066785a.0
        for <linux-sunxi@lists.linux.dev>; Fri, 11 Aug 2023 12:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691782842; x=1692387642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K8XAdlCauzuqTqX7DL7uCr2jVWlrna5hii1a8kj15JE=;
        b=i6oD9bghJDTu1zIQIV4UtUAx1+dPDP6CDrtzU9vghK3CiuknavQ6GqZJhbsOQVSMI2
         OV8W/NB2Z2SY+Jkf8lUEOxUjQIqmbxHu6jquYhiyp/0M2+yG8f/qDgaq2CbO2dLVp1dq
         +7/kqN0uTWYkwyjAuNnr6AuOtZG/vR6lP0L427ToteS19YuwsytmuMdebanfvGRNNOx5
         3p6DSoODvzu+GeZZd+si7+4RKOumeXVfqkLQLG8yaIArCBk+UWiLylcKWRB56HRCX/vX
         82k9L25AmzIFT5jInmSyANwga3Ke6p4QgJraLbfmT7IY/+7D/ca0rZ788xZWoQBtKi2z
         bVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691782842; x=1692387642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8XAdlCauzuqTqX7DL7uCr2jVWlrna5hii1a8kj15JE=;
        b=R88HdiVNzQUPEqjW+HkgF7ujYTJEqWsK5NfJIjcv9GP/4WpdlFhlV0zX69cDML0QhF
         QpXvNAzJKyU+lNMO1QTXPYlYlbiM1NhZ7yV0n2XIea91USo2RMqE4m2uBYQy8GaxZGOP
         Q/gcAe/ojLBuTO9PW5PmEAH1iTkFUsRo2tQ7Yi4yryDB/0AUc3fq7sWKdbSmOW+nVgR9
         +LemygxCuu4fpnMYpRczGYSWL7Smb0JIE1iY/i1BKUM+SLRUwOgGrelMqWFo4OF/qlG2
         Wc4Z1R5HIeafAhT23mHq+Of6KvkKj7cgol+smi5bKmohziicdfBX/5lBV3furhwOXwa4
         mLcg==
X-Gm-Message-State: AOJu0Yy4m8M9OQGyqWaaGVXqPjkJxEQZai3+kOH8qbdqh1E5x3mC77Dd
	MiB33enSGpw8uRvO9u5oe8o=
X-Google-Smtp-Source: AGHT+IEd6FKDf2LUftPdhsoDiwuk7hY3RyxprWEjQIOiy+tECLHywU9E044swelPCq0F+bD0scVt7w==
X-Received: by 2002:a05:620a:24c:b0:767:4016:29f3 with SMTP id q12-20020a05620a024c00b00767401629f3mr2941226qkn.58.1691782842614;
        Fri, 11 Aug 2023 12:40:42 -0700 (PDT)
Received: from localhost.localdomain ([92.85.190.61])
        by smtp.gmail.com with ESMTPSA id j1-20020ac84f81000000b003ef2db16e72sm1375329qtw.94.2023.08.11.12.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 12:40:42 -0700 (PDT)
From: Andrei Coardos <aboutphysycs@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Cc: samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	rui.zhang@intel.com,
	amitk@kernel.org,
	daniel.lezcano@linaro.org,
	rafael@kernel.org,
	tiny.windzz@gmail.com,
	anarsoul@gmail.com,
	alex@shruggie.ro,
	Andrei Coardos <aboutphysycs@gmail.com>
Subject: [PATCH] thermal: sun8i_thermal: remove unneeded call to platform_set_drvdata()
Date: Fri, 11 Aug 2023 22:40:32 +0300
Message-Id: <20230811194032.4240-1-aboutphysycs@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This function call was found to be unnecessary as there is no equivalent
platform_get_drvdata() call to access the private data of the driver. Also,
the private data is defined in this driver, so there is no risk of it being
accessed outside of this driver file.

Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 195f3c5d0b38..61a2f287ac90 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -489,8 +489,6 @@ static int sun8i_ths_probe(struct platform_device *pdev)
 	if (!tmdev->chip)
 		return -EINVAL;
 
-	platform_set_drvdata(pdev, tmdev);
-
 	ret = sun8i_ths_resource_init(tmdev);
 	if (ret)
 		return ret;
-- 
2.34.1

