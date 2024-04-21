Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D217111AD
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 01:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713661498; cv=none; b=U0XkTqZGq8eyV5UYSfnnVbNc1YsrlazqQ0u5xCuTCdK0LkP4NMWiNKSbuojmpAFKzUbxAyjyQleo5Oz520YiGPVI9OxZPpO7w4FGFD8VMLPhlkGFzZStn8PtTivdQDDptfND2WACDakDd0dFR7BLJsyBhKEr23DSi9KStSO+UFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713661498; c=relaxed/simple;
	bh=QiQI1i7vjXBhs46HZcfDGYtUbq5szs9hkhXvkNVDIxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Otm4pNWdP7iLRe5UsKUMMzQk1y7AM8BJ4AzTpQB6LARvuFygBYTwqJqAUvqoTBd9I04cK5NnR1HAJJpzDol52D6WHdkV9qaZMw98olS8OipipyM0J4NzQLdegqo9lvUER2y1k8NQUgbUd6I+lrzOyTVdgfKG7KDXkPR55/jI0pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=MRsnMIZP; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="MRsnMIZP"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6ed2170d89fso2819107b3a.1
        for <linux-sunxi@lists.linux.dev>; Sat, 20 Apr 2024 18:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713661497; x=1714266297; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yu9Am0unYXzuMc0qIjJPUdYEG2xZXFr099jsPQEasY0=;
        b=MRsnMIZPBvxR0zoyxoENJmwFQR42Srxxlb0894ApNxFvZ4Bl4BZH5LHor7zS6U4GOW
         0sF3bmXlTiYcZGzMUtbH3Ywh2knKcUu39p+xL8Cl8tT1rrLWpcTjAxdkuYnJwWMx9CoS
         NNsB1RjRUhCeLcRucyqWDXYz73PmIdP/UyGGvFMiOgCu+mSCdYCIe/RjObball3H/4ow
         oDtUBvQ6Y8WD9TBVh7cOQLBvlQCIe8Adot3fgcHMiE73M9vRjZmyyEmPvAwzQFSQO/Xc
         G2T5TCiXPckhv/ufU38USF8VDjmD62+FSnoZqcnCZhv/xQBvmmHxFin0L/w13i7HEe1Y
         USKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713661497; x=1714266297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yu9Am0unYXzuMc0qIjJPUdYEG2xZXFr099jsPQEasY0=;
        b=Ib7O/1fgfNsevFi0Y2FLZghmVWBLXv/vlbE/nPNvmuQwE3ZqDRKBFlklSTO8qlXZMm
         buYrKhoPTagHnN2ivB1k1Ol3umKlpifhAt22QCBPTMevtwizp9MaU/tPJTp0dQtml+ua
         5RmfIoSW0l93HnHeliI1hm+Glq7EX4DpjyKS0ZWncv2+J7dEBpnh+sE9TSNT+o7mLni6
         Rh2uJ+LxW3E6eHzngLi6LgDjDsE/rfZws70WJ/W0v6Izm7qZ6Cofp/YbKyUk0KHuz7LR
         SEL86Tt7RDslHLejpZrEqMrS2CcrlWcDMzXUKpoDqdVfq3evm7KpRb83PzBYVxxlIYpU
         pqjg==
X-Forwarded-Encrypted: i=1; AJvYcCVy8UHpZddSoCKSpVHLBpwtvz9rgK0ELlEVldm9aCSc+NY9MadbnIxusJTj4Y/eFBN8cxKe0oeKWK/+pLkY5+z2i3xm3tfKX0OYJPM=
X-Gm-Message-State: AOJu0YxliMsh5ZOvCRQGhVxvWFTC88ra/fWhf0t3toWd57Zcud5SJSPI
	0VGuoxyM12lHbKlxDctyLcuNRa/xKUp6xvE7MtKvp/Z3erZM2eAjvsJ9xV7H8Vg=
X-Google-Smtp-Source: AGHT+IFWaA66MVhFHzVqeH6ER04Jg35UlWbtwP1v2a6tYCwe6/lLPPzjlT26aXgRHK+BXdqOBFuWwQ==
X-Received: by 2002:a05:6a21:7884:b0:1ac:efd3:4d87 with SMTP id bf4-20020a056a21788400b001acefd34d87mr3420884pzc.19.1713661497028;
        Sat, 20 Apr 2024 18:04:57 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d6-20020a63d646000000b005dc8702f0a9sm5249627pgj.1.2024.04.20.18.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 18:04:56 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sat, 20 Apr 2024 18:04:38 -0700
Subject: [PATCH v3 06/17] riscv: Fix extension subset checking
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240420-dev-charlie-support_thead_vector_6_9-v3-6-67cff4271d1d@rivosinc.com>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
In-Reply-To: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713661481; l=1065;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=QiQI1i7vjXBhs46HZcfDGYtUbq5szs9hkhXvkNVDIxw=;
 b=+3zc6q0i2BsAtbDQT7K3i0HV2YRODdQ7IkaZd+LvMW/ig/YqGy1avCBI4l0spwFxEKlLUSKKu
 xWM1me9URmJCN4CloLYVBR+5P4yAUklVAjXSfYEk8uxaiWkJDMFr8fd
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

This loop is supposed to check if ext->subset_ext_ids[j] is valid, rather
than if ext->subset_ext_ids[i] is valid, before setting the extension
id ext->subset_ext_ids[j] in isainfo->isa.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Fixes: 0d8295ed975b ("riscv: add ISA extension parsing for scalar crypto")
---
 arch/riscv/kernel/cpufeature.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 48874aac4871..b537731cadef 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -609,7 +609,7 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
 
 			if (ext->subset_ext_size) {
 				for (int j = 0; j < ext->subset_ext_size; j++) {
-					if (riscv_isa_extension_check(ext->subset_ext_ids[i]))
+					if (riscv_isa_extension_check(ext->subset_ext_ids[j]))
 						set_bit(ext->subset_ext_ids[j], isainfo->isa);
 				}
 			}

-- 
2.44.0

