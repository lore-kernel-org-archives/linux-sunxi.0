Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0FF130483
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 04:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713240743; cv=none; b=R3rqBomVKzQM4iGbDfIuFCuDBpU/i1/Ig6OXJCQhVnnM2+0y+pTOeL/OobeYgyCJvlyL2V3Eil6CONkZDE8GoOnjb9fiPdPjYmob1YHGoWnG+8ogsyMP8TPu/W4/JW+oIOFZiBT7RtHZuiJ/RvmaJOKBIPwPMnKpzf6tzemcjgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713240743; c=relaxed/simple;
	bh=Pd17y8rSIQOLToPq65uzRQko/bOYuWvWVyIdFkWwUb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SKttz8y0Iopi3GmuePwqpsxoocatqRhN3j2PF1PpkilCZJz7CfU4Xy6ej94rQARyu0AO+DRdks8b68RWiB1x5wlMDhsrkxuwLEife5QrKguaPieaMITSHORgmDEhVHi5t6dMW2uVWnJOZLp77zGt8hGuMA+MouwBbeOkmexY4ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=23vlpXJE; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="23vlpXJE"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-22f078f1aecso2451833fac.3
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 21:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713240741; x=1713845541; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0myKjHbdI49O8sw2nrfLU2Cc+sQrhRNVz/AXXXRMvok=;
        b=23vlpXJESL6zDPzQfvltZy9GzZ80/XWTNFGxpchucckg3HK2YkMDq8LoFyYGMbNvxb
         SKSnQCyLHjYiAxJjtlWc53ZD9daotwlNlfs0j5wrLjBBwHJwYWSfjTr5eMX4MGIqOmwt
         UK5r4T4DjrJZNpn2csmit4J10KrrbeB1zvY1nYWRRrKg4gH/OmJF9Mokne9F3AhSYvZ2
         RIwbhPP1jZl0dwHviC59O2B60Cr8lXB354VT+YjqDLhJj7sDHtdlNmJZ6RwJryy9GTCJ
         jG4VCwAa3dmlrAOdwefssjudD9kf+HjRgzGT2viotyRD28kpwKBoTMz9PNWj66YPBP7y
         lTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713240741; x=1713845541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0myKjHbdI49O8sw2nrfLU2Cc+sQrhRNVz/AXXXRMvok=;
        b=Req1CpzMP2TlV3DSKN5wFA3T79vJUGjauvymTWK8tyXgUv666A9muNkOvgx4jOiOrX
         DJA9E3NgBMRiyTB+C+TYm3+/Hg2vjvOeCEH/U+de11XLdiAzyYK40GNMVX+XbMxLQEjM
         i5xFHKDCDNkkYs0Vv4wvp6Pq+ADTp53qFPSXZyAcq6PhewKlWZB+Oltq2UhkqCAmio2D
         6A/LrUF0FldA/VwwBGA8TJZnC9SeE6IM3wT4n5XB0YJ3ZXwU7OATWsNF8qqlvTJwWS8t
         JURLyi+MbWrhA5ROAA9T5+LwILS8XyLuomeL0yWhQ+RneD9rv83iNDubNqwFkt1MD7n6
         VO+w==
X-Forwarded-Encrypted: i=1; AJvYcCUqdWKCSEHjsQuc/aXETBjFCwXIobCVdjkxKbzySjuL94lvr46OI8lA9S59hAU7HRLPxJYNhZ7UYWN8MjHJrkdE8kDn89nhohI1BCU=
X-Gm-Message-State: AOJu0YxvGY/meqofK+sckovvKjSr7xyK2jlK8FGlv8WYnS2ZTK+x/A+3
	1xX+p6+/pBf5M29UlyrAzMpJc9UizBiKCJx4Vv2E2w9thkWMTRnHguc64NVJbk4=
X-Google-Smtp-Source: AGHT+IGuQqz7XBPHYMqlLYkYrN5ncOZQ+7ZMUGI9YSVjihm2ZpTJCtJuDLa4CbJCGT++Si3L+PEwNg==
X-Received: by 2002:a05:6871:548:b0:233:5fa0:8b72 with SMTP id t8-20020a056871054800b002335fa08b72mr15110671oal.27.1713240740821;
        Mon, 15 Apr 2024 21:12:20 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z184-20020a6265c1000000b006ed4c430acesm8383149pfb.40.2024.04.15.21.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:12:20 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 15 Apr 2024 21:12:09 -0700
Subject: [PATCH v2 12/17] riscv: Create xtheadvector file
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-dev-charlie-support_thead_vector_6_9-v2-12-c7d68c603268@rivosinc.com>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713240719; l=1714;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=Pd17y8rSIQOLToPq65uzRQko/bOYuWvWVyIdFkWwUb0=;
 b=x0EjMIJFFrE4HAj2PGdxo95DYqEzewoU6zjMx/S9k9KfLyw8q3BJBwXbiQVWfZdoldvr458qR
 BaL9KrCLBX/BsMLL47sjNU+Y+AYZAPIKomPQkJeNTYxxtLAfszRyApw
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

These definitions didn't fit anywhere nicely, so create a new file to
house various xtheadvector instruction encodings.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/xtheadvector.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/include/asm/xtheadvector.h b/arch/riscv/include/asm/xtheadvector.h
new file mode 100644
index 000000000000..348263ea164c
--- /dev/null
+++ b/arch/riscv/include/asm/xtheadvector.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/*
+ * Vector 0.7.1 as used for example on T-Head Xuantie cores, uses an older
+ * encoding for vsetvli (ta, ma vs. d1), so provide an instruction for
+ * vsetvli	t4, x0, e8, m8, d1
+ */
+#define THEAD_VSETVLI_T4X0E8M8D1	".long	0x00307ed7\n\t"
+#define THEAD_VSETVLI_X0X0E8M8D1	".long	0x00307057\n\t"
+
+/*
+ * While in theory, the vector-0.7.1 vsb.v and vlb.v result in the same
+ * encoding as the standard vse8.v and vle8.v, compilers seem to optimize
+ * the call resulting in a different encoding and then using a value for
+ * the "mop" field that is not part of vector-0.7.1
+ * So encode specific variants for vstate_save and _restore.
+ */
+#define THEAD_VSB_V_V0T0		".long	0x02028027\n\t"
+#define THEAD_VSB_V_V8T0		".long	0x02028427\n\t"
+#define THEAD_VSB_V_V16T0		".long	0x02028827\n\t"
+#define THEAD_VSB_V_V24T0		".long	0x02028c27\n\t"
+#define THEAD_VLB_V_V0T0		".long	0x012028007\n\t"
+#define THEAD_VLB_V_V8T0		".long	0x012028407\n\t"
+#define THEAD_VLB_V_V16T0		".long	0x012028807\n\t"
+#define THEAD_VLB_V_V24T0		".long	0x012028c07\n\t"

-- 
2.44.0

