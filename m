Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1413C301492
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Nov 2025 20:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763584519; cv=none; b=MNooxNOpqAyTiKEGl+M9Eiu7IIaRJtsoP1RUG/GIBnJLyEEoBZRSYi08JgPk3VphzwzRZHQWbEr1/8xHNFAxIEr7hOcBGbL0wBgD7M9Rj0PjiF33ufQdqYp81ZASN6Y7FaqSjyM+hh+CEOwkIugUwMvdPyWtMVSneXYUvcBgsxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763584519; c=relaxed/simple;
	bh=AcEF/ULZ7hn5XborFI2uRrFvNzwQynLPNGhuGPcXeuI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DKDXqjopYENhfVXq870Commgayz9fJXdbJPGvGC110NCq1qGRm/eZ0uhZH4wPVXwjVipeuC6Kcim8Sa3Glgv1e7lttx94sPS1IHy8Nm3gdRZhCbx1PqMIxlZg/5QXSa5QwGWXItfpwjX/Wuu63Y3X+oB8AnA/VLOLZzbgKlSwAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHBR8nkR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHBR8nkR"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso1481895e9.3
        for <linux-sunxi@lists.linux.dev>; Wed, 19 Nov 2025 12:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763584516; x=1764189316; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IPjBoOQ0X6tiw7eKt7ufioOYEoA2Xgma4d9CNgYmRXA=;
        b=YHBR8nkRAV5gcq0DXA2uaTcsBVRZNbQEFKzzA77SqOtedCJLo4d/WdCHlkXXp1C1I2
         G77rDo8j1i2uELJXzAqyYxIA6JYH2/APS7g86d01eMgKVllPObL7YRtw+pbMa5wF9GWe
         708LowWgwXeG/uqbaHmQ9n+We7CWGyXM7K0lHCYiwsdA0JTZj6R8GvkVu0godp9qacyP
         it5fiKFNwKzRh38pWZPKr5r2xcvooKlI2JxhhSONm4t2VXqdh9HxHnsiPzfREscf0KGf
         bpNAFBy4m029Csmgk0KxkdC48gr9BByZqats0HTm6fREhnrKUfS4i7v026I0rpAzPtgV
         slEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763584516; x=1764189316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPjBoOQ0X6tiw7eKt7ufioOYEoA2Xgma4d9CNgYmRXA=;
        b=kMrTJBLiGj4R3r2a88AU4STqP3IToa7nE+QOx9zSBLPLjLFRZnssVqo2wvTaVEHeNR
         teOdbHYJ27n2Nm1l5by0b3R2P435zv95q9mL5ZdGKUt1DMyJpas96zGWb6G4EOgV2oEE
         RSduXrwO/QPcKUAd+arbPNqh0GEqZXPGHu24CKyoFmjK6AwKhSnT0FoYf44jpGdZ+uTu
         CPpxn03ixC6VLPzYiySF9ho6eQ1uelggPpS5Ak3fBRi5Pf/3ctumrdShVE0eFLyk7nEa
         rxwArn1UC2LlVyjn1dLWktrGDVRZF+hUResFj3YkamCiL99Wfeu/ss94GvuVf3P8USeU
         Z2pA==
X-Forwarded-Encrypted: i=1; AJvYcCUMoieza/TKsUvin/82EYQ2+KEHHDkU1jEdn1ypll4UDyJw3d10Yi3RC7UhvTVOXyVFFpbY3nW199kRmQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJtydfOS5Tbo2NXs5TCyzioMUW1iJ/7tJfeTich03qJYFI0+A+
	Na2iSCHnSlJPC8FuWk2IABZif/FsKqtJ4dTvvygbmj32tToxgxfCGh/+
X-Gm-Gg: ASbGncuk9/5OXMa9E1LnM2R2MtTGP4vcGwIXtCsaASKqe/D40MNjZJ2n8ckqqQljG/W
	1aS9bgbwl8l5xR1pHo+UlBbTsi8jcDKkLIa28mvda5NH8JJ0v4e3Lj0gY5JHy5PtjanXHNZ7ybZ
	zjsZbwi+NSdannRew0Ht8SglphZ6ikH2YuOgUXtZQ1LmZ3wD4Py0UkmNC8mNPYEHsBSmHiOTGpW
	097wvf/2Fa/KsGhLMyvFdQd5BRf32iuiiWfN7Ki2otntKrX57rxvCywUjhK9gjiMwysZRtxK79c
	DB85CIAkIHC5zqx0aaMhCpd3+c13l93VRk/3VToGpPKW0gFvR0o40fioBJ/MzhsBheFlbQwop74
	+7ysfu7K7NMD8VgaFE1OeyJZUfxotQdWXKIG3mld+JlR7FVDMmw++m0pHCcpak1Ol5NDgpHGkR8
	Qtb4Jv
X-Google-Smtp-Source: AGHT+IFq24ZE90yWikR1WNs6G9qizziluuH3FFv6RjdpPlQ2XJnKH0ssswEw3Z2b4tPjhHGKFdhHog==
X-Received: by 2002:a05:600c:4506:b0:477:5af7:6fa with SMTP id 5b1f17b1804b1-477b8c92626mr4124585e9.32.1763584516042;
        Wed, 19 Nov 2025 12:35:16 -0800 (PST)
Received: from curiosity ([80.211.22.60])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477b82cc72dsm8653205e9.1.2025.11.19.12.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 12:35:15 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH] riscv: dts: allwinner: d1: fix vlenb property
Date: Wed, 19 Nov 2025 23:35:06 +0300
Message-ID: <20251119203508.1032716-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to [1], the C906 vector registers are 128 bits wide.
The 'thead,vlenb' property specifies the vector register length
in bytes, so its value must be set to 16.

[1] https://dl.linux-sunxi.org/D1/Xuantie_C906_R1S0_User_Manual.pdf

Fixes: ce1daeeba600 ("riscv: dts: allwinner: Add xtheadvector to the D1/D1s devicetree")
Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 6367112e614a..a7442a508433 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -28,7 +28,7 @@ cpu0: cpu@0 {
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
 					       "zifencei", "zihpm", "xtheadvector";
-			thead,vlenb = <128>;
+			thead,vlenb = <16>;
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {
-- 
2.51.2

