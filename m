Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5AB21422A
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Feb 2025 16:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738684863; cv=none; b=bUf0zKTtMBjcz15BAReX5VMZZL8WCmeNL/qa4yZRns2416pAtm3y6P8tNAQ9NMezBipqPp8p55CxFlfynQ92NBdmEi5BXv6ua/LEkxFdT6kFRNfffhr9gJNN72vjmJ+oRWaDzNT5yxItgM2EyEtzrO79PCPkX1FIhRAwVDmdu5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738684863; c=relaxed/simple;
	bh=Zw4geiqrec6cHDyNVp5ah68FGJHispIhBZyciy8rD9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F0Hpc1gyMiZuQobtxaAFUy74Que4kWCR9d0pb7FuR3OcaoKqzyatEs6E/o+bhLw4gx+fBTelf244/IrqiLFLfxi2Ijn5dAC2bZ1SjW4PZagWQ1iFnimmojX2Og8lHO22hnz1HtAsazMczavQkg19+z4800dWJsza0gCb0F6Tsh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PW2tBK4R; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PW2tBK4R"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3eb7edfa42dso3096409b6e.2
        for <linux-sunxi@lists.linux.dev>; Tue, 04 Feb 2025 08:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738684860; x=1739289660; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHlljfy889XgONy8L5QfUbtDDGX6j94H9380ihQ7yjQ=;
        b=PW2tBK4RAyg+nNz5PdSI5F1HcH1nC99vzErnLWCmsgLUAjCiiBYdWqBtyijl4vdTVL
         Af6l/On3oPxsPvq/PdatyTEb6mjxHWkNtxsiagcI8fVEM52mKZbvTuwdGgxfCo7yQy2a
         oBwtF8bFRxtluQhx5CBrp7ccRXL//4lKtpoqr91NoSQZ1iuvk77Ny+R4HecUJauy3KTN
         hTbE27HnSt5V3MkOcqzVd43Xn8QxEnxT4+mi8AiSIzDRbqj5t2cRXk4zu5O8gyeBhAut
         El/iubqs/519613gtOCFO/cQDs+wIokCDOkgcSAWaN78174YDm9WQaWTaCsTfHYp/9uU
         C+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738684860; x=1739289660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHlljfy889XgONy8L5QfUbtDDGX6j94H9380ihQ7yjQ=;
        b=NouPEdf1Lu9UbvKs4GGG88s//lI5SAv2DhivH1dw5cu2CeVMAOpc3enK8eYqQv6guj
         H1NKvNKD+L5AteUmRPvQl2L6YDqkVBow7PLPp337+SRpZ1IejFsLxdC3zRbbmAB4gM+w
         UeJzfEvLQbx7vD53CpS8J7fWtCwQ+BeediKnooF89GMWp1MF3XMb/gZNMQ8c3R1CiEqo
         x0dZNTiZePYcK/tO1YcD1ut8FnNaAWHh7Y2saTxZYunexgKAwOjF3L/DQXsRuOGWTswZ
         2rJMoNLD0zGJjvFnQZ6ASecCbigpXYRsDFRfjCA4NQHyhBw+NRNtWzXUgRNkcD+07XJk
         LyzQ==
X-Gm-Message-State: AOJu0Yz8k3U6P8ZnrE6v0tKlh5s4Wg4AoLbaVLqOipJiJsQlpH7B7cpI
	NpE+PjeDjWv2/pM4OH/3KJOxSlC98wvyPLOG1ngnDzHY0F3SuOV0lolmOg==
X-Gm-Gg: ASbGncuWI9Hpd+400nWjGmvk/ZG5jl7CnUtlUItQjUYgabMdCBtiHNot09Wuo48RrQ4
	GJwDXuC0XvS0CkmLYd+3O26UjufMS9AbBAp6SyILMEyPZnsDJZlExhChxeeCBNkGUVTOcxj+QT4
	xOL99fKkF/qVnWhDzmQkDPiKtdgxcTNGhxptfjajJ3uWANGoT9wyxLp5s2V71FrTyEE19Am398w
	rj/m0KxxsJvVxrh/qWb3/xfHwfLXpJaCpC2pVae4OLGapd+VheLwIyaQJ42Ai9q3aoxao0FIblD
	pOw2pJPMZiXzdK2K7N4BXM/GrpmhK5ILBIM=
X-Google-Smtp-Source: AGHT+IGaIZAPvAttTrRBItEFWc9qMjMXZM9Cgd/5fO7zmh2Rf9f7b6ITgUhhswhFOvU7exbhdKvtSg==
X-Received: by 2002:a05:6808:1793:b0:3f1:b153:3105 with SMTP id 5614622812f47-3f323af0374mr20723191b6e.26.1738684859999;
        Tue, 04 Feb 2025 08:00:59 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:f8ca:b029:fcc5:5836])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f33365be86sm3039570b6e.31.2025.02.04.08.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 08:00:59 -0800 (PST)
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
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V2 1/4] dt-bindings: power: supply: axp20x-battery: Add  x-powers,no-thermistor
Date: Tue,  4 Feb 2025 09:58:31 -0600
Message-ID: <20250204155835.161973-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204155835.161973-1-macroalpha82@gmail.com>
References: <20250204155835.161973-1-macroalpha82@gmail.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../x-powers,axp20x-battery-power-supply.yaml | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
index 5ccd375eb294..3504c76a01d8 100644
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
@@ -35,7 +32,24 @@ properties:
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
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - x-powers,axp717-battery-power-supply
+    then:
+      properties:
+        x-powers,no-thermistor: false
+
 additionalProperties: false
-- 
2.43.0

