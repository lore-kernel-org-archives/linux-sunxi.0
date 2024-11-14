Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD72F1F5834
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Nov 2024 02:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731550906; cv=none; b=YKszmPwtYW5HTdobQ8lgEML0gftiW1RKkG39+Q+GX7fC6KJdc4Gyk7rGA3AIMwqvLd+3Mcm+tdF6fACyb9PUGhmu94mFZUmvwlazzXIkkULWoh11tLzKzTmRXgPTCVL0AZPRJVpWd7TWWajjuJgI0YRBg8zrL6zGwTxb6GGFsso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731550906; c=relaxed/simple;
	bh=n6bsGNjj+A2RAoocQg/Kf0wqob4BQjMpku28ZyzZUc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o6CQTNpx5jn96LrsYusT2tA5X5GRbjOT+i2fVaqagFm9nK83r9zckAUnjqAANKlF5I7fSLZvyTHqc6PL94o1mUcREbxcE83MRB6vN+8ouRuuBs9bwu0wnOhPYzjbdBQ0bc8evdfCmBG4IT3PaJ+W/qpEYlSEiNKgHlmdIh4S86I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=z0QZFmPO; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="z0QZFmPO"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-724455f40a0so58863b3a.0
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Nov 2024 18:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731550904; x=1732155704; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6+V3gED1QefX1oKTJPk0u4TQGYvATlv3RdDGUkMS7E=;
        b=z0QZFmPODwK9DHZGzDlp8QOUX9Mb/VcIWrR9zpDz2OPAlu+WCdO3d+X0+fvNwXK5Oz
         o4iDfSVs4APZABNM/gPKO6Uvj+kfMBMCz74TX3O180ZaWnhdC6IVs0hbEGEi71Jih7Ah
         6nwG4Eh2T08ZhH5r2o4iNam+eW61WjyvosNYivviuZlbbgUAVaovE5z4YxFtWGNrQBS+
         LRWckCU9wpgOkz5rxYhBgONnSOMS9VUkV9Y23Luc1b8Ehh05YVP17Y1PVYP8440SPkWe
         NEAUwpdPsTThilwoyt/pxtJRPFVlguveKAml6+sxkxQwCkrJ3A53c2TyHMQOsxTWVIC3
         GLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731550904; x=1732155704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6+V3gED1QefX1oKTJPk0u4TQGYvATlv3RdDGUkMS7E=;
        b=HfDx3dwwynXzqOEfIPGwfRBo4gxGnZ/KsSaVl//VrANaQT5MKVdPwsJHXf2Chc3Htb
         78Op0iP9LyG5SHjYaugF96bLOol1o9j8ICd/oDCinDGR10wVw3VpHY2+SfB6LbmUtqcX
         rXZ4OmBUCeVpusaIQmG0XhaCJqKcnlsGoT3SifIWEDp81zC1JnSzPmpDpFXP+sUmj0cf
         KzSEr+D7JqxFjxk+6CeenTRc24/LDUhbgOofC7Z7/qJYLadJ8/A9pt+tBtK0+ltlkOxh
         3pRIz4GMYmQ+WwIQCoQ741qpl9+tfRDK9xofRhYta1+t3pg2X8vZsk5rpt0nFbA3+Lql
         FZ2w==
X-Forwarded-Encrypted: i=1; AJvYcCVk49uV4+LDcEoBZl3BVL4b/Zmfan1gJHE5DgXv/oEJdn87XgAer9gn8Jvf6y73bQS5v26DUdlPujtvCg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQwBP/czu6qyQz+2ZuCWJO9zZKhn3Z8TUBn+9joA+2q4f/Npc4
	ZiT+xCvyJWUYZRtkzl37nfUlNLggXKDajTAyviQvZhfmYLkWWLLqwiiCdOhOCeI=
X-Google-Smtp-Source: AGHT+IFX9tVtH616LR9FBLywJC+ZOCVEFVB28iozSDr0ERYAR2ijQXSxlGW1Nab//EggRloJJbWjfw==
X-Received: by 2002:a17:90b:2e42:b0:2e9:5360:22b2 with SMTP id 98e67ed59e1d1-2e9b17415f4mr29255603a91.20.1731550903857;
        Wed, 13 Nov 2024 18:21:43 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7c499c9sm406875ad.68.2024.11.13.18.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 18:21:42 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 13 Nov 2024 18:21:13 -0800
Subject: [PATCH v11 07/14] riscv: csr: Add CSR encodings for
 CSR_VXRM/CSR_VXSAT
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-xtheadvector-v11-7-236c22791ef9@rivosinc.com>
References: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
In-Reply-To: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
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
 Jessica Clarke <jrtc27@jrtc27.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Yangyu Chen <cyy@cyyself.name>, Andy Chiu <andybnac@gmail.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1045; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=n6bsGNjj+A2RAoocQg/Kf0wqob4BQjMpku28ZyzZUc8=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ7pp3IIdm/4UH3h87vjB81Iz7FIMb7B8+3l65eKNYYuMk
 vw3J8se6ChlYRDjYJAVU2ThudbA3HpHv+yoaNkEmDmsTCBDGLg4BWAinamMDOsit5Z9OTNty6+d
 m7IfLxDQ+6jzqZRRtb9MyHbqTuVrHgKMDD18GpbdpwscN7J+31PCryjBkFhyxv/jPKb7nPMa34g
 s4gAA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

The VXRM vector csr for xtheadvector has an encoding of 0xa and VXSAT
has an encoding of 0x9.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index db1d26dfaef9..2155f5afffd6 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -314,9 +314,14 @@
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
2.34.1

