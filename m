Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AFE17F394
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Oct 2024 07:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729236711; cv=none; b=t29IeQQU0LH2bOUwCdl+n+MsX19vUFjpC0nOVCLwL9VzxDNEellTjOrEyubP7cGU2/d4S0HxLpuocljfkZR1McOjjTMoZtSN89zFBJ5GoqP4vtNaDK78TIYg3GkC9+N5XUH0msy8lbXrGEJTwp/sQVu5vbU47avbjoqpU5A9ZzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729236711; c=relaxed/simple;
	bh=NH+L9Jxf2wkMM71Yi6LYSc5pR0cezzW0842zQcofwrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sudhNhzjJ+51Fg+UX1+SAWwVwohJBeI3JF1vjEFaEk6n3an7pngIiOEceTP5gOFNW3EyhVC4p6ZW1Smf4y3mbnKALZ80kXcKon9fQhquCnwbPPfzCVU6HzzeRbq06uPf7PijljR6suzdiozVywn9OM2DKGGP9XnS217Ckb9yHJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fltur/tE; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fltur/tE"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7e9fd82f1a5so1210409a12.1
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Oct 2024 00:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729236708; x=1729841508; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IlPybqmG9m/ZAU4ubVutLFbdpffPKHkEonNeryEzP1o=;
        b=fltur/tEjjD5iwLL/5e2lV1Jq3tHVglkpT6d6fMNbI5rjCDzq2mreZWk1Z8ZrwHrgG
         c6mdjYqKnIfIGgUTTqHZXmumgKVlK6qrWa3zp6GvgJ47nW6WmMyLmG47PS9PSLQ1/TPj
         aSOu/H6KOyU+qElD/1xQ46WpaPBeZ6tmJ+838=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729236708; x=1729841508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IlPybqmG9m/ZAU4ubVutLFbdpffPKHkEonNeryEzP1o=;
        b=ivmYrveQLYBEA+07QDn7c+dYg5c5cocGN9NwD2xrAVXCAdEhm0PfsFoypEtzmeX9RB
         JWtxnGOrvPjcxlsmI+MDxx85596RDNmguhM6vSdQtM2MayjDA7BBFfPMooknfohEjNvC
         7sn3TvXBhBb1ePp21RscZkawV2ZFHGI6/4+8kqMIHiuoTK7RfJBGV5Dv3HjF7wUqUWTK
         h7lF8xZW94uy+WDJNpM5Xo5zpunm2QiVfXk0KrMx0JD3v8nhP9mFnnAMoSf3UD16u2qT
         qQZ1iZtXw9ZpHn3l8iF90utcGXsEjPcyCxh1vwMK9Xa7grPwZVu+z++tGAyYfWB3iGP2
         MRnw==
X-Forwarded-Encrypted: i=1; AJvYcCUpKkntNlhpYG0/7TWQxf+EvWrQCZ6on/z8akopqjdb0ONGpFq3Dp8gC1CDP3MR2XzG/0ND8xwRkzY65Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx48VNqU+RPSYZ3wEaFHzjKfIgP75ljHk7K83hZQ3pMTsgceEZY
	/7hlbdHDUKdUeCWu2EVzPJjuD2cDjCu68i8Y54KejnQQjirFeQ+1nXtWK1PO7w==
X-Google-Smtp-Source: AGHT+IHLIrR9ytIHJoh0tpY7PloSKaVtl6gokdxvrnHnBae8s/7gjJhQ59rft77DxeV3cTP3OmeRAA==
X-Received: by 2002:a05:6a21:70c8:b0:1d9:575:6659 with SMTP id adf61e73a8af0-1d92c58fa40mr2750256637.49.1729236708639;
        Fri, 18 Oct 2024 00:31:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5e77:354e:2385:7baa])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eacc229a7dsm745320a12.20.2024.10.18.00.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 00:31:48 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	Mark Brown <broonie@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v4] thermal/of: support thermal zones w/o trips subnode
Date: Fri, 18 Oct 2024 15:31:36 +0800
Message-ID: <20241018073139.1268995-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Icenowy Zheng <uwu@icenowy.me>

Although the current device tree binding of thermal zones require the
trips subnode, the binding in kernel v5.15 does not require it, and many
device trees shipped with the kernel, for example,
allwinner/sun50i-a64.dtsi and mediatek/mt8183-kukui.dtsi in ARM64, still
comply to the old binding and contain no trips subnode.

Allow the code to successfully register thermal zones w/o trips subnode
for DT binding compatibility now.

Furtherly, the inconsistency between DTs and bindings should be resolved
by either adding empty trips subnode or dropping the trips subnode
requirement.

Fixes: d0c75fa2c17f ("thermal/of: Initialize trip points separately")
Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
[wenst@chromium.org: Reworked logic and kernel log messages]
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This patch is based on Krzysztof's cleanup patches
  - thermal: of: Use scoped memory and OF handling to simplify thermal_of_trips_init() [1]

Changes since v3:
  - Set *ntrips = 0 and return NULL from thermal_of_trips_init() if
    no trip points are found in the device tree (Rafael)
  - Dropped log level of "no trip points found" message to INFO
  - Reworded new "failed to find trip points" message to "no trip points
    found"
  - Reworded existing "failed to find trip points" message to "failed to
    parse trip points"

I dropped Mark's reviewed-by because of the new changes.

Changes since v2:
- Stacked on top of Krzysztof's cleanup patches
  - thermal: of: Use scoped memory and OF handling to simplify thermal_of_trips_init() [1]
- Adjusted to account for eliminated error path

[1] https://lore.kernel.org/all/20241010-b4-cleanup-h-of-node-put-thermal-v4-2-bfbe29ad81f4@linaro.org/

Changes since v1:
- set *ntrips at beginning of thermal_of_trips_init()
- Keep goto out_of_node_put in of_get_child_count(trips) == 0 branch
- Check return value of thermal_of_trips_init(), if it is -ENXIO, print
  warning and clear |trips| pointer
- Drop |mask| change, as the variable was removed

---
 drivers/thermal/thermal_of.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 93f7c6f8d06d..abafce22c91f 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -99,14 +99,16 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
 
 	struct device_node *trips __free(device_node) = of_get_child_by_name(np, "trips");
 	if (!trips) {
-		pr_err("Failed to find 'trips' node\n");
-		return ERR_PTR(-EINVAL);
+		pr_debug("Failed to find 'trips' node\n");
+		*ntrips = 0;
+		return NULL;
 	}
 
 	count = of_get_child_count(trips);
 	if (!count) {
-		pr_err("No trip point defined\n");
-		return ERR_PTR(-EINVAL);
+		pr_debug("No trip point defined\n");
+		*ntrips = 0;
+		return NULL;
 	}
 
 	struct thermal_trip *tt __free(kfree) = kzalloc(sizeof(*tt) * count, GFP_KERNEL);
@@ -386,11 +388,14 @@ static struct thermal_zone_device *thermal_of_zone_register(struct device_node *
 
 	trips = thermal_of_trips_init(np, &ntrips);
 	if (IS_ERR(trips)) {
-		pr_err("Failed to find trip points for %pOFn id=%d\n", sensor, id);
+		pr_err("Failed to parse trip points for %pOFn id=%d\n", sensor, id);
 		ret = PTR_ERR(trips);
 		goto out_of_node_put;
 	}
 
+	if (!trips)
+		pr_info("No trip points found for %pOFn id=%d\n", sensor, id);
+
 	ret = thermal_of_monitor_init(np, &delay, &pdelay);
 	if (ret) {
 		pr_err("Failed to initialize monitoring delays from %pOFn\n", np);
-- 
2.47.0.rc1.288.g06298d1525-goog

