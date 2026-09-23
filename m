Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A1B579810
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 20:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194999; cv=none; b=htApGUzE/HnaWEd0E7VoGElt0f/FU5s2A8CIQETW9suYPIoSoNctioaa4tgRMA+xB2uU1MiEnAPxV2Uobu+eTQPX/NutL1DN5vKkWI2nmIY+n3baYbuwdXQvZ1kL91jmi80r11FH2qVyYYnH6g83l7tDGZ77G3UWu+hjCn7kdRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194999; c=relaxed/simple;
	bh=dplioYOzQkTgB7OtXIdIJ8d7kiQ1EMlzvR3wJI4xDb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DXNqQxZ/QWQ6dAL8NQ4OrHLpuAVlDdCcyiO4bAC8jj6BjCGwrTVBuYVLYp9gIyveeQq2eqdEdOc0NF51EoLGB82Iz5NHozf1HjQ9uB4brH4EAGR+W3VHyeWjVAOt84ddX4R7El+QCZqte98ymY2xu18UPFe/mfVZhWRL3E61TZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RI47S2pv; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RI47S2pv"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a1f611461so98506466b.1
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 13:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194990; x=1790799790; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVRS8IDqRClJGzLh+AyZKtdvQwPlkBwHKoeRoTOl5Sw=;
        b=RI47S2pvtKUr5EVkV3G9TmF8mfqJy2tbBO0oIMBwu2ObAjk1CND8NjrrMgVhMJ+xIT
         Rmq0URt1bjTykbYt88u9Xpq8/yAZLTvTAS+BvZh2eAPMRIW2VADjAWqck/aA7jg2AZsG
         U+n4yr2qozgwy3EllH0Z2/0/bK6bPbS5Pc/0VP5xKXjO5gtrK+cTYei8wlJLlyVO2QE2
         0T4E0wGCCkfvvJ7FVmUX4RA9ALYuQALkjNhLFoXQoOv6GASIQTTGQXk6k6avenyj3ov/
         szoqFPc7977mu/2f6WyiSkHfQRBuJsROtRTgQ6y0SerWtHet9ACOBVDddV4HDlHjInHq
         L6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194990; x=1790799790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVRS8IDqRClJGzLh+AyZKtdvQwPlkBwHKoeRoTOl5Sw=;
        b=qVhI6P+3Mm/StcJGen7rm2VpOFQp2ZhXWmrszsaQlPC6LQIrpYIxmGjSOEQqoYDY2t
         6ikQEbzv7ZIU52RRKf1IfxL6FCNO4mVfcoLvbz+Do5AyjPXLDjni1hHiZRUGtpU0TcQU
         M2mQaHGFcdaeeWtVHlyKDHDe2UqswxisdujjadBPi210as7dZoT1Vj/PumYBMoPTTrui
         1aEiqhQwDSJEOdwLd36YJzalJtHbvNAG6kPObLHVY+ywG8j6cGFAdgHfdyO00UIcATI5
         BXzKv92PmQzEfBldz0BwVF3IUTMf1396uGdZOqVHQtMyIKErdG6f6CNL9QMyq+kcj7VQ
         pQAA==
X-Forwarded-Encrypted: i=1; AKwUvBz+ptKUpYiPg3gNyjRQtzf9RA1EGZBs1G7UcSN4CN4hSLmCwjObKqeU5+o7gBDPfd2lJioHIm9Re60g5g==@lists.linux.dev
X-Gm-Message-State: AFuF++kniWyADxg/J8kcetB64O3PqrUtHyEpp1L45u+/LVoKwIsnWJI2
	ab3ayG+iBASCcPUIwLfr5do42SNRVJJr9e9dhBF2X/rfi5SQwPObG8GL
X-Gm-Gg: AYBFou0DKiX55WVQOZGopIbYIQD1oYPcJt/9yntGU0Zn38FG77HffwVufcW2V6wx6xE
	YJjThC4jNoDIraKDBkI/wzcNHHwNQtNZMwrB/U9WhInhMMV8+2k8YRDmyFqhyoZeqJu1KAe7Gqt
	SlskvS/sFPzvwTMd67PAS7ZVaw36zWpvXhPY7qDs5qk0qBzVjmhFccZZthhsdz9XZ8T8xEWmZVo
	vYoszCJcTU0algLg16+fclLi9U8K02YN/GD7536GgebMFs87J6ndHefc9ahcvSehFHVPHjOszwc
	tuymaAH+qbYu/7RMEEBah/Bof6s8ALl7iSu6ivqzOTUz62Ywrh8QJahw5hUWZ0IMsw8AsJ5thuf
	4bcpQB0T9FGPgg/QVDAdUEdtV9d63yODZ1/rb4IKEf4ixV+KHHtx090PwDxLLeoh7pXMRBr5dzd
	odq2RtR5l6V24iwMEgzdPftZwoeiwXaX3cNz+81diN89ZZI95CU8TH3+PNjNspsdkTbSyHFsTip
	3EqLHMAx1J6cYoOXLm5MLHBZWfLh7ke
X-Received: by 2002:a17:907:6c17:b0:c24:6382:2648 with SMTP id a640c23a62f3a-c2ac21f98famr25358866b.5.1790194989894;
        Wed, 23 Sep 2026 13:23:09 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:23:09 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 08/11] dt-bindings: mmc: sun4i-a10-mmc: add Allwinner B288
Date: Wed, 23 Sep 2026 21:16:58 +0100
Message-ID: <20260923201701.43391-8-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the MMC and eMMC compatibles.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
index 9e9610bb1eda..c2ec7151dccf 100644
--- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
@@ -32,10 +32,12 @@ properties:
       - items:
           - enum:
               - allwinner,sun8i-a83t-mmc
+              - allwinner,sun8i-b288-mmc
               - allwinner,suniv-f1c100s-mmc
           - const: allwinner,sun7i-a20-mmc
       - items:
           - enum:
+              - allwinner,sun8i-b288-emmc
               - allwinner,sun8i-r40-emmc
               - allwinner,sun50i-h5-emmc
               - allwinner,sun50i-h6-emmc
-- 
2.53.0

