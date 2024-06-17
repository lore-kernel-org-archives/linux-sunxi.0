Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56A1199386
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Jun 2024 22:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718661965; cv=none; b=ZcCaVzQWBa9S2lJbz2K17DUeb1Ju/81XXDDU7F0UcbpaX1V2BnIniV5yFhGU21JBFHnKx0VUBnDL8U/w+04kfm3OwSjba6srvxX1bZuuVS9YrW2YItrtt2Ek6aUjKhXLfe9cm/UiyNecPTSvEgdTlUBUcBHSfMKzQBaFiDLKoIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718661965; c=relaxed/simple;
	bh=u4D8owzU03JtVL+E5P2c1MwoyOjbnAxavHybzY1+PB8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WkppP8MUOxzEwmFEMjI4zAEsS5eblGbxNAGA30l9ssDbdjJTmzWLSSbf7XFH+mOVwHEg7QQm9TYd9YCvAqTd4swKVvuK0E9mNwd7xURwDXF7kgNy51HMWcefatKlUnTaq2CbPvOFA1Ie1kejw6wVF17E2xMeGMR/zHjiDLF5nso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMpZsCU6; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMpZsCU6"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-24c9f630e51so2414361fac.1
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Jun 2024 15:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718661963; x=1719266763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72y+9tHAatc4SLssayPtvrq36iX+xSvhsa+KDzNLInw=;
        b=XMpZsCU6diyjsIGnNevaloALz2CNvQbAptPttltyj8ME209Nte3zFdp8E49wJmQJgI
         +VgynglPa0tPLCXqqdvHHHJqS0KXrOUsrA5/kq0TWt2g+T+GPt19PLF2alU6dfAXKXsg
         l/6Mcy3V3ZpNoawVdogjinXhcPFq3A28wHNLdzKEfh4NsGRmNb8pUI28sOEQAS4ceNZA
         9kaM6VcA2apwnDVKNK+3Ge9bQt18voxKXg9XtNC3dJwe0INGt3l/55/ncIHRbI5OW6pI
         WAKmayhCU24ukDkkKGQVneyyHqjZ24WMjMLQgIWEou6uXHLMl5ZicnEimqQQ5Kb077py
         vCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718661963; x=1719266763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72y+9tHAatc4SLssayPtvrq36iX+xSvhsa+KDzNLInw=;
        b=cwjESJDFUAl8wCYEi5ORous/ar7LgJZzbP3XrVDHDNxBaOPvwuywfBTog0QrtKBPWo
         Q73K81nsa4vkH5Qq//+qNp+IX2LJyCExp7QuG7ziNNZi+WWjULVSY1q/PnlKzVGWFyU6
         vHIAwJefLYyB+cheImpGbSDHwop49BxNrdcKZFrXNHKUms8osmcmWfxoGErqI0uljAkB
         x8rZ388J5wU5rwbgZuYOxBH/fEJqYVOTu9++uprX7m4EOO78mDnm5bNlT4CwZDrKSDnR
         cS3uioClB2RkbEwfsNPMGW7bA/X8sWmqj/iA0Ci9R/v4Hx+lw5atTKFnjRM0zVcBwCFI
         b9RA==
X-Gm-Message-State: AOJu0YxZ3c1vJbB2wxja20SaSv9SuiI9BXD7r2bLXOyEEwvZUp2YWkT/
	a6k/iNhg9fDmkv6VUQrXt3kjaBuePHO6N1p9KJm72x8HD9g2+7hwAEyg9g==
X-Google-Smtp-Source: AGHT+IEkIdSVBPwRxmz/C+oaPXire0Q9K/OttIwtYadST9Y56jqSPQuftFjwT3ICPganY+BWI4wfiw==
X-Received: by 2002:a05:6870:14cd:b0:255:1bb8:8603 with SMTP id 586e51a60fabf-25842882a51mr12202205fac.3.1718661962789;
        Mon, 17 Jun 2024 15:06:02 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6fb5b1b0fa8sm1664232a34.28.2024.06.17.15.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 15:06:02 -0700 (PDT)
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
Subject: [PATCH 3/8] power: supply: axp20x_battery: add support for AXP717
Date: Mon, 17 Jun 2024 17:05:30 -0500
Message-Id: <20240617220535.359021-4-macroalpha82@gmail.com>
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

Add binding information for AXP717. Also, as the driver can read
simple-battery parameters for the AXP717 and other batteries, define
the simple-battery parameter.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../power/supply/x-powers,axp20x-battery-power-supply.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
index e0b95ecbbebd..8d6b06117f6d 100644
--- a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
+++ b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
@@ -23,11 +23,18 @@ properties:
       - const: x-powers,axp202-battery-power-supply
       - const: x-powers,axp209-battery-power-supply
       - const: x-powers,axp221-battery-power-supply
+      - const: x-powers,axp717-battery-power-supply
       - items:
           - const: x-powers,axp803-battery-power-supply
           - const: x-powers,axp813-battery-power-supply
       - const: x-powers,axp813-battery-power-supply
 
+  monitored-battery:
+    description: |
+      Specifies the phandle of an optional simple-battery connected to
+      this gauge.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
 required:
   - compatible
 
-- 
2.34.1

