Received: from mxout017.mail.hostpoint.ch (mxout017.mail.hostpoint.ch [217.26.49.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F084A22332C;
	Thu, 19 Dec 2024 10:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.26.49.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734605908; cv=none; b=RidFSY2INK9gHU/HTiv+69TClbYglqZSbNHwaVYssW9imWQPP3qnvzDCu6xmMKzyJcTGRjLagjy3WdGWJZh7LMgEwhu64lsps1RMnmkcF60SYpQxXQkhxSguZbvJQMiAcv+RyS5TDEvzAMCr1EnRA6rPIrjPFP6LsDUebdKf2i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734605908; c=relaxed/simple;
	bh=q7FGjl0Km+Fe0xwPC2d4F/rlzqPQO4tvLrheUJdCuo8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jT307UAbjP1Oplhwv9FdapD5IQ7/kcqckkObc/RHLaS/1TuS6bWkOVfzrHOW5AwU1jEDAPhtEG5CJtiboVOuKby5pV91UhHkOz4mKCl/U5n5qSLy19PAO5Kfs2vgJpFK2+N4RAPi5iQynHvZLsUlpBJKqMmZvn8NwTgQ0UIdHCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stefan-gloor.ch; spf=pass smtp.mailfrom=stefan-gloor.ch; arc=none smtp.client-ip=217.26.49.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stefan-gloor.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stefan-gloor.ch
Received: from [10.0.2.44] (helo=asmtp014.mail.hostpoint.ch)
	by mxout017.mail.hostpoint.ch with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1 (FreeBSD))
	(envelope-from <code@stefan-gloor.ch>)
	id 1tOEEP-00000000A6k-3zaV;
	Thu, 19 Dec 2024 11:58:14 +0100
Received: from [178.197.223.140] (helo=localhost.localdomain)
	by asmtp014.mail.hostpoint.ch with esmtpa (Exim 4.97.1 (FreeBSD))
	(envelope-from <code@stefan-gloor.ch>)
	id 1tOEEP-00000000Ezf-2xQw;
	Thu, 19 Dec 2024 11:58:13 +0100
X-Authenticated-Sender-Id: code@stefan-gloor.ch
From: Stefan Gloor <code@stefan-gloor.ch>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Gloor <code@stefan-gloor.ch>
Subject: [PATCH] ARM: dts: sunxi: Add MMC alias for consistent enumeration
Date: Thu, 19 Dec 2024 11:56:23 +0100
Message-ID: <20241219105622.13691-2-code@stefan-gloor.ch>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Vs-State: 0

Add explicit alias for MMC devices, so that (e)MMC and micro SD cards
are enumerated consistently. This should fix spurious boot failures when
specifying a hard-coded root partition, e.g., mmcblk0p2.

Link: https://github.com/linux-sunxi/meta-sunxi/pull/431
Signed-off-by: Stefan Gloor <code@stefan-gloor.ch>
---
 arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-micro.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-micro.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-micro.dts
index a1b89b2a2999..9cd1eb690134 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-micro.dts
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20-olinuxino-micro.dts
@@ -60,6 +60,8 @@ aliases {
 		serial2 = &uart7;
 		spi0 = &spi1;
 		spi1 = &spi2;
+		mmc0 = &mmc0;
+		mmc1 = &mmc3;
 	};
 
 	chosen {
-- 
2.45.2

