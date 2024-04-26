Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9729940878
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 21:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714166988; cv=none; b=PadU8XVGP7nmwkTVJZkYaGguPI+SkS7JZpN2v4/hvU3H/COR33Ke8n4IhT2vXdjjs7mUUQnGhJdFcYXda5nn8aAUgpaTQ5dTka3ZuDYFmX06Mg9T+PXcwZLyDe69lFIgrrz8dbTKsFR6jD+Bmh+wchfSZMYqpEJz4LQYrqgQOlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714166988; c=relaxed/simple;
	bh=xeqJIwHgg7hD2jKSz84QKxwBuWWYOka1Bl9jLn+Zfjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OKehqsqLTCiYqG868V/mzCcJTmhcUdiDlR+PxYMTcUJ4QKao2I9jBhUPiA243kh5/0tr/u83MrGfANB+Z9BEuyCXu6z5cH06neQ+BFJIf70YdYuZtIqrFTJkm9eTwKB3NETkRDqEaD9pVGw0o6KkB8MRWzcfLhqiSxsglmQ+AWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=WAK6bI/K; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="WAK6bI/K"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e2bbc2048eso23471395ad.3
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 14:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714166985; x=1714771785; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pOMs4h32AkZXkWKzzhZnFPMyLuFsGIiFaMimgT9NIKQ=;
        b=WAK6bI/K1pTuaeEzR60g5P0CmBNgXZPlw2dv1Id/2UgU/Qdnz7bbVOejGTQiiCVUbF
         NJixouwgl/T6YfYM37IoUoLYYKnvOS7J+vCWZnls8TDtpDRAc38gXb8rIdMLIGhzHWJY
         wqkI98cB4tnPTwMJb9uhpNQySO0ORaHxTzJNP/nLH5fv5OF6LY0VmI5RZhHSDG1fw5Dn
         yBSqamnCaS5iHPvmcUTcPex/0qJwhhdiWzDzS+yYmtwv60c9uHSgfyfnTMbEr8hpEkl3
         N4aSpiTBJTMMx4aJPC/hNuCDUb4G9yhvNArmenWkOeaL42sOztfjEDkVword+H29ZOuW
         fDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714166985; x=1714771785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pOMs4h32AkZXkWKzzhZnFPMyLuFsGIiFaMimgT9NIKQ=;
        b=TECiadAJK4102LaxxTxhW/X0q4dItx3+FGaI0rlsFQiolVVhEf2oKdCcSL5vIMYPtl
         tmo6p41kOQCY2t7ObY+85v0LArnw7dMgJlVQVqj7NlofL8X4WSyIUu7CqS71/uBJcq/c
         CdVw8l60QRcK2GBBlfbElrUCm5I/cVCkjs673fmJOHlgsqlT1aNfGbIg6HsqhWm2ox6k
         +SUX14DA2d0AWP+2SOCLyrKpTqTt3pVnCKwVYQemBbvYWpHwYoamoIKYohsw69HtgWYM
         pE4MSB1OqrGTNlzISOGJlCzA3vhZg7DD9V7hGJo8g2O3O1FK9xT06m6FA3+JhFdJU1eS
         1wAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL5GpMu75elMKL/enA5PJBEvSfeQ+Mndx9ZuU9h2B1hCDiRxKr0Idp8peSaEujv6BhG+Fmm144c1ilHhPsjA30UxyXMEyKFud2zig=
X-Gm-Message-State: AOJu0YxqTyBt6w2bxMTUFIgucLjFxxWFdt8jXfhFBlgBboO+FOoAwoXE
	pCFKNAehpOByGYnYoT/z44hkJXSoSINPjH64LIU0J4bg/t22KoUhlYvEjNirRpM=
X-Google-Smtp-Source: AGHT+IE4HRO2HvWPKWCsaUl05qCSHyEqF1FhN3eAiIk/SiGVJKE5JJUCtiWopLF1klv+Rz4K2Ni3eA==
X-Received: by 2002:a17:903:2445:b0:1e4:17e4:3a49 with SMTP id l5-20020a170903244500b001e417e43a49mr5024754pls.12.1714166984775;
        Fri, 26 Apr 2024 14:29:44 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b3-20020a170902650300b001ea2838fa5dsm7226720plk.76.2024.04.26.14.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:29:42 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 26 Apr 2024 14:29:22 -0700
Subject: [PATCH v4 08/16] riscv: Convert xandespmu to use the vendor
 extension framework
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-dev-charlie-support_thead_vector_6_9-v4-8-b692f3c516ec@rivosinc.com>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
In-Reply-To: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714166962; l=8762;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=xeqJIwHgg7hD2jKSz84QKxwBuWWYOka1Bl9jLn+Zfjo=;
 b=udCuM5AcqxC71KiPQVbM297gYikFWih/fHpQHVIS2JWfbqsIAe+lQenpnq+Buqd3naQueOwpJ
 63pmjJV6AvZC/6b3bhzQkX94DSlbv2hVZCTMBNQQfNIrnBgu4Q5FCgY
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Migrate xandespmu out of riscv_isa_ext and into a new Andes-specific
vendor namespace.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig.vendor                        | 12 ++++++++
 arch/riscv/errata/andes/errata.c                 |  2 ++
 arch/riscv/include/asm/hwcap.h                   |  1 -
 arch/riscv/include/asm/vendor_extensions/andes.h | 19 +++++++++++++
 arch/riscv/kernel/cpufeature.c                   |  1 -
 arch/riscv/kernel/vendor_extensions.c            | 11 ++++++++
 arch/riscv/kernel/vendor_extensions/Makefile     |  1 +
 arch/riscv/kernel/vendor_extensions/andes.c      | 35 ++++++++++++++++++++++++
 drivers/perf/riscv_pmu_sbi.c                     |  9 ++++--
 9 files changed, 86 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/Kconfig.vendor b/arch/riscv/Kconfig.vendor
index 4fc86810af1d..d47c0e7a250f 100644
--- a/arch/riscv/Kconfig.vendor
+++ b/arch/riscv/Kconfig.vendor
@@ -16,4 +16,16 @@ config RISCV_ISA_VENDOR_EXT_THEAD
 	  If you don't know what to do here, say Y.
 endmenu
 
+menu "Andes"
+config RISCV_ISA_VENDOR_EXT_ANDES
+	bool "Andes vendor extension support"
+	default y
+	help
+	  Say N here if you want to disable all Andes vendor extension
+	  support. This will cause any Andes vendor extensions that are
+	  requested by hardware probing to be ignored.
+
+	  If you don't know what to do here, say Y.
+endmenu
+
 endmenu
diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/errata.c
index f2708a9494a1..a5d96a7a4682 100644
--- a/arch/riscv/errata/andes/errata.c
+++ b/arch/riscv/errata/andes/errata.c
@@ -65,6 +65,8 @@ void __init_or_module andes_errata_patch_func(struct alt_entry *begin, struct al
 					      unsigned long archid, unsigned long impid,
 					      unsigned int stage)
 {
+	BUILD_BUG_ON(ERRATA_ANDES_NUMBER >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
+
 	if (stage == RISCV_ALTERNATIVES_BOOT)
 		errata_probe_iocp(stage, archid, impid);
 
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e17d0078a651..1f2d2599c655 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -80,7 +80,6 @@
 #define RISCV_ISA_EXT_ZFA		71
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
-#define RISCV_ISA_EXT_XANDESPMU		74
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/asm/vendor_extensions/andes.h b/arch/riscv/include/asm/vendor_extensions/andes.h
new file mode 100644
index 000000000000..54b0ad1a409d
--- /dev/null
+++ b/arch/riscv/include/asm/vendor_extensions/andes.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_ANDES_H
+#define _ASM_RISCV_VENDOR_EXTENSIONS_ANDES_H
+
+#include <asm/vendor_extensions.h>
+
+#include <linux/types.h>
+
+#define RISCV_ISA_VENDOR_EXT_XANDESPMU		0
+
+/*
+ * Extension keys should be strictly less than max.
+ * It is safe to increment this when necessary.
+ */
+#define RISCV_ISA_VENDOR_EXT_MAX_ANDES			32
+
+extern const struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_andes;
+
+#endif
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index dd7e8e0c0af1..0e2d77775e6b 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -289,7 +289,6 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
-	__RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_EXT_XANDESPMU),
 };
 
 const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/vendor_extensions.c
index eced93eec5a6..e31f16b8cec9 100644
--- a/arch/riscv/kernel/vendor_extensions.c
+++ b/arch/riscv/kernel/vendor_extensions.c
@@ -5,6 +5,7 @@
 
 #include <asm/vendorid_list.h>
 #include <asm/vendor_extensions.h>
+#include <asm/vendor_extensions/andes.h>
 #include <asm/vendor_extensions/thead.h>
 
 #include <linux/array_size.h>
@@ -14,6 +15,9 @@ const struct riscv_isa_vendor_ext_data_list *riscv_isa_vendor_ext_list[] = {
 #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
 	&riscv_isa_vendor_ext_list_thead,
 #endif
+#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_ANDES
+	&riscv_isa_vendor_ext_list_andes,
+#endif
 };
 
 const size_t riscv_isa_vendor_ext_list_size = ARRAY_SIZE(riscv_isa_vendor_ext_list);
@@ -42,6 +46,13 @@ bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsig
 		cpu_bmap = riscv_isa_vendor_ext_list_thead.per_hart_vendor_bitmap;
 		bmap_size = riscv_isa_vendor_ext_list_thead.bitmap_size;
 		break;
+#endif
+#ifdef CONFIG_RISCV_VENDOR_EXT_ANDES
+	case ANDES_VENDOR_ID:
+		bmap = riscv_isa_vendor_ext_list_andes.vendor_bitmap;
+		cpu_bmap = riscv_isa_vendor_ext_list_andes.per_hart_vendor_bitmap;
+		bmap_size = riscv_isa_vendor_ext_list_andes.bitmap_size;
+		break;
 #endif
 	default:
 		return false;
diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/kernel/vendor_extensions/Makefile
index 3383066baaab..8f1c5a4dc38f 100644
--- a/arch/riscv/kernel/vendor_extensions/Makefile
+++ b/arch/riscv/kernel/vendor_extensions/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead.o
+obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)	+= andes.o
diff --git a/arch/riscv/kernel/vendor_extensions/andes.c b/arch/riscv/kernel/vendor_extensions/andes.c
new file mode 100644
index 000000000000..8451106d2e07
--- /dev/null
+++ b/arch/riscv/kernel/vendor_extensions/andes.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <asm/cpufeature.h>
+#include <asm/vendor_extensions.h>
+#include <asm/vendor_extensions/andes.h>
+
+#include <linux/array_size.h>
+#include <linux/types.h>
+
+const struct riscv_isa_ext_data riscv_isa_vendor_ext_andes[] = {
+	__RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_VENDOR_EXT_XANDESPMU),
+};
+
+/*
+ * The first member of this struct must be a bitmap named isa so it can be
+ * compatible with riscv_isainfo even though the sizes of the bitmaps may be
+ * different.
+ */
+struct riscv_isavendorinfo_andes {
+	DECLARE_BITMAP(isa, RISCV_ISA_VENDOR_EXT_MAX_ANDES);
+};
+
+/* Hart specific T-Head vendor extension support */
+static struct riscv_isavendorinfo_andes hart_vendorinfo_andes[NR_CPUS];
+
+/* Set of T-Head vendor extensions supported on all harts */
+DECLARE_BITMAP(vendorinfo_andes, RISCV_ISA_VENDOR_EXT_MAX_ANDES);
+
+const struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_andes = {
+	.ext_data = riscv_isa_vendor_ext_andes,
+	.per_hart_vendor_bitmap = (struct riscv_isainfo *)hart_vendorinfo_andes,
+	.vendor_bitmap = vendorinfo_andes,
+	.ext_data_count = ARRAY_SIZE(riscv_isa_vendor_ext_andes),
+	.bitmap_size = RISCV_ISA_VENDOR_EXT_MAX_ANDES
+};
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 8cbe6e5f9c39..d39b01372fa5 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -24,6 +24,8 @@
 #include <asm/errata_list.h>
 #include <asm/sbi.h>
 #include <asm/cpufeature.h>
+#include <asm/vendorid_list.h>
+#include <asm/vendor_extensions/andes.h>
 
 #define ALT_SBI_PMU_OVERFLOW(__ovl)					\
 asm volatile(ALTERNATIVE_2(						\
@@ -32,7 +34,7 @@ asm volatile(ALTERNATIVE_2(						\
 		THEAD_VENDOR_ID, ERRATA_THEAD_PMU,			\
 		CONFIG_ERRATA_THEAD_PMU,				\
 	"csrr %0, " __stringify(ANDES_CSR_SCOUNTEROF),			\
-		0, RISCV_ISA_EXT_XANDESPMU,				\
+		ANDES_VENDOR_ID, RISCV_ISA_VENDOR_EXT_XANDESPMU,	\
 		CONFIG_ANDES_CUSTOM_PMU)				\
 	: "=r" (__ovl) :						\
 	: "memory")
@@ -41,7 +43,7 @@ asm volatile(ALTERNATIVE_2(						\
 asm volatile(ALTERNATIVE(						\
 	"csrc " __stringify(CSR_IP) ", %0\n\t",				\
 	"csrc " __stringify(ANDES_CSR_SLIP) ", %0\n\t",			\
-		0, RISCV_ISA_EXT_XANDESPMU,				\
+		ANDES_VENDOR_ID, RISCV_ISA_VENDOR_EXT_XANDESPMU,	\
 		CONFIG_ANDES_CUSTOM_PMU)				\
 	: : "r"(__irq_mask)						\
 	: "memory")
@@ -837,7 +839,8 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pde
 		   riscv_cached_mimpid(0) == 0) {
 		riscv_pmu_irq_num = THEAD_C9XX_RV_IRQ_PMU;
 		riscv_pmu_use_irq = true;
-	} else if (riscv_isa_extension_available(NULL, XANDESPMU) &&
+	} else if (riscv_has_vendor_extension_unlikely(ANDES_VENDOR_ID,
+						       RISCV_ISA_VENDOR_EXT_XANDESPMU) &&
 		   IS_ENABLED(CONFIG_ANDES_CUSTOM_PMU)) {
 		riscv_pmu_irq_num = ANDES_SLI_CAUSE_BASE + ANDES_RV_IRQ_PMOVI;
 		riscv_pmu_use_irq = true;

-- 
2.44.0

