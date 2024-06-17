Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA3F196C86
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Jun 2024 22:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718661964; cv=none; b=iVGNaCqUEmP1v/xAKf//45EEW2WecEwwbA9Fvxx/fV1DLB+tpvOnCXTagxpRj+o9uspowEtEBTdXxxoxMNtHoFM0PSyV+B9VEhSvVmqN7Ke9SLR4LCUsUba8dRN8/5vxdqfziOBm0J9Uf5uAI+U64SFNsn8Jy7nMG/sr3Bm6ESk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718661964; c=relaxed/simple;
	bh=g7SK16z3EUsEncjRhzlqTX6KiMzpqs0fmUG3VteIg2A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=klymEcZ5vjGej0uBIC3YT3BRJF5faaJxW2JANOcGk9bIKV6Vgtdikr0864dp+9mDlMBnkIyyqvwmDx+erUON25fhQz1sdzODUTuFKnSHaXSr8xW9KuAcNAfnb96JGSvaVAjaMu98jeiSlZG5zNQi58hp+6ljdL5bh/Yf1TKxNWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZIOBE6B; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZIOBE6B"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-24c9f73ccaaso2793740fac.1
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Jun 2024 15:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718661962; x=1719266762; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJEcEGbw3swKdFCLUtr2n8Y6Tlc0pU3Bhk1KNMQfJkk=;
        b=SZIOBE6BDg5332uOz+BGOiTMQLmHJddV8o+B/l0MoOh3SQRjjMJh1y+Hm/hewRn/eC
         cwWGWpBQFmMu42dlm4Ylvh4UYlBBrypgv4VdvhpU8U8TONlXCZigt8a+lRfJX8KuXHi4
         VVJOl/RAuuq9Sc5O/+nlAQAQbOimxdTUHH4dPa7Qhn3e29x114EKRLvTilpBMfa1mrOw
         o+rw6PokKwGnBOlpVH3ljAWYqk/N2hWNPWEnjRm796mS6KoBeYobA+oUVf3gt+l+03g+
         wBjzJ+fNOLRrhn8ezTutvoIZK4+403zziGxUbtxqyGbYF77Bb0rfX+FeCVlnop6lFQ2q
         TlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718661962; x=1719266762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJEcEGbw3swKdFCLUtr2n8Y6Tlc0pU3Bhk1KNMQfJkk=;
        b=QoIQWPSiV8Wf3MNGVz2bmL0xslx71h1GMFjL724By2FISuG5YsFxl5Hsbv9PWgnEK6
         gW6GHXJjJZk6QB4TBOXMVUN3rh6vNQH7eQzPuSqEFKrou3ZRGbuJdk1eMHxwMc6kJ07U
         8QGvg+QK9iwQMWPeqdt2yFwE9LQzzpAl/aK73P5IV0NTtVRRP2nqqNSSvER05m+Ybm5a
         YsWycwrmMw0UVxrRXWwQkV8jZukDZ0kwoFO/DE//XJpYoVxZUbEMO8cmWn9lu5gkF7ik
         vBYeiWkUgm+IPgIUHq5wVhhdNzunPSajzWW00VL5kiaWR9qPhozT+TDUNvi240PDKNlx
         inmw==
X-Gm-Message-State: AOJu0YyoAHFUjnjDYa42EMyaivkLvItKqyiAfhyOROPMkQdS057EQaVS
	y5X9LUckTYMg/a5mscr1douxZUUcAuT+DKQuESRcyazGNjEE56ihdRlLyg==
X-Google-Smtp-Source: AGHT+IF3ufe30O8vIgO/leV+i/sjcoIYX8wYXPEpQkLumyd/BX/GT/GpBoDit9t8oWl6BJ+tvkaNBw==
X-Received: by 2002:a05:6870:b618:b0:254:c617:a9a0 with SMTP id 586e51a60fabf-25842c137e7mr13481515fac.50.1718661962037;
        Mon, 17 Jun 2024 15:06:02 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6fb5b1b0fa8sm1664232a34.28.2024.06.17.15.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 15:06:01 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	broonie@kernel.org,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	sre@kernel.org,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	lars@metafoo.de,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/8] power: supply: axp20x_usb_power: Add support for AXP717
Date: Mon, 17 Jun 2024 17:05:29 -0500
Message-Id: <20240617220535.359021-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617220535.359021-1-macroalpha82@gmail.com>
References: <20240617220535.359021-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the AXP717. It has BC 1.2 detection like the AXP813
and uses ADC channels like all other AXP devices, but otherwise is
very different requiring new registers for most functions.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../power/supply/x-powers,axp20x-usb-power-supply.yaml      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
index 34b7959d6772..e5879c85c9a3 100644
--- a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
+++ b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
@@ -26,11 +26,17 @@ properties:
           - x-powers,axp202-usb-power-supply
           - x-powers,axp221-usb-power-supply
           - x-powers,axp223-usb-power-supply
+          - x-powers,axp717-usb-power-supply
           - x-powers,axp813-usb-power-supply
       - items:
           - const: x-powers,axp803-usb-power-supply
           - const: x-powers,axp813-usb-power-supply
 
+  input-current-limit-microamp:
+    description:
+      Optional value to clamp the maximum input current limit to for
+      the device. The supported min and max values will vary based on
+      the PMIC revision, consult the datasheet for supported values.
 
 required:
   - compatible
-- 
2.34.1

