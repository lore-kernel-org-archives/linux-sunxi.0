Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2355615958D
	for <linux-sunxi@lists.linux.dev>; Fri,  3 May 2024 18:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760334; cv=none; b=DkGzWfdcGWLG5qj1l4ntXz3XRxJMp9aeuRRFd9ikdMgf3C5/C039cCotQTMMzperiIVNlEjESENssA9cVOrv+L1n6ii+q4yzx0EGPez1b1L9O3uD1cNTAP8PCk1NCKI7K+7EkcJ8cZod7BRCq6r2dUSwrB16uqKWMdoZnr9N5LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760334; c=relaxed/simple;
	bh=UzEc0yRARGIHVH+xpb1W1PZIYRyHFtDu9bYbzdHSNSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pyoroSN1GWkP7DoSFIwWxBWHyYbU09aJwW4qH5ZkVrMpVNECSbuOe6h2d5IcfVhvpQV4oWTIHY8Je22DW7R7k3z3XrhEk9FNws8noJGK6x6G/YWbShUxhVJGEX2tNVAUwBjnScvloR/VU/4gwcDzjoR8GU/6vdwr3zHFEAZ+siY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=GS5amWcB; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="GS5amWcB"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6f4472561f1so20330b3a.0
        for <linux-sunxi@lists.linux.dev>; Fri, 03 May 2024 11:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714760332; x=1715365132; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/aCXBTIafdM0j1fCbSwj2L/nqF062/08cNHwgBijiVY=;
        b=GS5amWcBO6x/yhl+jNfNyStR5JHemW3eVdU0zjWdI69aWnlk9TE/XxM7ZZS/Np5rIW
         Yor5McWEd7WboYxuzHzvCbW1ECd8oTvmTbvAd/raKvtPpgjs3o8wCPI+5S07cBoAmssX
         sZ+kyvo1m+IG899btCopT2z+tLD/ujSKcrEOEWXjFjGVhqp43c1QGB7pjkJkYDOGAFWi
         R/UOLhsVXNrD4IEhTzBkN1X+pxsTbcI4Jd8iglatnEKtka9hfNrHW8l8zRsihvrzBG5K
         8LAkq3XYgwZchgYbxIor3IgBNg9u9wzH7nynaHhsMW7UWiH33LP0aNLKAjaxAGmMfT1S
         bneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760332; x=1715365132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/aCXBTIafdM0j1fCbSwj2L/nqF062/08cNHwgBijiVY=;
        b=PmBAq/MyYKCiZ2kQ8UdLkx7wb0HzqrY6b3nZ93nhBJVcrZJ0LgIqI1uX9KEI+RNGsK
         l9pzUIdHXQoB0Jy2W6DSJXU103YD/0Jl3XByZspkSfcNjKGA8U72bWC/DZ37Q8FOF222
         Eul4oqBC5bURj2/SydKPQ4vCtsvi0Cc56VTnI67X8iMX8oz8t2kZIvqw0U4vNnb+6cK2
         nW1aCPyMoXE1kxmX82JOdi1DiQWJWax6X4r003xG1mlSStYNdBtcugh3BeYr0XTMNOwe
         d5nJRL9YH3e8z/QbV1TC/CtB4STq/xJ6oRpHhhu7yw0m3PdGtZblu73Qj56CONuv40fj
         KxSQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2W9i9szBHt2JFSpweMyx8ePOWCbcY9qxiJ91J+ypb6ysfnu3VwfalX5qlg0EnSe7YV1oQajeKhqh2FOEj6NqahESecCJ2O48RhDc=
X-Gm-Message-State: AOJu0Yym45RaAmIObb8u/h7Pyjs2wryiNpZ1AEPa3Q3IdKYnrMM1l3SJ
	z7aiXGS/sxTOYvkAtYevX+O+wpi+ZBEV6z4M1ASF0q+viP022LKf4I25mBQQXDw=
X-Google-Smtp-Source: AGHT+IF3lL/I9F9JP6DiIhPIFpWSigby3t/QFCUiZFk4REu0rXCsiCJEKAcVWJd/kxYUU4UwGmsujA==
X-Received: by 2002:a05:6a00:1805:b0:6ed:de86:be57 with SMTP id y5-20020a056a00180500b006edde86be57mr3871828pfa.25.1714760332334;
        Fri, 03 May 2024 11:18:52 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fu6-20020a056a00610600b006f3f5d3595fsm3355421pfb.80.2024.05.03.11.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:18:51 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 03 May 2024 11:18:20 -0700
Subject: [PATCH v6 05/17] riscv: Extend cpufeature.c to detect vendor
 extensions
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-dev-charlie-support_thead_vector_6_9-v6-5-cb7624e65d82@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714760318; l=12250;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=UzEc0yRARGIHVH+xpb1W1PZIYRyHFtDu9bYbzdHSNSY=;
 b=FvX+v5yvXmmRvTzpD4PimZRanXMKqYpXuRYIzKbfzl3fOiqgWc7BmttIAEmCltMcRjOY+2Q8B
 Oc0SNTdM1nCDxJnFTCoMal5BfESGakI+jqGjbbquPlhH7yHO/udIsZ6
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Separate vendor extensions out into one struct per vendor
instead of adding vendor extensions onto riscv_isa_ext.

Add a hidden config RISCV_ISA_VENDOR_EXT to conditionally include this
code.

The xtheadvector vendor extension is added using these changes.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig                               |  2 +
 arch/riscv/Kconfig.vendor                        | 19 +++++
 arch/riscv/include/asm/cpufeature.h              | 18 +++++
 arch/riscv/include/asm/vendor_extensions.h       | 34 +++++++++
 arch/riscv/include/asm/vendor_extensions/thead.h | 16 ++++
 arch/riscv/kernel/Makefile                       |  2 +
 arch/riscv/kernel/cpufeature.c                   | 93 +++++++++++++++++++-----
 arch/riscv/kernel/vendor_extensions.c            | 18 +++++
 arch/riscv/kernel/vendor_extensions/Makefile     |  3 +
 arch/riscv/kernel/vendor_extensions/thead.c      | 18 +++++
 10 files changed, 203 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index be09c8836d56..fec86fba3acd 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -759,6 +759,8 @@ config RISCV_EFFICIENT_UNALIGNED_ACCESS
 
 endchoice
 
+source "arch/riscv/Kconfig.vendor"
+
 endmenu # "Platform type"
 
 menu "Kernel features"
diff --git a/arch/riscv/Kconfig.vendor b/arch/riscv/Kconfig.vendor
new file mode 100644
index 000000000000..85ac30496b0e
--- /dev/null
+++ b/arch/riscv/Kconfig.vendor
@@ -0,0 +1,19 @@
+menu "Vendor extensions"
+
+config RISCV_ISA_VENDOR_EXT
+	bool
+
+menu "T-Head"
+config RISCV_ISA_VENDOR_EXT_THEAD
+	bool "T-Head vendor extension support"
+	select RISCV_ISA_VENDOR_EXT
+	default y
+	help
+	  Say N here to disable detection of and support for all T-Head vendor
+	  extensions. Without this option enabled, T-Head vendor extensions will
+	  not be detected at boot and their presence not reported to userspace.
+
+	  If you don't know what to do here, say Y.
+endmenu
+
+endmenu
diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 0c4f08577015..fedd479ccfd1 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -35,6 +35,24 @@ extern u32 riscv_vlenb_of;
 
 void riscv_user_isa_enable(void);
 
+#define _RISCV_ISA_EXT_DATA(_name, _id, _subset_exts, _subset_exts_size) {	\
+	.name = #_name,								\
+	.property = #_name,							\
+	.id = _id,								\
+	.subset_ext_ids = _subset_exts,						\
+	.subset_ext_size = _subset_exts_size					\
+}
+
+#define __RISCV_ISA_EXT_DATA(_name, _id) _RISCV_ISA_EXT_DATA(_name, _id, NULL, 0)
+
+/* Used to declare pure "lasso" extension (Zk for instance) */
+#define __RISCV_ISA_EXT_BUNDLE(_name, _bundled_exts) \
+	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, _bundled_exts, ARRAY_SIZE(_bundled_exts))
+
+/* Used to declare extensions that are a superset of other extensions (Zvbb for instance) */
+#define __RISCV_ISA_EXT_SUPERSET(_name, _id, _sub_exts) \
+	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts))
+
 #if defined(CONFIG_RISCV_MISALIGNED)
 bool check_unaligned_access_emulated_all_cpus(void);
 void unaligned_emulation_finish(void);
diff --git a/arch/riscv/include/asm/vendor_extensions.h b/arch/riscv/include/asm/vendor_extensions.h
new file mode 100644
index 000000000000..bf4dac66e6e6
--- /dev/null
+++ b/arch/riscv/include/asm/vendor_extensions.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2024 Rivos, Inc
+ */
+
+#ifndef _ASM_VENDOR_EXTENSIONS_H
+#define _ASM_VENDOR_EXTENSIONS_H
+
+#include <asm/cpufeature.h>
+
+#include <linux/array_size.h>
+#include <linux/types.h>
+
+/*
+ * The extension keys of each vendor must be strictly less than this value.
+ */
+#define RISCV_ISA_VENDOR_EXT_MAX 32
+
+struct riscv_isavendorinfo {
+	DECLARE_BITMAP(isa, RISCV_ISA_VENDOR_EXT_MAX);
+};
+
+struct riscv_isa_vendor_ext_data_list {
+	const size_t ext_data_count;
+	const struct riscv_isa_ext_data *ext_data;
+	struct riscv_isavendorinfo per_hart_isa_bitmap[NR_CPUS];
+	struct riscv_isavendorinfo all_harts_isa_bitmap;
+};
+
+extern struct riscv_isa_vendor_ext_data_list *riscv_isa_vendor_ext_list[];
+
+extern const size_t riscv_isa_vendor_ext_list_size;
+
+#endif /* _ASM_VENDOR_EXTENSIONS_H */
diff --git a/arch/riscv/include/asm/vendor_extensions/thead.h b/arch/riscv/include/asm/vendor_extensions/thead.h
new file mode 100644
index 000000000000..48421d1553ad
--- /dev/null
+++ b/arch/riscv/include/asm/vendor_extensions/thead.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_THEAD_H
+#define _ASM_RISCV_VENDOR_EXTENSIONS_THEAD_H
+
+#include <asm/vendor_extensions.h>
+
+#include <linux/types.h>
+
+/*
+ * Extension keys must be strictly less than RISCV_ISA_VENDOR_EXT_MAX.
+ */
+#define RISCV_ISA_VENDOR_EXT_XTHEADVECTOR		0
+
+extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_thead;
+
+#endif
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 81d94a8ee10f..53361c50fb46 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -58,6 +58,8 @@ obj-y	+= riscv_ksyms.o
 obj-y	+= stacktrace.o
 obj-y	+= cacheinfo.o
 obj-y	+= patch.o
+obj-y	+= vendor_extensions.o
+obj-y	+= vendor_extensions/
 obj-y	+= probes/
 obj-y	+= tests/
 obj-$(CONFIG_MMU) += vdso.o vdso/
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 6c143ea9592b..6019b2527c46 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -24,6 +24,7 @@
 #include <asm/processor.h>
 #include <asm/sbi.h>
 #include <asm/vector.h>
+#include <asm/vendor_extensions.h>
 
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
@@ -102,24 +103,6 @@ static bool riscv_isa_extension_check(int id)
 	return true;
 }
 
-#define _RISCV_ISA_EXT_DATA(_name, _id, _subset_exts, _subset_exts_size) {	\
-	.name = #_name,								\
-	.property = #_name,							\
-	.id = _id,								\
-	.subset_ext_ids = _subset_exts,						\
-	.subset_ext_size = _subset_exts_size					\
-}
-
-#define __RISCV_ISA_EXT_DATA(_name, _id) _RISCV_ISA_EXT_DATA(_name, _id, NULL, 0)
-
-/* Used to declare pure "lasso" extension (Zk for instance) */
-#define __RISCV_ISA_EXT_BUNDLE(_name, _bundled_exts) \
-	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, _bundled_exts, ARRAY_SIZE(_bundled_exts))
-
-/* Used to declare extensions that are a superset of other extensions (Zvbb for instance) */
-#define __RISCV_ISA_EXT_SUPERSET(_name, _id, _sub_exts) \
-	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts))
-
 static const unsigned int riscv_zk_bundled_exts[] = {
 	RISCV_ISA_EXT_ZBKB,
 	RISCV_ISA_EXT_ZBKC,
@@ -353,6 +336,21 @@ static void __init riscv_parse_isa_string(unsigned long *this_hwcap, struct risc
 		bool ext_long = false, ext_err = false;
 
 		switch (*ext) {
+		case 'x':
+		case 'X':
+			if (acpi_disabled)
+				pr_warn_once("Vendor extensions are ignored in riscv,isa. Use riscv,isa-extensions instead.");
+			/*
+			 * To skip an extension, we find its end.
+			 * As multi-letter extensions must be split from other multi-letter
+			 * extensions with an "_", the end of a multi-letter extension will
+			 * either be the null character or the "_" at the start of the next
+			 * multi-letter extension.
+			 */
+			for (; *isa && *isa != '_'; ++isa)
+				;
+			ext_err = true;
+			break;
 		case 's':
 			/*
 			 * Workaround for invalid single-letter 's' & 'u' (QEMU).
@@ -368,8 +366,6 @@ static void __init riscv_parse_isa_string(unsigned long *this_hwcap, struct risc
 			}
 			fallthrough;
 		case 'S':
-		case 'x':
-		case 'X':
 		case 'z':
 		case 'Z':
 			/*
@@ -572,6 +568,59 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 		acpi_put_table((struct acpi_table_header *)rhct);
 }
 
+static void __init riscv_fill_cpu_vendor_ext(struct device_node *cpu_node, int cpu)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))
+		return;
+
+	for (int i = 0; i < riscv_isa_vendor_ext_list_size; i++) {
+		struct riscv_isa_vendor_ext_data_list *ext_list = riscv_isa_vendor_ext_list[i];
+
+		for (int j = 0; j < ext_list->ext_data_count; j++) {
+			const struct riscv_isa_ext_data ext = ext_list->ext_data[j];
+			struct riscv_isavendorinfo *isavendorinfo = &ext_list->per_hart_isa_bitmap[cpu];
+
+			if (of_property_match_string(cpu_node, "riscv,isa-extensions",
+						     ext.property) < 0)
+				continue;
+
+			/*
+			 * Assume that subset extensions are all members of the
+			 * same vendor.
+			 */
+			if (ext.subset_ext_size)
+				for (int k = 0; k < ext.subset_ext_size; k++)
+					set_bit(ext.subset_ext_ids[k], isavendorinfo->isa);
+
+			set_bit(ext.id, isavendorinfo->isa);
+		}
+	}
+}
+
+static void __init riscv_fill_vendor_ext_list(int cpu)
+{
+	static bool first = true;
+
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))
+		return;
+
+	for (int i = 0; i < riscv_isa_vendor_ext_list_size; i++) {
+		struct riscv_isa_vendor_ext_data_list *ext_list = riscv_isa_vendor_ext_list[i];
+
+		if (first) {
+			bitmap_copy(ext_list->all_harts_isa_bitmap.isa,
+				    ext_list->per_hart_isa_bitmap[cpu].isa,
+				    RISCV_ISA_VENDOR_EXT_MAX);
+			first = false;
+		} else {
+			bitmap_and(ext_list->all_harts_isa_bitmap.isa,
+				   ext_list->all_harts_isa_bitmap.isa,
+				   ext_list->per_hart_isa_bitmap[cpu].isa,
+				   RISCV_ISA_VENDOR_EXT_MAX);
+		}
+	}
+}
+
 static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
 {
 	unsigned int cpu;
@@ -615,6 +664,8 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
 			}
 		}
 
+		riscv_fill_cpu_vendor_ext(cpu_node, cpu);
+
 		of_node_put(cpu_node);
 
 		/*
@@ -630,6 +681,8 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
 			bitmap_copy(riscv_isa, isainfo->isa, RISCV_ISA_EXT_MAX);
 		else
 			bitmap_and(riscv_isa, riscv_isa, isainfo->isa, RISCV_ISA_EXT_MAX);
+
+		riscv_fill_vendor_ext_list(cpu);
 	}
 
 	if (bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX))
diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/vendor_extensions.c
new file mode 100644
index 000000000000..03ba7949a07f
--- /dev/null
+++ b/arch/riscv/kernel/vendor_extensions.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2024 Rivos, Inc
+ */
+
+#include <asm/vendor_extensions.h>
+#include <asm/vendor_extensions/thead.h>
+
+#include <linux/array_size.h>
+#include <linux/types.h>
+
+struct riscv_isa_vendor_ext_data_list *riscv_isa_vendor_ext_list[] = {
+#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
+	&riscv_isa_vendor_ext_list_thead,
+#endif
+};
+
+const size_t riscv_isa_vendor_ext_list_size = ARRAY_SIZE(riscv_isa_vendor_ext_list);
diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/kernel/vendor_extensions/Makefile
new file mode 100644
index 000000000000..3383066baaab
--- /dev/null
+++ b/arch/riscv/kernel/vendor_extensions/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead.o
diff --git a/arch/riscv/kernel/vendor_extensions/thead.c b/arch/riscv/kernel/vendor_extensions/thead.c
new file mode 100644
index 000000000000..0934a2086473
--- /dev/null
+++ b/arch/riscv/kernel/vendor_extensions/thead.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <asm/cpufeature.h>
+#include <asm/vendor_extensions.h>
+#include <asm/vendor_extensions/thead.h>
+
+#include <linux/array_size.h>
+#include <linux/types.h>
+
+/* All T-Head vendor extensions supported in Linux */
+const struct riscv_isa_ext_data riscv_isa_vendor_ext_thead[] = {
+	__RISCV_ISA_EXT_DATA(xtheadvector, RISCV_ISA_VENDOR_EXT_XTHEADVECTOR),
+};
+
+struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_thead = {
+	.ext_data_count = ARRAY_SIZE(riscv_isa_vendor_ext_thead),
+	.ext_data = riscv_isa_vendor_ext_thead,
+};

-- 
2.44.0

