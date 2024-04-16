Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6426F06A
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 04:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713240741; cv=none; b=FseQKbL+JcPS5Tei2DUPTF5IAtLOzcwq18u/PbZTdXXbIuXPDvR+jQ/7VEttyiYLXg/iBVnFiUwud4Yqo5E85H1Cu7BbcNEq9n2NxGiZMdFY8fK98zboweRaJo/E5qIYcW2w/MLZtNEBcHk+HGHizYqjU0258P+5Rensk/DFC6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713240741; c=relaxed/simple;
	bh=hSZDQKNr3tkZT93AWiF+tJx7RzaJfBNyv2pzte748aU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DQQ+iuDRNqbInF5dssGt0zaOM7MuphYJL8xOdQq6ACyEBCJcQ3wrY8PncLaFgJ55xn+ICuFuQos7B4DGwFXJf6KNZdSgWbZ6JoPyg8yFYCPnOJZx7qSNBof14TWf2vlJCgZdscc2PGzrrGA/hnYPRcYgfdNclTY2SzCVd/HDg44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=nIj6dcvZ; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="nIj6dcvZ"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6eb7a0b3fe7so1416404a34.2
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 21:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713240739; x=1713845539; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2nk2JCBk+l9WgkXKFxu/w/itsXmN0i69JJANxOESAA=;
        b=nIj6dcvZKhpShmjC194ODT0bmjA3pFSKFNzCT3kE5xaP37WRBKYRI4PYrPJf5K7u2P
         PRu2l3HvF+EBMhug3cUFx5lcvacC4PSPzgu//O3JIrv2JONT8MFAAGtyCTpRnWdxxySv
         NDJg1uXfPi0pTmdVShJPHNcKTyjtJLn3mpYxG21vknEwnpEg5VhWjwHpSlYJr+pBrcV9
         L7Z+RRyyIBGHUObFMPih14se6yd/gHInPxthK3a2JnmKGiR2fUKc4R2RQ0LS7Y7h0vX4
         hce5YRuYjQaNqRu4E6YTWcGMiXcqySjskT8+lssLSW2Df/pU6U4jhWzFMkNGx3mulMO9
         SX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713240739; x=1713845539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2nk2JCBk+l9WgkXKFxu/w/itsXmN0i69JJANxOESAA=;
        b=M3Z4v8cw9ji4tXMWPz3PaZA8n0vQyIcsiLLyJu4UbsYZZwdy4nNAjvcKo835WqfcaR
         5shXzopLY9g2yd/1+SiqxNsJKKaXChPV9TfOva+YtYadne4vh3ufvm3xlPCgqe5usBa4
         bEKF7o2Zzto+D80TZm2qsWDR3MyrWXvGmzGwiQh/d2d8VHy0p6RZBGBZ+UJrq1O75s4S
         NxeTaY6U4XFwQOSE/K0JGxnASGjsWIGZL9M6cJPUCqIGqWTiummFH5nDag8y7Ee1NDuJ
         HxB3Gplmxk4AWdiXEGRcZPq+ZdeFaiSvSqNp9lur4Qt2Epq8dIVlyERslZhR5/MjwO3B
         2g6w==
X-Forwarded-Encrypted: i=1; AJvYcCXkv3pWPFLpAgOEddT12untew//DktmRENaBr2aWs9Kd4b/94oeCyIq+ZEzWrzjgQTQkA6Qx+BCA2hePvXZySMt84PhLpQdbrvZypg=
X-Gm-Message-State: AOJu0YwImGE9jPOM881fDNaUx7QIB3UOB5E4P5qxzEF2H16xD+sbKZGb
	h1sbveIvcn9OwLwaxyVQ7cqJnaCj4zSQt3MvDCOckNeFI9XTgHXshUAnzebqbI0=
X-Google-Smtp-Source: AGHT+IFNWU9CebDAHIM2aIAM6rLVSvNJ/hrQCBnmGjLqT75ItU9fq2F3GA/ekORi1awzAiDhiP22NQ==
X-Received: by 2002:a05:6871:1c8:b0:22e:c2f7:1116 with SMTP id q8-20020a05687101c800b0022ec2f71116mr13338643oad.13.1713240739236;
        Mon, 15 Apr 2024 21:12:19 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z184-20020a6265c1000000b006ed4c430acesm8383149pfb.40.2024.04.15.21.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:12:18 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 15 Apr 2024 21:12:08 -0700
Subject: [PATCH v2 11/17] riscv: csr: Add CSR encodings for
 VCSR_VXRM/VCSR_VXSAT
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-dev-charlie-support_thead_vector_6_9-v2-11-c7d68c603268@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713240719; l=706;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=hSZDQKNr3tkZT93AWiF+tJx7RzaJfBNyv2pzte748aU=;
 b=3n67e3FD9DqnFP7FKjCt1L6NZMd+vBdPmua297IaBixuIX0cg2gLuR2SpqAcKm34Fv/rCrkUV
 RSpsPRdvYKgDA6f5D8F2uvwawZAD4aRtLFgcjUvk86YSBvc93fYMyCZ
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

