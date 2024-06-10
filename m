Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CEC155342
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Jun 2024 22:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718060223; cv=none; b=QeLQ5KPMRYS8htW1s5Lm8c5TBqsS3H5Wm7u56hrykm1zm6E9rFc8fL73+TDk1h4DVJr/JfceMl1Hm7sBTH9mXqg7OmXzGGUvXYAQXWNkPsqtrc/QWli3uwO12gPnGuM8/XK7Y8WDHws/0BpWx6Bzkz3GE8iA5xTmVfLNM4Xhe3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718060223; c=relaxed/simple;
	bh=YRbwjAEMooOC1Wqfne0YGBAOlvdWm2exzND7IqGSDDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FLnHeJGlX3B3RVF4jguFIa/KVwYROdYawSfKzJw9jPfji7n2FwZEz2wshaboEEZqnPwxhshdtAaHG0Q/2VwD+wKn8MtyINNebwaMYBAQJvUK0G5WuIFA6OFce83HAO81tw35n4u8loeLeFDk8I1Y2GyWlj4r6vgd0kOhU76ElMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=rwvT7pWO; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="rwvT7pWO"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7041053c0fdso2385617b3a.3
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Jun 2024 15:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718060221; x=1718665021; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7HBSOfNpcERRo+IfFfSUzbZmQ8OANKCSab29OA8NgQg=;
        b=rwvT7pWO27Se0yQEN2CO4RYhLruqoO6P0z6J2wbTga/O9MUe4q42xOqMaRF3wCMjW1
         UU5952G8/mXDM7OhiKVLU7eiav86n0cqftKUDCDR4Yx5yEmHrwyMkmSj8uarP6Li5wKN
         M/ILWJbsZTe95br9ifYrCmCibBFSBEsh9u272h2jeMd2hfRLlc9de4dwLXx5C+uZKhSQ
         wScVFGNmIp6xjUbd/nt8jVZ4R4UDdodtqEb50dqoeQdXy7dy5Bxo/eGAzsVguzWt4pbO
         m8OyX5TUbq3Dl4T85nux0RP0OZnlEL6uKWKriTOCC1tUslGVPR1zZ+6NhkeQGQOIa1Eq
         uitw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718060221; x=1718665021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7HBSOfNpcERRo+IfFfSUzbZmQ8OANKCSab29OA8NgQg=;
        b=flYSxjpqDHdGKFtyzU47wJ2lXG5pHWbu5/ZL721vsjjhJ7/GDcd5djdX04lvRWVxcj
         RNSoAtVV9OE+QCNQ9kYw2chItdjHJw+e6E/wor7bsvXPMlBWmncCv2zWuUMdCXB+3TKZ
         JAtF3VunwC+eeOiy0LDkX3LEt52vi5f83ghI9ZMuizmOGBY11I81rZNyaupCxtDuQ2VI
         NLfJVqLfbOMf4ERawXmWhzNZ6tYngX1y93KQHlXtyXPEiZiNg4EzmPn+ly8bJ/cxAv7E
         iDeLbFVIA1H3vc86XJ5z1igd9WnwvFjouF1DbJHAe9yrZ68aUi/EUlSATIe8MnxgzXDf
         ZIbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVgSxdYYsbF67fD5C7obF/4TSPwOF3IL5GX16PeclQ80b0vBiponDFON4LObbpy4UGqDbMP2s4tNJ/8/uRGKIoUMlQIli+Z1AfaLI=
X-Gm-Message-State: AOJu0YzQcm08TOn4kLKPD9GHzbtJ1uvI4R+7pOmedZvW9kBroXiGegqr
	0X1RKjH/R/LH+VkDCmpgqgEx+qXd4rAY6d206fSoGS/2uKXouFkGbQngB4f6yUk=
X-Google-Smtp-Source: AGHT+IGIZbpFLMHE/lJ5GbefKME8Gn68phzhUe0FaeJN8+1dFczSl0GMa6MPZKO47tw63mwCQaqOEg==
X-Received: by 2002:a05:6a21:9991:b0:1b4:772d:2885 with SMTP id adf61e73a8af0-1b4772d29d3mr9114268637.3.1718060221031;
        Mon, 10 Jun 2024 15:57:01 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71b597072sm18355865ad.99.2024.06.10.15.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 15:56:59 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 10 Jun 2024 15:56:44 -0700
Subject: [PATCH v2 07/13] riscv: csr: Add CSR encodings for
 VCSR_VXRM/VCSR_VXSAT
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240610-xtheadvector-v2-7-97a48613ad64@rivosinc.com>
References: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
In-Reply-To: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718060203; l=706;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=YRbwjAEMooOC1Wqfne0YGBAOlvdWm2exzND7IqGSDDM=;
 b=BM5m5V/nQRNhZjvOPuMabe0KTvggdAN05fZDbXe+2vVdatDi9tChErTOUmlzrP1AEH9N7fbby
 PcLGUrn7jT5APulSOlHctEyjRk1D0HhX5Gm8tzJtZGG2+4QDc9oh7fv
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
index 18e178d83401..9086639a3dde 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -220,6 +220,8 @@
 #define VCSR_VXRM_MASK			3
 #define VCSR_VXRM_SHIFT			1
 #define VCSR_VXSAT_MASK			1
+#define VCSR_VXSAT			0x9
+#define VCSR_VXRM			0xa
 
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00

-- 
2.44.0

