Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907251;
	b=JKTpQoOLPYW2l70XrGuFEUqITYJNsfc3vZoHtYzJ5Dabl9vz1abbYoin3k2YVI7gxk3e
	 SKtv1X3VOFxv+TK2OgpopyK/uZ8YMNFCgJA0+pFZsoD/ziJ56O18HOpAy1QcHZI0yWggL
	 eiq9Mqxrm+9aPGvU7VNFJyHu27v83kdnfsUNnGHRePcbiVhe4ykBjBI9navFWRe2RAS77
	 DkPqFx6puCgkosf9gc2pN8MrMeH12HZFbsFtrZSngbYi9i+OzRwufh2shn4A3E+lqNbtb
	 9d+Xei7ZNRjqhyHdm5BIuEWDPGuMVPbcehB+M4Grtqet1V11CrDJzguC5m6jEpQk1fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907251;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=TzwsEBgKW8jB9RMsf+8WadAiOdNeN3ARQQcwnDStTM8=;
	b=21H8BvKMedWJu03YDvNrD3fU9vyLJUbP5YtotPS/V5AI/gHmLBxNzydqP+FefX9xar0y
	 +tjONkyBhCa/6yULLyeyLD3SFdpWZ3FLCZaZ0SUXmMqA88td+AP3MHjKGCtbTJn9YSA25
	 KerDu+pLmiJqF7jUiw76HM/8WMva9ITJ5sKkq+6Cq0k18ooRtKWMTUZJEEVt6DOhzpFiR
	 4Tin5E01zrin9fWtBo1FLIDDtHT4R97mG+/Jqym85/kQBymUqn2Vdykb8svmSMn5gJRBG
	 vgO59AJ7vwTkU7bqTSCq6e7pDUZV0BfLuTvbQCFOrM+29cN+UpTRZD8EvSwd2MwmvjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=TFQzJ0X0;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392BE606A32F
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Nov 2026 09:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 392BE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=TFQzJ0X0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Tz
	wsEBgKW8jB9RMsf+8WadAiOdNeN3ARQQcwnDStTM8=; b=TFQzJ0X0q2vlmw/mVN
	4HstBU6y2ZF9k/HfpNBWvWYfT3lpvo9rar7UWNw2elcoJLOqAGZ9E7komHPFbJQ8
	rcJ39B7hE80opKlNM8qxbKBoPOjrRs24mqg53Z+HR81k+m76l276q/lo6elFEw1c
	obCVyJZamu/g1alRdRKym+T9A=
Received: from SYPC (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDXl39jHPxquf0OFw--.36174S2;
	Tue, 17 Nov 2026 17:20:36 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: allwinner: rg35xx: keep RTL8821CS powered during suspend
Date: Tue, 17 Nov 2026 17:20:24 +0800
Message-ID: <20261117092024.12163-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgDXl39jHPxquf0OFw--.36174S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7urWfGF47Wry7ZF1rJrWrZrb_yoW8XFW3pa
	yI9w48Gwn8uw10yrs5KFy8Kr4UZr95Gr45Zr92y34UKw17ZFsYgr4akFn09rWjyrWrJwsF
	yF4rXay7uFnIk3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UXa9fUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7QT5Lmr8HGRs6QAA3V

The RTL8821CS SDIO WiFi on the RG35XX Plus/SP is soldered and powered by
CLDO4.  rtw88's SDIO suspend callback asks the MMC host to keep power
during system suspend:

    rtw88_8821cs mmc1:0001:1: Failed to host PM flag MMC_PM_KEEP_POWER

sdio_set_host_pm_flags() only accepts MMC_PM_KEEP_POWER when the host's
pm_caps contains it, and mmc_of_parse() sets that flag from the
"keep-power-in-suspend" DT property.  Without it, the first s2idle
suspend aborts with -EINVAL before the system can enter suspend.

Add keep-power-in-suspend to &mmc1 so the WiFi stays powered and s2idle
works.  Tested on an Anbernic RG35XX-SP: the board suspends and resumes
from the lid switch, and the WiFi reconnects after resume.

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
 .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
index 60a8e49..ceb25a3 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
@@ -27,6 +27,8 @@
 	mmc-pwrseq = <&wifi_pwrseq>;
 	bus-width = <4>;
 	non-removable;
+	/* rtw88's SDIO suspend requires MMC_PM_KEEP_POWER. */
+	keep-power-in-suspend;
 	status = "okay";
 
 	sdio_wifi: wifi@1 {

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.56.1

