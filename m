Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF17C28EA75
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 20:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649357; cv=none; b=DOKNqKzotnZrr6kL78jHfdpchIyirxzATUsJqh9E2Xk7ZM3C1mX4hA9qCKxa8SIkfoRuh67TAw6DPtHeZ7/uF6aS/eFIo6rpSGQ+e3GNo+0uvleZ2XPxYB8v74069Y+pvDG6T7tfpKTvdDlz5DByDx4jfz9S3Mkb/O/dG2N6rHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649357; c=relaxed/simple;
	bh=LsuYS6qoBFINp6ctEKngWvXGFkd5+/qi3wP3l2WCm08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ctB4o1fwINXJ8A5rjVIS4QNOQ6gQxHaJ4IcKTQhWinl2croHn1dn2NwbPwg704/BLpVvwWpOo28eaqraLVy+0MH8o7f2vF3gs1MbjOxeMfwHOIYu4U6BO47j6lnNU1yS390cs64LIy9s/HaQYe5a0K16eC7woneMvM4Htg1xEgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XpXd9AXS; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpXd9AXS"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-72bd5f25ea6so77331a34.1
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 13:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649354; x=1747254154; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=521t/CeHAKMYn/pwM/BkFVrSOh7CwyL/JsWX9K+z/SM=;
        b=XpXd9AXS7RptO55AOsNvIf0Z9Uwyjwg6MKseP6Wci+111oYWA/d0qHeUTupu9FFJA5
         DQ065CkVkl+tSpRlu5tSxlIFDgDwdZHJ8zlzIknIhdVvLiJVIkwS4ql4/Inoa/BUQAuI
         qHnifrws2ZNKuXDG+HsXjSHKQRJVChNkE04yey6uiUrxV/ZvSOcYk5QOnmACtp1zxokd
         k9M/PgotuAnVaQV8FLwJqUe/88rg31bRPRqEA358K9PMPfcUsZUhAw+zeFZAy/aHwMZE
         c9qXCIsbU1FlPbdVjp9zQLMopHJy2k3x62u3hBpU4DJ05zUQ5xtiNZQfJYRYVLahd0kh
         ic+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649354; x=1747254154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=521t/CeHAKMYn/pwM/BkFVrSOh7CwyL/JsWX9K+z/SM=;
        b=cgBL6UyWzibMcrvLUnC4r75dYZDWIkdRUrwJAfhBvIWeLakJFfM2EhDoQ5l4azLprC
         jawPT6CWCv6pb20AzYZ2T+8/UuPKcR3T6CKzkVCjBvJqZ18lT0I/bWECYvLO69+JpEZv
         EcdWxzKco0XTlTzbUOzDVmMENHwxGEaMWRqLJXmJ7wF/nLMy52UOmEVIz0rdc4RR/Oe/
         +uoTdbwxoa8onc9eU/z99EbFfAmz2mcuf7HY/f2ObmXuJIYR60y31IZPl6HRhTY/w1L0
         YAgvaqojGeCo/qXfQbGd/z5schN0uV/yTy2udPQwNd0aicl3dLgEbPQzZYUFv8ARuzju
         2V5A==
X-Gm-Message-State: AOJu0YyNvNR4ysaA6tY3xXRQjBXN248eNe+jQ1satoM4easrOI7Ybshq
	toS2jIAcWuXW7VBY2s76tUd0Y7eTTZkrLpuk3DiRw3h8XjNGN2NjsYg0oQ==
X-Gm-Gg: ASbGncuxemJDY2BkAAzz34FsMTblQDFqkyIMExmli79z1t4Qc2j+hBlLCGbAYvefTQb
	O9armPitddz2GdTZ1iYjJh/ir8yFbcDKXSo0ZkHfaxWeOxgu2DjRmDDpr0Y67ptDl6Yea0wPgqp
	jVeM4bBUsQrd3q1dgOh7TO6rl1rTcutjFxqjR5aMeb9Ore6qvfB9ZTT95zPjKZypzSf4rW72U3t
	NZdcH621F5Q84yHhuKMSOjeBdiZxKiRxp1BofMxenx81FDqgMBZauQsAlrx8hyL0A8baxXVd1HZ
	3EqRcz/v32PNj1nB9MdfiUKGcipfTlqEuCmsuJ75GjGwzOB4CSwGCDujPk+i
X-Google-Smtp-Source: AGHT+IEgovUo3fqEdnkhJw+bsJ52pKIQ7trPCxR4KR+DeBMftR4N+JrGDxjm3mhsjvknZyqu+0Tatg==
X-Received: by 2002:a05:6830:6204:b0:72b:a3f3:deb6 with SMTP id 46e09a7af769-73210a692famr3145427a34.4.1746649353725;
        Wed, 07 May 2025 13:22:33 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:22:33 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	ryan@testtoast.com,
	macromorgan@hotmail.com,
	p.zabel@pengutronix.de,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	simona@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V9 08/24] dt-bindings: allwinner: add H616 DE33 clock binding
Date: Wed,  7 May 2025 15:19:27 -0500
Message-ID: <20250507201943.330111-9-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The Allwinner H616 and variants have a new display engine revision
(DE33).

Add a clock binding for the DE33.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
---
Changelog v2..v3:
- Separate content into three patches for three separate subsystems
---
 .../devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
index 70369bd633e4..7fcd55d468d4 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml
@@ -25,6 +25,7 @@ properties:
       - const: allwinner,sun50i-a64-de2-clk
       - const: allwinner,sun50i-h5-de2-clk
       - const: allwinner,sun50i-h6-de3-clk
+      - const: allwinner,sun50i-h616-de33-clk
       - items:
           - const: allwinner,sun8i-r40-de2-clk
           - const: allwinner,sun8i-h3-de2-clk
-- 
2.43.0

