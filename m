Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4139036D513
	for <linux-sunxi@lists.linux.dev>; Sun, 30 Nov 2025 21:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764539175; cv=none; b=nUuzUcSSBAWwlNVDiqzU6PPl4N8SE27To8+KFjldYbwlUfBwA0s4JOJQUdKDQi8bpEMKyRSrQ/+iU9kDbUe+7uTRyrwnnPSzNbIA27pa+Xet688j34KjY6Jt1Fth/Ss9ftmdmvzL/gjsrLsQnN5F0Nia3qoDaQawh3gU4w61QQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764539175; c=relaxed/simple;
	bh=twLD1/GQXwXfnC89AnDWfhGb5WKizTT4jM1M5ct4ciQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wx06fOdbS8Ni+dSIJW4SDKIo3uAB8MJBN23IqTA8yrQLtScQtkjOaRSvSy89G8UIH22sovDWuqUkYXltdgBMK7PgDzLd0Xh8/AdvEkLKoR4/njWo6v4c6uMaxjo2/xXy7KvAgqZ1RnPnSw064+eTs8slSaJNwbdXLjpfZiPWc3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from ofovo.local (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C253A340F39;
	Sun, 30 Nov 2025 21:46:10 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sun, 30 Nov 2025 21:45:12 +0000
Subject: [PATCH v2 03/10] sunxi: a733: uart: setup serial console
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-01-a733-soc-support-v2-3-18bdd4376fad@gentoo.org>
References: <20251130-01-a733-soc-support-v2-0-18bdd4376fad@gentoo.org>
In-Reply-To: <20251130-01-a733-soc-support-v2-0-18bdd4376fad@gentoo.org>
To: u-boot@lists.denx.de
Cc: linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Paul Kocialkowski <contact@paulk.fr>, Samuel Holland <samuel@sholland.org>, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=twLD1/GQXwXfnC89AnDWfhGb5WKizTT4jM1M5ct4ciQ=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBpLLr/pj/xnw7wboAfcMhD2FapvoKsTyYfVINsn
 53jufaf592JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaSy6/18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277biaD/9GQxglQvyHlXbJZt
 hDf3+AaVC8jzIJVPLiV9xfoPOpjYvj5SH91TC98aVd7h1MYZqO+mcZjfR4EjxWEE/pyxEEuTmpX
 iPCjkmABal6SX2Fc2pS1VNybG/QKRV750d1Ku32WssSoDM9vvUWtpWXj5I8kHMQawlj8vRZBwat
 3AhF4BKZgtTXZka1CsXYHqGQPV7HiW2ffj+TECGj/FgIo9nBvCo9oYPExhgQd2iY6bAyicmQL9l
 +Uj2ltTY+PUgAzmG0SK/Qb6mfL2WRJmAuqY+mhuKPh7WEgkBHYwMnA1e6Mw1utMAVcXUuaWe/RE
 zg0bGvH17DJ4fIegX71GolLiRhmEG2kOhe3m724tR2HK9iDkuZ5kCHjy3NSdOcldpxbrMhyL5Cu
 +0fDayD6Saimm6oAVzCgAwAjCI++2Ad82HimpqKDu7oB6XGOEk5cJbKwla8TXut97iyi8gW4Oqx
 LIYsTP+sZ5hlvQTkjbTMbmu9ZIBDl0JJX3r2KQqS94ZKrv1weZnlSILkXH3LojTU88JrjfEpUXS
 kdCMRMvNeX3DMJFl5ctK3v2FWIs5VvEDJ8R7yLibhAV2Hd1+tGD/aKxX2Xv3a+vxCAL7p3Y3VLf
 UgTGtsQTn+hA7xGkgghO3NybV8cmiFl4E//6E+4+1n2vKnyYVXLiJ85qc4nbhM5uKxww==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Setup correct UART base address for A733 SoC.

According to Allwinner's board design, A733 SoC use the UART0 port
for serial console, so config PB9-10 pins to setup pinmux.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/arm/mach-sunxi/board.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
index 432b1c10f92..72c9fc413cb 100644
--- a/arch/arm/mach-sunxi/board.c
+++ b/arch/arm/mach-sunxi/board.c
@@ -141,7 +141,8 @@ static int gpio_init(void)
 	sunxi_gpio_set_cfgpin(SUNXI_GPB(9), SUN50I_H616_GPH_UART0);
 	sunxi_gpio_set_cfgpin(SUNXI_GPB(10), SUN50I_H616_GPH_UART0);
 	sunxi_gpio_set_pull(SUNXI_GPB(10), SUNXI_GPIO_PULL_UP);
-#elif CONFIG_CONS_INDEX == 1 && defined(CONFIG_MACH_SUN55I_A523)
+#elif CONFIG_CONS_INDEX == 1 && (defined(CONFIG_MACH_SUN55I_A523) || \
+				defined(CONFIG_MACH_SUN60I_A733))
 	sunxi_gpio_set_cfgpin(SUNXI_GPB(9), 2);
 	sunxi_gpio_set_cfgpin(SUNXI_GPB(10), 2);
 	sunxi_gpio_set_pull(SUNXI_GPB(10), SUNXI_GPIO_PULL_UP);

-- 
2.51.2

