Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C024473F08
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Feb 2024 21:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708636420; cv=none; b=N1xs1E4RJ/uth3v5rv0qSIARf2dEkSk4j6YEnCwu9S3w6dUPfBudOOiHP9qBbY9ohdxmZTGDoMvVw4zkI6XpR99bTbgtWKJMfC33D+x9ADM9stPoJiskngZwmCJv/yLj+8T1xVvI9xtKm+glM60SLG8TBSCSWqifoqYwL6KjytY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708636420; c=relaxed/simple;
	bh=Li5hH27ilVbcU3qbz8ZCBO4YJFaeFf6V6/fGppbkPrg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ScqtsL61s8OczKnONTqj5VArUOq2ZrcrOcVT+tov/6q8Th+ZQHTyA+vIP6FITpCGgsBZQ6mtC3pjrzOHSOHz6sjHETU+FcLW1hJLZ0WHC7pWfGl5xkIVyublCTN2xKiJsRHWwb9gEmf/VYQ/+fINZXHbjd5CCtaQ4svhWVCorxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7WIk+gD; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7WIk+gD"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a3ed9cae56fso272561566b.1
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Feb 2024 13:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708636417; x=1709241217; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/5e9mSee9zp+N/Xd7G2seNRIz/9lLuVdPxZW9PfymvM=;
        b=Z7WIk+gDO4btmQY5e5J6Jxn0LAeyV/mCMiSLGL8eVufWrk8kaHRxvuf6VzPUZoZgNk
         s1v9f3LQ4p9NQA/DVnN2aAHyHK+BHNNpKA4yE+1nBWr/KEfiVwrYCV/DZgheU3K4JDGs
         au8zvn9tSojKno8WT08Sv8UTy3h1AETjOf0HTenJ6fWqgOf+vU57xdXza/l+GBYmacFf
         616QC+HtKOqfFkuW0y7AMWrSVnoWJSHcNBfwEECjO/CNPkYPLUPK7PZqvZ1ORKxlxHAf
         7VsfiI3+li6X32a6XYRHvXBast/nt10FI+w1yEQKwXDsYo/myBz4ApHEq/yV4LIZxSOb
         fs9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708636417; x=1709241217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/5e9mSee9zp+N/Xd7G2seNRIz/9lLuVdPxZW9PfymvM=;
        b=smWbgYILvPoAkayFuCi0lyIj8xHwuTHzBx5uBt7V/BQNmI5lziNvmL70+3GH8yjDzW
         u7tDmjGj37TjWZdtx0dM9/13zBfbNJxowJ+Ayie0ry72E1EyXiSGksgqibN1st/UyelY
         BI+rgslqeVfaBCxu6XY30KgA5EfgfnQqXVzalbLewD4k0JqS/effLz64zmvrzPz9WIwO
         IuU7tet/ZjZJWm44J8JM3cA0qkvnBltRvA1JqPrGXQPLiRZX1KRP9DwD3ZEpbvWC/TIO
         X/6nn5bFJOHbqwbqOjGADX8C1Grk43EwEG8MWL4aPO/Glcgum8VpA7WhXkjx3Qy0nDJz
         ivnw==
X-Forwarded-Encrypted: i=1; AJvYcCWzetmIojCjoJ45ZZhGPSZhb35NxIGOMdFswaCiyPq/jhNI601KGNklQ5rFqyAUH1kYKZ9w5xjlfL2X0Gigyy53sQRz2XpPH86sQh8=
X-Gm-Message-State: AOJu0YzoNRBjBCcRyacEaGwv2ou0b5r1qp2cX/ugBLZQ5OlM6deLxl1j
	zVCjN3gc0uJzwXT5+ToB4UES74RnhCnGyXB0et1jSR5aOHIur5+e
X-Google-Smtp-Source: AGHT+IG0jh84FYHk+aZL0x57TxmRZpwDqGQQiksxzRLN1vbtmHOFCvwJbrTfxHU99FJpkCDCLDaaDQ==
X-Received: by 2002:a17:906:3b0b:b0:a3e:7f80:ecac with SMTP id g11-20020a1709063b0b00b00a3e7f80ecacmr3213548ejf.12.1708636416937;
        Thu, 22 Feb 2024 13:13:36 -0800 (PST)
Received: from localhost.localdomain (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id xh8-20020a170906da8800b00a3d8a76a92esm6341468ejb.175.2024.02.22.13.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 13:13:36 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andre.przywara@arm.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: allwinner: h616: Add Orange Pi Zero 2W to Makefile
Date: Thu, 22 Feb 2024 22:13:26 +0100
Message-ID: <20240222211326.114955-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Orange Pi Zero 2W dts file is not included in Makefile. Fix this.

Fixes: c505ee1eae18 ("arm64: dts: allwinner: h616: add Orange Pi Zero 2W support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 91d505b385de..1f1f8d865d0e 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -42,5 +42,6 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-cb1-manta.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-pi.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-orangepi-zero2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-x96-mate.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero3.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-transpeed-8k618-t.dtb
-- 
2.43.2

