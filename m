Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5422D1598FD
	for <linux-sunxi@lists.linux.dev>; Fri,  3 May 2024 18:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714760336; cv=none; b=F7hPtzRkDPNQ4+7Xjm+19R5J5zgcsVz6vA8csH7RjhN03ImyYXk2qKCfXavb1JZx0j5SckjAl7bL/FrK3J1OFB+hmcdFGtWzTl+kLObjnzAGx1fh1SPWc0Pblz3mDpvNLiqdk1fjAgO/i+bV1/qVpT3Y0jQ8kho6bkJzDVJFYpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714760336; c=relaxed/simple;
	bh=pqN1lFvFRjrgQQgZqYCWrh0drQd/FoIFRL9Qt9AtemU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kw2SiOjLLYO8BEW7Zro/pE6J1xFmL9raWPVvLZTE6Lbv47S1vIr1Jk6YCbI7z6iulyrEX2rYiJCUaJ+MSYI4jq1LMB66LwvOUO2ZttaYZ/CnrMsStZdqsGjMTG1fd3Ze8Zzi4QX9VKMV2mk9hafaNtIOm2ozQKnNoTxGCPd2p+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=hBZ07EQq; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="hBZ07EQq"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6f457853950so33478b3a.0
        for <linux-sunxi@lists.linux.dev>; Fri, 03 May 2024 11:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714760335; x=1715365135; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1x3fnfXZgKbRNZW52PQl31Hn8/VT/niX2j925w6Muw=;
        b=hBZ07EQqG9Hr29YMK/ukz2Inu/8OahtxFqlap3Og3C8FFBlL5r5G9WdaZcuf7qn06M
         rrygy6DDrluHf+04Ety1RHWTKfSpHBnuwHr+mmG0fhI7t3an/kL8Cqyo2nPdIoHi+KbI
         wvZlQvbPxVw50SZBuKfdqRWMNfAWMvQUhGeb7Q3x2TlSGToLc870WHJY4NMKRzbvi+eV
         S0K3MKvzQMwDzUZuIhhfEHov9QROOPtyIq6QJCzJ2wwybtBLq1zd2wMSilYf+eofUWQq
         r5CSeXvxSuwdLlSHZoovNiwdqekz9mE90WmJCRAJx2YDVMVtM0tkKfDLQNrzbxwJMh/M
         Kr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760335; x=1715365135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1x3fnfXZgKbRNZW52PQl31Hn8/VT/niX2j925w6Muw=;
        b=LH9Cgan72Z4h9lGix1p/E1MggQSVuLthluAxZd71DS0PTwNRvHBxcnfvzRblluZtOu
         +S6VKKWveM7zjWvDN+6b5akM6psQ38wqDSLnfS5HxUCFo6Fut5NpzQn59gwCpqU2jdnw
         yYwxr7mb4Gx8ew+f+zgrgSoCObDNFsvFGzMx2pUBteXXd6Juj8s8yJIb0p8QdCTE2h7k
         h8jYwTx0JARzsheCWzVQvvtm/b1eGU2LQqM4WlxFkWe/KA1O8X20ZWp6h50Z8sp/VmdP
         eNDV3vW9b/wjOVDbDGmPp+Nig/nGY5JyKd1FI0lniRYzb0y3HBuHYzXeCllYWFz4cAnP
         OEzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPLE4k4KGKEzQ64GVhAdh0wg0RadeuZn9oygN4wXDuVdbLpyFV84Ie/Iqrqv0CswOx88XNZGuv0U7ri8a5LCeJ7K82AaRgSKByEUw=
X-Gm-Message-State: AOJu0YybtexDcWrcvfvKJrMCyiT9IqdIJ3nnOOOuIlED3ixVXVS2bnpY
	9MvLVVTme7UJxVTtpBcSlty5Dz9YdGfepNlfgoWczq4PtDeX2hN8FMQnLbqPCAk=
X-Google-Smtp-Source: AGHT+IFtffChuwBhS5Hm7XU8F8qXkdTP8YFkTdZYyG5ns+Etj9MDZuxDDNk7FtJ718xCtJB8CuLs2g==
X-Received: by 2002:a05:6a20:104d:b0:1a9:11e5:2915 with SMTP id gt13-20020a056a20104d00b001a911e52915mr3981411pzc.27.1714760334670;
        Fri, 03 May 2024 11:18:54 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fu6-20020a056a00610600b006f3f5d3595fsm3355421pfb.80.2024.05.03.11.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:18:53 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 03 May 2024 11:18:21 -0700
Subject: [PATCH v6 06/17] riscv: Add vendor extensions to /proc/cpuinfo
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-dev-charlie-support_thead_vector_6_9-v6-6-cb7624e65d82@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714760318; l=2459;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=pqN1lFvFRjrgQQgZqYCWrh0drQd/FoIFRL9Qt9AtemU=;
 b=mSKF8x/jDoWL2qt9MbecKfiOANTWEfzH0iw4ND1E+SV0TbNnB9ytivBteSpS+Z2vjGFzFTRiQ
 UdfwX8NaOz5BpeYweh8Wk3kACtc1ksmEmsYKFfUKkaZcms6Ck2Wyrck
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

All of the supported vendor extensions that have been listed in
riscv_isa_vendor_ext_list can be exported through /proc/cpuinfo.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/kernel/cpu.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index d11d6320fb0d..2a7924dd809b 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -16,6 +16,7 @@
 #include <asm/sbi.h>
 #include <asm/smp.h>
 #include <asm/pgtable.h>
+#include <asm/vendor_extensions.h>
 
 bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
 {
@@ -203,7 +204,33 @@ arch_initcall(riscv_cpuinfo_init);
 
 #ifdef CONFIG_PROC_FS
 
-static void print_isa(struct seq_file *f, const unsigned long *isa_bitmap)
+#define ALL_CPUS -1
+
+static void print_vendor_isa(struct seq_file *f, int cpu)
+{
+	struct riscv_isavendorinfo *vendor_bitmap;
+	struct riscv_isa_vendor_ext_data_list *ext_list;
+	const struct riscv_isa_ext_data *ext_data;
+
+	for (int i = 0; i < riscv_isa_vendor_ext_list_size; i++) {
+		ext_list = riscv_isa_vendor_ext_list[i];
+		ext_data = riscv_isa_vendor_ext_list[i]->ext_data;
+
+		if (cpu == ALL_CPUS)
+			vendor_bitmap = &ext_list->all_harts_isa_bitmap;
+		else
+			vendor_bitmap = &ext_list->per_hart_isa_bitmap[cpu];
+
+		for (int j = 0; j < ext_list->ext_data_count; j++) {
+			if (!__riscv_isa_extension_available(vendor_bitmap->isa, ext_data[j].id))
+				continue;
+
+			seq_printf(f, "_%s", ext_data[j].name);
+		}
+	}
+}
+
+static void print_isa(struct seq_file *f, const unsigned long *isa_bitmap, int cpu)
 {
 
 	if (IS_ENABLED(CONFIG_32BIT))
@@ -222,6 +249,8 @@ static void print_isa(struct seq_file *f, const unsigned long *isa_bitmap)
 		seq_printf(f, "%s", riscv_isa_ext[i].name);
 	}
 
+	print_vendor_isa(f, cpu);
+
 	seq_puts(f, "\n");
 }
 
@@ -284,7 +313,7 @@ static int c_show(struct seq_file *m, void *v)
 	 * line.
 	 */
 	seq_puts(m, "isa\t\t: ");
-	print_isa(m, NULL);
+	print_isa(m, NULL, ALL_CPUS);
 	print_mmu(m);
 
 	if (acpi_disabled) {
@@ -306,7 +335,7 @@ static int c_show(struct seq_file *m, void *v)
 	 * additional extensions not present across all harts.
 	 */
 	seq_puts(m, "hart isa\t: ");
-	print_isa(m, hart_isa[cpu_id].isa);
+	print_isa(m, hart_isa[cpu_id].isa, cpu_id);
 	seq_puts(m, "\n");
 
 	return 0;

-- 
2.44.0

