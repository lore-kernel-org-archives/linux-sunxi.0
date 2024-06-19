Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5DF15EFD6
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Jun 2024 23:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718841458; cv=none; b=Uc6rU9CM6XQUPM9J51i56S/NKYiGcbna0QQW5XjlZyknUyeaYeD+7l3x6abJNAF+slebFyDbnSuPB8tFrxYp1ICt1McTMKvSC6gUgpq9DEcFXQlDmq3Ntce19vHlOduADD4fE9HdzCsHT/vhA0UxfuA9IcMlXBrQJlGInoA3UQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718841458; c=relaxed/simple;
	bh=qOY+VtIcVN3hdGAY4IcChQJf3hAlNIfnJ4uQBcO1roI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bPu3a2gT4DTEG1cGmUKXp9cP4Foe1NlBxwvjYsMCakZcSXSst+DJjgUDaDLabFl1J15c2cGDeELVxXIm8a7QONwmKmHYCIifZt7d/ID4s/TCNOdXARx2gCxxjkqHymJPgxoCmsChanRqoT1pYFMitnZkPOh/xzytfj5qBWWIJyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=kP5WD18d; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="kP5WD18d"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f70c457823so2319425ad.3
        for <linux-sunxi@lists.linux.dev>; Wed, 19 Jun 2024 16:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718841456; x=1719446256; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cOKC028yPYch1Ke/tNFgblYoKhqz61EWi9uuPUKXmbI=;
        b=kP5WD18df5chCTlNiwctO8uyw4YXrTUpn0pGM6HAaIlnHWbDpwyWlSSUkYQmqvPV4e
         XqhyGZ37yryOtDxkUw/d+oW509l88JIanhmsjknNCNZmeAx1V2rvoucpLp+ajYGmhrPF
         xoa3BRRCA1gHoL5LxMTXYE/EiW1wQaxxHYViqzHneCxYT4HBp0mvMHWapNiqN6xG3VfG
         d+ySGtIenOUlp3va7P3MKvzCk4lt6axv9QptflGyIXRprjW+QT7pLpot6piDY3YWIkud
         9DAz8kUki/UCpuSjEwtAhCrswqdRsB5EUrU046fhgIv4w5MTDQXRF3KC3/OFsNS8aMkf
         Nasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718841456; x=1719446256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cOKC028yPYch1Ke/tNFgblYoKhqz61EWi9uuPUKXmbI=;
        b=MnnGi6LCOMPNG3SwbaCNEX7nYZ+cI5y8NhcEhH+MR1HLu8JnJtoIQs424F5JoN6QCq
         kavaJv5ALyFRbheh50ub60EdIxN+vfa8bMs0W3ph70yGxQPMNKhRfuI+twOyut4df+ix
         XYz71J53mLxgvmaFFiZwAR2F7Q/MVqgMQzEcmHnBmaDjdAzWqr9YnaFG2icTBz1YP1lD
         iXrxgLh+4jZREU+iZi+EWYSTs/AatPFJkX4pETvXbolISnBkP39USwOr+azvVbAcvxXr
         Mk31m2XoirqJtTs4SGkfYDbmP9CZ4NkMhMu5JIVEABi0uKMXrn3Y80yEhs8sxwiJclI5
         HS5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPjlozxSh25CbLEcnA78J7LGOtUpUkoOIcLs4PEno1/fCFcYD/NPk+tZXxgZdjYrw7DbTB+wyaV/rUQ2ROMu6wgxlmIVoYKZB7wEw=
X-Gm-Message-State: AOJu0YypLDyretj7numUOyB+wKMEvc8KLGW22NHKt1NXeQ/HtPcyc55B
	LrXdDx89M7hXD1kXgjwiKE634LsxZAJErTFCTFO/tETcNlA8BZV51N33rJygkO8=
X-Google-Smtp-Source: AGHT+IFqbn5yDjdLuA+jmVCUC+AKSwQqm6gIyqYTL/7HDqAlOYnC0GiNC9kMe2pGkJv016qHqQlvFQ==
X-Received: by 2002:a17:902:ce8a:b0:1e0:bae4:48f9 with SMTP id d9443c01a7336-1f9aa42e7a1mr42022105ad.32.1718841455977;
        Wed, 19 Jun 2024 16:57:35 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e70ae6sm123620745ad.71.2024.06.19.16.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 16:57:35 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 19 Jun 2024 16:57:18 -0700
Subject: [PATCH v3 05/13] riscv: vector: Use vlenb from DT for thead
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-xtheadvector-v3-5-bff39eb9668e@rivosinc.com>
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
In-Reply-To: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718841444; l=4477;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=qOY+VtIcVN3hdGAY4IcChQJf3hAlNIfnJ4uQBcO1roI=;
 b=5TtfZAlOuc3utVE8165Rd1ndzsCNKmNfY7QEK4sotjq15ebm6/duI1KY6+rVJSRLQdq32XI4l
 PAI0/EWD9igBJoT4peFmtuk/6aM+wKPuepV+Z2Wp4b6GhpYHw4AS2bC
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

If thead,vlenb is provided in the device tree, prefer that over reading
the vlenb csr.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig.vendor           | 13 ++++++++++
 arch/riscv/include/asm/cpufeature.h |  2 ++
 arch/riscv/kernel/cpufeature.c      | 48 +++++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/vector.c          | 12 +++++++++-
 4 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig.vendor b/arch/riscv/Kconfig.vendor
index 9897442bd44f..b096548fe0ff 100644
--- a/arch/riscv/Kconfig.vendor
+++ b/arch/riscv/Kconfig.vendor
@@ -26,6 +26,19 @@ config RISCV_ISA_VENDOR_EXT_THEAD
 	  extensions. Without this option enabled, T-Head vendor extensions will
 	  not be detected at boot and their presence not reported to userspace.
 
+	  If you don't know what to do here, say Y.
+
+config RISCV_ISA_XTHEADVECTOR
+	bool "xtheadvector extension support"
+	depends on RISCV_ISA_VENDOR_EXT_THEAD
+	depends on RISCV_ISA_V
+	depends on FPU
+	default y
+	help
+	  Say N here if you want to disable all xtheadvector related procedures
+	  in the kernel. This will disable vector for any T-Head board that
+	  contains xtheadvector rather than the standard vector.
+
 	  If you don't know what to do here, say Y.
 endmenu
 
diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index b029ca72cebc..e0a3164c7a06 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -31,6 +31,8 @@ DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
+extern u32 thead_vlenb_of;
+
 void riscv_user_isa_enable(void);
 
 #define _RISCV_ISA_EXT_DATA(_name, _id, _subset_exts, _subset_exts_size) {	\
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 2107c59575dd..077be4ab1f9a 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -37,6 +37,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 /* Per-cpu ISA extensions. */
 struct riscv_isainfo hart_isa[NR_CPUS];
 
+u32 thead_vlenb_of;
+
 /**
  * riscv_isa_extension_base() - Get base extension word
  *
@@ -625,6 +627,46 @@ static void __init riscv_fill_vendor_ext_list(int cpu)
 	}
 }
 
+static int has_thead_homogeneous_vlenb(void)
+{
+	int cpu;
+	u32 prev_vlenb = 0;
+	u32 vlenb;
+
+	/* Ignore thead,vlenb property if xtheavector is not enabled in the kernel */
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_XTHEADVECTOR))
+		return 0;
+
+	for_each_possible_cpu(cpu) {
+		struct device_node *cpu_node;
+
+		cpu_node = of_cpu_device_node_get(cpu);
+		if (!cpu_node) {
+			pr_warn("Unable to find cpu node\n");
+			return -ENOENT;
+		}
+
+		if (of_property_read_u32(cpu_node, "thead,vlenb", &vlenb)) {
+			of_node_put(cpu_node);
+
+			if (prev_vlenb)
+				return -ENOENT;
+			continue;
+		}
+
+		if (prev_vlenb && vlenb != prev_vlenb) {
+			of_node_put(cpu_node);
+			return -ENOENT;
+		}
+
+		prev_vlenb = vlenb;
+		of_node_put(cpu_node);
+	}
+
+	thead_vlenb_of = vlenb;
+	return 0;
+}
+
 static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
 {
 	unsigned int cpu;
@@ -689,6 +731,12 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
 		riscv_fill_vendor_ext_list(cpu);
 	}
 
+	if (riscv_isa_vendor_extension_available(THEAD_VENDOR_ID, XTHEADVECTOR) &&
+	    has_thead_homogeneous_vlenb() < 0) {
+		pr_warn("Unsupported heterogeneous vlenb detected, vector extension disabled.\n");
+		elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
+	}
+
 	if (bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX))
 		return -ENOENT;
 
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 6727d1d3b8f2..3ba2f2432483 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -33,7 +33,17 @@ int riscv_v_setup_vsize(void)
 {
 	unsigned long this_vsize;
 
-	/* There are 32 vector registers with vlenb length. */
+	/*
+	 * There are 32 vector registers with vlenb length.
+	 *
+	 * If the thead,vlenb property was provided by the firmware, use that
+	 * instead of probing the CSRs.
+	 */
+	if (thead_vlenb_of) {
+		this_vsize = thead_vlenb_of * 32;
+		return 0;
+	}
+
 	riscv_v_enable();
 	this_vsize = csr_read(CSR_VLENB) * 32;
 	riscv_v_disable();

-- 
2.34.1

