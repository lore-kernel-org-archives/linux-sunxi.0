Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C90613C3F2
	for <linux-sunxi@lists.linux.dev>; Fri,  3 May 2024 04:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714711631; cv=none; b=oC9F85Op9fuJ7DMcBy5sKrqeLO0KeFH4YOYYOUzMzi7tybNwbsed0PBnlU8/jIEBz4JmZa61SiQLf2rgCAHjBmrMF2+0t1UjcOA2efYitosNZEFge6kbtEalSN9N2DEMLt+Ph/sAvjhi7t8vd5ceAKfLJlIPZrwE09uTq3V5vqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714711631; c=relaxed/simple;
	bh=fwxPC9e5acCJKXfvxD0QuLfngnuG8uQUjT/zUUS4iJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TsISvvOWWD3yfvyk6LKLHvFYAqD6xaTRQiN+A1B39vvf1yZKevhi0qNfg1MTy4E/UCrhh/X+B1ph5zRejGDrYlypIFBSei8cJ7X9mWQJA1aBo4IaJ0gQm3mTxA/ZnN8tXcB4aGwVTVC7rHLAlzesJZhQsIcFH6ZxaezzeN0MrKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=aUk8JiSF; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="aUk8JiSF"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5ce6b5e3c4eso5221680a12.2
        for <linux-sunxi@lists.linux.dev>; Thu, 02 May 2024 21:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714711629; x=1715316429; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLBLJWgoI5ONq0p19OcZNiSMS9NNG1Jn9M7ZhOPyPpg=;
        b=aUk8JiSFMaixEvRNT1dTWPr8uzQXpw+6HLhFIQX2sFkKiGc8asohON0uc4527K7kkD
         kEKmwvMfPTV9QYkFMnlmyFggyiIqUKGYNdeeuzqGSaGkYTz+4ix6STvRk7+M6wrJGgHw
         4+x8ipaKl4VhmAnAR2wPsQN8/tyEQu/BIgiHRCBPU7iGDWRBA7XEqekO4XZSPCmgdTZu
         c6K3GE+IHmtItBqicEZYAGsfx92hkxdOXlKNTXEidCrtXcIh17TvpkliPYYQCXBDqFI2
         BkX9/f3aBaUrVle+NBCGOzo6Ur9mKnSNT4Wue+ClzET9Xk0pnLzJxxioy/SAwC4pqlEX
         o+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714711629; x=1715316429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLBLJWgoI5ONq0p19OcZNiSMS9NNG1Jn9M7ZhOPyPpg=;
        b=s0w//0IUaTvdPxLS5OzG/UGPURuUgWcEuyYWSHaLu6uuPnv5CAYcVKl9IMQCO5h8/O
         H+yfZwlWxXEHURDSdRGuZtv13uL3fVtmX4A/V/tTGO6DvrcNZmUIp9HeClQ7p8fCn84N
         qOw3pOWV1CfuMb7NLj/1cztQG0OUvmvBWN/sNm/vo8OUa7xW/9w3natYhPIMr1QqJvDM
         mQ3VDHn7KYloknFW/4btjgEUsQH3T6qYSQ3yA/yz2ovMEqlyb5n2tlKEgLWar1knEmc8
         cRV9blZSVLMbChno4mxkWWO5cdGiggfDJIM+BzhI/RjTu6sIDeUAzgFsi23LHlxO4i8U
         iVew==
X-Forwarded-Encrypted: i=1; AJvYcCUUPqMZsw+fGolE1jNUXY02WBXqns+k67dcll8OZZ4QwnsAdAS7xvFocNnmMbGwJ7nhYEBQzCm8U6IAzaqL8y++JOx0+8kgLg9Q01g=
X-Gm-Message-State: AOJu0Yzq44wasnvX2UfJntHicZq3Pc3c93VDKIieMASPRDnS+QOndLwK
	QfhEXtiH5qQCKPqpvxqQsGEkY30Bq6rp8ciqeAAiOGS4WWmXuuHhS7Aq46Vv0iA=
X-Google-Smtp-Source: AGHT+IHxiJG3XKuZnalMhMY0zBrYlix3NEAr72SPYl6kui+CH+Se+262eWO3YNNn+MAYWHadXypMvQ==
X-Received: by 2002:a05:6a20:f393:b0:1a7:4b40:96db with SMTP id qr19-20020a056a20f39300b001a74b4096dbmr1617087pzb.10.1714711629443;
        Thu, 02 May 2024 21:47:09 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b001e2bb03893dsm2240411plh.198.2024.05.02.21.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 21:47:08 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 02 May 2024 21:46:47 -0700
Subject: [PATCH v5 12/17] riscv: Add xtheadvector instruction definitions
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240502-dev-charlie-support_thead_vector_6_9-v5-12-d1b5c013a966@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714711602; l=1908;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=fwxPC9e5acCJKXfvxD0QuLfngnuG8uQUjT/zUUS4iJ0=;
 b=tsASdWZ+V/WOtznPM1nvcKllla4Vt62mCeqqf/9/oDU2uch8BE2mc33Z26RL6fLgWnEC8I0+Q
 8mBe6EQvsFnBS9sgIxF6SaL2+IQ9ituhuA3C9zxt/NwfJ3n0ZomxMIP
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

xtheadvector uses different encodings than standard vector for
vsetvli and vector loads/stores. Write the instruction formats to be
used in assembly code.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/vendor_extensions/thead.h | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/include/asm/vendor_extensions/thead.h b/arch/riscv/include/asm/vendor_extensions/thead.h
index 48421d1553ad..27a253a20ab8 100644
--- a/arch/riscv/include/asm/vendor_extensions/thead.h
+++ b/arch/riscv/include/asm/vendor_extensions/thead.h
@@ -13,4 +13,30 @@
 
 extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_thead;
 
+/* Extension specific helpers */
+
+/*
+ * Vector 0.7.1 as used for example on T-Head Xuantie cores, uses an older
+ * encoding for vsetvli (ta, ma vs. d1), so provide an instruction for
+ * vsetvli	t4, x0, e8, m8, d1
+ */
+#define THEAD_VSETVLI_T4X0E8M8D1	".long	0x00307ed7\n\t"
+#define THEAD_VSETVLI_X0X0E8M8D1	".long	0x00307057\n\t"
+
+/*
+ * While in theory, the vector-0.7.1 vsb.v and vlb.v result in the same
+ * encoding as the standard vse8.v and vle8.v, compilers seem to optimize
+ * the call resulting in a different encoding and then using a value for
+ * the "mop" field that is not part of vector-0.7.1
+ * So encode specific variants for vstate_save and _restore.
+ */
+#define THEAD_VSB_V_V0T0		".long	0x02028027\n\t"
+#define THEAD_VSB_V_V8T0		".long	0x02028427\n\t"
+#define THEAD_VSB_V_V16T0		".long	0x02028827\n\t"
+#define THEAD_VSB_V_V24T0		".long	0x02028c27\n\t"
+#define THEAD_VLB_V_V0T0		".long	0x012028007\n\t"
+#define THEAD_VLB_V_V8T0		".long	0x012028407\n\t"
+#define THEAD_VLB_V_V16T0		".long	0x012028807\n\t"
+#define THEAD_VLB_V_V24T0		".long	0x012028c07\n\t"
+
 #endif

-- 
2.44.0

