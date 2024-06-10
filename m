Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA1C152E04
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Jun 2024 22:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718060217; cv=none; b=sLV+J9RXUrJnmvPc/YciqqMZYZCo6521oq9oD52if1DiKSfyz0EfeYw551K8/SFDpuKMQ+tK8abARDX7IJDs1oL7M10Rsxh99EgsX3lc7oUmXHjMZ2d+batFjAYbxmHiSeui07L+ph7SCHI/Ooh3ZmwNeyxvM8Pj1wjtbLVe9S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718060217; c=relaxed/simple;
	bh=Be9GFskCPaOhLa/vnEPQwyxN6jle/+xWeXOMsnFs0uY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MaAygv7rO3UGC1kgEAkUYhK128c8MS+AI4ss57lva7ZDhuRiA5ajffwsbrtoacU0l4GF2HEa6NOeJ4g1WJ/zfj8X/+8VlRjaQd5eXvGWFnFp6ldcV2LTqa215zaZFpSJAgSju5giN0Jm+LrbcKTBwQs4wv2jfc/HrPs4icZQUJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=mpi6hq8x; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="mpi6hq8x"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f7274a453bso3742645ad.2
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Jun 2024 15:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718060214; x=1718665014; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bt/OPDG5ozolIGkzcJWAUq0hvCz2HvO0aGCtSKiuUJE=;
        b=mpi6hq8xIW1mW6hqo1DaKDMqX9m4zBjG1BnmXFyoGrYimxBsduFdtOVfhSglByYWn8
         meSgFP4NxOc6PAwoPK2yM7ei74sZM74BV6IbsNquD8CV7us2wloguSG33kPox9JKN/p2
         MJlHiBcZ+nCisdlKyjFVdovcgbfL3wAewCQ+8ZjJNvKfyOwRc9mCa/w/Pp9D/Xz5Vz1a
         PAN0+VkXBVqess6Lhfx+ZPHB3q0QEVgI8bpkZY4sb5yLXvMWIkSZu4otW553Cw/Q9xzH
         RNrP/9NDwh/mTnSDqLT45n+/cL4aYe+XvHyHKR9UPpuc4FCWwm+eS+i5DD/fdfhCKEwO
         QZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718060214; x=1718665014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bt/OPDG5ozolIGkzcJWAUq0hvCz2HvO0aGCtSKiuUJE=;
        b=clc0ajODQvkOkY747xSsWc0bum8bYXKpbRLfHKoppjwZOlKSVK7tGAFhrgLtS/mqqo
         cvxkaAp6AmLnzBEy+lxywQXNLHwApjBsLzvDUmBRx9/PyIKJ724YrrxbKwH01WfVJcDz
         HXIRxSCwRUe9lVm6zuFKqlpm9XqEoJzhAA14smszMZMQDSEy3OxEb+Hd3t1LzagGV6+x
         WwQFnMe/Wu6LsFwvfsgQ8QvPdZvVkvvbJmFQZ74aJvwhEIGplU2n1Nma6vddGQItZcXK
         1gDTBkwm7Ih7beLMTGCH56vBqKxMrpucGxd9xRR2oC3hQdwWN1P7q2n6JM1FnsX2F1vV
         ETQg==
X-Forwarded-Encrypted: i=1; AJvYcCWQLqJ8D9mwJ0M0Y6GG2TLORs0CxdwiTg1NE/clPTSSLEM9ibMR5SKQXsYlxX3xsVvHkxQwwOQsNukJFdQTrKcWy3MDhf3wnu2Tf5U=
X-Gm-Message-State: AOJu0YyrcBG3lignJQb2FvAa+1OoMihY9Xag26YFaPOZ6+b3TExzJ4CF
	5fPeS0z2pALYJ6OM8IWBJB/ujunAxihMJCrEu/jySQOpdqQf9XncY98WnAOtrWg=
X-Google-Smtp-Source: AGHT+IGIKZvkWswuDuV0qLuBe/3IL68a1bgSEu0ILYTU/pNo35XfrwIGxWA/+2Je+tqgOfe3mtlw4w==
X-Received: by 2002:a17:903:183:b0:1f6:225e:67a1 with SMTP id d9443c01a7336-1f6d03ca5femr131064715ad.56.1718060214052;
        Mon, 10 Jun 2024 15:56:54 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71b597072sm18355865ad.99.2024.06.10.15.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 15:56:53 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 10 Jun 2024 15:56:41 -0700
Subject: [PATCH v2 04/13] riscv: Add thead and xtheadvector as a vendor
 extension
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240610-xtheadvector-v2-4-97a48613ad64@rivosinc.com>
References: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
In-Reply-To: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718060203; l=4997;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=Be9GFskCPaOhLa/vnEPQwyxN6jle/+xWeXOMsnFs0uY=;
 b=RC7ToHOdBgiWxMdyMqRsLKTuCAuSk+knvsLRi71xDnNautlNotdlEUZg7JILaAMRLtgXvbamE
 a+j+1i4ckiNDcblcxj/LeFJ0+fmv5x1yhyE1T4vZdkuP7brD28WWC5m
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Add support to the kernel for THead vendor extensions with the target of
the new extension xtheadvector.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
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
index f2c24820700b..2107c59575dd 100644
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

