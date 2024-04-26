Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823423AC1F
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 21:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714167447; cv=none; b=LWihobFVxkbvX6JupPLM/zISZYbEYCpf6X7/7+S/kyN2K2xrIkSYWm45E/uaFfqyg+cpGAik3WKERm6dDVN2zfmRs6G2VSvsqrvLuGC4fiYESjYZfmjnxrKq4DtaB052AC1Rb2oiJ/pkX6lgvtilYNs7/7zZrPRVfLRUFi8qWk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714167447; c=relaxed/simple;
	bh=njxZJ4tjqskliSfS99XP11uds7FNyIfAX7p1PlNikQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bX0mSMNw2o+4W7aFSm9IWL95+8MMOqWHO9ccdHRwUGznWfRbEiXroa/PXYgTV9lh3kD1hYLogrD35f9XoaYoyweRbN4c/RGqWwqZY7DupLkp8VaDrhej1M+QQitfREpUunFQayZjbXfgbxmuo97FRdIkmz8ZRZa1gmB2qwu7g7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=DEGi7sJ0; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="DEGi7sJ0"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1e40042c13eso19702805ad.2
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 14:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714167444; x=1714772244; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9NzYu0APNSW46lcjHROzAtiEMcjboazXdDN+cuqdShs=;
        b=DEGi7sJ0aXIvGOaHXpCVJNjCTnP1MsuE4bFDqPfaZnXANh+I+LOLbrkctUjxNSp8pd
         Ov5uqh1G8D+We1jTCjJYMFJSqGYR+U6ZetPmHpWVO9aaN0wTfZBcSamYTkzat7Jv4xVH
         FBrVwjMokFhonfhvnBn0WnF82dfW2tQlUxxns9z5iQMDp0HdzRVjHY2PwJuqtqDaNP5z
         Luzmvi926DUGrOu77sojbV/XeTa5z9QS+CfWZseFlnSz5VgFBjoaNFCCPp+k9iBVY2Nv
         12Zke92TE560NkPGDMgy4o+T4W/7o7VZKNw/rguAu1KUq3CqftwbZ890EpM2upl7Z7Gc
         eBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714167444; x=1714772244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NzYu0APNSW46lcjHROzAtiEMcjboazXdDN+cuqdShs=;
        b=qWyVcBHq7th8+Bln5gnCRKd74nJrHEse2cXAuci+MeOGelxPNrnLGZ+0JdO+TCCOLx
         HYOKwPv7uTYcd/Ut/iDzPUC4oYA5/7OGMvUnYJTV8LSjSZBfFeseJ5PWo2Gui6/pUwQz
         Ru4W7+Ypv2CHq8RvkE4bmk9Yvm9HJTOfIu5iqW5Dmh2WjCJyXjmLdl+7HcJXWnEqlMog
         NeqQjGaGB/dJUBsQ383LPBzboFo7P7aSI03w5KbUbKChrMTB4yjymMMYK1OZOTybyM7y
         tEiANAwY3ZlePLY9guKryazp7cs/dJaf++ED9o/6Ymd4JHtiXXrlpID4oM6L2QHyQejd
         p9EA==
X-Forwarded-Encrypted: i=1; AJvYcCXHdF4nQ4f6mm7pZ8l89ZzxtzYeuIPxGcCxkg7ve+4/gRpBMGA+yUJyoaEJFpObonLuTdKAw7JzpsIXQpyZJ6XWtXm5tLJBx1Hl6I8=
X-Gm-Message-State: AOJu0Yxfo0PMGQIhsDrajHzflpJvLtZ+2c8YJRRQZ9dCLvsyUeft/wwV
	SUUectvmPzYZybYlwxmPckKxP/HzEYpEZ46kRNQ0HPsLIPqQzxIqjfw43wu/HhYgIPX8vuToEl7
	i
X-Google-Smtp-Source: AGHT+IFvJKtxRl1ytIKwAlGCyJvtDuaSLzUG+CyGlL68+giAEMPweCuVbPmvCnheDgpuuPZ37BzK2Q==
X-Received: by 2002:a17:902:ce09:b0:1e5:28cd:4ef9 with SMTP id k9-20020a170902ce0900b001e528cd4ef9mr4626638plg.30.1714167444437;
        Fri, 26 Apr 2024 14:37:24 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id k4-20020a170902760400b001e2936705b4sm15935701pll.243.2024.04.26.14.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:37:22 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 26 Apr 2024 14:37:08 -0700
Subject: [PATCH v4 13/16] riscv: hwprobe: Add thead vendor extension
 probing
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-dev-charlie-support_thead_vector_6_9-v4-13-5cf53b5bc492@rivosinc.com>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-5cf53b5bc492@rivosinc.com>
In-Reply-To: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-5cf53b5bc492@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714167425; l=6249;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=njxZJ4tjqskliSfS99XP11uds7FNyIfAX7p1PlNikQo=;
 b=mgri1ppnm9XQjBdKjRM/2U6r8B74S6oZ2vGxHh3BqguKRS0EE4oKnBPVsiUsZSvc4wFenydAn
 MxOd2mP5ydzDtnS/+EYKPA8/k7uQxGh24tgpEoTfahAvy6v1Xgb6Eqf
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

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
---
 arch/riscv/include/asm/hwprobe.h                   |  4 +--
 .../include/asm/vendor_extensions/thead_hwprobe.h  | 11 ++++++
 arch/riscv/include/uapi/asm/hwprobe.h              |  3 +-
 arch/riscv/include/uapi/asm/vendor/thead.h         |  3 ++
 arch/riscv/kernel/sys_hwprobe.c                    |  9 +++++
 arch/riscv/kernel/vendor_extensions/Makefile       |  1 +
 .../riscv/kernel/vendor_extensions/thead_hwprobe.c | 42 ++++++++++++++++++++++
 7 files changed, 70 insertions(+), 3 deletions(-)

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
diff --git a/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h b/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
new file mode 100644
index 000000000000..907cfc4eb4dc
--- /dev/null
+++ b/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_THEAD_HWPROBE_H
+#define _ASM_RISCV_VENDOR_EXTENSIONS_THEAD_HWPROBE_H
+
+#include <linux/cpumask.h>
+
+#include <uapi/asm/hwprobe.h>
+
+void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const struct cpumask *cpus);
+
+#endif
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9f2a8e3ff204..21e96a63f9ea 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
- * Copyright 2023 Rivos, Inc
+ * Copyright 2023-2024 Rivos, Inc
  */
 
 #ifndef _UAPI_ASM_HWPROBE_H
@@ -67,6 +67,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
 #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
+#define RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0	7
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
index 8cae41a502dd..e59cac545df5 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -13,6 +13,7 @@
 #include <asm/uaccess.h>
 #include <asm/unistd.h>
 #include <asm/vector.h>
+#include <asm/vendor_extensions/thead_hwprobe.h>
 #include <vdso/vsyscall.h>
 
 
@@ -216,6 +217,14 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 			pair->value = riscv_cboz_block_size;
 		break;
 
+	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
+#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
+		hwprobe_isa_vendor_ext_thead_0(pair, cpus);
+#else
+		pair->value = 0;
+#endif
+		break;
+
 	/*
 	 * For forward compatibility, unknown keys don't fail the whole
 	 * call, but get their element key set to -1 and value set to 0
diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/kernel/vendor_extensions/Makefile
index 8f1c5a4dc38f..f511fd269e8a 100644
--- a/arch/riscv/kernel/vendor_extensions/Makefile
+++ b/arch/riscv/kernel/vendor_extensions/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead.o
+obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead_hwprobe.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)	+= andes.o
diff --git a/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
new file mode 100644
index 000000000000..e8e2de292032
--- /dev/null
+++ b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <asm/vector.h>
+#include <asm/vendor_extensions/thead.h>
+#include <asm/vendor_extensions/thead_hwprobe.h>
+
+#include <linux/cpumask.h>
+#include <linux/types.h>
+
+#include <uapi/asm/hwprobe.h>
+#include <uapi/asm/vendor/thead.h>
+
+void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const struct cpumask *cpus)
+{
+	/*
+	 * Loop through and record extensions that 1) anyone has, and 2) anyone
+	 * doesn't have.
+	 */
+
+	struct riscv_isainfo *per_hart_thead_bitmap = riscv_isa_vendor_ext_list_thead.per_hart_vendor_bitmap;
+	int cpu;
+	u64 missing;
+
+	for_each_cpu(cpu, cpus) {
+		struct riscv_isainfo *isainfo = &per_hart_thead_bitmap[cpu];
+
+#define EXT_KEY(ext)									\
+	do {										\
+		if (__riscv_isa_extension_available(isainfo->isa, RISCV_ISA_VENDOR_EXT_##ext)) \
+			pair->value |= RISCV_HWPROBE_VENDOR_EXT_##ext;			\
+		else									\
+			missing |= RISCV_HWPROBE_VENDOR_EXT_##ext;			\
+	} while (false)
+
+	EXT_KEY(XTHEADVECTOR);
+
+#undef EXT_KEY
+	}
+
+	/* Now turn off reporting features if any CPU is missing it. */
+	pair->value &= ~missing;
+}

-- 
2.44.0

