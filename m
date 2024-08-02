Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F47B165F0C
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Aug 2024 19:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722626578; cv=none; b=I437D+7TSUGbLJvugK5gW5mmBBYgbbfP/9Pi+PTeIDFtUFvAIm7RI/Y1uFKijCu66L3y44hzGjKv8qQukcx/5vOGsGswtye3M//QE6tnWYcYEGEpGPva9a8IYhTlFl30h1p2scISYR32HOAKWHZQUpbdbNIdcHfK//cR6/2L/II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722626578; c=relaxed/simple;
	bh=4y5dka9Ir5lnHkbs38KhflB8tgwWZxeU5OvpvbN1pks=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ulyQOOdD3HwHChJFuZK10ay0htC0KlnY+z2QeSHNpUP6VPIjsDHQ4LNCTXE8hrBWdV9JG+kS/iDBJWdiTY/fi6jZKrvOhySbRKZ4sFWty1nOXHW0yyzgsgKFQJGveEdexNKh0PaIhpwom6geSSM5829IhRWLpKrLuTBYIOc9zAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SyhV53Bu; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SyhV53Bu"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3db1bc36bc2so1730077b6e.0
        for <linux-sunxi@lists.linux.dev>; Fri, 02 Aug 2024 12:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722626576; x=1723231376; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOyuQfbILcMGTmLZPccNjk0siFr1lyw/4cIfSrAVrWo=;
        b=SyhV53BuwlsH+xd9d731C7ENSh+OMV2a7ZvO442Wn4nmbVubgB7CcLxh9gPnBhT23N
         9LlkucRuxMA4i5ZHliqNk8fFRI6QMNkdgoouAHxTaX43Y8Kqri6ltUvYt7P87kzuoXoG
         UxES6JTGtY0N7sImiM/k50XHlbZMtLJPvFO3Avm0nUwRvwP5VE/nUuLx9w0Cc6rOpSO8
         2qBlSLLjO0Ei1B0voV/PBxyvEL/pBTYJtWjn3hMr0lg2gvJ+EbKGIXhbr1WEHGU7pBnX
         elCB1yxpHfrWt7Lu8P7GnmglEwVE3tJLGCzJFGzQOSEHa9DRM2ftTo5I+qrVChN43us6
         FvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722626576; x=1723231376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TOyuQfbILcMGTmLZPccNjk0siFr1lyw/4cIfSrAVrWo=;
        b=ggGTsAVBm6z7QQwn5DraFqUkRuuhUeb7uQv92Kl3BxlUHaCP29bWZD3VXA4Hy84hdE
         FwIgLuIeArPYVA3MhBl+NEhlJp0YtXJCMu8UXGLFmMVYm1qwL6/3Rt0syHfRX2SkMivp
         lU+g0rXTkJXEiQQ0noNSHK5rKWDF4ASbMFNdjjCpNA5qJZm17Wn58JQuPmJGqtgfLLm5
         jEKDnoqfldlz3v+89/MWrvP6EMn5DBxC0//NBMt5PcG/UjTKpbl6fYXIOU9fQq084BiX
         YAsI8DLKp60LkFUuijjMjVQeN/oTJH+XvHxmD0Mr0BqfqABOpj1+GHcxGtuNRwsbuAG1
         01EQ==
X-Gm-Message-State: AOJu0YyLlhfe6VsZ1Uh/6YGq4PUKbnhX9L7s57YomSZaudyhZZHmGcmA
	505Usj+7wqqLOnHkKDaeY9oPlzctGnYQE07HJTfXPcPGcH4mSocZjzMBeg==
X-Google-Smtp-Source: AGHT+IFxPdAe/2YdHaq99lURfivc8IRArlYVgwZnu48DQyuvdfvclsbedQRdAd0XWC+Tjce6SDTJNQ==
X-Received: by 2002:a05:6808:1304:b0:3d5:6529:bea0 with SMTP id 5614622812f47-3db537d3682mr2277502b6e.6.1722626575664;
        Fri, 02 Aug 2024 12:22:55 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3db563b7065sm584592b6e.46.2024.08.02.12.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 12:22:55 -0700 (PDT)
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
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 07/15] dt-bindings: power: supply: axp20x-battery: Add monitored-battery
Date: Fri,  2 Aug 2024 14:20:18 -0500
Message-Id: <20240802192026.446344-8-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240802192026.446344-1-macroalpha82@gmail.com>
References: <20240802192026.446344-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Document the monitored-battery property, which the existing driver can
use to set certain properties.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../power/supply/x-powers,axp20x-battery-power-supply.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
index e0b95ecbbebd..f196bf70b248 100644
--- a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
+++ b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
@@ -28,6 +28,12 @@ properties:
           - const: x-powers,axp813-battery-power-supply
       - const: x-powers,axp813-battery-power-supply
 
+  monitored-battery:
+    description:
+      Specifies the phandle of an optional simple-battery connected to
+      this gauge.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
 required:
   - compatible
 
-- 
2.34.1

