Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C75315B143
	for <linux-sunxi@lists.linux.dev>; Fri,  3 May 2024 18:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760349; cv=none; b=Zpks51S1Pl5dJpY6nZpI2dU7xjaprEBVo80sDXQY+nHeFopkPwwKrQpa916ug7pJ3my3RC8yG52D14MYtf94risJeqVPJLJZMjFEtqHEd2UdAXHNtL5aNSo8bpelfkTGmEXHqvHjFjdhOpKMXCbJUk6/iRK8Bq/if0NT9qkZTa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760349; c=relaxed/simple;
	bh=fwxPC9e5acCJKXfvxD0QuLfngnuG8uQUjT/zUUS4iJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SCNM52IMHXQ3MLYxlYJ+qCgK3yvO/Rye7WS2BbD03z8v8wkP6p1eDwyLdCk4iXZvr5jrWUh+preCJHyB6klNrlM7TJiLmm6s93ckzGEpan9FMLmeauB8O5Du+5L5TL9nxB19ihO5HltHdJgBl7eInpMmIIIPEmSgPasp2rqcjsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=CyqmA9jz; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="CyqmA9jz"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6ee13f19e7eso10275b3a.1
        for <linux-sunxi@lists.linux.dev>; Fri, 03 May 2024 11:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714760348; x=1715365148; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLBLJWgoI5ONq0p19OcZNiSMS9NNG1Jn9M7ZhOPyPpg=;
        b=CyqmA9jzuRVlJFy4JmNC7NjswVvteSANOMmquVeSt3XwXw5wLfd4Dp3jWLEL0lxUNf
         2YaBerAnkY/4bzkpbHCyhHowXMltTwyGlEg6BySqFTbwtau0m6ml4PQPd98poRo7y1uc
         CTyE7SliQk0nMfrMtqhL8Z2Wmt4/DdbZ4qdWsW65Se9ECGWK4hq/zXV56tgRW6cDnY99
         Dl2Sb1fHioioaQzPK644SJRTK9eM/Tl3pwhKmHn15CxVp5gJET6YJ7nm7dkwl2aCkPLY
         Dm6hWc9u36CDGLpMeRC0Y3I3fOcyxg3QnP5imaHoa29CX6B2LwVZFvIeDTDmMJlXMR8X
         Z8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760348; x=1715365148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLBLJWgoI5ONq0p19OcZNiSMS9NNG1Jn9M7ZhOPyPpg=;
        b=H0c0u2ja4z5UiIZ8LAsA68RyxeFF4ObAeZLd3ewR5h9KzzI7KdK5NTurSL1nVQQi3f
         BgbgLUOSHS4i0BEMpaoqTsqGOGByz4ATcHEpdjl8KnDx7SkBEm0aP1yd8kiO8i8J4KEo
         wUFCnXhnWV1T9By5L8zWUhK2wKGvsfmTlzD4CPwFWY4O8gy9g3lBfv5XveJUjnrcgWO4
         y/24y/sm060AJO13yp/Qf0zi2fq6KP06EAcB/ED/zyOrCBvOCYNKaqjVZan9uJjeyC6d
         vnzqetwDDUsEoVQYCCVQSVI5VdzOCEFSsq4Lcf8leCWfmdQQEEkGAxsEOZzYmjkOe1fE
         rgxw==
X-Forwarded-Encrypted: i=1; AJvYcCX7ayDdMCK850yngTjLC4JMrXW4v/zIFOb7mkCPefLyXAHMhmwaeaUz2/gBp/RoKbgk1y8erWog4976hgwE+amkUILuYXiEfARA/U4=
X-Gm-Message-State: AOJu0Yw1oHf/2X8keDGE26O1D8dMD/Z7+WBN8+mN9MoOMZGg0ILGYB01
	euPEC+8f96xgPOwR9hbZy59Tkm90eUtz4XBYO5nIaHt7s3T66pjTlZIDGFGZL8sZJ09hdiy9I/F
	A
X-Google-Smtp-Source: AGHT+IFpd0GjwjtDFrGFdOgb28GX7E5A84WrU9nww/Fc6oikSNFplYSG78IpCN90Vvy5bJGvfi7P+Q==
X-Received: by 2002:a05:6a00:8c4:b0:6e6:89ad:1233 with SMTP id s4-20020a056a0008c400b006e689ad1233mr4026532pfu.2.1714760347890;
        Fri, 03 May 2024 11:19:07 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fu6-20020a056a00610600b006f3f5d3595fsm3355421pfb.80.2024.05.03.11.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:19:07 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 03 May 2024 11:18:27 -0700
Subject: [PATCH v6 12/17] riscv: Add xtheadvector instruction definitions
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-dev-charlie-support_thead_vector_6_9-v6-12-cb7624e65d82@rivosinc.com>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714760319; l=1908;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=fwxPC9e5acCJKXfvxD0QuLfngnuG8uQUjT/zUUS4iJ0=;
 b=Onr8XJTzFkGHOux99DIgUZXs1b9d+YcK226SmnBPnkCifc4zEA/CelPcAWTyhcOig7svSCUUI
 loL72CiVW4xBpDmLkunPNu4gWtqd89zT8YDIgri2Nv/sOqXqJzDCf47
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

xtheadvector uses different encodings than standard vector for
vsetvli and vector loads/stores. Write the instruction formats to be
used in assembly code.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/vendor_extensions/thead.h | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/include/asm/vendor_extensions/thead.h b/arch/riscv/include/asm/vendor_extensions/thead.h
index 48421d1553ad..27a253a20ab8 100644
--- a/arch/riscv/include/asm/vendor_extensions/thead.h
+++ b/arch/riscv/include/asm/vendor_extensions/thead.h
@@ -13,4 +13,30 @@
 
 extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_thead;
 
+/* Extension specific helpers */
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
+
 #endif

-- 
2.44.0

