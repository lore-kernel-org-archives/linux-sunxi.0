Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5BA22EE3
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 04:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712895104; cv=none; b=f7lLKsixSd+bKCSMZrkbH/QHNEP/taREiP8uStmEGg0zvMYmogB7cfyh6JDMhS3t8fB3br8xnuGOZVRe5pbTUeEWD5hgrko2t11jTMuu4sK1XZ2FnDG4GGmulDX9rv2r9pMVvNsRqvo/8BqU6KOIJ4nGaLYZqFkIquyZoNqdl3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712895104; c=relaxed/simple;
	bh=WDb56Qzs+x7qgry7ohRR7vfqZXbErIkQr8CN2awdr1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RT5hLC0OirRpG2JFjE0nOGKtvQBXyyFxbtLbzAuWJ60Orb6CVOgq5IdvvsI9SjJlTxMCt+heHc70N5gNmtRspaCb4aEQpWR5we+jDPDGIg4f11BW1m8N/hSz1E33cwa7khtiXl6EYL0PzL2Nsnw9Cunf/7fvcdErTrgTeyh/0+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=0xTc6/tz; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="0xTc6/tz"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ecec796323so556444b3a.3
        for <linux-sunxi@lists.linux.dev>; Thu, 11 Apr 2024 21:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712895102; x=1713499902; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wB7ZUsYFAipUnqatnSlT79/6WrFmpwXquit13SzfcsE=;
        b=0xTc6/tzYNEUMNMZyza3hafvwzw+sHz5aqynKPGjMN/Ih2bEJeDN+JigtVToecRbqD
         1jqTSfeUCDGoW/ZpN88udm6IVlsiE+1mT0vaACYGsBE9+OTEpPyV/Ny0HzExsT1boGOa
         mOLIm8jZvPc9A19kOTO+Hyb6OsMvD/BjAIT5a58csqdRoNvDnptf6l4QC2kV+kZxOks/
         OJCwPxY6CcxhhvBa+km4w07NYYt7V9hljGyeV87m4m6RyhCdhMnov8JZQcK0SKoI5Dl0
         ARJpmcZGyYr0mSlxr7D2Yr5+MjDK+93rFN00BClst0JSjGrrX26JBLj2qcUi7VGGFktP
         sPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712895102; x=1713499902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wB7ZUsYFAipUnqatnSlT79/6WrFmpwXquit13SzfcsE=;
        b=hB++VIKqTTW1G3m/y/DqGXoSiZBkQMQdGZi7Pabzoe194wssw3FyY7czy9kbb4vWwf
         05HeiNvRB/ozeELs44eelvJJts2s5bpV9QJ7M3OEAahtQ6C50GGPo73hMqY4b78OG1L6
         /e5MoS1VRnSxNDZM4htIUoyNGAgpFB/3CZdThJiDrm9clTbz7KG0/mEWDNp0JmCwyIRF
         Oo70jKkoJ0xYqBiKEdr65huxT4ukoBTq6rMRd4lGUUhvfuXUwz1ltQ+62zVZUC5feNb+
         7FqLjuqR9QesEljiGCKSuN9OKaVk972OyxsKiKx8s2nI3MZNPoaqG8LuDH/NrUYzLhzq
         CExQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNL4vheACyfCFVvkPcYNkdvc+KqDlx+MeLHiR70KCVsF4Oo1UjruaVcNyaOF7AD46RHOEGsQKaZ3812+YUmklsbCFRWGX9MWKUcBc=
X-Gm-Message-State: AOJu0YySmpYOEzTImnb2R5eCRBGoat7cvh96GmoG6kcXcN64Jb5Bdv/N
	dF4tBzyls4YHKvsGfNeBKsZx9mBR37R6mnM38Rmq+JfeT6AdONBJHCLCWC8sK3k=
X-Google-Smtp-Source: AGHT+IEbXTdjwKLaPoBheBbgei3pXYbfSWchIDinY7tvcECrUoBINHI4reVXQnWJo28mfWEnV9kXkg==
X-Received: by 2002:aa7:888b:0:b0:6ea:bf1c:9dfd with SMTP id z11-20020aa7888b000000b006eabf1c9dfdmr1790213pfe.27.1712895102592;
        Thu, 11 Apr 2024 21:11:42 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e57247f4e5sm1949712pfb.8.2024.04.11.21.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:11:41 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 11 Apr 2024 21:11:11 -0700
Subject: [PATCH 05/19] riscv: Fix extension subset checking
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-dev-charlie-support_thead_vector_6_9-v1-5-4af9815ec746@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712895091; l=1009;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=WDb56Qzs+x7qgry7ohRR7vfqZXbErIkQr8CN2awdr1k=;
 b=DqPs9x4+xKLxKyU/GrR0haiJT1ooRWwhD1976AoD+11P4Z8zzQJKe+3G0zIGEYtipbwIx+Bxe
 QzUI0P7hfTcDieR1B1pNbhgYYul8C9wqM7AqldfpgtiC+2APKsFh8HR
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

This loop is supposed to check if ext->subset_ext_ids[j] is valid, rather
than if ext->subset_ext_ids[i] is valid, before setting the extension
id ext->subset_ext_ids[j] in isainfo->isa.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: 0d8295ed975b ("riscv: add ISA extension parsing for scalar crypto")
---
 arch/riscv/kernel/cpufeature.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index cd156adbeb66..5eb52d270a9a 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -617,7 +617,7 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
 
 			if (ext->subset_ext_size) {
 				for (int j = 0; j < ext->subset_ext_size; j++) {
-					if (riscv_isa_extension_check(ext->subset_ext_ids[i]))
+					if (riscv_isa_extension_check(ext->subset_ext_ids[j]))
 						set_bit(ext->subset_ext_ids[j], isainfo->isa);
 				}
 			}

-- 
2.44.0

