Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2795B699
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 04:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713240739; cv=none; b=aOLtkevz9avrSNZIGEFwm6ZROSu+yrGXtT4XJlxGM9D6sg6BRQFMeNzo6MUtHwnj28Lva8cufoxrMJ7QRw63Ka+FSaT4RM7Vc7KoFSXMCaAbAnXNgqxRRZnpR5AmZcoFoRChh9Q2sRme46BmXdaC7RELgZhNaamoQ9eUIRD3EtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713240739; c=relaxed/simple;
	bh=pB2VSPvj33lI/8AQbCi/3smUxH+y5ljsCL7cqqiQMp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HHz5k/DYnT1jI1Xqdve3RpuGbFY47TNkUv4gANtjphFAnHIBelK1iEKSNSS2gbPVxoXfK3drlgfJegS1zYMR2x3flr9DOeUPUap6fJKg7LJk3dlwR0MLAB6PWscf/7PaKhulyABxvUsTvt75frDzL4mAQ5dGjmiOHNIKbEDSs4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=0rRlVCM9; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="0rRlVCM9"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6ead4093f85so3193985b3a.3
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 21:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713240737; x=1713845537; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lt9+WFFQa5ypEuNBueQsHraOx3Sw6YlRb9NPkxzQDbc=;
        b=0rRlVCM91YCBrEwVINcRNyF13VuP1xMRbBA09VkpNja7CCQNe3pvRkLr52gKZMaF+L
         1XeavWpAe6EKR+7L+tc8w9B5AsqcM+1WrmFN1WZ0jl0qpLijcUkKd2tpUfi0Tuwz4jUO
         z6w1ovdI7fQPiqFBb0SJRjwmR4k/0015Ry8yGwZbOps21yBA3ubyBKH1yN5D5lCvgriG
         UzGDaJyzU6VFqEw731gmN6RGJ2Yyjx8/mgZY65bnKZsmOaLHK1Pt30bu8u8tGqTlA9pI
         4tZ98ct4G+rKdmO7f16IfDnRClUM7mszIvBRcT8TislcymOUIaRsjFcWWV2yDRdo2VLU
         jAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713240737; x=1713845537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lt9+WFFQa5ypEuNBueQsHraOx3Sw6YlRb9NPkxzQDbc=;
        b=Uiiu48cud7JkktYPToOtK+BxzkmcbbQ+ghB2ugLDjf0zPJ6HRPMeRT2nppCWJx9mmw
         i/B9TU41cAGf8dLWHxx7Tg9c8kA2dcGe73ih1cFIkAyzAGRnXqY/vo0qrR37CTEWnUbL
         vGafA9QPRbMmQQaEV2/tJ28BT9+LqYn85wR2VOa2OHAxn+AwH6uyq2IyCsDHzDFBw3T/
         5FsUUZPFxROSExjzYtTJMty2h1zJo3QAposGJI2b9qH6xphMsebADd+thTdlmpIfAne2
         vYr/Co4/Cb4U1NEYqz46ePBWN+2wLMJ45lCwFtPvbRISDjo+5LNy8lZ/9Pappb8E6kSC
         Y7qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrjymmnbFjahlFcmjA6dtllpItlNIkizDKYIapBsd2/2/REfxQ2Ui/EfQkNmnXJfKCRHKzfr2BC3SCkmrpBVUq55P3NT0X+/Vy+oQ=
X-Gm-Message-State: AOJu0YxSugJL92YvE0fGkEWjzokQGzrq9Uw9iIs+6lgdSDNulKwWMJAp
	NS9CS8QWuLGNFeQ2LSWkqurejuq0VG2N0gTcZjdEYxTsd0VwnaZKpGrxsRUrSRM=
X-Google-Smtp-Source: AGHT+IHCNCA1HXhs7dCFTKMFTWnzq8i+GYhA6+4Dbcx+4s0UknMRIzl057VqWDeyJSsM3TdjS4r2BA==
X-Received: by 2002:a05:6a00:2308:b0:6e7:3223:4556 with SMTP id h8-20020a056a00230800b006e732234556mr11616992pfh.32.1713240735967;
        Mon, 15 Apr 2024 21:12:15 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z184-20020a6265c1000000b006ed4c430acesm8383149pfb.40.2024.04.15.21.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:12:15 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 15 Apr 2024 21:12:06 -0700
Subject: [PATCH v2 09/17] riscv: uaccess: Add alternative for xtheadvector
 uaccess
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-dev-charlie-support_thead_vector_6_9-v2-9-c7d68c603268@rivosinc.com>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713240719; l=1060;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=pB2VSPvj33lI/8AQbCi/3smUxH+y5ljsCL7cqqiQMp0=;
 b=dG18cYHtMBrx7rXL/eDJ2J/MEkXppkdVPVqNGAzWfC+Il8JQEsduUE1vvr/F4ONbgf1PyHIwe
 CJzJ8zZcdQTAxXdraBfQwbJEfD2R9/JWH+8NHRtQIw3nfMBSlLS4cMj
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

At this time, use the fallback uaccess routines rather than customizing
the vectorized uaccess routines to be compatible with xtheadvector.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/lib/uaccess.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index bc22c078aba8..1fe798666aee 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -5,6 +5,7 @@
 #include <asm/csr.h>
 #include <asm/hwcap.h>
 #include <asm/alternative-macros.h>
+#include <asm/vendorid_list.h>
 
 	.macro fixup op reg addr lbl
 100:
@@ -15,6 +16,7 @@
 SYM_FUNC_START(__asm_copy_to_user)
 #ifdef CONFIG_RISCV_ISA_V
 	ALTERNATIVE("j fallback_scalar_usercopy", "nop", 0, RISCV_ISA_EXT_v, CONFIG_RISCV_ISA_V)
+	ALTERNATIVE("nop", "j fallback_scalar_usercopy", THEAD_VENDOR_ID, RISCV_ISA_VENDOR_EXT_XTHEADVECTOR, CONFIG_RISCV_ISA_XTHEADVECTOR)
 	REG_L	t0, riscv_v_usercopy_threshold
 	bltu	a2, t0, fallback_scalar_usercopy
 	tail enter_vector_usercopy

-- 
2.44.0

