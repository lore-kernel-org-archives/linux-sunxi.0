Received: from sender4-op-o18.zoho.com (sender4-op-o18.zoho.com [136.143.188.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEB02C9C
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Oct 2022 13:27:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1665667633; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MQ3LG/Ouu823+63QcG9xfVeapkeb2aQkUJ6nkGpcIJRu0voIBIg2ykqseHPB2JCIeHM4kTbyd+H3/7LSOz6VTW8XQJBfZgDDiKdntCQNuXBh6nBjs4rRtReXZIqAGN+4hOtcmQuwaAlB5gb7TZdYKUt7AsKQjsPZ6vimLf1uuR8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1665667633; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=KVnyKiSWUSY8PwcrngoncKTpR70A337whh/cJ3hQgeM=; 
	b=VxG52FkWkKH846YyrjrRUcAlbZt81DM5QDfwEXwHt7GbQcvQYHZLGwoemKvPKbW5LEFr68hMgMdYtmTZV+JNjP5MwbDmFchNqcE/ptX3b6k1nhLvrQkpApn2m+Ms4Ud0LtjrX1AFfqoG4kGkL7IZTaT5Tsx6evvMyRUHCh5VvG4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1665667633;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=KVnyKiSWUSY8PwcrngoncKTpR70A337whh/cJ3hQgeM=;
	b=hiQ+vSHLtvZAuPMrEPEr/SeRBnj7d+j1ghHcCNpgRlmiX+mxv7Dv2kqMjW1EUJQQ
	HMNkW8nMNVjwdRrpSUpeqorNGlOgHuU/byvVG5SJdMvVbvqRQ5CIJLuWYfYJ9bw7c8r
	GkQw3VLzI1+/1f5x0ODlyaW2my8iFHUb+nJ6UeNs=
Received: from edelgard.fodlan.icenowy.me (112.94.102.144 [112.94.102.144]) by mx.zohomail.com
	with SMTPS id 1665667632997672.4203183083479; Thu, 13 Oct 2022 06:27:12 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 2/2] configs: sunxi: licheepi_nano: enable D-Cache
Date: Thu, 13 Oct 2022 21:26:45 +0800
Message-Id: <20221013132645.2469041-3-uwu@icenowy.me>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221013132645.2469041-1-uwu@icenowy.me>
References: <20221013132645.2469041-1-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

As the compile error when D-Cache is enabled is gone, we can have
D-Cache enabled now.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 configs/licheepi_nano_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/licheepi_nano_defconfig b/configs/licheepi_nano_defconfig
index a9776bbcac..b80d32c502 100644
--- a/configs/licheepi_nano_defconfig
+++ b/configs/licheepi_nano_defconfig
@@ -1,7 +1,6 @@
 CONFIG_ARM=y
 CONFIG_SKIP_LOWLEVEL_INIT_ONLY=y
 CONFIG_SPL_SKIP_LOWLEVEL_INIT_ONLY=y
-CONFIG_SYS_DCACHE_OFF=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_DEFAULT_DEVICE_TREE="suniv-f1c100s-licheepi-nano"
 CONFIG_SPL=y
-- 
2.37.1

