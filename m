Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B73486B8C
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 10:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161090; cv=none; b=nwfuCsUJQ6igaQp+I1iGssnRc+awNq3syQGl6FmFSieutwB9PdpbowoUpbv89+/HJGyMojhOuBvmpJVr5mb6FSguARTcwYvq61xFItwb4JvyVutBY901LbSoE5KHvFX4kmgl9pi2e6N9yWrRcfZ55qFwPVpCGBnLBqRXxn1XL0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161090; c=relaxed/simple;
	bh=rS2E/4MHN8oX+wH7iWFSabQRKWvtT5oxQlLidA08taQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b0KZ9a47c1v3IzTnZ5Cw3VhTg0tU0Lopa1ieJxAN/0UA8fSf/j0JUQgEMWY6LNH6zC+0w/5CMWWO6fAIci87sMoikL/8zDkBoZs97r+vteNBBOOuqkHDAwjAHpKANHOurLtZKPxDnD6ryuJ1hmLYPc9wtpEqUWhpmI8nM00+Kjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEDCcSPj; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEDCcSPj"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b79so646053e87.1
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 03:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790161081; x=1790765881; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/cw8tLIDAcANE0rBxwCaZOdt393QPndtVfDmqg3iEZo=;
        b=hEDCcSPjqaggwAYgwfKMjfKNCKI7fMpSTBpJfMOCN8GTx79hyADk65ZMQh4+hjF0Hm
         OAH2gWYCntSVIASNJWe7y1FXD5yyE98pNKpcf1nhbCAh9kp0h5kjRTxAf4fFy8ryBrKJ
         +nLKZy8fU2BnLNJLr3zNogPirT91QjicxUxnj7e2HU7Ki2XwXP9lAH4PFhtxPDQ8UMJc
         0NzYvLPWlYnBsZBLQt/rJHD/1XUOd2k39qv2h5t7nl6z+erSobZ3tI/6yoXbQAAMuDbI
         I4j4RIuNNxCOYw+486VX/q8Dzsgs50BZaHz/oIa0xhgIy3Wss22pDMCujx3dTJ4/n0V8
         S/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161081; x=1790765881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/cw8tLIDAcANE0rBxwCaZOdt393QPndtVfDmqg3iEZo=;
        b=0Gw+eFp5hefduTchHgA48qAjmRzxjV9qjkYk1j6rltfndfdpKU/IzVKwDtZ6IJAMEr
         t2DmIA7HL3JnHifK/5b9dFQKdrdQu12majXRyDKmKXOTZvuTBEuZd6IQL3DoKpCAT+KA
         XkT6gtr7yOB93CoCtxf6r0VVY7fHudcVzJW7qY2JlHUYZcdfd0GL6qgHvFmFP8mcgsgq
         WYNxJxPW8Wj0zDUG4XL9nzB0TGadDVKowEjcvg/z7D+VKyTlpL6HO+On0XhfeCZVSjPR
         bVnfuTmEvnI+9AXRgju+C81+eszsTUQ+F73x6HSjDDe8XA2VDaleAvIp89nl0VtVDfKW
         ik7A==
X-Forwarded-Encrypted: i=1; AKwUvBwSnF6+KHIK/2SxgZbbZQdmTphaA1F3GDHKwVv0i1RBxFm4BnLEaaSitHkz/2xWOI9jbbV2CUUDDuqwDQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lpwnhzT37zBQff0ftuGTog5T1phTyXj1a+zOSHzNoFZFvZT4PY
	G8J+pDiNJ86t2Qoea1sC6lqizK8a7fHULoA75ZBlUR/oW3cN/v5gFqODZkQLfLl3JbkfFg==
X-Gm-Gg: AYBFou0FsUdN39rslG43J2dWPwo75iWDTN/TTwPqgpOudt2F7qAzO6Imz9TzZUQJcXl
	x1HncF8yVC1eEhKscJIBGAl77jMOucQ3g7FZzoY7GzLp4StQ4eFGUh+0stki7Cw1ltKGD9clWN0
	PjuiHu/zfpwtYKFzJ1T0Q+o/jfjTXgIUor6SdC+YVQYUMOTa37S+TL4vYJ9aZ/92RWPoAfsipJm
	1ZvEby01NNuFWKp7IvU+orqX9N9sQqDSy3iljzG8jxHnvCLkv1GZogvQU9MplYSgXndDWwRRCMR
	cdz4AY+jWvx+jFnvWdlwK4efluYfrZSdpFCzTI1HfJqcxGH4HMYaAqN8OjuOIx7Lm01rlYlPJzD
	AMU0JZY+4JGBJ5Wm1oJIctDMvGZad/kP+40L+ghMHRwy4dxmfPL1IQmZKMpuDeLcIOL+xn3xo9a
	ApxtL9pAdi9NW/eBqzWcNN2ZUy4R+Rq6DCVJgc5753en7rfrTTdpQDD3mVv47fKysIJfAQ/aEU+
	Ce3jX4qzaDQSC9yBqo=
X-Received: by 2002:a05:6512:318d:b0:5b8:bc5e:b580 with SMTP id 2adb3069b0e04-5b8d89c111dmr839870e87.56.1790161080622;
        Wed, 23 Sep 2026 03:58:00 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d858ef85sm499606e87.62.2026.09.23.03.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:58:00 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-input@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Vladimir <anykey196@gmail.com>
Subject: [PATCH] Input: axp20x-pek - add AXP313a support
Date: Wed, 23 Sep 2026 15:57:57 +0500
Message-ID: <20260923105757.260-1-anykey196@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AXP313a MFD driver registers its power button cell as "axp313a-pek",
but the axp20x-pek platform id table only matches "axp20x-pek" and
"axp221-pek". The power button therefore never probes on boards using the
AXP313a PMIC (e.g. the OrangePi Zero 2W).

Add the missing id table entry. The register layout used by the driver
matches the AXP313a, so the generic axp20x_info is reused.

Tested on: OrangePi Zero 2W (Allwinner H618 + AXP313a), kernel 7.1.13.

Signed-off-by: Vladimir <anykey196@gmail.com>
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

