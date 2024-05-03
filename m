Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF2E13B5A7
	for <linux-sunxi@lists.linux.dev>; Fri,  3 May 2024 04:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714711623; cv=none; b=uY7drMdKWm1rPn9LkSVj/ttzVYrlv0rOEJTkWJ0YmPfI2xs2rNvTecisIar2IpJtNE09cPvppBVN5NRKoVKym0vSeT2PIsQoPI4Kd+28foZGUX25azLQW1cGZE6F4z/MhqMgEYI2jIHK2Uz31kH4L0c/Ua4d769iyv+tV8nr++w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714711623; c=relaxed/simple;
	bh=2AJiZIKU/txIzz8lcRnB5tCco7QN7//SJU1vx5ohkb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uwLk+LBIIvlt24S6yG1EPTiK6SJ93+FvB2jDAznYst2qSAuK4ugqTTPZyzPSr8agLhU2o5ThffPn/ln9PnPNnuNi9Qt4bDoKqpa+jhkbKOWu2u0zijy91iFkU0H60XCECFrE+PNocsouW/wm4XrjnDXnpVEl7WPKOv9D5j4LqIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=3Ms7Xbdy; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="3Ms7Xbdy"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5d42e7ab8a9so5051812a12.3
        for <linux-sunxi@lists.linux.dev>; Thu, 02 May 2024 21:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714711621; x=1715316421; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBAtK6yz0tN7qnDVCrHDFDflditCb34tqrZg7A4OIKI=;
        b=3Ms7Xbdypi/4Gc/0R9BARe88g0CGMPh7VK8Cjdk3sM8so/Hp8FBjUebcHHw5Y5j5Ni
         qBrMQPbhdcpKxQDn0N1VjbLchUI+8IOGN6M+cAVgeb1bg7Bs0eHD2dGvNZlVkd4rT+0Z
         OP6cfxwnlI4/rwTAbKx54rJKF/XREaIr2hy5oZhkPl+8GwAO+/8nBHWnWHLpqU1+3mh/
         hU9JvYbsscu23+yitIrfZZ+b2DnRt34qDqHdRMuWhQs0mmKfgu5BTsyasb1X/Alh67+l
         XZr2vaWjvebAPhB+Zr6F02MowKSTQmLzHk4ZlNz5ejNNpkSyeAy4ZJdr2qA6Ugm6Hzlk
         qbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714711621; x=1715316421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBAtK6yz0tN7qnDVCrHDFDflditCb34tqrZg7A4OIKI=;
        b=AaFKz+Kt3KTjT9z97r2IVzQQ6Mvbgwaa7M86EJEzYcpfWhQfe+VmzfYpf9+NnhcE7I
         AjLewo83zfLPubxCMqaOKVMI53tH258R1b7Pj9dygJvaE/Hi8NA9teGnGR/uVJUUe/yN
         bzlVEOzJObD7DRNMd5NvxO768Vvy98UAwbNk8TjShyhh+1ft0tkwXuwQeSGFb2yAxfii
         heosYY3SovT0m4M99aT9+jLjUPin3wo9rfCzpFIu13Fgt73YfbCmJOd60z+pAE2yjW1S
         M0OaeLOzkTivlzwQTdsVdSBl2m7oxklPTjUZxan+uqm+MyD2jI6QGoLHSzzUPFim852x
         K3Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVjiLjZQMq59pBZ6apsw6pkOFwbSz3RGkshIKLkjJ1xZsP74dVcXCOXmUw0+4r6wz+6UEX9eYjUYxNYnHbWtfB93LFcpkp6CjX9do4=
X-Gm-Message-State: AOJu0Yz/7YMEDGopxCQqKBp88E2Ml9WwWedZ9GqR6H6zIajmnWVP//Su
	G6/skMb8Zun6naTuBTBORW7GXHyg8uPuFbLO2EayRRdi5QKhqqBnHX2CHtROdoA=
X-Google-Smtp-Source: AGHT+IF06THjz5G9qZKmeRTr1gAvHdFeHK50QwVhMpmQmsh4TwbRlEVHFDctwj8AEiO9jRfEFBYmZw==
X-Received: by 2002:a05:6a20:a122:b0:1af:6a37:3cfd with SMTP id q34-20020a056a20a12200b001af6a373cfdmr2118253pzk.24.1714711620917;
        Thu, 02 May 2024 21:47:00 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b001e2bb03893dsm2240411plh.198.2024.05.02.21.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 21:47:00 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 02 May 2024 21:46:43 -0700
Subject: [PATCH v5 08/17] riscv: cpufeature: Extract common elements from
 extension checking
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240502-dev-charlie-support_thead_vector_6_9-v5-8-d1b5c013a966@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714711602; l=7158;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=2AJiZIKU/txIzz8lcRnB5tCco7QN7//SJU1vx5ohkb8=;
 b=YOIghtsf7HC7GWmj4P7wyDakVJLWJTC5OsydPCk6VdnIqyCKpImm9cXdMtYbcFm9oDMyUx2It
 1Je3ehTENzUA3Yjtec9EJKC48M+XxXGidUnbtL8A2DpwHXJ5Z/qdhYK
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The __riscv_has_extension_likely() and __riscv_has_extension_unlikely()
functions from the vendor_extensions.h can be used to simplify the
standard extension checking code as well. Migrate those functions to
cpufeature.h and reorganize the code in the file to use the functions.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/cpufeature.h        | 78 +++++++++++++++++-------------
 arch/riscv/include/asm/vendor_extensions.h | 28 -----------
 arch/riscv/kernel/vendor_extensions.c      | 16 +++---
 3 files changed, 51 insertions(+), 71 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index fedd479ccfd1..88723ac2d26e 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -98,59 +98,66 @@ extern bool riscv_isa_fallback;
 
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
 
+#define STANDARD_EXT		0
+
 bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned int bit);
 #define riscv_isa_extension_available(isa_bitmap, ext)	\
 	__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
 
-static __always_inline bool
-riscv_has_extension_likely(const unsigned long ext)
+static __always_inline bool __riscv_has_extension_likely(const unsigned long vendor,
+							 const unsigned long ext)
 {
-	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
-			   "ext must be < RISCV_ISA_EXT_MAX");
-
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
-		asm goto(
-		ALTERNATIVE("j	%l[l_no]", "nop", 0, %[ext], 1)
-		:
-		: [ext] "i" (ext)
-		:
-		: l_no);
-	} else {
-		if (!__riscv_isa_extension_available(NULL, ext))
-			goto l_no;
-	}
+	asm goto(ALTERNATIVE("j	%l[l_no]", "nop", %[vendor], %[ext], 1)
+	:
+	: [vendor] "i" (vendor), [ext] "i" (ext)
+	:
+	: l_no);
 
 	return true;
 l_no:
 	return false;
 }
 
-static __always_inline bool
-riscv_has_extension_unlikely(const unsigned long ext)
+static __always_inline bool __riscv_has_extension_unlikely(const unsigned long vendor,
+							   const unsigned long ext)
 {
-	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
-			   "ext must be < RISCV_ISA_EXT_MAX");
-
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
-		asm goto(
-		ALTERNATIVE("nop", "j	%l[l_yes]", 0, %[ext], 1)
-		:
-		: [ext] "i" (ext)
-		:
-		: l_yes);
-	} else {
-		if (__riscv_isa_extension_available(NULL, ext))
-			goto l_yes;
-	}
+	asm goto(ALTERNATIVE("nop", "j	%l[l_yes]", %[vendor], %[ext], 1)
+	:
+	: [vendor] "i" (vendor), [ext] "i" (ext)
+	:
+	: l_yes);
 
 	return false;
 l_yes:
 	return true;
 }
 
+static __always_inline bool riscv_has_extension_unlikely(const unsigned long ext)
+{
+	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return __riscv_has_extension_unlikely(STANDARD_EXT, ext);
+
+	return __riscv_isa_extension_available(NULL, ext);
+}
+
+static __always_inline bool riscv_has_extension_likely(const unsigned long ext)
+{
+	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return __riscv_has_extension_likely(STANDARD_EXT, ext);
+
+	return __riscv_isa_extension_available(NULL, ext);
+}
+
 static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
 {
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_likely(ext))
+	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
+	    __riscv_has_extension_likely(STANDARD_EXT, ext))
 		return true;
 
 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
@@ -158,7 +165,10 @@ static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsign
 
 static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsigned long ext)
 {
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_unlikely(ext))
+	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
+	    __riscv_has_extension_unlikely(STANDARD_EXT, ext))
 		return true;
 
 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
diff --git a/arch/riscv/include/asm/vendor_extensions.h b/arch/riscv/include/asm/vendor_extensions.h
index a6959836f895..d21e411d7338 100644
--- a/arch/riscv/include/asm/vendor_extensions.h
+++ b/arch/riscv/include/asm/vendor_extensions.h
@@ -47,34 +47,6 @@ bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsig
 	__riscv_isa_vendor_extension_available(VENDOR_EXT_ALL_CPUS, vendor, \
 					       RISCV_ISA_VENDOR_EXT_##ext)
 
-static __always_inline bool __riscv_has_extension_likely(const unsigned long vendor,
-							 const unsigned long ext)
-{
-	asm goto(ALTERNATIVE("j	%l[l_no]", "nop", %[vendor], %[ext], 1)
-	:
-	: [vendor] "i" (vendor), [ext] "i" (ext)
-	:
-	: l_no);
-
-	return true;
-l_no:
-	return false;
-}
-
-static __always_inline bool __riscv_has_extension_unlikely(const unsigned long vendor,
-							   const unsigned long ext)
-{
-	asm goto(ALTERNATIVE("nop", "j	%l[l_yes]", %[vendor], %[ext], 1)
-	:
-	: [vendor] "i" (vendor), [ext] "i" (ext)
-	:
-	: l_yes);
-
-	return false;
-l_yes:
-	return true;
-}
-
 static __always_inline bool riscv_has_vendor_extension_likely(const unsigned long vendor,
 							      const unsigned long ext)
 {
diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/vendor_extensions.c
index e4ef574b7d08..7910890c17de 100644
--- a/arch/riscv/kernel/vendor_extensions.c
+++ b/arch/riscv/kernel/vendor_extensions.c
@@ -31,16 +31,14 @@ const size_t riscv_isa_vendor_ext_list_size = ARRAY_SIZE(riscv_isa_vendor_ext_li
  */
 bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsigned int bit)
 {
-	unsigned long *bmap;
-	struct riscv_isainfo *cpu_bmap;
-	size_t bmap_size;
+	struct riscv_isavendorinfo *bmap;
+	struct riscv_isavendorinfo *cpu_bmap;
 
 	switch (vendor) {
 #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
 	case THEAD_VENDOR_ID:
-		bmap = riscv_isa_vendor_ext_list_thead.vendor_bitmap;
-		cpu_bmap = riscv_isa_vendor_ext_list_thead.per_hart_vendor_bitmap;
-		bmap_size = riscv_isa_vendor_ext_list_thead.bitmap_size;
+		bmap = &riscv_isa_vendor_ext_list_thead.all_harts_isa_bitmap;
+		cpu_bmap = &riscv_isa_vendor_ext_list_thead.per_hart_isa_bitmap[cpu];
 		break;
 #endif
 	default:
@@ -48,11 +46,11 @@ bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsig
 	}
 
 	if (cpu != -1)
-		bmap = cpu_bmap[cpu].isa;
+		bmap = &cpu_bmap[cpu];
 
-	if (bit >= bmap_size)
+	if (bit >= RISCV_ISA_VENDOR_EXT_MAX)
 		return false;
 
-	return test_bit(bit, bmap) ? true : false;
+	return test_bit(bit, bmap->isa) ? true : false;
 }
 EXPORT_SYMBOL_GPL(__riscv_isa_vendor_extension_available);

-- 
2.44.0

