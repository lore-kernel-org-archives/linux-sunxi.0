Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662D242045
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 04:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712895111; cv=none; b=AT8UtXXdHoqWHinyTChtzhgTmkuqnEyoAI1DJ2dVyfVO+SlwhpMZOtbsJVdEc94yW8YrUOw7oyREqR5hrChQJ4wm3kjqRyc6alH3VpqSG6EGiqQzWVPvMltYp5srpl4Po/9uJzyIbhidkO+si1v5qfi0lkgXt4rvWDX2fHQ0+JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712895111; c=relaxed/simple;
	bh=AjSOqPvk8pDaNRWNo6bJjXE2EKHaQE5Z9yM7TIyqWv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WCsq2yBOceERFLfI7lpdUladKN5LRboAy25GT3Oo6AgcUrtO74UrELK3GNnVvzg+eI3sW1pgUOnfdE1bcqrA1eQh6MrQUZ5isnhNPW2WoxUvfw24UfcruS4zzSEVmCAkbOfp0dox5Ipz0BO/JsQ8d0X7ZU8kzOglX1ESPG1nrxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=TBIQZikd; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="TBIQZikd"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6ed2dc03df6so476132b3a.1
        for <linux-sunxi@lists.linux.dev>; Thu, 11 Apr 2024 21:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712895109; x=1713499909; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZMPIuwt6cMnmpNq4lu1wiuX0ZLQRNI3Tbplv0ws9fgg=;
        b=TBIQZikdaIC6XSTV+fF9RCF4Zh6u1Lo59E3MPzx2TLs5jNvIFwJvQzRdVtUwf3eBmC
         JX/ofjisUosgi+oWj2OQiivTZeju+xzFoOBo7IhTUyiCsDMgTGOTW2bOFkkL7ywqldsM
         l28l9jWzfKbtJ9ASOZGfsQtDIF9VjQ9dLj3vX4pn9mT8XLaupUXj5/Np5RmEqKqrlavu
         FPhJG3Lyw/RYwkSmeojiB3ucTd66uJPzBbFRw1Q/Y3zRxBePcASI254gxUX3uTNUq/mC
         AkMjLYrXfUMIxdGuiba4SbgAMSi+KX5By7at/wYPhge2nF+sd3QAePQMz1Cnt+Qo7OuF
         tm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712895109; x=1713499909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMPIuwt6cMnmpNq4lu1wiuX0ZLQRNI3Tbplv0ws9fgg=;
        b=eYOzQkynHh1ujuV+b2R0p+oviXw5Ypkf8C9mI9Ng/cgmSovrg2/BtMLmiBTx2C4Yhx
         v+U/n1IRuzsEHwLwfle5Mgfb5ktiw7cpXAXYMk8d1S/+Id4y3Y/HikRd7po/IkG19lwQ
         QUmKV4UkQHD0ryoQ4CqT9Va54hW6Cl8b7jLc/s4Uukak8veea1swjmByfyckt3i7vSs0
         Nhs1IXnzdbIcjpJYyxjY3j9WiDVyLBd61d8DMM7AtGr0rEHDleN+2WesOOZhWJy5QRO4
         9GBJ8GS+hEYn01a6tQFntqDKpMsmYPjqnmnjjsmPQCcs6hxV/VutCyYQpO70ZAu75+Uh
         Iahg==
X-Forwarded-Encrypted: i=1; AJvYcCXG6JbLJcM+XD7vqUPcD2Tt2VzA1k2bLHEmvL+dRWG8du5aoii6xqxfplFmWUJO3jvLNlA54ddIBB9EIqEd6+nkYkauJd59TEkXaeY=
X-Gm-Message-State: AOJu0YwOiDe5pjU7+XCLZEVzjLacj8C4DA6ou6/yKnidOSGjWqcALORA
	GKMHgIs08xtLQLyA32hKI3Vzkwo56IB6g4cyKmUUrLCRRC0omyDrk9MzRDqic7U=
X-Google-Smtp-Source: AGHT+IFCzy27N8mqtHUrUbUr0RUPxfjDtDbiINOHTo2v+uHwsCX7URxkFsS+GECfOE3fQY7tSLC35A==
X-Received: by 2002:a05:6a00:3d0f:b0:6ea:b073:c10c with SMTP id lo15-20020a056a003d0f00b006eab073c10cmr1638560pfb.6.1712895109632;
        Thu, 11 Apr 2024 21:11:49 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e57247f4e5sm1949712pfb.8.2024.04.11.21.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:11:48 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 11 Apr 2024 21:11:15 -0700
Subject: [PATCH 09/19] riscv: uaccess: Add alternative for xtheadvector
 uaccess
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-dev-charlie-support_thead_vector_6_9-v1-9-4af9815ec746@rivosinc.com>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712895091; l=855;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=AjSOqPvk8pDaNRWNo6bJjXE2EKHaQE5Z9yM7TIyqWv4=;
 b=rLdA0uDN/4SuDsKaNkE1B/5EQ3+8RUn38NFVGd7zgF1hdVuMZ9rnFvU8oAtWxXhpoFvN3XcS2
 AwLpS2uv0ZdD7oPmFrJym2AWAe7fYoEjhePpIuQeP49tGq9DoLHJSQU
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

At this time, use the fallback uaccess routines rather than customizing
the vectorized uaccess routines to be compatible with xtheadvector.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/lib/uaccess.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index bc22c078aba8..74bd75b673d7 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -15,6 +15,7 @@
 SYM_FUNC_START(__asm_copy_to_user)
 #ifdef CONFIG_RISCV_ISA_V
 	ALTERNATIVE("j fallback_scalar_usercopy", "nop", 0, RISCV_ISA_EXT_v, CONFIG_RISCV_ISA_V)
+	ALTERNATIVE("nop", "j fallback_scalar_usercopy", 0, RISCV_ISA_VENDOR_EXT_XTHEADVECTOR, CONFIG_RISCV_ISA_V)
 	REG_L	t0, riscv_v_usercopy_threshold
 	bltu	a2, t0, fallback_scalar_usercopy
 	tail enter_vector_usercopy

-- 
2.44.0

