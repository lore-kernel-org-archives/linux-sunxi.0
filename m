Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511EE80027
	for <linux-sunxi@lists.linux.dev>; Wed,  7 Aug 2024 00:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722990729; cv=none; b=DQ+tV4WViEYlilp8IYAVRLZ+CwGVRbZ4pa9wCdXSf25x2+NuVcYip3+xH8SoNeEO68Frx/ZIg4bmBdMc2E7BS1BG8VVvVC4w+in0KPH3w7m5pOK9yNFgZUtHYgFWHyJFKH+W7vREGsQu+77a09edQ2CcEkuZZJLoXRs1OZHz9LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722990729; c=relaxed/simple;
	bh=R1ruP19VNMYIJ2t74sibaC/YoWJ+uh82rPlu1gqwh/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rcYeiBtOJQnwEVWdgkE89AliCu9OgDBpfWwtq5d2n0oGqEDsyh/kbJV2EbeFKJ40xywaLJt8IY4BGeCDsO73rcyrLqSb1UmCHHHUqVXZvH+8QHxW8KOcQijzEx7DhPgmdG6CYmJV8a9MJe51VxNHMX4ADKhiURXLbJlpcTWsAJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=KoEadPkR; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="KoEadPkR"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3db14339fb0so777805b6e.2
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Aug 2024 17:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722990727; x=1723595527; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WzA4CLrN9c04I0TkiHjILEnLnNrrRfsvuLr439lHPOs=;
        b=KoEadPkRJTPS3yytwR5KwIFwePBj+LmiACbIQOqqGRC3L5tekepgZAkw0QbhADIRd1
         AruwKA4pjOAqKgvqXUUKqY4Ry0SjLArwMjjwBiaIZRoyvx9qMN0p45T1T8ULail6PSpQ
         c68zgoMle21U09Bqx40XLd0FtgRcZYI9JwNPWdxKYWjycLuXMzv35UwUr0G53+YvMUrP
         0mhLGw71PbMXkPuXzi6lXXNqxuFm/lUC50XVRXpH6Xf1OpLIwA1Kn0Ty9ZZqudA2iZw7
         wcJ8GDl7KJqxpH1igzPa4dcosSEfyydpe4DFqmmAz8LTz+R9WdtUdAy/VRuo5sZyi9tM
         S3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722990727; x=1723595527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WzA4CLrN9c04I0TkiHjILEnLnNrrRfsvuLr439lHPOs=;
        b=TrSrqlO2tQ8DqkGHWfZ1Yq5KtMwj6e0bcCZXYNBMDhNbbawOue6EpFQPPirvv3qsM0
         C3py+h5yfuSwLpFjF/j1uTrtBUS469A76Lij35gdyHFIR6Ei4WKyVnPGftgmOXw6QpMu
         VE4504zys8EpZd+HhpXNkshXKQb/XvEyT4Qu1lbWPec1nbRKWz0uRFYCmS2+N/Kr9qgB
         5grwZOxgAypuruXHRDcmgoFMfEcJq2USpLdikHDuNIn/w9UqcIjzuJyCiE92X6VeU7SH
         DJASkLqKoCC56cud3ipSBgY2dRqixYjMLfjyECHT1OJoEIlObr6FiyOU7XZLa3mZNtug
         KIBg==
X-Forwarded-Encrypted: i=1; AJvYcCWTvbaKtby7z1p2axqNFe7eZtFZILuqCWY2RuYLfobPcvQKtAu1txezReVaOgx2JnJssTLuI2b/k08+d+wcgzH15s1On2kp8EtxiEM=
X-Gm-Message-State: AOJu0YzZAq9SeCevyq7UQ1uzr7zbuZ69JqmHBi0TpLw6RppEqrtO26Dd
	FU3WP/FdZ9lixb5oIyxUDXIzE6WU7f5YOj0YgNhgITcF1lJUINsy1yX6Fz0vbRQ=
X-Google-Smtp-Source: AGHT+IHqzKeTjTwY0Ng2jkjIMaChA9GIbY2sG0qJ6XgUQbDiYCd/LS4ujzMb8ElUuNWFWcAn/anGOg==
X-Received: by 2002:a05:6808:d50:b0:3d9:2601:891c with SMTP id 5614622812f47-3db5581fedamr22651422b6e.30.1722990727421;
        Tue, 06 Aug 2024 17:32:07 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b762e9f5aasm7476174a12.6.2024.08.06.17.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 17:32:06 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 06 Aug 2024 17:31:47 -0700
Subject: [PATCH v9 11/13] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240806-xtheadvector-v9-11-62a56d2da5d0@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722990701; l=1263;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=R1ruP19VNMYIJ2t74sibaC/YoWJ+uh82rPlu1gqwh/o=;
 b=vR7egj22DaToCJ0lFeXF/Sk8iuiDix41LIpSDYfvyZJw4L8VcHmi0ndy9Vft4en/hY8js4/nv
 GniIsQaMb+HDtS7wmY4nAomw3jUjJ6LXwfSjooY3JOkZbazmUMC4IWu
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
index 3db60a0911df..400753d166ee 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -266,3 +266,13 @@ The following keys are defined:
   represent the highest userspace virtual address usable.
 
 * :c:macro:`RISCV_HWPROBE_KEY_TIME_CSR_FREQ`: Frequency (in Hz) of `time CSR`.
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
2.45.0

