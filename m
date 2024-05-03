Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407FF13AD3A
	for <linux-sunxi@lists.linux.dev>; Fri,  3 May 2024 04:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714711618; cv=none; b=Ojh6R2kcTacHlYnk+7P4QAF/cfLmUtNp2YyktbIl9HaJA32VTccWIgj5Y55uBkax/rDtONy6lMlkC7UHDie97BsDNHe9Tent9b44HhkSfFztezYzeeLzPy9vNF3l0ORb9KF0DI81j4E0evNlQbhrMYSTrP9vYoqmCQXxZfDZTuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714711618; c=relaxed/simple;
	bh=pqN1lFvFRjrgQQgZqYCWrh0drQd/FoIFRL9Qt9AtemU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u1NtUXLXOj0E4Yq/ZdbwfkdPytLNhqbDZZXpcAxeeJ2JvekzZ0amZ/Nn3pOtkLP6qR66tMWsuVej89IHwG4ddXJZ5XO80pylVY6MgQvHdqDbtYLThHSl2zew2USXVH6Ec/XsrE8DMW5j65sc0OhTxLyytaU7511T+4aLXyGqxCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=QXUu7XAH; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="QXUu7XAH"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ecddf96313so15160095ad.2
        for <linux-sunxi@lists.linux.dev>; Thu, 02 May 2024 21:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714711617; x=1715316417; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1x3fnfXZgKbRNZW52PQl31Hn8/VT/niX2j925w6Muw=;
        b=QXUu7XAHvMX+MGtL5tazShNEbBMyWSkPlQ028FmPxG/6fBJLcS4YAvWtmekRS21RGH
         7+/RN1bV+pMt1YvkZdByQDgq5xdBGCWAE3X53o7YOsa9E7cawoSuefjzXANZXiEyzQ2o
         YSNPKeSXPPLSFbu9rdf13CpUQZWqOlcveOq1SsjnqPw5HdEIJmVAa2mC2kRAA1Dj4orn
         MIyuCdMeTaQmQ0BzGbD76WirZqBd4OarHd7FYMIEq6mPJa7qmqZeYOC641CTAGiI5yhp
         jcQwiwj3vZ5g8fW2gTts8D8iY73fglgAP4FqgEEzszID9JyumU4bz3OuOGhhWbDRPlZW
         EbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714711617; x=1715316417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1x3fnfXZgKbRNZW52PQl31Hn8/VT/niX2j925w6Muw=;
        b=kUWD5OPgdvDG/EpZKnM+PJbz+UwJu3rRCqNQUJPOqfpIgau1yPCD0S3c2nofjUnd1E
         wNT4f6AOYiPJ47eN7q/sJiEOCj1nTtZRS4xdCAM3LnZuz2+bN2F3mg3rk04g2Uo3N1xD
         a2zh5FQPGJCJoU5zFyx0wK+N+VqvWaAh6r/ertxixcQCqzMYrm96574REdFSa4CqpqbL
         7vzD/clz3uMSt+EtQXwZ47EoI2VfAPsFDDGhCeluDLS25+UPBX60ALVQKZtSzg8bsD6D
         wfrxvnCdfDaQYLFFu56hJTC9TJg9iVDoUppt6iKoevf9SRMHpBnTHGhNZZyJZsUvjIVs
         Uc2A==
X-Forwarded-Encrypted: i=1; AJvYcCUdB6wR+RjvbQT+p/Sdu4wKpE2hFGDi+xUodILwtAEaV1zsuDwulkiitGLfKr/al9GpUZJbxvqMixcE0zgs+NvrUDr8GPcrK++CkNw=
X-Gm-Message-State: AOJu0YxHU+sss7NF0l5AOyg1f1rV6wwydTLP4gcFSIZPCSv0DG+8qFXa
	EcaNT0I9UGdrUu1/YRec+PO9QJK+KMKotwOs+a95eScsXsgp1bRIR3bwihEiKl4=
X-Google-Smtp-Source: AGHT+IHbNMkuv/su3XYOiyps0iZwtZ876nCqWFEdktTVe4e6t6GWJkz5DfWvpaj9ZsUbI8EqMDprbw==
X-Received: by 2002:a17:902:ecc7:b0:1eb:dae:bdab with SMTP id a7-20020a170902ecc700b001eb0daebdabmr2129152plh.46.1714711616732;
        Thu, 02 May 2024 21:46:56 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b001e2bb03893dsm2240411plh.198.2024.05.02.21.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 21:46:55 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 02 May 2024 21:46:41 -0700
Subject: [PATCH v5 06/17] riscv: Add vendor extensions to /proc/cpuinfo
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240502-dev-charlie-support_thead_vector_6_9-v5-6-d1b5c013a966@rivosinc.com>
References: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
In-Reply-To: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714711602; l=2459;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=pqN1lFvFRjrgQQgZqYCWrh0drQd/FoIFRL9Qt9AtemU=;
 b=H+DX3cVVjv1vLieQvFF/GzHeHnV6V/D0UYWMIUMz9yJnTEHNzwd2Lhb1bwFvj20Y7hip0X35P
 f1ya+z76CwvDzykr4rBxhsKf62CDwPGbJNyH02uPIH6mLHUmhes2dAq
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

