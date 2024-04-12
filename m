Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCAB502B2
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 04:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712895124; cv=none; b=FFjsOggeTQpI+pIeJaVp5kwq4Jn90RjTaGNZunrkWvFi6kDAzXg+85MClBzvW+auxiq3NpZyjPrjzr7rgM59ySmQ26ae40o6lOiEGi41RIsvcJ3NYFKnHRRloDv0qqjUs02e16oWBSSy1R2/Gyt+N+I/XBUr0CTIasH3UNdhPyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712895124; c=relaxed/simple;
	bh=22c5/aVaNWuzr+hY+XBBKO5QM19i5NRomlGB0sHVgMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=thwZn8IJvAZvliR7Zh4sVyDhJavvzT81xIC7YCEhLVeYDmfqoATcuhp40NFYBIuk4JSK9BhPV0xlj1fR7XNr/JqTT8RxR1jEI9Wnu1LD5nRiYyEIMhuBACQDC/qvzjkSE+Ea1xpBy41haP1YLUgGKL+rWePpiP/ShPllyuqZaZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Rn0o53U4; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Rn0o53U4"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6ea2ef1c6b6so324867a34.1
        for <linux-sunxi@lists.linux.dev>; Thu, 11 Apr 2024 21:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712895122; x=1713499922; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKwobcWgI8wbYxTmFBJi5ZSioPCQHdxuKYdZlkTVr/4=;
        b=Rn0o53U4ddYOhqpFmSxN8aYKeYNRclJUc/wxXjfPN21BzpDCkc/WOeA5+EWMC6jmCz
         ItQVPQ1lPAwv/ctYRRN+Xg4KRt0KPsPlNyaJvoKFEjJR9y4LXMEQwstYaJr/ZmKOQwql
         c6kWKCN7TgS9vFgTq9NRfOcAf2Z5QaQKrQdkfFE8CPk4npFjhHEsOpUEaziC+/ZgH6c6
         iJ0ctbnZXrQdSF1xj4Sf4qgC6cFaOT6ltRHliWeTzbPm2ds+15bLp2cGQ5CFtSTihpM9
         aH8cjoyifOb7H9/9Nh+JjQwd/MbGe7p/3pnpN8yxMepSPoB2uq5VCWC9fhhpmPN3XQGB
         4/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712895122; x=1713499922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKwobcWgI8wbYxTmFBJi5ZSioPCQHdxuKYdZlkTVr/4=;
        b=acltbs8wz+6XX0rMJ+SFSDAI4lRiL6E2qC/U6E2IhDilD0X2Q56Kn6yYd/960t+Wyl
         Uov77LZGuW5SPiwy2aSckU0zup8pPHqEz/xbFbIwV2Nho3P38181DF7wEynyNKs9Qucj
         kgj3HaOvGAcJDlwXKwdzdWcY6oCvRX+O/I9ocWGoPREhhhL3XSQBqU9rwrOnoDbyPkTj
         PjyRnSwHxUw0LaPRe/sLxhUZ/PrsdCK9VCPWOaXC7JBr5oP/VQylYQLEflJ3BnFXahKa
         o/gwUwHBLdNJRfdPTDnmrTMRXH94Yph34r0bhDXWJBo/JU/OXz1p/yetwvOBQtdzF+s+
         pJkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqR0OOAtyjekmAE0M9MUF88MFVVB5Y4+gj5wVBrVjFMZ8pA8sXt/HVgXDmktG8wJnMrTDIaQ0h0DqU3oTRKEKYn9ZH69uqwT4biUg=
X-Gm-Message-State: AOJu0Yw7jS/1a0v8v2KRusnF+gWtmtb9+Cyop89E+Jlg5XmPtfmsrLCJ
	5IDN8WVE7eYhSTRKTziZ1gzzhRnKJhsa0Yafvj6rjD0eCZiXwiSAq67PwTSYxhc=
X-Google-Smtp-Source: AGHT+IH/B2/q4/6s1iCXztXFmKC8ZMz57okvrKhf61ydgsJdbMqDfSUZTC+42ieBTBDQk8F0BlEoIg==
X-Received: by 2002:a05:6871:b216:b0:233:1027:af37 with SMTP id bb22-20020a056871b21600b002331027af37mr1371136oac.45.1712895121654;
        Thu, 11 Apr 2024 21:12:01 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e57247f4e5sm1949712pfb.8.2024.04.11.21.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:12:00 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 11 Apr 2024 21:11:22 -0700
Subject: [PATCH 16/19] riscv: hwprobe: Add vendor extension probing
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-dev-charlie-support_thead_vector_6_9-v1-16-4af9815ec746@rivosinc.com>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712895091; l=5003;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=22c5/aVaNWuzr+hY+XBBKO5QM19i5NRomlGB0sHVgMA=;
 b=pSFVAl7ovaKyV4/QquVHHir19tkGWmouC1DS4HubxRE92K7fLdvS806y8SJCtr97rk2lVaa9+
 t6sWoWrVE9wDPWmXRGpxtPXEu9YureRbs6cYbraan8GObD8mTcJj6Qp
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Add a new hwprobe key "RISCV_HWPROBE_KEY_VENDOR_EXT_0" which allows
userspace to probe for the new RISCV_ISA_VENDOR_EXT_XTHEADVECTOR vendor
extension.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/hwprobe.h      |  4 +--
 arch/riscv/include/uapi/asm/hwprobe.h | 10 +++++-
 arch/riscv/kernel/sys_hwprobe.c       | 59 +++++++++++++++++++++++++++++++++--
 3 files changed, 68 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 630507dff5ea..e68496b4f8de 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
- * Copyright 2023 Rivos, Inc
+ * Copyright 2023-2024 Rivos, Inc
  */
 
 #ifndef _ASM_HWPROBE_H
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 6
+#define RISCV_HWPROBE_MAX_KEY 7
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9f2a8e3ff204..6614d3adfc75 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
- * Copyright 2023 Rivos, Inc
+ * Copyright 2023-2024 Rivos, Inc
  */
 
 #ifndef _UAPI_ASM_HWPROBE_H
@@ -67,6 +67,14 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
 #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
+/*
+ * It is not possible for one CPU to have multiple vendor ids, so each vendor
+ * has its own vendor extension "namespace". The keys for each vendor starts
+ * at zero.
+ */
+#define RISCV_HWPROBE_KEY_VENDOR_EXT_0	7
+ /* T-Head */
+#define		RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR	(1 << 0)
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index e0a42c851511..365ce7380443 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -69,7 +69,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	if (riscv_isa_extension_available(NULL, c))
 		pair->value |= RISCV_HWPROBE_IMA_C;
 
-	if (has_vector() && !riscv_has_vendor_extension_unlikely(RISCV_ISA_VENDOR_EXT_XTHEADVECTOR))
+	if (has_vector() &&
+	    !__riscv_isa_vendor_extension_available(NULL, RISCV_ISA_VENDOR_EXT_XTHEADVECTOR))
 		pair->value |= RISCV_HWPROBE_IMA_V;
 
 	/*
@@ -112,7 +113,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZACAS);
 		EXT_KEY(ZICOND);
 
-		if (has_vector() && !riscv_has_vendor_extension_unlikely(RISCV_ISA_VENDOR_EXT_XTHEADVECTOR)) {
+		if (has_vector() &&
+		    !riscv_has_vendor_extension_unlikely(RISCV_ISA_VENDOR_EXT_XTHEADVECTOR)) {
 			EXT_KEY(ZVBB);
 			EXT_KEY(ZVBC);
 			EXT_KEY(ZVKB);
@@ -139,6 +141,55 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	pair->value &= ~missing;
 }
 
+static void hwprobe_isa_vendor_ext0(struct riscv_hwprobe *pair,
+				    const struct cpumask *cpus)
+{
+	int cpu;
+	u64 missing = 0;
+
+	pair->value = 0;
+
+	struct riscv_hwprobe mvendorid = {
+		.key = RISCV_HWPROBE_KEY_MVENDORID,
+		.value = 0
+	};
+
+	hwprobe_arch_id(&mvendorid, cpus);
+
+	/* Set value to zero if CPUs in the set do not have the same vendor. */
+	if (mvendorid.value == -1ULL)
+		return;
+
+	/*
+	 * Loop through and record vendor extensions that 1) anyone has, and
+	 * 2) anyone doesn't have.
+	 */
+	for_each_cpu(cpu, cpus) {
+		struct riscv_isainfo *isavendorinfo = &hart_isa_vendor[cpu];
+
+#define VENDOR_EXT_KEY(ext)								\
+	do {										\
+		if (__riscv_isa_vendor_extension_available(isavendorinfo->isa,		\
+							 RISCV_ISA_VENDOR_EXT_##ext))	\
+			pair->value |= RISCV_HWPROBE_VENDOR_EXT_##ext;			\
+		else									\
+			missing |= RISCV_HWPROBE_VENDOR_EXT_##ext;			\
+	} while (false)
+
+	/*
+	 * Only use VENDOR_EXT_KEY() for extensions which can be exposed to userspace,
+	 * regardless of the kernel's configuration, as no other checks, besides
+	 * presence in the hart_vendor_isa bitmap, are made.
+	 */
+	VENDOR_EXT_KEY(XTHEADVECTOR);
+
+#undef VENDOR_EXT_KEY
+	}
+
+	/* Now turn off reporting features if any CPU is missing it. */
+	pair->value &= ~missing;
+}
+
 static bool hwprobe_ext0_has(const struct cpumask *cpus, unsigned long ext)
 {
 	struct riscv_hwprobe pair;
@@ -216,6 +267,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 			pair->value = riscv_cboz_block_size;
 		break;
 
+	case RISCV_HWPROBE_KEY_VENDOR_EXT_0:
+		hwprobe_isa_vendor_ext0(pair, cpus);
+		break;
+
 	/*
 	 * For forward compatibility, unknown keys don't fail the whole
 	 * call, but get their element key set to -1 and value set to 0

-- 
2.44.0

