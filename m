Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC801CD00
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 01:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713661511; cv=none; b=fpr6EQBK7SwiTSajIs7D3zwt0jrhqDw+OFTg7JTsbog2Hco86uks1skhkz5ozIw0O9kijaBBUVQOI2VJ6TvpkVlKflmRt81wsS1UCrSihnpRhD4o+MN9A7OKgQITnPYAROxzVqt8IhPQkeh1+i0GwCfzQeo7sZpzLkqpWpoH2Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713661511; c=relaxed/simple;
	bh=/S5mXvNckx5pf6RsnXH2juTR+JzZCbCosBXwMflqUFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XAj/GvVg9Q1bIHGXpJ7rRUg1iTMtb+snYATsqziUGL82fqadX7Q/V2QwIjdtF17wueItBxdc/Cxo8p8bFcCMbygbOcC98YQwro3DeBxF4mSyTRRUdz5gBOCh49fj7owaKMAO17eFb4BFISUJ9fKvyIgxr+Nk9GTejdAFgjssRM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=PoLpQxWc; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="PoLpQxWc"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5ce9555d42eso2197960a12.2
        for <linux-sunxi@lists.linux.dev>; Sat, 20 Apr 2024 18:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713661510; x=1714266310; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7WZZ9B05w7yOdiDdmOf8xUgYc+IvuHvU5nr8Ugv9mw=;
        b=PoLpQxWcglkbuhWxjHapamyw9OsE7alZiQa+giMrO/Ui5kUxUVHtLo1QsYKFWQQL5u
         G7p+OFlIxq/uIsMtL38z0m5P41tebn5mFOCfGiO0S6+OMYlU6u6nnO+A8Aui/goMtccX
         N313To+P4m366iS66puN19dc0S1TElsgr3DFZ+za2A6WITxyVjVV/golJYbuQOQuETW8
         tsYmvGgaGIgxqsOmEOogUHHYm+Z3qGrP83fl62Ez0cOTtgzK5pUMUEWP/qGQHC5oA99g
         ciNcLarfHXGo2BkcmQx2y5g08KRk7dWGMMdADp9tjRPg1JOfUxtMa3tXghFyb/bcjdm3
         L4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713661510; x=1714266310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7WZZ9B05w7yOdiDdmOf8xUgYc+IvuHvU5nr8Ugv9mw=;
        b=cqE4rbJ2kHVx9DUnb+xP3C4m1RAniavfVwmDt2XTQ1nkjtnN5rUDLaUrNH3VbpVJTn
         M4oLvlAql2wuA3hekwX0ZDkOPS9+BM6XkVG1XStH09cPXL57Vxfvumk3YfNGUYNtONxA
         9dWQt3eCctmuEKPx8NAI2gljbeghmUBiqJirCRqtiGfwDcdNwI+hsYsVTFwuYOZ1tsZe
         r9VuwFU/UwXvRoAJI9DE2BJFG92Ebr7b873WU7BjhNREPMHvDUZOGnp3vIWhEr1oBGdI
         Yckq45Y1gFZ+HoZGVRSesKfoOrkh81wlE0j3q+qqqz1oeIVi/coIdXuDI4yAzHbraZTk
         Bv2w==
X-Forwarded-Encrypted: i=1; AJvYcCWMN4fYGf+f9pyWOpEbWDowwHABX/V38YBDaH8SdZIRUR/9SN6dLIqs1mpLL3cFBJcsgHBdAYWHvj6xDg1EOKiEt0izecWeDYzbMuk=
X-Gm-Message-State: AOJu0YzIWrFfg4tuU1Vaco6UMFvIAJzxhNVLIWk/6A6AdBaT8uvz9I1N
	ZYL89kWU1+/F+1uWtnRb/03lEI2Y6SUbJpRQ3UD2qHh+n52JzqHM/XR14c1Wm4c=
X-Google-Smtp-Source: AGHT+IHKFFwWOUNX34yfbtkNAA2sLpa34va32+rUsK/EqAZ0SRgYOjV+4xyTToafrWWlIRTNeQE9eA==
X-Received: by 2002:a05:6a20:561b:b0:1a9:3e7a:b0fc with SMTP id ir27-20020a056a20561b00b001a93e7ab0fcmr6650092pzc.51.1713661509732;
        Sat, 20 Apr 2024 18:05:09 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d6-20020a63d646000000b005dc8702f0a9sm5249627pgj.1.2024.04.20.18.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 18:05:08 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sat, 20 Apr 2024 18:04:44 -0700
Subject: [PATCH v3 12/17] riscv: Add xtheadvector instruction definitions
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240420-dev-charlie-support_thead_vector_6_9-v3-12-67cff4271d1d@rivosinc.com>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
In-Reply-To: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713661481; l=1914;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=/S5mXvNckx5pf6RsnXH2juTR+JzZCbCosBXwMflqUFg=;
 b=1kn8f9MgXWKJKmQlrV30BpZBvgJ52FS2fVV9itSClPiV/9gnAsAa8aFVH+g1I31umjB1dO4bk
 q2h7E0sCJbKDEMlRKHZpHo7aqc4t3bXxPYgHr6Zitugls9OvOjNuxGR
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
index 92eec729888d..6e3c85351f82 100644
--- a/arch/riscv/include/asm/vendor_extensions/thead.h
+++ b/arch/riscv/include/asm/vendor_extensions/thead.h
@@ -16,4 +16,30 @@
 
 extern const struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_thead;
 
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

