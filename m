Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBBB1BC3C
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 01:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713661509; cv=none; b=kxlxN1yGfvC8iYt1/M4ZtjOUXwQr7PRXzefRg9R50GSVNe/VdWcvMsQOMmkbG9gmic/5xUJgl29tiNpRgGHYU93lKu7xN1EgtgiqI1FGLCKmIPn6ReNjUMpqwMxADh2/i+866SrTdhXy8ePY8nb5detlHvGDmZzQPj6bRTygO5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713661509; c=relaxed/simple;
	bh=hSZDQKNr3tkZT93AWiF+tJx7RzaJfBNyv2pzte748aU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TvOCXs63GROZFpJVZdcP0alI301bfALGm03ga+1V+f6kM+BSc6aiXTbLYpWboFyXA/3GfUBb+3WiPvt6B6e7MrwuOtvnnac3UX0R8S+/+K775yYbSpT7V2gDc5fd++hzfpQLUGXV2sPYvD38Lrz0CVDriDlxw0VolSGSFD8gBQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Oi359HG9; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Oi359HG9"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5f415fd71f8so2502580a12.3
        for <linux-sunxi@lists.linux.dev>; Sat, 20 Apr 2024 18:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713661507; x=1714266307; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2nk2JCBk+l9WgkXKFxu/w/itsXmN0i69JJANxOESAA=;
        b=Oi359HG9ktqa7AWUzGxpqdXKBwAkOL+4/ulw/l7ffdbW8R4NptrgZ8gx1fVijSXJiB
         QNUN7yIPP2AWFhsKXR/7BD0kq3RIGajMd+TfaYFr3ZGuexZ/Vn8vZWUBoeyZAqc1ws0x
         AsyqEg72F3z+v80RGxCtJkSxAbPFAi37bUoJ7DB2N5TBI1Wl5GfJ1Cbq6KfC7mWTfc1x
         gnZ6G73ZF1o9k1jkGZL9CAnG4GRS37+YS0kkFVDsOmiW0CeVBNqIJp3bzu7gINhKcFd2
         YsgO7pFZzhn/3IvkF1dWJc4VBAwVzA3I4O+EC5I5bhw9JMoWQ7z7g+YvYV0/cE9HntlM
         JTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713661507; x=1714266307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2nk2JCBk+l9WgkXKFxu/w/itsXmN0i69JJANxOESAA=;
        b=aPErG8Ks3hdNIdF0c0p7RfZUv7BENCzXmXcCJdGgPThg7d+8vrS4vrrWdvaTNu5Eze
         3N/9oqSqVEkpC6le4FV2k4dvwrYptDjgddAwV85XYuFoTmXT80pLcNJJRcRi+H99Gks6
         /83PnR2TiBqZnAVKrcTIimvQaEKkCNw+X1icqFS4gk3UTitERcCJKRPFVOwDH2do5bll
         sWmgKQFIb8qhwmSQl4o3y20oPPlJ8vnRpZXwhNz/Kq5D5FwzFMW2+EXI96mFJSsomFqO
         lsxgHamFTaEfh07bvGZJS4pG9tRBBU6J0Ej6JtMAEFuQj8ukpQdlRMfNp/ynttu1ljo9
         +CCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6sZ8R4b0lW5FgIm3hF6tHRkd06zTsUdABb+0QWVKul2GJbEWPFmjvqAA6Cm8VDR3TOkle5T5LzLWeksTiWa5h2Kfxes8aTsAVl3Q=
X-Gm-Message-State: AOJu0YxuE99+L6lM3O9jrEwlx1ACxGlVq89ONco2jU3L2yT87ikcOQ8A
	PpCfNtwi4pLP2oCRlEWNUCmvQZZVVpY6JJvv1m9AE0TlCUbkSAV4K3NbGD5oEN0=
X-Google-Smtp-Source: AGHT+IHHK0CmFEjUYa4B6mPQ0N1eaa44TysOKXGCa/Ivklg6CG4klOmrEKVYQ7lcoTnquYAd4o9XZg==
X-Received: by 2002:a05:6a00:3d05:b0:6e6:9552:cf33 with SMTP id lo5-20020a056a003d0500b006e69552cf33mr7165613pfb.31.1713661507603;
        Sat, 20 Apr 2024 18:05:07 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d6-20020a63d646000000b005dc8702f0a9sm5249627pgj.1.2024.04.20.18.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 18:05:06 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sat, 20 Apr 2024 18:04:43 -0700
Subject: [PATCH v3 11/17] riscv: csr: Add CSR encodings for
 VCSR_VXRM/VCSR_VXSAT
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240420-dev-charlie-support_thead_vector_6_9-v3-11-67cff4271d1d@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713661481; l=706;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=hSZDQKNr3tkZT93AWiF+tJx7RzaJfBNyv2pzte748aU=;
 b=EaRHq+U6nQY6UMNHfwQt7VXjyHg2fLwFPXP1BAl3sVEmRMdMMwXIiKvRomtQPJzmqtJqOUvg2
 jdINbQQjXWJAPYzqwG9jFhZUzK57PzwK7Icxv/QOIMHdsf9Ai2sSDqo
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The VXRM vector csr for xtheadvector has an encoding of 0xa and VXSAT
has an encoding of 0x9.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 13bc99c995d1..e5a35efd56e0 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -219,6 +219,8 @@
 #define VCSR_VXRM_MASK			3
 #define VCSR_VXRM_SHIFT			1
 #define VCSR_VXSAT_MASK			1
+#define VCSR_VXSAT			0x9
+#define VCSR_VXRM			0xa
 
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00

-- 
2.44.0

