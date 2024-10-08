Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA31C1C230D
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Oct 2024 09:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728378032; cv=none; b=eIQJ1+mdRqH3LXoYEgFU+Gn6VVQyFO4DL/dCAM5rDyEL/fnIIP6CRm0Ipt0fUYASq/NenPX22fC280Vo210wvfRk4/Wdb5q/BittAB7FSVrPVQgYheA1oA2jla5Mk/AQhNMerB8wIZvylEoMTLsPEc6NUHqXuIZ+KEMqtK55Ewo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728378032; c=relaxed/simple;
	bh=NAkU7Fk6Fp6cGUBKd+rBMuQ31s4lw/iDzBqC00OUzpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IEYvCBpCBrANqmnC3DGjakHAjaP3TuZKTcZ1j7wX9xXcMo/mhbk/vcg55Jbe5kMyJItKvnoW7yTDY4+6NpkdzbvDiIkKgB++KB66MSkwrpne4njBBKED261xoAvl2JQDzElkhAKBSfhnHByG9kRV9o1zZ1Wg36dShNSB42tbo2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ovvDwSAO; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ovvDwSAO"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c895d975e5so1039435a12.2
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Oct 2024 02:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728378027; x=1728982827; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4oADJGjtlfntgi0z62nuqr2PW+j4MIg/odMBZra4oxk=;
        b=ovvDwSAONVdn92tEgIpe8yu49nf5BtxQzABZSfkGlLKgAaSvNhQe3Pvf3tu02EFeWi
         zQXzSaWxPZDpVDPu7j8RWAXOt2Gx9rkLsKpT72ueQOb+3hTrl0jTCjbbsyBZ+Lix8/uf
         iHGLanyc1rMug/qUDcx7L7Ey57kWZKgpc685H2JiAB2KtxDsIvpyAMltEnyE2fP8G4XK
         b2APAuv1GvNqyllk9/L+SYwhLVNtiXv5lCY5PjI0R7Uvg5d8/cIOOnSwS8chX7+K5HTr
         GxbreBI3AKbF1zJ7wcv9YhYDZ4VONoIK0brAHK0502j8sC0kBPPA+8+AWeCFhwNsYdN3
         qSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728378027; x=1728982827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4oADJGjtlfntgi0z62nuqr2PW+j4MIg/odMBZra4oxk=;
        b=Q/7yfQ3tj9+zY4OME65qoL/yehnVwcPhi7CYzQFiIN6tvZDoRgxNF1gpgMGlQ4fa/t
         uW1oVhdRtB2GV4/Q2ds940WVnmLZFl+C0yBH4aSvBHkfhQm9QxLGFJoMGIrMl03dakNx
         Vip+rsk2wDF+yfXkWgLHbeWeV67LQqcGtdlEun/7h/N8sPU83EXEMEgX+uY+mnNqT7wQ
         ouH8ORARCCndDQqZ0TZnTTug/8zFswI0cHlh2I5C4ngDUX8DArTbBwrdCK419ZNBFt+W
         1Nr5W8GgSTQPQKOXPlUI0Jf+pn1/eOgWhrbQObH9CYLVMuzsPzsLAAS7mG4o8c3iXfIW
         lCbw==
X-Forwarded-Encrypted: i=1; AJvYcCU5Jsr+tP7BqFtgXy6BOQ0FIjOLeafThLU6r9fHEDCju0nDjVGdiWMECpmHtCVXxBwjaOsuKOseDr2S/w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUfCGESBvNTldoqEAxrEF/FokiPGfOX69cnI6uBIamiq2jA4Db
	28WMQ76zoEinsUDghjNDSsEESME25NycyMfBbjDWftImcgWUuT3ITRkq5x0UvC4=
X-Google-Smtp-Source: AGHT+IE4rAwFz4YToK9oIOrST4cNJVzihTb7ARFndMACSf9P5n3oVTiyvIASIpzgE+N85pWnytiblQ==
X-Received: by 2002:a17:907:7d93:b0:a99:4c5e:1b35 with SMTP id a640c23a62f3a-a994c5e1e7fmr375623166b.5.1728378027050;
        Tue, 08 Oct 2024 02:00:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a994e6e571asm294701166b.85.2024.10.08.02.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 02:00:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Oct 2024 11:00:05 +0200
Subject: [PATCH v3 5/6] thermal: tegra: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-b4-cleanup-h-of-node-put-thermal-v3-5-825122398f71@linaro.org>
References: <20241008-b4-cleanup-h-of-node-put-thermal-v3-0-825122398f71@linaro.org>
In-Reply-To: <20241008-b4-cleanup-h-of-node-put-thermal-v3-0-825122398f71@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Chen-Yu Tsai <wenst@chromium.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1416;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NAkU7Fk6Fp6cGUBKd+rBMuQ31s4lw/iDzBqC00OUzpk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnBPSeZwtVtveYq+plqJz96zA+Pl5Z10FmeGEoL
 z8/CK2Td3iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZwT0ngAKCRDBN2bmhouD
 19neEACPde0mZ3s9xDglnBk+mwX4fYnnR8YXiTLCvHtDoaID2MYCaS1/7liq1DK0w5ky95SVDfC
 lhNAjEEg7PICNBWpbcaGN3HmTqAJnBzqG48JxxPY0aL+0O+v0gYouUOg2Fen2+Bkx6Ww9dqoc/o
 b/ssg3PXLBrlIKvnr9TQG/a7R6ScWMInk9hROjjqa0wa8Qgf5Nod5OjDOj8eSlYZGYArRuQuJIK
 GxjDjXBjyuocDsS3gIwACdpad6Xq73fRnCHa+daqvzPkXTdoDvxne0pji/O3SWOc1XaPef4jZor
 VnhZx60VBfpe9mUu/SKskmb6eJTHMliR3VOd+z2rd35fEj9Ld+ZoMgqvgtYfMKppDfAIsY/nOEM
 j4Ty7gK+pfvlzClxwec9I1SfuS7u/iw/7b4bUof+NiTQfWVpq7JIhj0JID599K1sONd3KYR+n7l
 YV8obDRv68tTDgCgJHUPHLvfEb/CvDlbFrV+z8SBKni5bAVd559zQCMMkxIZZMmprhEwz5FhmxS
 q+dmqM084LYIbThZnZFUZNttvJQ24ILNvNBs5iesW3E2cs+WAMBNbITWDWQX7T8Upr14tH5bTHn
 XOW2R3O5u9gZoaGdC9yXwGMPr88H0hXRJKbpoPpxsjoRD5GG+jyzcePviq2TNoxErvhTmh8Vkmd
 VnXeFrorXAr9TYg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/tegra/soctherm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
index a023c948afbddd6d9fc1a00b2fe310c71147bda9..ff4eedb553fb6e78c94b714dd179193c244b6589 100644
--- a/drivers/thermal/tegra/soctherm.c
+++ b/drivers/thermal/tegra/soctherm.c
@@ -1651,7 +1651,7 @@ static void soctherm_init_hw_throt_cdev(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct tegra_soctherm *ts = dev_get_drvdata(dev);
-	struct device_node *np_stc, *np_stcc;
+	struct device_node *np_stc;
 	const char *name;
 	int i;
 
@@ -1668,7 +1668,7 @@ static void soctherm_init_hw_throt_cdev(struct platform_device *pdev)
 		return;
 	}
 
-	for_each_child_of_node(np_stc, np_stcc) {
+	for_each_child_of_node_scoped(np_stc, np_stcc) {
 		struct soctherm_throt_cfg *stc;
 		struct thermal_cooling_device *tcd;
 		int err;
@@ -1683,7 +1683,6 @@ static void soctherm_init_hw_throt_cdev(struct platform_device *pdev)
 
 		if (stc->init) {
 			dev_err(dev, "throttle-cfg: %s: redefined!\n", name);
-			of_node_put(np_stcc);
 			break;
 		}
 

-- 
2.43.0

