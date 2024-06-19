Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265EB16B39C
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Jun 2024 23:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718841472; cv=none; b=l22VaoqOzt+pqmTh4nBnQcCiLvgS1ohA3l3uGBuP0mo/dY12tiuW+kteDLDdZKUTbVi/HkejEWzikNjlc24Eo6uqvi5HuUNhm794qb7dWTGFQ4utBnievwf0sOMV60Fe+rh9/m2Qlf6bA0tbP4fgSCLYIRGelst2dtExM74X0QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718841472; c=relaxed/simple;
	bh=yTwaY8S9oNhGM05ZV5FG2RHddIKcxh8pG0u3E+TyBmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y/W6UOY3riiM2tMMmEJmrRa/2kNRk6alHg0+TqJP/9BhTzhESHB+fmvAUPPwd7znlh15sh5nKDbaGQRqxzaC6fMOl2mCvE2I6V25cOwMl/Y4eXf0QvjOsV0vTs5R94nZN1hRP6PKGVL6DTc+Nq+uU9UibL1yQnjROeiUelezHNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=xOBJglEM; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="xOBJglEM"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f9885d5c04so2704375ad.0
        for <linux-sunxi@lists.linux.dev>; Wed, 19 Jun 2024 16:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718841470; x=1719446270; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NAXQqHWj6RC6jFR+ueMfrd0PI1JIhem7QFbAuTK3mUI=;
        b=xOBJglEMsknm8nFwlStg+CGw8fXobee3ZdPewKmclXAJG1tzzRVAtMTns0USBYrX75
         TtURsW89b/OXOjVj53Z8UvvZKjDaBryvw1vNyDxdC1NDXE221zIRUaVKT5XCasmNttl+
         Is0/35uRYhB5xOrhVq+5UGXWkbNFWQB3rtrMPFlXUyJ26r1Z/i7sutkTlj+Dr/1SocXs
         8V30pC1rNXgIk6R/cEdenuFcqykYwubaVV9TIJdP0Fs7CD8ntAiuQn7qcyyRDeO8rG+p
         x/1ZVtKlsKVPAlyfCgS4YoLLOVj7xr3VHm8I5XsUPHBcQyGQUvzCtP/b9wMggGV1LDmp
         fNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718841470; x=1719446270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NAXQqHWj6RC6jFR+ueMfrd0PI1JIhem7QFbAuTK3mUI=;
        b=jtkHn+ae1jN5WT/T9niMZgkheRqLX4PU2PfkPByBvUfNM2nQy9WLj3vr0TG4dGmGy/
         AHUZwXXNRTFOvcJdL2c3MB1SdSJaZzS9zB+WA54+tXELr2xHohfZBoUUYwl1MS7PT2NE
         I0uiJ2ScpHMYjQGea2kFeE1dX0go+cL6fJAcSHb5COBff8kuBSJ1/vS3aTM/fE5SiTaY
         uakD3/OFLfyUuaffn4cfZ3dSdGt4oNrndqCGG+hl0X+kGx6MjHBDXa0hqn3Bn2K1Onl5
         3YRljKaGmQwWwFYuwjpIld/CIvkqUk2dP3hIjq9VTzpeKaULRrKwAP3sCAeJQ1/ZLA8e
         T96g==
X-Forwarded-Encrypted: i=1; AJvYcCXg3phfd5HUtSrIa4gbynMIhPC2K80ivTAPJsN6azdJ7WsgoCE8fDC/9lfnHWrCYM25fD+OmXt9klVh3TIphtDE68zl68/pu2PEkAE=
X-Gm-Message-State: AOJu0YyziBnO0VlE6GUOwE0dbyAi6l0llB1hGBLjKe06yi9rATaH013H
	D3he41lbgbGDd6KTsfanf9b7pvAHxx+c994KRKZSQU+N1PuBMRIN169B012hiYo=
X-Google-Smtp-Source: AGHT+IFVRPz7YNRWNVDYSqgeHtz7ULVWaI0ft4SwOZeHcOSts5XdoPM+w3zKpio5hZE5D2KZsy2okg==
X-Received: by 2002:a17:903:230e:b0:1f7:6ed:737a with SMTP id d9443c01a7336-1f9aa4748d3mr42510675ad.66.1718841470314;
        Wed, 19 Jun 2024 16:57:50 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e70ae6sm123620745ad.71.2024.06.19.16.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 16:57:49 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 19 Jun 2024 16:57:24 -0700
Subject: [PATCH v3 11/13] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-xtheadvector-v3-11-bff39eb9668e@rivosinc.com>
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
In-Reply-To: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718841444; l=1250;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=yTwaY8S9oNhGM05ZV5FG2RHddIKcxh8pG0u3E+TyBmY=;
 b=RMZXjD5+a211S1corOkUM74VVlyWtn6BgDltv56wmhFjf6CDeu+LV6gT8Cz6RtzXPhq4l3Kxw
 mEEg4FqMqaQBI30XGenqGukGLDqhx98zFheM1VqXvR1dpQWeGdCv6KP
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Document support for thead vendor extensions using the key
RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 and xtheadvector extension using
the key RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 204cd4433af5..9c0ef8c57228 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -214,3 +214,13 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0`: A bitmask containing the
+  thead vendor extensions that are compatible with the
+  :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * T-HEAD
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR`: The xtheadvector vendor
+        extension is supported in the T-Head ISA extensions spec starting from
+	commit a18c801634 ("Add T-Head VECTOR vendor extension. ").

-- 
2.34.1

