Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D034206E
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Jul 2024 04:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721881010; cv=none; b=rAyij18rfWQVk1mUB6Y5S1I13noX1DXJ0N5p5ifawbWDvtQrUY3/qKpxamL2N4iWcOOh5sofVApzI1EeFIB99GiG2z7edCKVVz2kYZ/aneHrM9upuq0+dztwGVttYeQVvcaN1KYMsqcKgqDjYIEJVRJmwNV4XvOf4tvNfUdwFsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721881010; c=relaxed/simple;
	bh=wrX0uryyy89vYlAinvVr2O6QBZz257uuEBuSnzas59I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XnT9+bM6VahXsbac0N5QEvxAR6pz1azVTsBMRnAXKrbzxRPCs8cbtiIVS3hwl+Lo9z4r8kdiq55hBpIBJmaLOcPzih6mVJwC82Sk5XOrmXTylseNN785kpxDAW6OXptjSUmSUFzSOe0fAqCCtHVeyh/1onNmJyBD0ZSAhi7hfIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=bKshPqSo; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="bKshPqSo"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70d357040dbso418524b3a.1
        for <linux-sunxi@lists.linux.dev>; Wed, 24 Jul 2024 21:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721881008; x=1722485808; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=425S2jEpk/4yk63j4Ow9jwZmOCFjeEcHZbKGmEqnWN8=;
        b=bKshPqSo6fKj8SIxXS3/2hyZdkuer1xcsyLdUH9zUkn+YVclWs3opj6tcziYrKrehR
         Qc1u02kYNKVc4gqYmwND5+zpkrtMrOnJXotLvYATycYufvg8jBk4sG66s+N2lei2lDFe
         VG7tw8+hxJJaniQzJiMXXC8yRjG24NxXXaAejS+4zuQM8IMn15p4MGWZXpxIESZm5fKl
         +EcwuUrwesjZ6TcJ/S92YVOpQBFR6ZkMANY8RvSm9p/dZ4g/t2fp9wZUed1/9oKsHb2I
         /GT39VPWD0PAw8ijWGWVnGIW6iuzuNHbBjEyZfiGaelAa2lN4ZD+Exv2X/0gmWdKzTov
         0TkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721881008; x=1722485808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=425S2jEpk/4yk63j4Ow9jwZmOCFjeEcHZbKGmEqnWN8=;
        b=e9jRIz81QtaZtZjSj2slx6UcExXS3ZijlDnCpsoPub2qE8eRKcHZHuO7Vzan5SQelZ
         GHwrqNQ0EO5oX1jzWnxyhxhNCBFDTdGa0VkSRf1kvWjn14fsWisS7mykgh3lR5PaGq8n
         SjyLlR8BwzjG8oT4nOv/UyIYOnp0FyjydIVLaT96z7fn13xhel9T01p8ZzAfLRbXTbVs
         XeBf33PPuoIfpOAM1gb/J4dIzMxqLVIKJTLkJWQTg7D50yZeaapbM1DmS1umqo/Lmdcr
         KgE1Oou6eoJCen0ZsUDbsQGPhOh07z5lohGzFtGoDAs7r3QSe22ZKM6fBOWk9+axGH4I
         G2xg==
X-Forwarded-Encrypted: i=1; AJvYcCWS+H4sN4WspKpb0y5hqN+F82RRhXlIli7HCH+TTmwG1Pet1OY0ADMKhF+6PZdgpa2aqYcFNFU350Jg1eBqWDpZWe7y5ZuAcNKY9us=
X-Gm-Message-State: AOJu0YzIs21arzgMmQX3Of2z/eYQhYW5flG5PzXgt3F0oMUOvtBWwuTO
	+FOPUlukhVRUWVvsOIdafzf78EhI6MJpXz20SkrD2GmmDU5NphFCWrhUV7Id9BU=
X-Google-Smtp-Source: AGHT+IELFiGNwGGv7BR7vYWVLsiKiV4ZaPKzv5DoyOE6vOqbQlIXSrJhQprJhQfqNRbBaTkdXj3ZOQ==
X-Received: by 2002:a05:6a20:432c:b0:1c3:b1b6:5066 with SMTP id adf61e73a8af0-1c472893397mr2419803637.13.1721881007915;
        Wed, 24 Jul 2024 21:16:47 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f2b80bsm3781825ad.205.2024.07.24.21.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 21:16:47 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 24 Jul 2024 21:16:23 -0700
Subject: [PATCH v8 06/13] RISC-V: define the elements of the VCSR vector
 CSR
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240724-xtheadvector-v8-6-cf043168e137@rivosinc.com>
References: <20240724-xtheadvector-v8-0-cf043168e137@rivosinc.com>
In-Reply-To: <20240724-xtheadvector-v8-0-cf043168e137@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721880993; l=930;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=0jkC45FH0LUvSVfvCEJuCBZ027fqPbAipPAnc4zFoN4=;
 b=XoiS1Ep8clInqZ7ahG0jkemQdoRrDU7bl84W8H28OTMlrx89tCkebW1m05ZpUpyXPXMGRWIyU
 Fq/qygjnv8pA9unHDFBhSb8y5j5eJkXw3j05S6lI2uSroDPOkH6rML3
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

From: Heiko Stuebner <heiko@sntech.de>

The VCSR CSR contains two elements VXRM[2:1] and VXSAT[0].

Define constants for those to access the elements in a readable way.

Acked-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 25966995da04..3eeb07d73065 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -300,6 +300,10 @@
 #define CSR_STIMECMP		0x14D
 #define CSR_STIMECMPH		0x15D
 
+#define VCSR_VXRM_MASK			3
+#define VCSR_VXRM_SHIFT			1
+#define VCSR_VXSAT_MASK			1
+
 /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_SISELECT		0x150
 #define CSR_SIREG		0x151

-- 
2.44.0

