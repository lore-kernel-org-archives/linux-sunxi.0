Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3850613790A
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jul 2024 05:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719986231; cv=none; b=lYAQaAar4Ev0X/sxY8Y8d7/JkRnlXr7r53Ejr8k3N9/RKlp5SuIMkCGrcbsSzLIotl007TfkrEBoeVfHphOdGnSf/cogns3Z9y2aVEz+eFR3fJ4e0Ceokr4A47domcPdVCWozuJCxD726cvRUW7dNil1nCt6pzaff8PomBzHKIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719986231; c=relaxed/simple;
	bh=wrX0uryyy89vYlAinvVr2O6QBZz257uuEBuSnzas59I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c2Z41l8NA5Okm7RSjpeW7lj7xC0ocWMSq6OWlJQA4AAPjTG7zoRl3vuY/lARDS1ad/5KI9bKBf5ordFwGAxUzB9/Q5GcFhccYRgcQNCWeTQoPwFhWKym2dtrkGU9rwo5Dugf+9z9UUnApTym7TvpToA30RDn49BNs7YurWGZFb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Cour+yIs; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Cour+yIs"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-81011c142ffso325297241.3
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Jul 2024 22:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719986228; x=1720591028; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=425S2jEpk/4yk63j4Ow9jwZmOCFjeEcHZbKGmEqnWN8=;
        b=Cour+yIsLDPeGai6qAbhGVB+GMrEi6GRUkR15y8pAJJpmfvpLbrNlSy2CYVm2SowjM
         UW3uYOnN9umhHuUrRhH9qmb/bLXmEHj1DZfSsxOgpy5nJsPrV1ojrjLutKetfbJ+GF4L
         /aDLk0gWoVCsAQvYaYNdkbuevVnWCfAVjIunDtW0ASM2FXjWeH0TTJzn29EyBOnI/RAU
         oNSDKqgVt61mc/XtSb5P7+v0eoCG44Bt2YKNCE15x4uVhoNbYhK+BK3Nxl1pegV/NLOI
         AKQ2y7ZVYAdRcu7UPtGIXKqZ4MfHITaTqoEg9A4LVeJ/SCmiEOHrNyfPOGuzl873PmM/
         G2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719986228; x=1720591028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=425S2jEpk/4yk63j4Ow9jwZmOCFjeEcHZbKGmEqnWN8=;
        b=kUpQVE+t3xHVk6YR3N7jsq0OLj4vV95xDSFJUjsAd6i7+iRXX92eBqQhsMG6Ro4+/n
         CBl14qVNGVR5DkWsygr+z2PSr3mzHtWAGROeuVqCxW8UfBQ3VZ3od5C6qU6kj50M0Cnj
         wV86eHW9Nq/y08926vFX5ljslXtBQYznbnzekswTQvalBOgl3AO5Mf7yFcrXGvYFS53w
         ivJQfrpdZRCu/9ulB3ODBtceigpQuvA9iVGQ1Tsxfe+brCqp74agmZCLZsN3HymgOkWa
         zzboOvdr0i4F8+EXsMrF5aGy3bOMMzqWWhd+oCkqkvBOxRBoWSk/YsGHG35sdMM8mAuA
         xnjg==
X-Forwarded-Encrypted: i=1; AJvYcCXJEsGBR54RzrtphDInlvFqOfDQec0LWHgxBnvsIP44M/aXnSWoAHyZoukwX76IF1h1eINzFXXUMMAXWwNAqRjRgcL94Ju04Q2/2X0=
X-Gm-Message-State: AOJu0Yxs8E9HPoB5iMuf0hVTuWSRPdIyZj/aS9pwml1TqEi9wq+gFlYD
	gIAQRXLnOW+K4Jyc1BSVz/jIQc+d63grUNgTdXNF9PC73MtBn1of4OthVtBsOsc=
X-Google-Smtp-Source: AGHT+IG88slojnrcpUylTggNpN9VQexHVaXRtFlyPKNtjShl9oJwn4L30O8Mo2E41agg/TiMHNr5YQ==
X-Received: by 2002:a05:6102:19d8:b0:48f:95f5:507b with SMTP id ada2fe7eead31-48faf152008mr12485438137.31.1719986227984;
        Tue, 02 Jul 2024 22:57:07 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70804a89fc9sm9514103b3a.212.2024.07.02.22.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 22:57:07 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 02 Jul 2024 22:56:26 -0700
Subject: [PATCH v4 06/13] RISC-V: define the elements of the VCSR vector
 CSR
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240702-xtheadvector-v4-6-2bad6820db11@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719986213; l=930;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=0jkC45FH0LUvSVfvCEJuCBZ027fqPbAipPAnc4zFoN4=;
 b=6Q+Z3FOZMBsstZLmmdhAH3prUYL6lUJSpkZmRi1OCw/CqyP477CvmFjgXyaBRVaw08PBHr89t
 09L71Bw1E29CVgH5H7DhHsiOvvQT73JXK39wJHe5PiVuX48TVJ9yNEa
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

