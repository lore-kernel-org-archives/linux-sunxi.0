Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053BE7346D
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Oct 2024 09:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730020864; cv=none; b=DIiobuqm95nSWRLX2OTe9mKRx70Ab2duwASJOgWpbqfcbu0N6hCjT+F0iO3gXQk3PYf6zdp+4XwIV3Pn90LTMA6QlPVPaqJNgjQeUWyXg51Bld7q1HgIippqixbcgyjkhw3Xsfe4kDr3y2HCt7NcsiyJREHClcg5m9LMouUROs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730020864; c=relaxed/simple;
	bh=3UkeRzv8tuyM480RNYtsP4upZlJ+1C00o1KTqGMdwCg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rMDp1le7xDG1PA6F9sUFZ3amxBuOyA0ZfUQd3b9gxYdn+sevTpC6P80mChlerfv0Fu8gmPxAfay/S/ZDOVLpDis8QGFX6sdAO2+43rAsBzrqZt5erpYlIB9gvPE+uziy1fpiLonMvUdulN/ZADZseE3rr8fqG9ScAsipOXvkReY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=kto4zU6J; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="kto4zU6J"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 9002FA0767;
	Sun, 27 Oct 2024 10:21:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=6BVVyLjJdR6me74k/F+O
	t1blbg2/epRtk+d2HKjKdKo=; b=kto4zU6Jzf9uthGJhK3POptVxqxy4ZYAvJP6
	voP0ko6mdKLkVp2WSfluSP68dVXA7IfaAcPRMHtP6ym1AEHFF71ImPB185h/18/Q
	gPjTS/CphqmSGnK5pUKYlvKvtNMPWXGCiJQVMqRrzF1tKI4GgOTSK7SvXswwC2yW
	khKGEF8XQcLgFwvDtRS2v3HCwsgS8F8oZrldsLZEyUGgiMSv3GKDZ2SF1NPsiRbX
	IC+aU7BPM90INxKhOfMMqX+MScvxZMS1+YQ/NwonPrUUCOQWg0nq01u7ioF74IKS
	wezfNDcjOkYBP5yT0USGgkV7h8TSFGm52TzpLzmYpcJcawDaYfLrrrHm+6T6d0tB
	+YszchGRyxe2Or2QnCuIGWhRVaOND/zTWhv+QcYx8/gNXPmdoD4WLAExn5QjibX1
	3aHXVajbay/k2y6RUXWhWg/tWjjJdLfSZCqyaKWblyNr004XrVf6P7Tpm49QYO8W
	hfHI+jMDZ0116vbpF8Kx/VUVfWzZ8oKF6Oco3IID6OU976Z7CSBJA4p91El8jMsa
	i+NhUj1anXXcz+zQoi5OHOI878u5fTh09WB/6TW/6i2mkKlX7KPm21dp9wIpbdS1
	TWLKnc/YtPTZjeMTta5sz05GP0/PO99hqe6LRgcU1tzNHzsGZ66+3iX1+ps+431R
	k7qspOM=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, "Samuel
 Holland" <samuel@sholland.org>
Subject: [PATCH v2 07/10] dt-bindings: sound: Add Allwinner suniv F1C100s Audio Codec
Date: Sun, 27 Oct 2024 10:14:38 +0100
Message-ID: <20241027091440.1913863-7-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241027091440.1913863-1-csokas.bence@prolan.hu>
References: <20241027091440.1913863-1-csokas.bence@prolan.hu>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1730020860;VERSION=7978;MC=230514840;ID=156043;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94855677D65

Add compatible string for Allwinner suniv F1C100s audio codec.

[ csokas.bence: Reimplement Mesih Kilinc's binding in YAML ]
Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 .../sound/allwinner,sun4i-a10-codec.yaml      | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
index 78273647f766..16f4f7a40d9d 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
@@ -22,6 +22,7 @@ properties:
       - allwinner,sun8i-a23-codec
       - allwinner,sun8i-h3-codec
       - allwinner,sun8i-v3s-codec
+      - allwinner,suniv-f1c100s-codec
 
   reg:
     maxItems: 1
@@ -70,6 +71,7 @@ properties:
         - MIC1
         - MIC2
         - MIC3
+        - MIC
 
         # Microphone Biases from the SoC
         - HBIAS
@@ -80,6 +82,8 @@ properties:
         - Headset Mic
         - Line In
         - Line Out
+        - Right FM In
+        - Left FM In
         - Mic
         - Speaker
 
@@ -229,6 +233,33 @@ allOf:
               - Mic
               - Speaker
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,suniv-f1c100s-codec
+
+    then:
+      properties:
+        allwinner,audio-routing:
+          items:
+            enum:
+              - HP
+              - HPCOM
+              - LINEIN
+              - LINEOUT
+              - MIC
+              - HBIAS
+              - MBIAS
+              - Headphone
+              - Headset Mic
+              - Line In
+              - Line Out
+              - Right FM In
+              - Left FM In
+              - Mic
+              - Speaker
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


