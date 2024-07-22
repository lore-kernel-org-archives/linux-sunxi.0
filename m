Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896917604D
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Jul 2024 21:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721685508; cv=none; b=gRrofYKU7ThxLq+4pJnlenjmNuBNdExLuCuFxLGOIN1nFfzAXaTksy4TJoD8TURBJpjlMmrJNXV0+2X9I+wciClMWKOUh2u2/eyGxtdsfk7KdEv8Kt+NhK0A4518Tt8etUXB/fYNcialJREJmZ2xOALlwLhik9BkUT7nFNnM/Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721685508; c=relaxed/simple;
	bh=/awdvkpT37Pcv9l+R6WHhK0Ytr8TrWH5wurC23dujZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZaJmyCFRL0G7R7v0/VnU5eb9mMTjMCfDKc4zxvb5mJKSoTCsHHUrDFDLodmFDpX9dpydm1c8MNER5gQZzA4strsPZ2MXFA26C+yiiDT7/+s0PngyZqt1QzbLu12OZK4VAYwZgIb+Bhka0KGhMG+2xshE+uWoDlX/z93pLG8id/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=gAAEGZ7I; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="gAAEGZ7I"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fc5296e214so37088065ad.0
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Jul 2024 14:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721685506; x=1722290306; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7liFIbqG3XLVQtLXjuEuZ9H5FIup228+UAuRj2s502A=;
        b=gAAEGZ7I1+D0nwlffUc2MYijPiZAgtqE7XQGgcSXO3uUPTebu8q9ggtqu0VZT9JZhf
         8dFCmc0nxAIK8G87Jt+t5gMGrd5hK86m4PLRXuA2uRGI6YqX80ha2nMlJ/dlSFFo/Y05
         gJj7aXFk8aB4EEYW7m00ZXEIEbXzvK5hp4afZH4CXHLTUHOUZbOl8ARFZ4a+IVP4P81W
         q2wEquOI+DdHCens+vxxmKyUf0pMMG5mClEeS6cFLut+0rWa71Jl1SvKGUADSoVEm2Zr
         leTonCdSL7Li4mL/iow0adxXAgjd9d9jYZqzxTqySgE6daulSQKFv2f82/szxsN4hFzn
         mnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721685506; x=1722290306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7liFIbqG3XLVQtLXjuEuZ9H5FIup228+UAuRj2s502A=;
        b=wTvGXEB1lkhhzwZC6itN8go41VUJVqsoH2bR0ENA3Dt4vkzuReMzhFFdSrS/bEE12Z
         IGhrsOUiLzUgJSHx3teAAZGz9Su41WjfUTrKhgpWjYVQRKe+zOocs+CCH4BigZaR2E7U
         sw7XlAvRwN1/sd0ex1iZni3q1LayTqmqeZ7iysS9v6X1L2ZklfKRmsOoKhm/STGyt0tV
         LQJ3UlVfV3ElknvZlr7esJwGYjV1hLiObiiEwwgEREEKetNxhJ03b6a1XG44LAOCDUUF
         eU9WE2feu/notye8g/6KYT3RZ49AAUVcd/Jw9bK3QV+9pAQ0SGu7V19Bn6UlvyWaKBOe
         +6GQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP3iZ4veWrIru6M5bpBzsU8PxLNGbC1nBBMPvfKMguSSiZwpERVsjZ64KyrYGY6gEny89VJI54VVA/ymwib9QBAK3gqoZtlxQhCSg=
X-Gm-Message-State: AOJu0YwiGDhnTU8sMqR+GO6WeLFqfLhG/rqwn73MY3NJ2tMoO0irD93V
	39tHW05tBvzcO4UdfwiE5wLt3TIw12n1RrKznaKiiCsrQwvbqn4dtvT+pqh++H0=
X-Google-Smtp-Source: AGHT+IEhQYp1BZWLj9eFDI4F+59SR/8t3UUInGJ4gX5TJPVL1PbpSo7Q3rXHcGW/E8u/+YVve3sRYQ==
X-Received: by 2002:a17:903:18d:b0:1fd:9fd8:1b2f with SMTP id d9443c01a7336-1fd9fd82008mr51936315ad.8.1721685505924;
        Mon, 22 Jul 2024 14:58:25 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f44f0d4sm59997775ad.219.2024.07.22.14.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 14:58:25 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 22 Jul 2024 14:58:11 -0700
Subject: [PATCH v6 07/13] riscv: csr: Add CSR encodings for
 CSR_VXRM/CSR_VXSAT
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240722-xtheadvector-v6-7-c9af0130fa00@rivosinc.com>
References: <20240722-xtheadvector-v6-0-c9af0130fa00@rivosinc.com>
In-Reply-To: <20240722-xtheadvector-v6-0-c9af0130fa00@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721685488; l=1045;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=/awdvkpT37Pcv9l+R6WHhK0Ytr8TrWH5wurC23dujZY=;
 b=HkA9GryhuoQSbrAEZ95j95Hqi2eIuaKpw8ZKsmN39SZQzbRBNWPE66zVFn20eiWNCV9omY0DH
 m+/5MZAQ7RODwQ/ViRBSsCcS8JUhXwkT+4tZRvwC/Z2ygfj/aiygn8J
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
2.44.0

