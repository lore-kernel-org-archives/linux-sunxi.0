Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4945A200C7
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Jun 2024 04:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717994747; cv=none; b=tLJvzQoQ3HZyMW5gSj78Gtoua84uGAntyde+k8/BNf7ZrUtmu3rfo0oULVf1rs8zRdVEckaq1I2ZADfgoSvC70FXly144lpkFhSwof1pkREt8JInCYt7x2GvYVeoVE9q0Nuo4qhd4VQoYBG27IqjsSA7yr48YuWhDz4nH5PqQ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717994747; c=relaxed/simple;
	bh=4N9WDp7GVC3puitkjGgcI/jJcnDMobkD3Avh+NXutPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eI9MsFnPSNmc32mK3Dt+kWtCQK5Jos8jP4Hn0oe5SD0fZF+ECd0xP6n6Lvari0/3jctOaCJ8nJsyoRxmcuG4yN20vCXxIqd3ywURWAUaLuNHP/qOfpEtM2DuE9WXlG3SDDwNSghxfZ8Tf+wI5Imm0iMJFI45pQ5JL/hkQ0KwNGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Szj1/1a5; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Szj1/1a5"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f44b594deeso32397835ad.2
        for <linux-sunxi@lists.linux.dev>; Sun, 09 Jun 2024 21:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717994746; x=1718599546; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6wty7/5ckkbIMYQrfSGTFo0XViwtxD1A330OlnyF00=;
        b=Szj1/1a5esilTqZhrX5ZSTfVey076lb8Z3Npgxvg2I7Js+0Q/tTeNyE5EzeYSXeDJS
         8o+gbg96a/CMsTOfjYU1E2qLelzkMZdmS1Wjq70qoFFXs3wASjbOx+zZKjjDWo/RK2Af
         sZ8iINYRF26QIYBlhyLk/z/j8Q7uX0+KMsgqsv5WHNTAh7anjTMoWrfFde5+m9HKMMAm
         7Py/HHWc22irdCxa+/fq6ME+lEgk/FBxGnJpk+Kw8SdFQx2U11iWJoIF5hIIFaUL8rLC
         2dfc5YuqbqcIyEljWDNGab3uIVm6Cnsj23hFPwBv9UgVeG7pp2b1HytvfuLHsxDIIGAR
         GjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717994746; x=1718599546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6wty7/5ckkbIMYQrfSGTFo0XViwtxD1A330OlnyF00=;
        b=T9HnJ7X8kVzLcVCIr4FKpYA2jcRvvz3LZnq35rLtqnnsTf+Bdgn3PVx6NNKiPGUofG
         0KZ1DNSnKcb4uyEG9SGmaUrU9pW54MY13X1CJ/sQNGvf2V3FHnzXB3Z3cKL11+eNAMIP
         6w3t2xt26GXX4OWkPdQsLFulXxUzEhmliwoGdk+CWMX73kouVaCjCwdHk14EmkvUgzqc
         Lym0h2AHXsR2UxHByW79eTEs3/Pgs25UnUS0W9nuUhj8xQ7W2eZWic7/9sot2s3VDCsG
         DPk91BexOV26t4ZR+eMCIKD1TL6NdazeAWBkhq7vhPpbYVZ4ebn3GxTd6jLfW/nD/iF0
         btLw==
X-Forwarded-Encrypted: i=1; AJvYcCXqQ49E46t7xcF9am1WAz4czDY1w0FNX3JgVTeg/7lGK2Y9vh6hUvonEFFO77oJ0xT2TYXN6QUyy+XGFOI9QGWN05WaAwSKXBA2Mjg=
X-Gm-Message-State: AOJu0Ywst1p3Y89NQRFsoAGhI617OzYfQt1sYn562yAYj9FHL4++EQje
	07J2tNYntx5KwKWjNOWmsCuqqlhbeRz5WZa6AqEF3NU0mGxPAnt499KsgzApFys=
X-Google-Smtp-Source: AGHT+IFf+1OJg1xK1MiXf0vBcz9BVHeA14Ul2s1z6qYt10MeOW0nvzzXkW/P4XRzr1D4aiRO1tRUzg==
X-Received: by 2002:a17:902:e88d:b0:1f4:a3a1:a7e5 with SMTP id d9443c01a7336-1f6d02bef11mr85103415ad.13.1717994745696;
        Sun, 09 Jun 2024 21:45:45 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76ce8asm73124095ad.77.2024.06.09.21.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 21:45:44 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sun, 09 Jun 2024 21:45:10 -0700
Subject: [PATCH 05/13] riscv: vector: Use vlenb from DT for thead
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240609-xtheadvector-v1-5-3fe591d7f109@rivosinc.com>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
In-Reply-To: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717994732; l=3511;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=4N9WDp7GVC3puitkjGgcI/jJcnDMobkD3Avh+NXutPg=;
 b=DC7NLCqeukgT5lOVe137EsewYJ9o72ymXSCD9kejmdpQ1Vf7p2mH/l6TTZY1v6PLdnnpuqWvY
 zXH1O/+aMGsDnv7PW52FjUayRa3BK2sWdLtfhwVrfOaa4GCD21J2jf2
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

If thead,vlenb is provided in the device tree, prefer that over reading
the vlenb csr.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h |  2 ++
 arch/riscv/kernel/cpufeature.c      | 48 +++++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/vector.c          | 12 +++++++++-
 3 files changed, 61 insertions(+), 1 deletion(-)

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
index 2107c59575dd..0c01f33f2348 100644
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
+	/* Ignore vlenb if vector is not enabled in the kernel */
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
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
2.44.0

