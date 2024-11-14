Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1111E1E8835
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Nov 2024 02:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731550914; cv=none; b=pKlkBOj18vFSRRLAM0Xv//ator3AusVOkteNvqefhmQ8xDi3JVVe/du8L5hkrm7uYsLPJqN9oOPxB/pBskQuwlkZb+/kldCtC62n947TvYsggvHdHacI8SWY+LtxIGzcBc1w/2A9T5GREl7Kdp5FGBJ+7lrqiOmdnGElP2U8nGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731550914; c=relaxed/simple;
	bh=vVkud4e9R47gSZgPMNDJZksRvA2HQoR5jfKAUnJsh+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yx9wA1i4vJTB7alG53uUYP04LNubiVG0IDSWcI2Ob2rBBf48fy5DyUjZNzyFWf4vjwFaKiWbqldLRpI/2LB1HGYWSW/FqL4m/C1hKfOHpmJD8tFizFDmfMwMELSXQYLanJA02kkxb3NdpAs4nQuf7ZpPvptPqtwtyJw0UiVULLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=b0EMeVIf; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="b0EMeVIf"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20c805a0753so792645ad.0
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Nov 2024 18:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731550911; x=1732155711; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wDdKZTqqve6VdW986HJmpWiQXcyyTFz9AM7LMev9nc=;
        b=b0EMeVIfRn5jp/VM5kZ0uahshycICU/Z1dci1CIenaN859MBDlONVz4koqpFyNt9UI
         uCievEQOwh1JMUzq/z51418QMBGJIBTiXtWVjlARRFZgVJiHxXAGbwj7mFWDeCEXNtjz
         +vBcJa+3N/D7oJOSAcTWxARh+YiTdCiZLBVP0+J/sZsOt/f70f5FWya23uJexZqYf/qP
         DHsC2BXoMnVWpD5PhW/dzUPdEklCZKAJXdagOZo4cDKN5yAhfl+i5PZ+EcBtlcBHhtZy
         DLCP6fQ4fAzpbKocQXsbauI//4m3KCTkNQFI11Ta40d+HLGVP4Bm8SaZT7pl4KzTyQD2
         hGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731550911; x=1732155711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wDdKZTqqve6VdW986HJmpWiQXcyyTFz9AM7LMev9nc=;
        b=iryFyJK91uma777jLhyM+syqOVACEZX6J3+v1Gi2ZeFz2yfkYAl9WBrSJvrIx9kU/G
         ZC4se36mhUvzK8f5+YblJz345tM6t6ZmWcyLZQGQXSVcVhgb6dYpzXIGQdUNyy7RP1xW
         vM00O1eIWwYE9kiR32+5CJaFyooA+foYHMXvhMe7C3xRxa1rd9Rj53pldZUU1djzXg+8
         et6FA0tA4HRfFbdQEigQPo3GNuUhpkjAUBfiPol21LFeGS2o3pVaHwyDqzIYfH6yp5Yr
         Pw39Ob6XlSsHjogQ4lqH435XHiR7aM/14wEV633t8aOg2Qinm2vl23hrgCWibAGl3VrS
         mAEg==
X-Forwarded-Encrypted: i=1; AJvYcCUDMaKI4psiGc30zfJA/5Qt6+Aqjcm1siSBg6OeuMHMPFWwAleriBG+Rm85txUebAB5pAvvBYcm0L7JSw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxEzeMXQ8CxqmUTX1VwBw/FTFceXWODjA6pwhcvlWXD+hwGKtRd
	Y5nhZn3iPeuzyAjUDU4kCVMfz/xbm5EgSlVkygg1nu3pLx2FNXBA5t5MS8AXCl4=
X-Google-Smtp-Source: AGHT+IF1mX+ca6uf88fbanYQJIa19pvjOfhXivwRqEcBZ58OIZTy5ln02cFSgzZbcoQ2mrKB//ELyA==
X-Received: by 2002:a17:902:cec8:b0:20c:8839:c517 with SMTP id d9443c01a7336-21183e414d2mr330567115ad.53.1731550911047;
        Wed, 13 Nov 2024 18:21:51 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7c499c9sm406875ad.68.2024.11.13.18.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 18:21:49 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 13 Nov 2024 18:21:16 -0800
Subject: [PATCH v11 10/14] riscv: hwprobe: Add thead vendor extension
 probing
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-xtheadvector-v11-10-236c22791ef9@rivosinc.com>
References: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
In-Reply-To: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
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
 Jessica Clarke <jrtc27@jrtc27.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Yangyu Chen <cyy@cyyself.name>, Andy Chiu <andybnac@gmail.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7382; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=vVkud4e9R47gSZgPMNDJZksRvA2HQoR5jfKAUnJsh+Y=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ7pp3ELZhIQ9f67e6Cx+aPnrXKvL7Zqpu/5lHpdL2ZHfK
 Mn3p9y/o5SFQYyDQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgInoNTAynCuZWKUpeTr6zITf
 bcwph+avMDj+tHNd78X5hyZrcy/3zGNkaD7rd8Fadd6tS7Uff6vbeZut6QvRTE05verYWtOpBtc
 K2QA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Add a new hwprobe key "RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0" which
allows userspace to probe for the new RISCV_ISA_VENDOR_EXT_XTHEADVECTOR
vendor extension.

This new key will allow userspace code to probe for which thead vendor
extensions are supported. This API is modeled to be consistent with
RISCV_HWPROBE_KEY_IMA_EXT_0. The bitmask returned will have each bit
corresponding to a supported thead vendor extension of the cpumask set.
Just like RISCV_HWPROBE_KEY_IMA_EXT_0, this allows a userspace program
to determine all of the supported thead vendor extensions in one call.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
---
 arch/riscv/include/asm/hwprobe.h                   |  3 +-
 .../include/asm/vendor_extensions/thead_hwprobe.h  | 19 +++++++++++
 .../include/asm/vendor_extensions/vendor_hwprobe.h | 37 ++++++++++++++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h              |  3 +-
 arch/riscv/include/uapi/asm/vendor/thead.h         |  3 ++
 arch/riscv/kernel/sys_hwprobe.c                    |  5 +++
 arch/riscv/kernel/vendor_extensions/Makefile       |  1 +
 .../riscv/kernel/vendor_extensions/thead_hwprobe.c | 19 +++++++++++
 8 files changed, 88 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 1ce1df6d0ff3..fb2c27a6e5f6 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
- * Copyright 2023 Rivos, Inc
+ * Copyright 2023-2024 Rivos, Inc
  */
 
 #ifndef _ASM_HWPROBE_H
@@ -21,6 +21,7 @@ static inline bool hwprobe_key_is_bitmask(__s64 key)
 	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
 	case RISCV_HWPROBE_KEY_CPUPERF_0:
+	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
 		return true;
 	}
 
diff --git a/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h b/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
new file mode 100644
index 000000000000..65a9c5612466
--- /dev/null
+++ b/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_THEAD_HWPROBE_H
+#define _ASM_RISCV_VENDOR_EXTENSIONS_THEAD_HWPROBE_H
+
+#include <linux/cpumask.h>
+
+#include <uapi/asm/hwprobe.h>
+
+#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
+void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const struct cpumask *cpus);
+#else
+static inline void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair,
+						  const struct cpumask *cpus)
+{
+	pair->value = 0;
+}
+#endif
+
+#endif
diff --git a/arch/riscv/include/asm/vendor_extensions/vendor_hwprobe.h b/arch/riscv/include/asm/vendor_extensions/vendor_hwprobe.h
new file mode 100644
index 000000000000..6b9293e984a9
--- /dev/null
+++ b/arch/riscv/include/asm/vendor_extensions/vendor_hwprobe.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2024 Rivos, Inc
+ */
+
+#ifndef _ASM_RISCV_SYS_HWPROBE_H
+#define _ASM_RISCV_SYS_HWPROBE_H
+
+#include <asm/cpufeature.h>
+
+#define VENDOR_EXT_KEY(ext)								\
+	do {										\
+		if (__riscv_isa_extension_available(isainfo->isa, RISCV_ISA_VENDOR_EXT_##ext)) \
+			pair->value |= RISCV_HWPROBE_VENDOR_EXT_##ext;			\
+		else									\
+			missing |= RISCV_HWPROBE_VENDOR_EXT_##ext;			\
+	} while (false)
+
+/*
+ * Loop through and record extensions that 1) anyone has, and 2) anyone
+ * doesn't have.
+ *
+ * _extension_checks is an arbitrary C block to set the values of pair->value
+ * and missing. It should be filled with VENDOR_EXT_KEY expressions.
+ */
+#define VENDOR_EXTENSION_SUPPORTED(pair, cpus, per_hart_vendor_bitmap, _extension_checks)	\
+	do {											\
+		int cpu;									\
+		u64 missing = 0;								\
+		for_each_cpu(cpu, (cpus)) {							\
+			struct riscv_isavendorinfo *isainfo = &(per_hart_vendor_bitmap)[cpu];	\
+			_extension_checks							\
+		}										\
+		(pair)->value &= ~missing;							\
+	} while (false)										\
+
+#endif /* _ASM_RISCV_SYS_HWPROBE_H */
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 3af142b99f77..c3c1cc951cb9 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
- * Copyright 2023 Rivos, Inc
+ * Copyright 2023-2024 Rivos, Inc
  */
 
 #ifndef _UAPI_ASM_HWPROBE_H
@@ -94,6 +94,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_VECTOR_SLOW		2
 #define		RISCV_HWPROBE_MISALIGNED_VECTOR_FAST		3
 #define		RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED	4
+#define RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0	11
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/include/uapi/asm/vendor/thead.h b/arch/riscv/include/uapi/asm/vendor/thead.h
new file mode 100644
index 000000000000..43790ebe5faf
--- /dev/null
+++ b/arch/riscv/include/uapi/asm/vendor/thead.h
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+#define		RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 9050f3246264..13eff75d78a8 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -15,6 +15,7 @@
 #include <asm/uaccess.h>
 #include <asm/unistd.h>
 #include <asm/vector.h>
+#include <asm/vendor_extensions/thead_hwprobe.h>
 #include <vdso/vsyscall.h>
 
 
@@ -286,6 +287,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		pair->value = riscv_timebase;
 		break;
 
+	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
+		hwprobe_isa_vendor_ext_thead_0(pair, cpus);
+		break;
+
 	/*
 	 * For forward compatibility, unknown keys don't fail the whole
 	 * call, but get their element key set to -1 and value set to 0
diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/kernel/vendor_extensions/Makefile
index 353522cb3bf0..866414c81a9f 100644
--- a/arch/riscv/kernel/vendor_extensions/Makefile
+++ b/arch/riscv/kernel/vendor_extensions/Makefile
@@ -2,3 +2,4 @@
 
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)	+= andes.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead.o
+obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead_hwprobe.o
diff --git a/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
new file mode 100644
index 000000000000..2eba34011786
--- /dev/null
+++ b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <asm/vendor_extensions/thead.h>
+#include <asm/vendor_extensions/thead_hwprobe.h>
+#include <asm/vendor_extensions/vendor_hwprobe.h>
+
+#include <linux/cpumask.h>
+#include <linux/types.h>
+
+#include <uapi/asm/hwprobe.h>
+#include <uapi/asm/vendor/thead.h>
+
+void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const struct cpumask *cpus)
+{
+	VENDOR_EXTENSION_SUPPORTED(pair, cpus,
+				   riscv_isa_vendor_ext_list_thead.per_hart_isa_bitmap, {
+		VENDOR_EXT_KEY(XTHEADVECTOR);
+	});
+}

-- 
2.34.1

