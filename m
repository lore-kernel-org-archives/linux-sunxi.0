Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CBC78B50
	for <linux-sunxi@lists.linux.dev>; Wed,  7 Aug 2024 00:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722990721; cv=none; b=WJNJKrbWkLe92c3qGFj9Qy9d4Z+CWZlv5lYly9ze4JKEanCDey7Po051sj/8YGZWsewTPzbpkUZSuRnbFN5WzAzKGkbvcrainz5GGenEzuQuRl8fUUYRpwNNVBErtMD9dVBkLdm+tqwNeTaVsOokVaMH9InDx4cHOCy5EdQRJN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722990721; c=relaxed/simple;
	bh=M4fQyJxhZ7NtPnQCPQfoncg1fbWtYe6qmsOGHrd6z/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pmTRPUH2S/snoSw/CdY/vp+I/QUZn/o8gluIWBZ9EYCiljOSfHqnCLr1IumTifPeq5EscAokA4nIldm7rGmdJgC/67syOfX/UCseti32lct5Euv1DJsrrYryzIF3DEwSGFAtGWMjQNgucjph5xDtajD8rPzqb47duoJXRG/sLsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=PnkLRrVj; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="PnkLRrVj"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-260e1b5576aso791048fac.1
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Aug 2024 17:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722990719; x=1723595519; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6vSC44jl4CdBSHHJd2q6Sf8U8Y24j++yUJmo2Jtjkw=;
        b=PnkLRrVjGiyehOxISGEiuFptfz8s+qgpejifu3m+Abe6OCQSvXuHEfm/wMRgudCJQL
         HSUTVzvXHQEZPGwXV1RJu3Itl7z/3B0ag3fgZsTmVsJ0u1dQytmTW0ZHz7ERQ585y2NP
         mLLGAq1vkfMHrhyDGYslXgW6flsgRfQFni7yAKwgdCD9UU89Lve8Rm1SmgRF9tc6pX+P
         KFHb6MsLAwbXz+iMHim2S6PMwnQafqzsspqyKbaBZAmdLIfiRfx0cnyFF2qISv7esUhD
         OSgWM1CZQHFylxpsnlMIh44AS/WGTYiei5udvhA+IHUtr36CArSB+ep/57wqfN4pcMC5
         mBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722990719; x=1723595519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6vSC44jl4CdBSHHJd2q6Sf8U8Y24j++yUJmo2Jtjkw=;
        b=MtI9yJf52YGV6OdzrDdsAk7RyhW9Pb8NyGuFcdtNj/APM6Nx0ml4TxXk+A1r7Va9Tn
         nTZ5de5U2atyCrcEdEhFcyWG7fwEmOcZhspZz857R4YMo1JlLRp99Vfezrn8g+XffzjC
         ytL0C7kjuMHRpj5FIun9rdnJpCOcEQM7W3fBQMM2v2e7TvE9U0M6OYDr2nLh/U3YBlrf
         4epJpD29GghG2b68uMZG5c9W5OFiKvcA3bKPmm4Dy/2znnUFRpwlv3AOEUo6nZWUwjOm
         kewtN/CapFMQgUQ3r64TnLMCi5j7e557BRJHYdno9D+wJuNhAbRDQiJd3LydrkGcx+rG
         nT5A==
X-Forwarded-Encrypted: i=1; AJvYcCXvzRfB1Hgf6nDOzRXKwF4j6s1DTWMItYN9ZpoqSdGU7vKSvKI/VpAHyDchM833YwOWnxwema6NjCoaXuXE8VQ+rMmAiPEG5c3C1YA=
X-Gm-Message-State: AOJu0Yy003oRGwETq5/S2ppD+kXauRzQqYgrnW5NVQrSr8PGu4upz/D1
	N9cNl0XIdAo7Gc2Yk+hStGUadHEur5afWNIAk6jGlJWkuyy6gun9ae07532GBo0=
X-Google-Smtp-Source: AGHT+IFnj3kIuRll1qVruAYZ27yJp57qLFZHBjlVTk6x/guLrFPnuVwAodBd5IFbDfmkbBhevIxCJQ==
X-Received: by 2002:a05:6871:5b2a:b0:254:8666:cded with SMTP id 586e51a60fabf-26891d3b2acmr19881342fac.11.1722990719025;
        Tue, 06 Aug 2024 17:31:59 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b762e9f5aasm7476174a12.6.2024.08.06.17.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 17:31:58 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 06 Aug 2024 17:31:43 -0700
Subject: [PATCH v9 07/13] riscv: csr: Add CSR encodings for
 CSR_VXRM/CSR_VXSAT
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240806-xtheadvector-v9-7-62a56d2da5d0@rivosinc.com>
References: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
In-Reply-To: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
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
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722990701; l=1045;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=M4fQyJxhZ7NtPnQCPQfoncg1fbWtYe6qmsOGHrd6z/g=;
 b=iKtL+WyQGLyitjyGHlYu61BfGzlSRVUxwmNxH+dUMij5Yc/9iOxYeYmj/uiQ8K8XXvkTGyPSs
 /HJjj73aZMBArTPioQCOvQvyG6MSxbyqfoWVpmBWkjzkt1irCHP5J83
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The VXRM vector csr for xtheadvector has an encoding of 0xa and VXSAT
has an encoding of 0x9.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 3eeb07d73065..c0a60c4ed911 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -300,9 +300,14 @@
 #define CSR_STIMECMP		0x14D
 #define CSR_STIMECMPH		0x15D
 
-#define VCSR_VXRM_MASK			3
-#define VCSR_VXRM_SHIFT			1
-#define VCSR_VXSAT_MASK			1
+/* xtheadvector symbolic CSR names */
+#define CSR_VXSAT		0x9
+#define CSR_VXRM		0xa
+
+/* xtheadvector CSR masks */
+#define CSR_VXRM_MASK		3
+#define CSR_VXRM_SHIFT		1
+#define CSR_VXSAT_MASK		1
 
 /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_SISELECT		0x150

-- 
2.45.0

