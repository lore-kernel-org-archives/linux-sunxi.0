Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6E51547FD
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Aug 2024 19:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722626576; cv=none; b=jWGquGa/jDdPuQgQ401UOlGJSRXBu5jwJGhZgCDwcrXYB53RpJYr4QRXcje7TYWIQg3n49MlY41A0n7sHlWZ15Z/ibOtq5z+OLi93MPK98LNyLQvMOS4fCFtoKMBU7cmDEhm6YvOHI1lRf3Lg1Nia5dfazrxwAY8B3sO7syaYQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722626576; c=relaxed/simple;
	bh=CwabAuQrozbIc2WF23RTg7OF1MIHY7LWz/n7DhKVozA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BXFa9vpIRSgUjQ2RiFn96us5m6MAUaWmzr3X9Up3yYJaNV/wIyq7HCbhREIYjUgIqGP74A3uLa//haTMZFJTlD1bvi0BR5zb7Q8ZUp42D74t7Uukj4VJylKuoo4GJ7b4CeBLnfPbl/nkdLrVokXAaIE+7BF1X4gvSN92RW3icV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nl+JchNo; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nl+JchNo"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3db1eb76702so5454142b6e.0
        for <linux-sunxi@lists.linux.dev>; Fri, 02 Aug 2024 12:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722626574; x=1723231374; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKF6Zi/1m6aLjcN04yV3BkCZRPPdlRv2r0+D/Gsd088=;
        b=nl+JchNoe228ruRQXRuu0ScmhjSOfMXMaMbl4z6qnPhnXzcCwkNoOHQFKMLLAfXqvM
         rOdF8iIXh6gbV/ZCARrkK1D83CSaDrB+dOTwdh82GokE6EnVAaQeJE11XUEho7WdvqsZ
         Kr/13acQTRBjCIzklsuqdfEYgYGseoZ2y9IJGIoA65068BVjwWpnXHm6r3WA2uDgvKjS
         5DCICS1yNq8wce6/tjUG4B+7kmMv3wp3epo63oq3+CsAXVfyB647Gc3+veQOPozxDwqk
         7BGgRw+Tzk8K5gSyPqHG/Yn3TOVuJZjINrE2XZc7OFC4vZpMJIbaPAkI48Cj19s1cNTL
         /Maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722626574; x=1723231374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aKF6Zi/1m6aLjcN04yV3BkCZRPPdlRv2r0+D/Gsd088=;
        b=qfwD0dL7UIxRMmnK10GnZHrJV3+PrfReHK8oJ1LCFkPv+kYiKw+8NU3+HMeN1WnQrg
         eXXdIukLsh+8Qn2G5ur1VprC95OkZgoJF9qv69jCR9Z5B1cT+9sOOfO+e3zY0JJ7S8W8
         Ssv8+PbfxOEwQcJH1r3LwZxMivPUhy/4qRbk5z4OT1BHCIM1N6qPPoKDhRaAwEiUV4S7
         m6KFRjj25U1VUtH4QDeVXN+DfgKD/5x8qnKEZCly3SUB36QE18SycwMZvzficzm/y4Pg
         YuSgRop20WEAfudYawdzdgc05exRcR4mucIK3qVrgHxGTYlsGbNEBjMYAj8IHwwfh+9W
         r3GA==
X-Gm-Message-State: AOJu0YwOT6nA3KFQG0PKl6UJubC62l7fPkolxy/cZfUvemh7CxMQ86V7
	5QRfj+KgaaeYspQsHNxodLCSohtxav3Ov3G6re/ys9VO0rtQq9R6DuoK7g==
X-Google-Smtp-Source: AGHT+IH1wc5hz1GvQtj4riUZkn6QJtAKThKL3VwHHxx5uvWODtXToZinS1qoo41MQ31LwphZAMvO6w==
X-Received: by 2002:a05:6808:3094:b0:3d5:802c:9056 with SMTP id 5614622812f47-3db557fded5mr5335578b6e.2.1722626574006;
        Fri, 02 Aug 2024 12:22:54 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3db563b7065sm584592b6e.46.2024.08.02.12.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 12:22:53 -0700 (PDT)
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
Subject: [PATCH V2 05/15] dt-bindings: power: supply: axp20x: Add input-current-limit-microamp
Date: Fri,  2 Aug 2024 14:20:16 -0500
Message-Id: <20240802192026.446344-6-macroalpha82@gmail.com>
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

Allow specifying a hard limit of the maximum input current. Some PMICs
such as the AXP717 can pull up to 3.25A, so allow a value to be
specified that clamps this in the event the hardware is not designed
for it.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../power/supply/x-powers,axp20x-usb-power-supply.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
index 34b7959d6772..903e0bac24a0 100644
--- a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
+++ b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-usb-power-supply.yaml
@@ -31,6 +31,11 @@ properties:
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

