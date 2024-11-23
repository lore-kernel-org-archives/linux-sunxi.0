Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4736176AAF
	for <linux-sunxi@lists.linux.dev>; Sat, 23 Nov 2024 12:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732365771; cv=none; b=S9DGfuy5pOWWzvaaLcDZPzVSUSeCKtLPIPuXkXCP23iWXpPE9J5RC1W3FOP2zu8yBDb1l85rRfXe2h1mRCVv/iGtXJq6FcFiO2oJ2OH/4KAjlFZ2hekxkZUxgYaRDdA+M9F1KDSRD1rY4ye54TiMxJI/TrcsICnAVY6c0ZhxnAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732365771; c=relaxed/simple;
	bh=GlwV+vgJBHWYKKjvYmdECj6tan8HO3qcfiL93+s04fA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eUJ9M1MqHEMP3ccDgFpVuMFUWHMG51vvR2FlKFgLI4mQMt6YweeW9XyU6wNWLr0vfiCrLDx7zolk0hHpFiPZv1/7i2J+s6obmUGgFzo3621r9DCWu84HEC6WPpg8yRrnUZK6GehsaTYZcAVOGWlVf2zELWIkqTAdeQCcqw77BUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=h12pQO2A; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="h12pQO2A"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 42326A0365;
	Sat, 23 Nov 2024 13:42:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=U/Y+t7R02LJWG7XTAOk6
	+QTMggkhTH+0gpcoJOIca9w=; b=h12pQO2AdYrnZ/T7VjfZR9dtTHaxO/Wt4/EG
	giM9cHkDgmVpFgzehA+bnTf+knFPbrbIRAYaVc/YugA/sGt/Dkh0foxBlOa8MaRW
	YYy1Vt7K9K4PFqY8vgNJziKEaCUYjyuxEd15h3uGkMYZk9MfC5Gi/2ITpRM/XdTD
	wnvhaBB5urrY8gidElkI7Llvct74JlFf48PkBMrgzhxwdVj9rTQaQzr9WGnngD3L
	++YdpFulycQVuvXfRVcv4g6vo0xETexS12Q0pTdVMtUD5GveHgEF7E8RGLMowwz+
	4rDD40oS1TH36/XSV0dCApL9rgllqmqxgQPW2nEPtua8/XoCAUk363IpCWH+M41N
	2BZQoK4AxQRV/oWyN62PFROmconlhyMxl29izNqxUFCmv3J8yDF8pMNDHmcL/GT+
	tD65bSfPoX8KPVXXHKB6NcV7clAhiIFV/fDMpFwM2xj6cIEEoFlwRFt/1oXSjosf
	YivzEyWjJfdAd8hsY8ilH2Arda1kdvUG6ed95GXtUj2JbHteAgiQmkJNVOrrzDO/
	gIFDHUMJhOJd33wXfFPJqgrSkN5z0S3QyGdTuJ6dl5AGrWnS29lAQB07/bntKeno
	jx2fRqRRCmcAVERS0kbe886sbtG53qYUrYJ4iEypUdvCaDSyFlj6RRyk7Q+NmZHp
	MThHGGQ=
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
Subject: [PATCH v6 2/5] dt-bindings: sound: Add Allwinner suniv F1C100s Audio Codec
Date: Sat, 23 Nov 2024 13:39:00 +0100
Message-ID: <20241123123900.2656837-3-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241123123900.2656837-1-csokas.bence@prolan.hu>
References: <20241123123900.2656837-1-csokas.bence@prolan.hu>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1732365767;VERSION=7980;MC=747292532;ID=80952;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD9485560726B

Add compatible string for Allwinner suniv F1C100s audio codec.

[ csokas.bence: Reimplement Mesih Kilinc's binding in YAML ]
Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 .../sound/allwinner,sun4i-a10-codec.yaml      | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
index ebc9097f936a..ccae64ce3071 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
@@ -23,6 +23,7 @@ properties:
       - allwinner,sun8i-h3-codec
       - allwinner,sun8i-v3s-codec
       - allwinner,sun50i-h616-codec
+      - allwinner,suniv-f1c100s-codec
 
   reg:
     maxItems: 1
@@ -77,6 +78,7 @@ properties:
         - MIC1
         - MIC2
         - MIC3
+        - MIC
 
         # Microphone Biases from the SoC
         - HBIAS
@@ -87,6 +89,8 @@ properties:
         - Headset Mic
         - Line In
         - Line Out
+        - Right FM In
+        - Left FM In
         - Mic
         - Speaker
 
@@ -270,6 +274,33 @@ allOf:
             - const: rx
             - const: tx
 
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


