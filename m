Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F75D13CFB0
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jul 2024 05:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719986239; cv=none; b=j9mQzxqUE/zFXQeMS+9pfMD4dJcuihVxTOB9g5tmW5BtF857Mb03ThohrpA09Pm6fIincnyp2x5AVvYZjgBRuJZnFmt5HyHK7v3R4Rhfu/DbArpZ/3a9RaQk+7Qzti2Pk58nM1RCM93GmctpuD2LV6OegNSGsgEtP9H5jeh7+rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719986239; c=relaxed/simple;
	bh=FGQxjkKFg6ikcL755lFMFBnsaceTJTK90HJM8u9R8ek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=usAo8CdMSDc5Qj3ITHQruceVvVamkeWYVm0pBk6r3gbPb+yi7EZUzln90jQDQQBbEsjZ0nIqZk20xQSA4w0L/9llkmQKntkagqIKBJCyp2AqAchFkn3oOsSJoCY6ka/eVGi/lYzTBVcSrsQdAILx24LPrF0rgnr6Vucd8wmRVHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=LBrObkDD; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="LBrObkDD"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70670188420so3457283b3a.2
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Jul 2024 22:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719986238; x=1720591038; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8BieCexzaDREgF6SB/4DhCje3SwtC4a6MLqQwsxjuQ=;
        b=LBrObkDDX6vS3GN7NZUdtXH1hvtwJn+itnd5Q5MvWUwKyNTFg2iTp6jSurNLj3C+iF
         ui82z6udPmA7VuwJSEFZJO/OkmBTermUrbMAcsHirzlvN3lRyRcOaDJmhwZzkJkiEbgD
         2cLdbhtTAdOfBLVd83YslAuxiesRhYgWhoGoYSrZybJS37+UXwDMTzlw9sKv0ktMT3Rv
         uIG4Peby4Dy3FagEfupeEbPXx+Jsm2enArT2U8lrQrjCLnjTveVZIaTUG35j1ayhV3Nf
         mMpiatG/GLBB8cuCnBGWmsvAMKHqlCjfBADrg0C5iOx0nGtgkhc9iST67j5YWtofLUvd
         TDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719986238; x=1720591038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8BieCexzaDREgF6SB/4DhCje3SwtC4a6MLqQwsxjuQ=;
        b=f0VmaPUSMWUUTOmjrbFCJUC3MWEjqZfYqefnh4DbI8QHcupoAgPW8Q2vY/RzlPgTMH
         be4SNUhXJoI4+zyeG/7zCSpPPjx7UFkHE4wDyxy17DVCN2W1/xG2nkZcqdsmFKZAD4hs
         HGCke6FJS6RGOfbPi2gNiEHIsynK6LfHtNT18LnAvSFrW+M03hBsb0FtXS9NRZC6SB0o
         esiySeNJolXfiNgUgwfv38Cnvrddeo0kISj7mN5N+BJDHSc6YREPemeuhVSVSihvydMf
         VfR1Plbdt2O+rdNsGtwIMxGHjNMstyjtmJ3eCgTGT/RrDyLugkeDbalfR0dFQOIM7fcW
         pSNw==
X-Forwarded-Encrypted: i=1; AJvYcCUbJTovy3LYGcafyrepjE44aP+bnymb+GxdqgGp8hB08lyx8tge69yn3UCJRByo1u192F557RKRgjMUVWFbF/0J9TdxbhAo4+mFstc=
X-Gm-Message-State: AOJu0Ywxbg3fxM6U2JD1Rbk5aSDU2MZ8iqqUnqEYrDnvHrTMfL6Cl201
	+casjWvVENNQI8faSPazUUcXa61YqLa3p/3kjNUifAU2yelmsqeWL2RDNBLWl3M=
X-Google-Smtp-Source: AGHT+IFzvdI//RONmUthpW+hRWa51qcRYfwcsRmaIZeDnAw47D4PCUBSFePGU751qqoEQDHXwWFdIQ==
X-Received: by 2002:a05:6a00:3c85:b0:70a:97d9:5b9e with SMTP id d2e1a72fcca58-70aaad356acmr9691205b3a.10.1719986237704;
        Tue, 02 Jul 2024 22:57:17 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70804a89fc9sm9514103b3a.212.2024.07.02.22.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 22:57:16 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 02 Jul 2024 22:56:31 -0700
Subject: [PATCH v4 11/13] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240702-xtheadvector-v4-11-2bad6820db11@rivosinc.com>
References: <20240702-xtheadvector-v4-0-2bad6820db11@rivosinc.com>
In-Reply-To: <20240702-xtheadvector-v4-0-2bad6820db11@rivosinc.com>
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
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719986213; l=1250;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=FGQxjkKFg6ikcL755lFMFBnsaceTJTK90HJM8u9R8ek=;
 b=sIDrXUBnETGRLfiW3zt5N5JYHfJry51btMZGlC0y5DhEnENP8D39rrbQ3DrevQRN+apvrPhel
 LMTH3ygFemNAAJ/z4MibYy1lGR4MHQXOubOgGbmV5dOQelLGlVHepXR
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

