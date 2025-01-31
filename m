Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8651B4154
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jan 2025 23:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738365446; cv=none; b=XFQwL7nrTF475dHodN0y2WPj95pIlo7wjmlHfRxt9DgaNPrBrKybRhcdT8IbAOjpfyu3vE8Q2ww/j66d04IkFA18TrR6qdP0VXxAOWksVk4ri87lrfTmlq89AqzbWwEZSMb4fDwDYF07TooTUjruJQulrs3qoZhIEbhGz48VI2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738365446; c=relaxed/simple;
	bh=OheuIsXal5ELPtW/MGuDmGxWvHjuF3GuZlgFTGOYNcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lKc0ahJFKFElVUD1XK1Sfa1SP/R5rI5WMQk6Qkn0E+Zchw8AJig8CnciTnocu5SsUpnyJqn8Qkbjg1MONqPBNLIvIMgmPytuTl7rJSNo7eAhT3qvjQm2xydXb1J+yw2hpDnF66jATJxULd26EHmhuf/DdunDmSgv/COXqCLL8tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUswLr9s; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUswLr9s"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-71ded02b779so1404726a34.2
        for <linux-sunxi@lists.linux.dev>; Fri, 31 Jan 2025 15:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738365442; x=1738970242; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0AvaeYEwbl4eYOtBZm1BZYUzls9/jU76Z0u4jhcL2E=;
        b=fUswLr9s/ByiFR2JvZvRDitMK99VR77nYhJlxirCbyGxbqrUwnhR9i3FI5P20d+0DF
         llZgciKxf9WeASvjBDVtCelchE0VGA3blGFDShhyx2Uta1HRp4Y0RCmdOSWaTmqVfhnU
         0zVFehpE4EOrY/G8o+WHyNF7FrjA4cq0qXMx01Lh3xKze6Z0gnwRuwHcZc7jQSrXy8v6
         8n2zb2CwHlpzAHHj0IICLVHk/QyWFCj+oVkGp4rwnbUtzGun9FohcgetONRTslBhGC+G
         w308jfircc9DRw7uBR5TEMp4oiGhYsWaI4l+VkXxK4scxog/SDkcNUM0znRcPCUuYd+V
         pypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738365442; x=1738970242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K0AvaeYEwbl4eYOtBZm1BZYUzls9/jU76Z0u4jhcL2E=;
        b=tReV2mczV42TlwWliC3SPQxdsKzPEKXnjHFSBLk/1L/b9Jd+mlhHueLiSSgjDKpCUJ
         scyI/1sX8lsJU9o0+q6VBJvFNmOvVYG0oakrGBvIX4D+qoFiDkCd89DFLleEhZksECL8
         ztDhw5ssiWz5ojFi6usB/WqgJUJ1NZQNYVQ4x6NP0klVRJx0TC1bbIr8NVBXGa28O24t
         l1l8y2uNIRBRyYqM3mHIVtZ9MUS0CepjbGvXT03BtMXV9i6Njt4eBFuiyekIiHtodLHU
         3HGAqDv3NiDNpE+KvHGRisuiB4kfSslsPUU4n4ZevxarCmDypoPM0GDT3eTzZBoAM8hS
         Yviw==
X-Gm-Message-State: AOJu0YxLYb/tpSKCmhcDE92dwExRVSA80sCqsZVyO0C/bfzb9uMTBDix
	gMjayzciRyoroqRWSRusAKF9LMt7lCg9hloT6r85IhDz98dkMigiYKi6eA==
X-Gm-Gg: ASbGncv9T5okZFzsrffSbD4vhbaUryyiTGBzo5DNxLVTqFbC+wetz2cJvbARk77kpZu
	kHq/6Ql6E31DdFNteVu0369AsS21eBzAoJs5a1QVpao024DL7PKqkebVavi7sO7J+k+/vkh6E+k
	a6EH8wrQuhhs2/AtC6Njhxyhk/2vIpRytkwtR5nqENwCXvxDuAmzH/mVX5+eu9t1iD5SiJ1tunE
	IMr+jJ1/YWyf480ROd6A7ZXeyY/JFh65tI7YpOw7eixPucUvyEj2TMisKGhmZZ0Jk0StY3UHk+M
	21CvaorEnbs95J82xJwhMj0/SIs37Fw2ibM=
X-Google-Smtp-Source: AGHT+IFbQpcZQbXtAxI1mzIXIjxIHwluHgvFFoYQrutWhvWWVUgAGBuyeA2KduyyPKouqn34IVV5qg==
X-Received: by 2002:a05:6808:228e:b0:3e6:5792:2fb1 with SMTP id 5614622812f47-3f323a23307mr9610002b6e.10.1738365442481;
        Fri, 31 Jan 2025 15:17:22 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:d061:e6e5:c6da:b514])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f33365bf31sm1099128b6e.34.2025.01.31.15.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 15:17:22 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sre@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/5] dt-bindings: power: supply: axp20x-battery: Add x-powers,no-thermistor
Date: Fri, 31 Jan 2025 17:14:52 -0600
Message-ID: <20250131231455.153447-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250131231455.153447-1-macroalpha82@gmail.com>
References: <20250131231455.153447-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the vendor specific boolean property of x-powers,no-thermistor.
This property optionally describes hardware where no thermistor is
present on the battery and is specific to the AXP717. In rare
circumstances this value can be set incorrectly in the efuse of the
PMIC, and if it is not hard-coded the device will fail to charge.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../x-powers,axp20x-battery-power-supply.yaml | 22 ++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
index 5ccd375eb294..e0f134a13f7e 100644
--- a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
+++ b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
@@ -14,9 +14,6 @@ maintainers:
   - Chen-Yu Tsai <wens@csie.org>
   - Sebastian Reichel <sre@kernel.org>
 
-allOf:
-  - $ref: power-supply.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -35,7 +32,26 @@ properties:
       this gauge.
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  x-powers,no-thermistor:
+    type: boolean
+    description: Indicates that no thermistor is connected to the TS pin
+
 required:
   - compatible
 
+allOf:
+  - $ref: power-supply.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - x-powers,axp717-battery-power-supply
+    then:
+      properties:
+        x-powers,no-thermistor: true
+    else:
+      properties:
+        x-powers,no-thermistor: false
+
 additionalProperties: false
-- 
2.43.0

