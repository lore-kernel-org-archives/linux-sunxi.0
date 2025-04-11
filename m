Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2F81E833D
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Apr 2025 16:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744388128; cv=none; b=WHPczyBMZaNFXYkLa/DO9hCxvaLgSQYDNvrL0zdFpstbbwuPzVUeXTJDrl8AvxetZmwJivHow05Ngj9mZnja8ZXpXhFE/9u+grgh7XNhPnFFu1SxYU+gStKnVO+9gByEgJfTL9UhMy3qdem8twsHQmIP9sm0TGx01wzmLsLx3Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744388128; c=relaxed/simple;
	bh=/uDh6xisdDttyOBDhxRhE344S2W3v5V90juKjuD1Fj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WYV8P8+pLYoV08aN7Bgr41hAjpT33L6PT2RbcyWMlHCX/dsXbxLgLk/I+WcMRS8YtEvNpXJOrZUjCuASaM0FeyWY1io5bkCgZXR+YXxxSI+ly1fLHv5x30ggaF6+j6D1BP+ANal/2nocnLhBNZEwj/txoFitoMjfbtlE6xMheow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gG/dfS7s; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gG/dfS7s"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5cd420781so4268663a12.2
        for <linux-sunxi@lists.linux.dev>; Fri, 11 Apr 2025 09:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744388125; x=1744992925; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plFavMblBUPZMwgoP8wOxSFygVXsbi6ncRkK/LjY2cI=;
        b=gG/dfS7sdfWc0wy3j0/3OM3KcJYSoBamM68o1OKx+42JNNEG22hm14ePqGOumdN9/6
         KjYoERovZjbpVd6IEtjx31vUpIlrabgPyukO+er/kbVhq7yG7MRMlYLmXmmUaYugRPZP
         lDj8GFSMKrXfnHLTQw1NNCWbEf1RXWPo94mOL2yyDU/NCjXLz4s28IGHqTKm8pWiYZ37
         GukYRYHoI1reRVk4qZYMM6ONrVqHN2a8EiclG2N7uAmWnPG8U6hL4gTuFKRXrw+nqmLk
         MKbw55RsRdkt0usUL/IIAJJBLqCurR21X33+CWGNPIJJfuIFnwFQhSveWZyqvWBpa4Fh
         tQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744388125; x=1744992925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plFavMblBUPZMwgoP8wOxSFygVXsbi6ncRkK/LjY2cI=;
        b=BfQ5tWsrIrXb953HM26B+4AYoxExEcAK6WnOgjsxQBi4XWx92znbJh17Iq6qHzU+Lu
         1/Vfh1hw2ZJP/9ELlD7QeN8/GG5JbCLT1TDKiBIibX+FXn9JZOVE/sdU5PY1qorBjkZc
         D5YuN2kr7oh4LNI3ncGNjeumM2mF4ig9QrdFxEFzoROY8cmro4gL5QDSsy9UZkp5PqJw
         WTcYij5qfj/zTO+xczX5aCI94mFuU9+FpAUw5Hf/dlAViN9DL/0cbDSK3Rc3QOU3oTKO
         0pW1As+uf1aXRNhtUtERATRV21yG0Z0pLvaA/LYwagaLCqHHZCRKzu5W4LR/bx/hdf+b
         REKg==
X-Forwarded-Encrypted: i=1; AJvYcCUX2H/j74upxHZGQXz/9DZ9ZFfvtbehBAxruMPypdF2ubG/LOapw4J7fiuvAsCpDSTPrql3BeiUh6ziQw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfInCtwXkQSsLYujVlSFwAowtZsLK9MsoYgUff4gyCLBpugSs5
	xHu8ISt45aFJNMeB+tmjzpwDToMPR0eMyTmJIuS+8mmErkSZikC0k7vHxmyF2jU=
X-Gm-Gg: ASbGncsISRj6e3tlLvFWa6DI6sAxsraO0uK4Bzwkht8aN7Dl+nixg97hw0isKEX7Y/b
	534rZrQomo3kVf+p4w4/p/jByR3S369zaneM1vr7WegBVdvXXhUFinmWs9VhZkMLl9E4GrVTW6U
	COMpbiOB9h20olL/szb3MsmJ6WBBlJekVg3439t9XBam86pS58bTH0p/Dacse2IRvJJy0qrd/mt
	Izbdz7svD45NWZZiXpQTe9GqwikfrElUS1S4r2WTa5F2w7RKuSvveB1zKdMgF/lWboIWLcU0CNX
	xdG9vEoYAqQqgNouRB5McyWKPWpuMi9uY+VAX0DXfigS17hLs6bEkN8/Ag==
X-Google-Smtp-Source: AGHT+IG3z5ipT/8ygt9z8Ao/4hNyMj1+30brbGgn4tag3FWFzn/e9+tfPxzPBNJdAEnuTLQo+tfgqg==
X-Received: by 2002:a05:6402:1ec4:b0:5de:dfd0:9d22 with SMTP id 4fb4d7f45d1cf-5f36ff075d2mr3093629a12.22.1744388125097;
        Fri, 11 Apr 2025 09:15:25 -0700 (PDT)
Received: from localhost.localdomain ([80.90.89.143])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f526da3sm1136246a12.67.2025.04.11.09.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 09:15:24 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: jagan@amarulasolutions.com,
	andre.przywara@arm.com
Cc: trini@konsulko.com,
	macromorgan@hotmail.com,
	uwu@icenowy.me,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/5] sunxi: H6: Remove useless DRAM timings parameter
Date: Fri, 11 Apr 2025 18:14:36 +0200
Message-ID: <20250411161439.4743-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411161439.4743-1-jernej.skrabec@gmail.com>
References: <20250411161439.4743-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is just cosmetic fix for later easier rework.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/include/asm/arch-sunxi/dram_sun50i_h6.h | 2 +-
 arch/arm/mach-sunxi/dram_sun50i_h6.c             | 2 +-
 arch/arm/mach-sunxi/dram_timings/h6_ddr3_1333.c  | 2 +-
 arch/arm/mach-sunxi/dram_timings/h6_lpddr3.c     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h6.h b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h6.h
index f0caecc807dd..f05a1845b32b 100644
--- a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h6.h
+++ b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h6.h
@@ -330,6 +330,6 @@ static inline int ns_to_t(int nanoseconds)
 	return DIV_ROUND_UP(ctrl_freq * nanoseconds, 1000);
 }
 
-void mctl_set_timing_params(struct dram_para *para);
+void mctl_set_timing_params(void);
 
 #endif /* _SUNXI_DRAM_SUN50I_H6_H */
diff --git a/arch/arm/mach-sunxi/dram_sun50i_h6.c b/arch/arm/mach-sunxi/dram_sun50i_h6.c
index e7862bd06ea3..0adbda756639 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h6.c
@@ -45,7 +45,7 @@ static bool mctl_core_init(struct dram_para *para)
 	switch (para->type) {
 	case SUNXI_DRAM_TYPE_LPDDR3:
 	case SUNXI_DRAM_TYPE_DDR3:
-		mctl_set_timing_params(para);
+		mctl_set_timing_params();
 		break;
 	default:
 		panic("Unsupported DRAM type!");
diff --git a/arch/arm/mach-sunxi/dram_timings/h6_ddr3_1333.c b/arch/arm/mach-sunxi/dram_timings/h6_ddr3_1333.c
index afe8e25c7f58..1ed46fed411f 100644
--- a/arch/arm/mach-sunxi/dram_timings/h6_ddr3_1333.c
+++ b/arch/arm/mach-sunxi/dram_timings/h6_ddr3_1333.c
@@ -37,7 +37,7 @@ static u32 mr_ddr3[7] = {
 };
 
 /* TODO: flexible timing */
-void mctl_set_timing_params(struct dram_para *para)
+void mctl_set_timing_params(void)
 {
 	struct sunxi_mctl_ctl_reg * const mctl_ctl =
 			(struct sunxi_mctl_ctl_reg *)SUNXI_DRAM_CTL0_BASE;
diff --git a/arch/arm/mach-sunxi/dram_timings/h6_lpddr3.c b/arch/arm/mach-sunxi/dram_timings/h6_lpddr3.c
index c243b574406d..c02f542c989f 100644
--- a/arch/arm/mach-sunxi/dram_timings/h6_lpddr3.c
+++ b/arch/arm/mach-sunxi/dram_timings/h6_lpddr3.c
@@ -16,7 +16,7 @@ static u32 mr_lpddr3[12] = {
 };
 
 /* TODO: flexible timing */
-void mctl_set_timing_params(struct dram_para *para)
+void mctl_set_timing_params(void)
 {
 	struct sunxi_mctl_ctl_reg * const mctl_ctl =
 			(struct sunxi_mctl_ctl_reg *)SUNXI_DRAM_CTL0_BASE;
-- 
2.49.0

