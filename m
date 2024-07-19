Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EF114883F
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Jul 2024 16:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721405961; cv=none; b=W85Hkvc9OlA6GuwogRz+lGTJwpzz6LHArqWHgla4rQBDxr37PevIsT9CwS4fvGsxwXYqiTlozlggXO2zmQnrZxj4iXzeOyhH7CLTONa8dQ+c31DSwRKktJBaytPoi+8R1Pzo1YTmzie5QwN0HM8xV6pEVgFNMGa5N3XTAKm+HVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721405961; c=relaxed/simple;
	bh=L3aaRS2j1B7ly0GhgM86XDS3MRCOslmFg/ArzwGxzO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jcW9fiOokjEiUKOqR84T7zY0cSSlA3zF7IdqUKQpB+gBwzt0HFEMCdBkZnlG5wnQV7rB2YeMFEuNOLLZdlnHz1i+JtXDvfbdvlF4onuW5osQwJUjXykLz6K5jhmW0besTM1t4/y0z00qCDkAZdh/lrCPvEUBqhGbDatyFW7ks8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=KhslwwrA; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="KhslwwrA"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fc6ee64512so12396495ad.0
        for <linux-sunxi@lists.linux.dev>; Fri, 19 Jul 2024 09:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721405959; x=1722010759; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhITSSlteAMwmsPUv9TpJ8KEJQbK1ok0BXYvmwnIXKY=;
        b=KhslwwrA379SbBRTPGpLqUptMfhI70I+jeq5ZK21qo4ggW5uOZh1T0rdsXjvy8puWL
         PKeTexgbE6fUrMk6Mql/ge98kMHXNFhVInO6WKrLb5UyR+MJk9Aqdd1Tg9Q+ElGSe6pc
         A004Z+rh1UqQP7ODkRKv0g+jUpY51qZN6KXfQUTbDS34vzhxASsG1Okh0OtudOkysriW
         M5RJZ8Hlf6ZEppcjAZqgWdgbs+YZj7i4NsP4jyrUM419979e7VKPtUFuAFPpM2jKj6qK
         WEBojc4EH7TOkIbNJSrn1IMgGsHUzLJNYYikTovNXlY8xN9T1CAYRq/1geEQ3u+rcass
         8wbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405959; x=1722010759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UhITSSlteAMwmsPUv9TpJ8KEJQbK1ok0BXYvmwnIXKY=;
        b=nvNNkSXD7+tXxUdCGb0oeDIrAV5TA6oKWyD3U/bqUai88xBt4ueZGDzmLTrVSqmS1i
         IBfAghqrYSviS6cLEG/7lY09vRwxJiMrqrAFw8vK7BgoKsY9o5QKKYMZ8EAoapAISUpb
         Y62QE0b6QeG6YR9oeeusq/chOaSKpGtbCgEHGkh9yvuO+8e5pbmVLHzHJw91Wmm3nz/E
         wSYwnID5+6ruUSN6fM3ZSDSlrcevRtvP5EoXWaM4WqZ4rD1mVB9IEAbIUui5uyGflWET
         qgCm4y26f+D6D4tIumQfU9V3udC+HsPvaxPsz5bEUr36M50JXdl1rXQ0j254gWMEIjyr
         brQg==
X-Forwarded-Encrypted: i=1; AJvYcCWY7ZsXUkR2usQvDBRHE2yjk9xzbx2ZcfDCqJ1x94ppTkWD27OgVOvXu4ebtyE6JFDlWin075g+SAzDMoPUc+nBN2HtfLxMDdEZusg=
X-Gm-Message-State: AOJu0YzqGfONVJ2BugX+rb9aA/llG2dddv6fjtmoEQOslVVwjr1YOdSQ
	9KR0Nh/0P9OsdPZldaoVPUqoub2ocVpYFeP+SL84MBE5WnH60OeEfkwj50fo2cY=
X-Google-Smtp-Source: AGHT+IHQAe6O+cJbWh30lRbS6fU+uPb7cUyHdN7YYYoHVFpFhiHM0/KCIscA223+WHZBsMAZXm0o0Q==
X-Received: by 2002:a17:903:32cf:b0:1fb:19d1:707 with SMTP id d9443c01a7336-1fd745735edmr3496045ad.11.1721405958836;
        Fri, 19 Jul 2024 09:19:18 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f490dcbsm6461435ad.297.2024.07.19.09.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:19:18 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 19 Jul 2024 09:19:03 -0700
Subject: [PATCH v5 08/13] riscv: Add xtheadvector instruction definitions
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-xtheadvector-v5-8-4b485fc7d55f@rivosinc.com>
References: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
In-Reply-To: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721405940; l=1957;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=L3aaRS2j1B7ly0GhgM86XDS3MRCOslmFg/ArzwGxzO0=;
 b=46volz7D510nYpV8b8G8sEL+MfKDxkahX1p7p6VUtGEmp9hohd4dHxtouCXjKTmXgbf9vIiF1
 wq3zInJRmH+A/hFLdwwNWrSgDojxtU74mzqmsjOmzA+vh2qEoz9yX3B
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

xtheadvector uses different encodings than standard vector for
vsetvli and vector loads/stores. Write the instruction formats to be
used in assembly code.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
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

