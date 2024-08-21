Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBD217B4FF
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Aug 2024 21:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724277455; cv=none; b=FSEYQ8Sk/7DsxoxATamWoCOUGoE1JKawpuzHQF7eeEUhko+R/2X8Va45IiN26zozn85lHk2ScOAWGf7c0VaW6sxiGI4zEiPJooezjmLIAEGGsILXuSzH0kxbaJV1V0i8Uzf+RQJRwteigpHfsuikajdu44RhLpO3srfAIyVo6Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724277455; c=relaxed/simple;
	bh=xtbe2GE0kxv3PLdvqMIaX8WjPceiFQkO5WY5kWSV1ig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P8bCf0ymK5aCuaDCV0U2btjR8CHzsFjWGwlWVCgS67nLy5syxkMoa1d5xHSIkEs0sX3OZlcpfEqO7EaywP+8OsHx+P9FEYdqFpKAyntV2yCJ83/T3rx6kLKINTCn0AMGJVR/KQiGmX25LEjyf3ubyj0gwCpe/zzx8XSUzRyOsaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E33WfXjV; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E33WfXjV"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3db23a608eeso95277b6e.1
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Aug 2024 14:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724277453; x=1724882253; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGxHVYptl/mfZ5O11htImf9Dey/T9TeFYQkFJXrtkIg=;
        b=E33WfXjVtJjm+maD1QFvzqWalMopZNOlouXKfMEm7oEQDfjVvltlVGFpuZcBHtoV4D
         Klq/NsHbIBC/I3ULTUek0raU0nXHYwzE72jwMKowekE5szArT1EyYNHnqEWBLBE0AIS2
         LcyhQxdvh40zJQmwNr3nwN4DKl6s06ABMngyeWMWd0o0I1Y82MEe9nkASiLIgEVTesVZ
         J6fKF9lI+M+rBX/WOjiSg7JprAzOIHEewKGK+SsP62EwIiG2Mz2TYEytd4minfIuE9bq
         CEDEnY9yso/f7THtcD1vjyZXV77pof6ZEuSFATjIGmKLItK8P2MVjmYI3jYDz06bCez9
         yvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724277453; x=1724882253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QGxHVYptl/mfZ5O11htImf9Dey/T9TeFYQkFJXrtkIg=;
        b=t7AATqUjXwQeK7PZINCLN5m3CuL33V1MOAowKjCLL8yqENTqbUNQrbM38eXqJ9Ls+X
         JQjVcwpb0uUbrB+mFmXgo+jipC9z4mPj8NBDnJriiXnHz71xofCxKq5yiWYJ7cryYDRP
         yqfi//BuLvdq/49PzOEr3Ixh4NYmmk9hSJEc8P+Yk1XAMs2iHhJ4Q6FZIYs+D1XabFU1
         syhSFUK1LH0bFBy5FOCbHx46j4Hz5OGFp8QdmHy28nCj3AIS2JYlAGr+bAYDwLoLFXW2
         Zj9XAxwGdgIPrMWcZFwWHOQ4cDyX/nnoEC4SLQAL/XAYfEVERdg18k5N6S2MzhG73GSW
         V8Hg==
X-Gm-Message-State: AOJu0YzkMY5+f1lONYd0J6AFIPm0R8nA9xkicTH2sFhmnZle6BTvf5ax
	leN1R+o4eG2x2oikokIfuzNKwCWDm2EjqlA5DTyyA+l7DoqrQtB3ow7Etg==
X-Google-Smtp-Source: AGHT+IEEVh05GQZqcfbn4IDKx4nQgV7t9q/7T+7lh7gib4DsRCbvqlfs8kaWytyaNhMT/Lx2z5jZKg==
X-Received: by 2002:a05:6808:2f08:b0:3de:220c:ace2 with SMTP id 5614622812f47-3de220cae0amr601913b6e.14.1724277452915;
        Wed, 21 Aug 2024 14:57:32 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:81a9:2325:e0f7:7376])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3de225555b6sm47070b6e.17.2024.08.21.14.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 14:57:32 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	quentin.schulz@free-electrons.com,
	mripard@kernel.org,
	tgamblin@baylibre.com,
	aidanmacdonald.0x0@gmail.com,
	u.kleine-koenig@pengutronix.de,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	sre@kernel.org,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	lars@metafoo.de,
	jic23@kernel.org,
	jonathan.cameron@huawei.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V4 05/15] dt-bindings: power: supply: axp20x: Add input-current-limit-microamp
Date: Wed, 21 Aug 2024 16:54:46 -0500
Message-Id: <20240821215456.962564-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240821215456.962564-1-macroalpha82@gmail.com>
References: <20240821215456.962564-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Allow specifying a hard limit of the maximum input current. Some PMICs
such as the AXP717 can pull up to 3.25A, so allow a value to be
specified that clamps this in the event the hardware is not designed
for it.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../x-powers,axp20x-usb-power-supply.yaml     | 58 ++++++++++++++++++-
 1 file changed, 55 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
index 34b7959d6772..ab24ebf2852f 100644
--- a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
+++ b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
@@ -15,9 +15,6 @@ maintainers:
   - Chen-Yu Tsai <wens@csie.org>
   - Sebastian Reichel <sre@kernel.org>
 
-allOf:
-  - $ref: power-supply.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -31,8 +28,63 @@ properties:
           - const: x-powers,axp803-usb-power-supply
           - const: x-powers,axp813-usb-power-supply
 
+  input-current-limit-microamp:
+    description:
+      Optional value to clamp the maximum input current limit to for
+      the device. If omitted, the programmed value from the EFUSE will
+      be used.
+    minimum: 100000
+    maximum: 4000000
 
 required:
   - compatible
 
+allOf:
+  - $ref: power-supply.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - x-powers,axp192-usb-power-supply
+    then:
+      properties:
+        input-current-limit-microamp:
+          enum: [100000, 500000]
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - x-powers,axp202-usb-power-supply
+              - x-powers,axp223-usb-power-supply
+    then:
+      properties:
+        input-current-limit-microamp:
+          enum: [100000, 500000, 900000]
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - x-powers,axp221-usb-power-supply
+    then:
+      properties:
+        input-current-limit-microamp:
+          enum: [500000, 900000]
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - x-powers,axp813-usb-power-supply
+    then:
+      properties:
+        input-current-limit-microamp:
+          enum: [100000, 500000, 900000, 1500000, 2000000, 2500000,
+                 3000000, 3500000, 4000000]
+
 additionalProperties: false
-- 
2.34.1

