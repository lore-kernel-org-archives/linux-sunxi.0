Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76495221F26
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Mar 2026 03:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772681655; cv=none; b=EHKXnaYlPR6sLrEgtvVL2DfI8Ua4YcDbo20yiNvB+9gKmH+dKCqSlcWt+yZToTsvH6ptpNFhPTUByK8B4vydNZi06i8Enhx0E6mWQn4O5rqae72yanWaF7V4QkrXbLByAVkic4JtxETBPvAkj2ElDlzcFYBCCF4Qy4wabJNBNhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772681655; c=relaxed/simple;
	bh=G93cII+3A1u7CvKJrZXIJlpca2wo8XCXaCLCELHybVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kJlik7lxo03ko+JMYRDHFycc009Qm+lbP0kxC/i69VXVemgvWNdYEYx5Bss9Rfsq7lW3cQbqYQ6MJDRbXURec1KZKcu2jPj0z3zGCy68TfaoX8091DEoQeeeNHFyRNy2N8f00kQRQ43FbC1w0FLz5SBRi4jR4/6ouuj3mGvIz/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VU6U1PvY; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VU6U1PvY"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-506251815a3so67642931cf.0
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Mar 2026 19:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772681652; x=1773286452; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GoyJS43DjogCNIlYUyLOl9RH46vOQLUOd3a+06hfz+Q=;
        b=VU6U1PvYVoDuFZg3hwqfT3zAhKwT5AaNZnF96/hMIN3AiHjRe5vYV77k3jBT0eMoe5
         I9nbK0LOyc/vyzq0zW4MsHFdM3QTJ4VjYliKuKpERKGHm08Wzyja7TyGIvYyiTRYdcnm
         m3R7qJgZeRWmROfI7V0IxF5SyW0pClfkFLCbrYJxcZbTXb/98jznd1yE7RiDb+47YH9Z
         hPqsfTDXHC/eSUq7bkWy1KBKiwLASRLdJOQMpO1K8QxGAFsykLMn+YxAZzBfX/kb7AV1
         cTXP/+6yNRAm65+w1/FpFUf5OsbTQ4Mjapudg6PP9hNZNFS8AkI4JuvlRTh6dNWi8YU+
         1NZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772681652; x=1773286452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GoyJS43DjogCNIlYUyLOl9RH46vOQLUOd3a+06hfz+Q=;
        b=AXXytbIlk3GyArtoR3qcn4F6n1czzCXu3HtLXqvAoL7SidWD/ew83m7C5IH1sozyf1
         QqLBJxstO2JdrNO2yYoNZCNXVu3IAjXyQ56byvUuGEiurlQuPI/ezTnY8pSzrprwlXk9
         xpRgHYjEPQ+olNJK0fSXgZQtksPp8lU5Fy9ZulDPvAOC6ZmZ4yqMub1h6HKpWCrqzfkx
         KkFuaR85PAKsz2YvhOi/X5/V6aK1aTW+g00hOo/d/5tWXsWB0F0j7NfrO2qVm34mw/8i
         ULK5f7CwWEkgI1oxMJO2Vms+BU/JCdAIYempdNUKItbvtpG4zA3ivqunpuuoStLHvsHJ
         gs9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0Fg0cOdY0G3WZ8YuGsrkQwIGuosrEfT/EEEXaMMXKlC46KMx7C7ANuoCYrQMvuB0gOcnhMvSzcumCEQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLUCI+ZzvXelwS20JIxw68Sqoi3qGHx9R0KlML2K1R9GezxGU5
	QBKXfjqbHZUxcyaQPbcDkhtUEJgZilO/kQNXwn791pueBAqU36y8bYgZ
X-Gm-Gg: ATEYQzzL5JGUgYpMIKqq2+0eRN4qdWljCIJEAxQaqeTfL8GzMLdmRnKWBN3HGjouoZN
	oukH8WlAHNw0zO1qdfAb4n/ZvNtV7bV6UlsX19W6h/IceuxSQ7TlfkCJ138Z5IRH3ccBnLy7thh
	dqP/YMmBD7sEwCkro20RllUQGfuhJYyRsn8vhQlRLEhp66gif6vVjtK+D3RcEBwgqSClmuu2WVL
	FZ3CoOcfo3pN13lPNo/xAmLsKk1rKRmwmBgLOQCEbO/U6TiygWjiDzEhsYxEtzXU/SPUxNeSNP6
	9loVT5mx9mP5X3vNqjWLK6lhUai2pRP0AFf83VXx56CMCsYJb/kk1zPMLYJUT/TQVN0vuK83mQt
	5fOeJ74gG1C18Dg3yKjPoCg+OwhRWTM7N3N0YyFF8+uJBdkNH1JNsUFx8OME994kup5e8IG8sF+
	8Y/G2YsV79ydroo/s4bGRjtbanxYQ=
X-Received: by 2002:ac8:5a82:0:b0:502:9e93:617d with SMTP id d75a77b69052e-508db36395dmr51002631cf.46.1772681652477;
        Wed, 04 Mar 2026 19:34:12 -0800 (PST)
Received: from [172.17.0.2] ([134.128.219.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507449630b6sm190667601cf.7.2026.03.04.19.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 19:34:12 -0800 (PST)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Thu, 05 Mar 2026 03:34:07 +0000
Subject: [PATCH v2 1/2] dt-bindings: power: Add Support for Allwinner A733
 PCK600 Power Domain Controller
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-b4-pck600-a733-v2-1-ba6bbed7d253@gmail.com>
References: <20260305-b4-pck600-a733-v2-0-ba6bbed7d253@gmail.com>
In-Reply-To: <20260305-b4-pck600-a733-v2-0-ba6bbed7d253@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

The A733 PCK600, similar to A523 PCK600, is likely a customized version
of ARM PCK-600 power controller. They share the same BSP drivers in the
package provided by Radxa, with the only difference being the lack of
resets.

Therefore, document A733 compatible and make resets required only for
the other models, as well as prepare the PD definitions for future
device trees.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 .../bindings/power/allwinner,sun20i-d1-ppu.yaml        | 17 ++++++++++++++++-
 .../dt-bindings/power/allwinner,sun60i-a733-pck-600.h  | 18 ++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml b/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
index a28e75a9cb6a..b97361ce2a00 100644
--- a/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
+++ b/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
@@ -20,6 +20,7 @@ properties:
       - allwinner,sun20i-d1-ppu
       - allwinner,sun55i-a523-pck-600
       - allwinner,sun55i-a523-ppu
+      - allwinner,sun60i-a733-pck-600
 
   reg:
     maxItems: 1
@@ -38,9 +39,23 @@ required:
   - compatible
   - reg
   - clocks
-  - resets
   - '#power-domain-cells'
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun8i-v853-ppu
+              - allwinner,sun20i-d1-ppu
+              - allwinner,sun55i-a523-pck-600
+              - allwinner,sun55i-a523-ppu
+
+    then:
+      required:
+        - resets
+
 additionalProperties: false
 
 examples:
diff --git a/include/dt-bindings/power/allwinner,sun60i-a733-pck-600.h b/include/dt-bindings/power/allwinner,sun60i-a733-pck-600.h
new file mode 100644
index 000000000000..cf476a005b55
--- /dev/null
+++ b/include/dt-bindings/power/allwinner,sun60i-a733-pck-600.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_POWER_SUN60I_A733_PCK600_H_
+#define _DT_BINDINGS_POWER_SUN60I_A733_PCK600_H_
+
+#define PD_VI			0
+#define PD_DE_SYS		1
+#define PD_VE_DEC		2
+#define PD_VE_ENC		3
+#define PD_NPU			4
+#define PD_GPU_TOP		5
+#define PD_GPU_CORE		6
+#define PD_PCIE			7
+#define PD_USB2			8
+#define PD_VO			9
+#define PD_VO1			10
+
+#endif /* _DT_BINDINGS_POWER_SUN60I_A733_PCK600_H_ */

-- 
2.53.0

