Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F34B375F99
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Mar 2026 03:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772595852; cv=none; b=b9kVenSlxs5+5eSqH2Unz8muXvbug7MgpRXgFfU5P9NAmePJxcVPzSGfYFd3BJxZwMiXAmxT8KtsmbmzOJZ9QeCyu7yGN+I+v6BYP1FDohv2ZbaGGO+U4tiZtnH1OL0hD5o7S7XqUgMIEu4kNBYXkG5KF5zq03q0+s1RiTm1JRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772595852; c=relaxed/simple;
	bh=mdKNNesYCOjxGXKeUcr1BLhG7niNe+8/cXS+dPrtOPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KSulEtfiHNhTYfjqbYg7yNyQsr0UZ+IFnwnNQp/oU46cly0TbiLJ87+vDbAg3pkDjH9+4J4EvCt/ZQs/pcJ2HvPv1uyMi2IFSaMn6knPfPCAXCy10OJXIgBk9M+1tDt5LRbw+SEBoBa/lLSBGMSAHiA0caPDBF7djQcGvi+gFt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTrE/rL7; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTrE/rL7"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-506a67282a0so62274661cf.0
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Mar 2026 19:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772595850; x=1773200650; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqPUSx7NN053MAPTpYFUkReAMvsw/zhPAKa/7nlb7s8=;
        b=eTrE/rL7z7F3CCIhF0mOV8CBdPaR+kJKEvngi+PQ9D0gsIzKVysC4evf9RxvqrltC0
         OofhkAhlyb4fmyUHbPITU2EMzSmM+7umsJs6Mjr+R6ApGPe84zurVhahgaJp/elOHMQk
         8ZS9sGuQ/al8JlxeZ+ewBnahBGiFoHeVtqOKoGZaQwcROONZ/vshEL0JOm+wPhf+o47N
         Q5scIBruW8RfJmxjrAwq77X442ByE1yU8TSRCiAjpzqHvm3uwbEP50j/XDPf5XYKllyi
         Eq2quY6sIHTG0Sv95liLpcXMDSa+MG4F5b3EHLSczdcFlDEc35sYyCkwd2lU5pUjy0I8
         nEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772595850; x=1773200650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MqPUSx7NN053MAPTpYFUkReAMvsw/zhPAKa/7nlb7s8=;
        b=ILn0KE5BFHduggtZQV6CWRVXsRbszP/eFhXV4c0EWLlzpUKxwmB3cUZ47MYCdRaGEG
         l55eANAr+WfF21wRGYnjiy/iIq4O0B0NXcb2edsRUuv/ZXGJBL/43nWma1lEWEZNNC8y
         TvrxfJft79a0mlno5xVl+NF9nqbMgEtKY2FKwrzPSHqI/o7mJTFLqDoqphG/TRQdPIw/
         Tb7py8mHtmL6D9BwsYXffHdneIyIU4tfXThnsjo9aept3gfws8SpNQ/sLhN9s1//Jd2q
         gn50EhejBaEMRGznkBiOBWI/xtwFutRyEGYdKees9wlecmjl9WAlXMxaCP/p8AUPcGTV
         9X5w==
X-Forwarded-Encrypted: i=1; AJvYcCV9UAUO353GUbexvvxdM1i2hjoqIxqfI6mQ3/R1iGJ7HggOR73RMxsii8ePuzq9M1OAVmPV1pVNtiN6nw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQ5Fd1i7nSM2Hu9WiB/qITjJiv8ZikV2pmS/CXFk1fVaOJfMv1
	WEQ2bPLxNwHnxna5s9lDO46z+fFb0ejmdH/qntVyuU0Cq99l00Rk9QSj
X-Gm-Gg: ATEYQzzPihnB+UkbR4HEpv2f+iEsrDTyCGihtWsY0/U/HtdQBu2uLX26dOqtzfI3S6T
	Sw47QjvMJADZR7KrGaZzOS1TVYa+sRJi6iTZ+cb8MkKOdPXnF+Z29+FTC4GnWiXbIY3eucir1KN
	lAdYFW8qVjjuA+0UUIagnTudVYxjige36yh+hRFeOMH8/Z50Y45/YIpEfXs8gXkabiAyEEXDfVl
	cuADcyeM4FKUgWo+j/G6yw/GuQDsW01Dxiu1vS7uIq6wbEAU2+OcnsqS29X0Xjpme6KPrOF/mc0
	eABhGj3mI3qY2szUbdqtV+Fj0CRma3w1vxXq0rWBeiLrW9kuKyO9k9E28h38Rq59T51nP0jYnLT
	EAix95dXDr3D0VyuOLawLx3Xl+uFKBMDeXcpi+//GpYm1SzPTmBNONwFIMFjaNrV56Q204q63BH
	d+ARi8U+mQ2C3245Lotrx2OyoR8PU=
X-Received: by 2002:a05:622a:1828:b0:506:9b3a:2199 with SMTP id d75a77b69052e-508db4352a5mr7908731cf.67.1772595849959;
        Tue, 03 Mar 2026 19:44:09 -0800 (PST)
Received: from [172.17.0.2] ([134.128.219.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899e608cfc6sm88603286d6.14.2026.03.03.19.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 19:44:09 -0800 (PST)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 04 Mar 2026 03:43:44 +0000
Subject: [PATCH 1/2] dt-bindings: power: Add Support for Allwinner A733
 PCK600 Power Domain Controller
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-b4-pck600-a733-v1-1-2f54efdb8cc2@gmail.com>
References: <20260304-b4-pck600-a733-v1-0-2f54efdb8cc2@gmail.com>
In-Reply-To: <20260304-b4-pck600-a733-v1-0-2f54efdb8cc2@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.14.3

The A733 PCK600, similar to A523 PCK600, is likely a customized version
of ARM PCK-600 power controller. They share the same BSP drivers in the
package provided by Radxa, with the only difference being the lack of
resets.

Therefore, document A733 compatible and make resets required only for
the other models, as well as prepare the PD definitions for future
device trees.

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

