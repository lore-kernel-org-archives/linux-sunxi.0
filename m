Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A52928EA53
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 20:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649351; cv=none; b=GTVxlUQkDdgqOy1eirywyAhytzhkNoojT6IE6lX2tZxxN+FvYuvJ9fH6h55iAFinp0U9dO6f95WmOb7XM++H3ak0eZg2jHc9+hU1k7zVXEzjTNup5gGxwe/hxdx6BnfV7EjmvO7jmFvF11JZzJnrDGLEedl1gE5AMzef5OUwuk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649351; c=relaxed/simple;
	bh=4hIfE/LE0Bo5hgDg8MWhBMifz2o9TEh1kLGyL38EbdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VpsdkRflZNDqWthd80gdO1rLT9KHOF4r0RRvQye5ohuVNKpiLL+5RBCT/qcSOi4pBT/ATyHfvzcPIhw0ojoQNth+OmLlvMLY435yuyXaz1e+eOT+1lWsVFjEGVydZ0YpEpF3POigrI/w+Czvhn+zF7JCLZaNmm6IgPYNxs0rH68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQ14ev4Y; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQ14ev4Y"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-72c47631b4cso135754a34.1
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 13:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649349; x=1747254149; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uejrNc06iTAs+YLZjBRvSkO6o5dbouRkykrkJDTloTk=;
        b=jQ14ev4Yu/HZOiziQLmMH92Z0c3xw2P+8c7+vRm2RtRI8LAcGBMJRbj6O36ooRfmqP
         CSNRNgk1Mk3lUXNt70QfyK3Tdq4yqmWw/ZeRo4rWqzlXPOFFc+Njm01Hn0Vk/vEgHd+e
         yTYUq432tH+emBIX7u8bQpiltHqZ7/KmKtKtYTHUPGiU8/SZxsOPcKJ3DRrKmpKB2UvD
         qICQ0AMPShqZGSHZ3W8giV7XvLrRIcRvRx6CuNPKt0SifgMSN2418u+xOnom+wT70mZN
         eHV/6tfABQZtMI0a8ItN+nUTnUEEjinwYoKAOIeyjLzIJg0GnlyGKtHNosoCdtjd6+l6
         HZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649349; x=1747254149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uejrNc06iTAs+YLZjBRvSkO6o5dbouRkykrkJDTloTk=;
        b=keGePZvNlgGHPDUttTIo9G9NPKm+IG9Nt9N5H27CW56WpMfUIJL+N6XrbDpHYLu613
         prdO+8/2Rq6Q4kJkgoaqfm6QcuFk3pFpgyPmrtY/wLG6tmapEkDSljRGorziK8hUA1jt
         0x+yDA5eV6TLfo65SmGVzOsUE7Q49izpIdLxEWXmbtEON8PjGuE4r9fKKTM2oDGz0WGA
         npfdd2npjuYYj+sdSZJ50VnU6Gbcssqfr9fN87O8PjP8kbjcuMk+DMKXmZf6K2/1ULVF
         khTgAnXTnfyCDd5OqmzYddTzGwolGa1Q5vJhfPGz4qM083d3HS1of7RwzRlfI1y8Disg
         OADw==
X-Gm-Message-State: AOJu0Yy9hWyd/t6Pc2CSBB8kqEUrdGyB0i0tWa1XES4LuMJ65DrnArF6
	+10dZzBLjLuCCxVwxK+lB8XHt6sHhv5hHj2B2zSAGMltTsClAMKTD3o3lw==
X-Gm-Gg: ASbGnctbS7jfFF7tNLgM5ilEC+l2fGtSZyOy+27NHAVIBGV4qngORS4xMMr3hr2TDYd
	QZwMAbetU1g8hr7kJVPdDGCFkqThoB2isWdCYU24WxUk7UkNdoRe4mVdkbP3jjN0Bl2IPMb4ll4
	uIRMuTua8VhRBPck8UnBa2/5ZNK6DLvfoBZkKHfP++al1UADJ8QXHFqQo/c/VfR/tgWMbqxi+gu
	eTO/UvHqY7eFTqhrudE60O47gecdB5pGt3wiRKq/GJHuTYhO875k9XVBAcOHBsq2A2ouYQcDwNU
	xj0RzaB6TxACQ9JZ46U3vyDj7Nt21rL0pmSF+aB8YSd5HKVKu9nAcda1m11QeElxFGATUQc=
X-Google-Smtp-Source: AGHT+IFJzZAXCyZXw0QWeomPprmm2P68wLAv+/7r9VxtEI/Sd4+CGxIKlA//Tnd+huAraTUCYejlBQ==
X-Received: by 2002:a05:6830:3749:b0:731:cac7:3634 with SMTP id 46e09a7af769-7321c341618mr506386a34.3.1746649348955;
        Wed, 07 May 2025 13:22:28 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:22:28 -0700 (PDT)
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
	robh@kernel.org
Subject: [PATCH V9 02/24] clk: sunxi-ng: h616: Add LVDS reset for LCD TCON
Date: Wed,  7 May 2025 15:19:21 -0500
Message-ID: <20250507201943.330111-3-macroalpha82@gmail.com>
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

Add the required LVDS reset for the LCD TCON. Note that while this
reset is exposed for the T507, H616, and H700 only the H700 has
an LCD controller.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index daa462c7d477..955c614830fa 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -1094,6 +1094,7 @@ static const struct ccu_reset_map sun50i_h616_ccu_resets[] = {
 	[RST_BUS_TCON_LCD1]	= { 0xb7c, BIT(17) },
 	[RST_BUS_TCON_TV0]	= { 0xb9c, BIT(16) },
 	[RST_BUS_TCON_TV1]	= { 0xb9c, BIT(17) },
+	[RST_BUS_LVDS]		= { 0xbac, BIT(16) },
 	[RST_BUS_TVE_TOP]	= { 0xbbc, BIT(16) },
 	[RST_BUS_TVE0]		= { 0xbbc, BIT(17) },
 	[RST_BUS_HDCP]		= { 0xc4c, BIT(16) },
-- 
2.43.0

