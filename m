Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DEC146D6D
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Jul 2024 16:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721405952; cv=none; b=qk3n1m1sqsEqtJYJpEGSMlwrZxNNaQBKwoCp27R25Eu3HWrUW897mXywnl5jY95x2lPQ7UscZyaKdTOkMbJLS0QCarqtS31FtyPwiWxo2mQfwPrt/KnfJRD9c79tb5tHTB/yP8c79dDZAT6Y1KMJdLZsbDzMqyJ2lFyJbF86gVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721405952; c=relaxed/simple;
	bh=M+1BS68dt7Jh5BDKNUbAmq4jayBxd0dfxnDuF0LILQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=glfD/xz9lnyAgpwuXVMHiHGw+mSYhAzkqsacukI/DEfX3W+F+kNlZUBWLVpKeQCrfqY31DAiS3Sb795IJOMfgKUP/UEGROz6NM8ktl8QMAoReyOFwPEHl2P3/CfKDaWfmowe8NmrCXDn/NTnp+DFuvIIHBRYjzoDDGxQBOgusAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=qqC738y9; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="qqC738y9"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fc5296e214so17672655ad.0
        for <linux-sunxi@lists.linux.dev>; Fri, 19 Jul 2024 09:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721405950; x=1722010750; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sBB60L3vIBLp+F/JpYya3NHcSC2vXYtRWb/t7HsnMxM=;
        b=qqC738y93Suc2y06vuxRzlwmf+CfAfEnfSl258UG7jRFTBb+p3c+YBzxjN5Mh6EK9T
         rBUmNWKkTYvHrZDxKfNO0HgjvBW0UAn5931cLH80G9+AH+AYAeTmAMkTWFUOkMLCekh/
         ZRohv7xunYJpvRd7I6k5bXPiWJkRJQDXAi7s/6hUKb7/nl6QEGrJ2F5q0YUz0PTr8hZ6
         XL8jKx40OA1T1a3erP42mvOUBcwI5mC9n7QGf2coqTQiNLfLEwkvdBe78Dnf+xWMk2wz
         clmS+XbZB1t3+JqgJDX2jsUa3u/yeGM4PjRViI97HOs8FuqSFUrrFEVty/ZZvcaAPdPo
         0sqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405950; x=1722010750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sBB60L3vIBLp+F/JpYya3NHcSC2vXYtRWb/t7HsnMxM=;
        b=BPPu0RNm+/Fmb9lfg2fMpTE4fF/wYXKQt8TEAjzqcBizflwijnJRnqP+54m2vhP4dG
         zrb51J8BNqElMSyDqAgvKG0SD9x/7dw0fBNtAI3jg3h9129mNFqXZaHNpXLpuBUupO+Q
         qlLIiQcN9b8lxeySdgUos9USirbZ3k9g7aTBe6bOi5SkJ4c+yNpuuePzD6BlalIK8Cnz
         KYok1p7RtGMlu8f19VrPR5GkhbysUl7fWW6XcXVPYLDu6WAGyA4dnZstbKjHqEDVMrrP
         f4EXc97t3BJ5d4Rxu5MXYdddIKidJV1aLR/DeulmwHdTicpzKhfJ6TcFvGM7bot1yQyb
         yRZA==
X-Forwarded-Encrypted: i=1; AJvYcCVrt5ydEQRSdFH8g2l+fm8if1b4SPRMMSeao/fqgrtlVxAxozMhdvkTWRMBDqIowh/am9d4Pl0oXyd8cOSzsCo3i+rObZJK+a50STE=
X-Gm-Message-State: AOJu0YyX9OMMRhnL6ecqTjcwxFckAMBOjZW8XwU90AzipO6UP1OEYrXo
	Z4b6bTgbU3ge/ryuQ7Dik0JUY0WNTwCiSI3b1keB5FLhgEIS4CJpWuDV11jil6g=
X-Google-Smtp-Source: AGHT+IHQvb1Ny5+PmxaAGaIlj/SKlYDI/H2LVNZdMrBDdSGb1YklHAR22Bm9QF+nCPS3AGfgzqNLBw==
X-Received: by 2002:a17:902:ecc5:b0:1fb:7978:6b1 with SMTP id d9443c01a7336-1fd74578fb2mr4376615ad.31.1721405950516;
        Fri, 19 Jul 2024 09:19:10 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f490dcbsm6461435ad.297.2024.07.19.09.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:19:09 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 19 Jul 2024 09:18:59 -0700
Subject: [PATCH v5 04/13] riscv: Add thead and xtheadvector as a vendor
 extension
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-xtheadvector-v5-4-4b485fc7d55f@rivosinc.com>
References: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
In-Reply-To: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721405940; l=5053;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=M+1BS68dt7Jh5BDKNUbAmq4jayBxd0dfxnDuF0LILQU=;
 b=ZSmWhsyqvbJIyDN7h9xvm46Zg/931UNHVSUHQxzLFFeJr2k8aS3IR0sMkQuimETs3iQ1GmGF5
 W6UtdCuPpbaD9SpovbUHo29wn8GglJ9bV6wA6WH3OEIq3pD52j4FAaB
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Add support to the kernel for THead vendor extensions with the target of
the new extension xtheadvector.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.vendor                        | 13 +++++++++++++
 arch/riscv/include/asm/vendor_extensions/thead.h | 16 ++++++++++++++++
 arch/riscv/kernel/cpufeature.c                   |  1 +
 arch/riscv/kernel/vendor_extensions.c            | 10 ++++++++++
 arch/riscv/kernel/vendor_extensions/Makefile     |  1 +
 arch/riscv/kernel/vendor_extensions/thead.c      | 18 ++++++++++++++++++
 6 files changed, 59 insertions(+)

diff --git a/arch/riscv/Kconfig.vendor b/arch/riscv/Kconfig.vendor
index 6f1cdd32ed29..9897442bd44f 100644
--- a/arch/riscv/Kconfig.vendor
+++ b/arch/riscv/Kconfig.vendor
@@ -16,4 +16,17 @@ config RISCV_ISA_VENDOR_EXT_ANDES
 	  If you don't know what to do here, say Y.
 endmenu
 
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
 endmenu
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
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 271bb0917fcb..041e5e8f8312 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -25,6 +25,7 @@
 #include <asm/sbi.h>
 #include <asm/vector.h>
 #include <asm/vendor_extensions.h>
+#include <asm/vendor_extensions/thead.h>
 
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/vendor_extensions.c
index b6c1e7b5d34b..662ba64a8f93 100644
--- a/arch/riscv/kernel/vendor_extensions.c
+++ b/arch/riscv/kernel/vendor_extensions.c
@@ -6,6 +6,7 @@
 #include <asm/vendorid_list.h>
 #include <asm/vendor_extensions.h>
 #include <asm/vendor_extensions/andes.h>
+#include <asm/vendor_extensions/thead.h>
 
 #include <linux/array_size.h>
 #include <linux/types.h>
@@ -14,6 +15,9 @@ struct riscv_isa_vendor_ext_data_list *riscv_isa_vendor_ext_list[] = {
 #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_ANDES
 	&riscv_isa_vendor_ext_list_andes,
 #endif
+#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
+	&riscv_isa_vendor_ext_list_thead,
+#endif
 };
 
 const size_t riscv_isa_vendor_ext_list_size = ARRAY_SIZE(riscv_isa_vendor_ext_list);
@@ -41,6 +45,12 @@ bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsig
 		cpu_bmap = &riscv_isa_vendor_ext_list_andes.per_hart_isa_bitmap[cpu];
 		break;
 	#endif
+	#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
+	case THEAD_VENDOR_ID:
+		bmap = &riscv_isa_vendor_ext_list_thead.all_harts_isa_bitmap;
+		cpu_bmap = &riscv_isa_vendor_ext_list_thead.per_hart_isa_bitmap[cpu];
+		break;
+	#endif
 	default:
 		return false;
 	}
diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/kernel/vendor_extensions/Makefile
index 6a61aed944f1..353522cb3bf0 100644
--- a/arch/riscv/kernel/vendor_extensions/Makefile
+++ b/arch/riscv/kernel/vendor_extensions/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)	+= andes.o
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

