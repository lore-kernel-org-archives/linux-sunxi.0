Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6CA5466C
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Jun 2024 04:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717994760; cv=none; b=Up/Fw1ASViUX2ER1PX41jmcsjDVjBOyEWtru6S4vhO2itjwicIAHTB7ToHesOPd/zJ2aQITOXJfBgTqxW8N/0BkN/BkyYo/hnpNArloHthYQsz3TdGc/YBV67DgoBbtjA2iSgS0HRIejgESVGHUzHzmNmALjf1jZ/T1LzRJA4ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717994760; c=relaxed/simple;
	bh=FGQxjkKFg6ikcL755lFMFBnsaceTJTK90HJM8u9R8ek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OouPysPMRJg7Ft0xB76wEVWkMIVIW6lYHaw7nL+3gt5xsIEa3rWl3bwBF4+vu7kpeSYUY2uNiMtPU9SR8tIoc9P+HqEJ/wQPURUatGE7Rv0LxNmYvWTp/4FaVVyKDkaCh0n/sFDhuAuhVeVubOUNyLpXlu/kJy+LKossYsrAfi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=wIvWcimd; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="wIvWcimd"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f6fabe9da3so9320755ad.0
        for <linux-sunxi@lists.linux.dev>; Sun, 09 Jun 2024 21:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717994758; x=1718599558; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8BieCexzaDREgF6SB/4DhCje3SwtC4a6MLqQwsxjuQ=;
        b=wIvWcimd//0a8l0lMNCPx+zEt0fJ/4+aCFVpWodJ6Eg4Bb37kXgVOweadU19PQmdyJ
         aQ+U/Eq96zfVrm8cPecE+iD3/cxpvqjHbNcToE/Uq6pFCD147hPNPC/sDD+u8YvFftts
         lwTVPhMAVsprviMs1Zp25aGceAseIyMavvuxch5DaTNQaAIbXzADBNhX9c9Qjep5xmIs
         AkZgoLztwR5wrwxvFYrym2g4vY5lfHpK7gvJgKjvuZfpp9UNNt2ksSd9N14xY/Aow1Vc
         RRjsJCldtuuHQ8dplW7HgN1iIdRwHhOCNve+Q2EbgRaQTahnEaTlly0cq2yn70SKzIIr
         Aw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717994758; x=1718599558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8BieCexzaDREgF6SB/4DhCje3SwtC4a6MLqQwsxjuQ=;
        b=mxmhgZQ2/6GgJ9d16WgZ/YVL0Ze8lCNDlPu4SW9WqunMoaHbirwIkJLp3GoUQq0lxF
         Ij3PsYdC4s+sbv5uVzeiHcmu8Am2BTKnLDQM6l76gTS9fRJ2hmsKMXh8FmB5f85Qm9CS
         +ZfcBx++lZoq8JuT1v+KFwIICcPVau7/3Q2di6YOvqAfR0yi60FoyTGZt5HUmw9AbgQs
         ftLOZZyndIKsoNq/qt+VGC6voRs7iNO4uLbdzMVbLkXbNxk4oRqc2mH3l5SQw8mnKns9
         SF+O4Ov6YFR/GcdduH8D3N/5FSLwMe4fdvSbHRbA7NBusFlzfHpe+oUQJZVTdehvSMvW
         VX4g==
X-Forwarded-Encrypted: i=1; AJvYcCUTpO45gzn9Or2cRSEc7NtYVZCN5z267rLdu3Z1Zx9mmTp6tMJmZD/whVQ4TVvf14ZLbInRFxD4PSKF/+KmFnzNE8F72UcFm4iw3SU=
X-Gm-Message-State: AOJu0YxSJsiLkgjIDgGw276K4VgX6L2bsRuLEK7d33egOHYCfJECHIaB
	rIeMrdv0Q5CAzwlqKU6nEJPbr6ZCcnNlcXM+Cx2lrUx97NYNtm3t2rrxYDdXOs8=
X-Google-Smtp-Source: AGHT+IGT317oosIG3JNia7Pc2PgndKpOONadquoO+w7t4F+iRdDjWNQNIYmD2UUADman72ew5imj1g==
X-Received: by 2002:a17:902:e842:b0:1f7:1d78:db3f with SMTP id d9443c01a7336-1f71d78e31emr1364105ad.33.1717994758342;
        Sun, 09 Jun 2024 21:45:58 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76ce8asm73124095ad.77.2024.06.09.21.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 21:45:57 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sun, 09 Jun 2024 21:45:16 -0700
Subject: [PATCH 11/13] riscv: hwprobe: Document thead vendor extensions and
 xtheadvector extension
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240609-xtheadvector-v1-11-3fe591d7f109@rivosinc.com>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
In-Reply-To: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717994732; l=1250;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=FGQxjkKFg6ikcL755lFMFBnsaceTJTK90HJM8u9R8ek=;
 b=hOHF9McI+o1cU1DAmF1IXm7ZMdeqVzGBgk601RJJNOjyOk+/Oadw40msR5BmovQCOoTuHmcBF
 zkRQyUhxJRGCbqJNpLJekD/85gONlVrdLOUv5QHabXYSTiHWZC2HUUA
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
2.44.0

