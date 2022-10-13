Received: from sender4-op-o18.zoho.com (sender4-op-o18.zoho.com [136.143.188.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813452C9C
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Oct 2022 13:27:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1665667629; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HupC9Lj2WAa+ToABsz8ryHx51RPtWLS+0ehlJkXnBgXsDtdqUxkWhlHKgKtClDsyMst2F0CsrzySgXAVAS0LuE3n2lzS8hWCJ7ac9aNjNtnnDAo7wv/0B7EcPnqhUqCUrPkvml8Ez+i/Au6gz+aZuSmoFzP3iELWJgmRAAKjD7o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1665667629; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=pBc0sWQEv/gvIIFagIbkbl+AJ/ygERdWDw13UAYbJSs=; 
	b=Lhk+3EDXWOXZWgxh4Z5Cf1FC7A7OEGahagyoxiKpV7Wvvd8joe9wvoKWV4D1INiGRbxovLv6qWzK7Y17p0O/+4ARhnGJxcPxNiLtkICAROSPDB0k+kYelXWFj/hrlBABTEYioCkkt9LdxF3ydvkCM7EWs6FmcmD8aeEsLLOtVW0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1665667629;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=pBc0sWQEv/gvIIFagIbkbl+AJ/ygERdWDw13UAYbJSs=;
	b=INz48fRrRBuxhLyeJcRdWfytvTWH0aA1NzDZ6hrZ3f/Yr9/lGw6ejW5MVtK3vwjf
	Ssy4HPQNI5WjDJFOZ3fnFLr53zEoJatLAdO+fvY7SlZI2leN4VZi1bIsMq/7PPIqsjN
	j/kja48VVUj+t4XvdeysLQAiHdDOO/ZvdBpFBrTg=
Received: from edelgard.fodlan.icenowy.me (112.94.102.144 [112.94.102.144]) by mx.zohomail.com
	with SMTPS id 1665667628817901.0340454819353; Thu, 13 Oct 2022 06:27:08 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 1/2] sunxi: fix SUNIV build when enabling D-Cache
Date: Thu, 13 Oct 2022 21:26:44 +0800
Message-Id: <20221013132645.2469041-2-uwu@icenowy.me>
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

The enable_caches function in architecture-specific board code is only
necessary for V7A CPUs, code for both V8A and ARM926 have already
declared this function.

Only provide our implementation of enable_caches() for V7A CPUs.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 arch/arm/mach-sunxi/board.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
index 62bb40b8c8..60ccf909db 100644
--- a/arch/arm/mach-sunxi/board.c
+++ b/arch/arm/mach-sunxi/board.c
@@ -488,7 +488,7 @@ void reset_cpu(void)
 }
 #endif
 
-#if !CONFIG_IS_ENABLED(SYS_DCACHE_OFF) && !defined(CONFIG_ARM64)
+#if !CONFIG_IS_ENABLED(SYS_DCACHE_OFF) && defined(CONFIG_CPU_V7A)
 void enable_caches(void)
 {
 	/* Enable D-cache. I-cache is already enabled in start.S */
-- 
2.37.1

