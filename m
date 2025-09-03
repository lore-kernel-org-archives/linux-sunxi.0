Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com [203.205.221.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79D82D6619
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Sep 2025 08:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756887791; cv=none; b=LjJOfh6B0F7lcwfH/gRWnQ+F2dgvSEd/L9x3CxoyGwfrevHvoXxxLsNXCalHgyugafbq3unUYYMrHd0BL+pCoJUF/Qav9ZzY31YeDpKb3L1xeRML0zZ1tQKH0NCl9h+Sl556GV6amOmSeBnf6v1e84uSzzgn7c42zvG3AkMsll8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756887791; c=relaxed/simple;
	bh=eO11k6Ra2QsH1VCzI4Q5SU2ncwi5FG6M3i44nrlIkm4=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=gDOstsB4y9GZQGuIkPwxAJSK8ro7d5X2TCNBoHYgse4OZLy2Z344EmRyIF49fKzm+3VK3ryMFUqpPtIFaO7HXwrWQfoCkJNBIHu7+te4M1pUElZo9f1Sl/5WBTpHnr7P+SqhLEqYcwDj92d/mB6avpDPDTeR5gXJQEB9rNh6SXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=CY+jsKJ+; arc=none smtp.client-ip=203.205.221.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="CY+jsKJ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1756887785;
	bh=rxwbLt1/3yvtFHhZm8ytyPfgkNtAZ83DcuhmIdUSo48=;
	h=From:To:Cc:Subject:Date;
	b=CY+jsKJ+eUEWs2g1y+SJ5ZUIJnMa45ECbi+2KzpREImvJw4ZvWGuLzEhFTCgXAInn
	 DPCp4AolgXZ7pM2G719j/Vin/mFaIZhDBF84J1aA+Uz/Qrt58p+TrXeAubh3NHa7bk
	 Ft2ZAh1uiPSsMjvb1QYOu0DVB+kPuMhOG7jpE6R4=
Received: from localhost.localdomain ([112.94.77.11])
	by newxmesmtplogicsvrszc41-0.qq.com (NewEsmtp) with SMTP
	id 5A933850; Wed, 03 Sep 2025 16:22:41 +0800
X-QQ-mid: xmsmtpt1756887761tvydu8a21
Message-ID: <tencent_4E434174E9D516431365413D1B8047C6BB06@qq.com>
X-QQ-XMAILINFO: MZtEYADUG4AgcVOcqUEsC/Rrco1gqWxRo27AXcUx2WkW06jJpes6cEcTIRCdk7
	 8AqyusGrgbY7Ukwxej1hCZxZK9RM1lmEPhQTNz6mI+N7ypKbAZ6H6g++gVse98wMu/q2f+b4M9u0
	 RNT3AEbxhe4pTrfG+09IeGuzziFGBc2kw8zWDkBKCT1ykdzy6ss4d9H2HgGLPoWugzqbDwllHx74
	 GRe5uvwzjXPXRw1uSkyF/FIKd1xIwf1IURvAGZpObkXYT8W+t5XRsc1+z/klQzw5r8+kSqTIe9bm
	 N9O8BK0/DxoObnbKGT9tuGtljWOiICl2nHOokZcZzahjAw6CLUEFsudQp92FauqWPC1iK3OkhyJT
	 0/67kMYwscJE4SPiX/XXtA0OuiwAHW2qgpFji5e4NRrZuBGwDzP8ORoRPYkMjmBgIK9u/mWxOXgz
	 oxWoZ/lAU9gEc31erSu2RpBijHa4J7giDCed8yK9i9yHe96dIwOEx/tYz2Diet/lXIBDpJ2Bny2y
	 IPFCd/K3u3I6IUSeGVIcI3JtYTFCRpADFaHDECTGh0aWLBwtYjL89xoXqLKDQtM9eTUvFns46cSI
	 ZIXUFE1iK03y/w4uBMjz9NFvAz/+87qllwA+GyVuiY5RdwiH6iozFMgsitX65FgA0pCFNtDkFEgA
	 naIM3PWpVsj6iNo1qU3m17Nq1hmDlgnl08BDxQdsuIiAjyICw4q/1oxKC+wK/W4PN1M5pGBOH9a/
	 g3BjNPohPOvWYpKh1+fCikISnXECbRPU0bMzMJ3KrSWY1cJEIpkLkzIC2xv/aKlwaCWgC0CVXIdL
	 HZJgz1zSU0xwImTrCIQVO5Cd8UswgrB136d6cmwT6DmDDCceuYZBbhrztoG7WlbzHEvYLXCxsxRd
	 cJEUvtTM15v0ZmXPj6CQffEhRB1+0QJXIKGKVEi3AdR9wIFc2vnhqjHkwpUADZVYMXtL58qdJ6gi
	 ogyP7yVJw7QmETVcga7MSLapXbuqvOOIWyxD+9XaIavdx/HBIOdliaUmlsiPgJmr6SX9WVno6ZxA
	 KRFo4Qv+FitPVJxgemQXH2+4YcBYD0SEsee5S55oKCP4iH4pOv+OEnAqr0+0ocw3i+ood4yac8xj
	 rKTVjf
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Conley Lee <conleylee@foxmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	wens@csie.org,
	mripard@kernel.org
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Conley Lee <conleylee@foxmail.com>
Subject: [PATCH] dt-bindings: net: sun4i-emac: add dma support
Date: Wed,  3 Sep 2025 16:22:38 +0800
X-OQ-MSGID: <20250903082238.513066-1-conleylee@foxmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sun4i EMAC supports DMA for data transmission,
so it is necessary to add DMA options to the device tree bindings.

Signed-off-by: Conley Lee <conleylee@foxmail.com>
---
 .../bindings/net/allwinner,sun4i-a10-emac.yaml           | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
index eb26623da..d4d8f3a79 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
@@ -33,6 +33,15 @@ properties:
       - items:
           - description: phandle to SRAM
           - description: register value for device
+  dmas:
+    items:
+      - description: RX DMA Channel
+      - description: TX DMA Channel
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
 
 required:
   - compatible
-- 
2.25.1

