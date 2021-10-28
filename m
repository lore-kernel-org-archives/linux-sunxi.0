Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FCD2C82
	for <linux-sunxi@lists.linux.dev>; Thu, 28 Oct 2021 22:13:30 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id 19so5711104qtt.7
        for <linux-sunxi@lists.linux.dev>; Thu, 28 Oct 2021 15:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BxQeetJwEcrw7mZizeh9N8oA8I68HO4YJPCT6BOjW/s=;
        b=YFX4KkFo8sn9wUT9exIjYE3zy3X6XhfFyUpqK4woD/WNaVGG3KGkVpVflHcB2Qt1lE
         Xkhb3v3R7klYbEuJFZfZjc88uoGQTQlz55LXKAO/HgzTV1v+Iw3nk3r4l8kDktOetHWv
         zE+bQ06pDHenulNUaR3PQwa1vJ0rOPI/VD52aaxeqduMEy75r78mNhqQ8H2h5bci8jtS
         XwmcTcwMGOBl99eASIyea5vPhEfkpKyomJtpy9kr23OXOIjmoOzm/7kz1r2I8u/mpEdv
         Pn4gxdZZ5msiceUFeN0yQ5DE4zcoTWmFwaQLZYGeLXelxIx+UNHtzObZMzsrRiU9cZv5
         pTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=BxQeetJwEcrw7mZizeh9N8oA8I68HO4YJPCT6BOjW/s=;
        b=JYpJB2JQ8Hn/dr7+AdOG2epv88Fm7hvB7+HuV+uBukIaUj7cvNT2B4ILzakNSnuEmQ
         8lT/Re4eVzp3NO+iXGYfZFDdxNzCbZdsurtddKbmZJvf2fKAcbctNKj/HML450J+Mw/f
         nyV+O/lff0mX1lAOYyFP4rTGauIehjdzZ325k8b5dAzW23QFaHPBLG0dNUinYA2+myU/
         eR7+jKNjbNePYk+w20tV+Tf10mDhemkCh1WtcRRlOPEH1H3oc9H79PW+Zmz7zYHN+LoA
         sUL+NMWXAgPJOUzvkFQZec96LcD3vHaGD0DhlqorUm9b2jqOALpMxMgTQM0KH+Cf6b8P
         P3dg==
X-Gm-Message-State: AOAM531VYkhCba6mE2/qZF3ikatTryAqDr0x1TWqQm6mbICxk8j8wK4n
	GApnhZAYgb5sQrle4kqlAso=
X-Google-Smtp-Source: ABdhPJw7Ip+mVVOhi3P5MeUydNnz0+e4/X81XifGWVT5beNjEjvIb8weALxoCTaaNT8lMLrlpNCpGQ==
X-Received: by 2002:ac8:5d8c:: with SMTP id d12mr7510623qtx.184.1635459209652;
        Thu, 28 Oct 2021 15:13:29 -0700 (PDT)
Received: from localhost.localdomain ([67.8.38.84])
        by smtp.gmail.com with ESMTPSA id h2sm2791097qkf.106.2021.10.28.15.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 15:13:29 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	fazilyildiran@gmail.com
Subject: [PATCH] drm/sun4i: fix unmet dependency on RESET_CONTROLLER for PHY_SUN6I_MIPI_DPHY
Date: Thu, 28 Oct 2021 18:13:27 -0400
Message-Id: <20211028221327.17984-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When PHY_SUN6I_MIPI_DPHY is selected, and RESET_CONTROLLER
is not selected, Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for PHY_SUN6I_MIPI_DPHY
  Depends on [n]: (ARCH_SUNXI [=n] || COMPILE_TEST [=y]) && HAS_IOMEM [=y] && COMMON_CLK [=y] && RESET_CONTROLLER [=n]
  Selected by [y]:
  - DRM_SUN6I_DSI [=y] && HAS_IOMEM [=y] && DRM_SUN4I [=y]

This is because DRM_SUN6I_DSI selects PHY_SUN6I_MIPI_DPHY
without selecting or depending on RESET_CONTROLLER, despite
PHY_SUN6I_MIPI_DPHY depending on RESET_CONTROLLER.

These unmet dependency bugs were detected by Kismet,
a static analysis tool for Kconfig. Please advise if this
is not the appropriate solution.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/gpu/drm/sun4i/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
index 5755f0432e77..3f70a14a3c94 100644
--- a/drivers/gpu/drm/sun4i/Kconfig
+++ b/drivers/gpu/drm/sun4i/Kconfig
@@ -46,6 +46,7 @@ config DRM_SUN6I_DSI
 	default MACH_SUN8I
 	select CRC_CCITT
 	select DRM_MIPI_DSI
+  select RESET_CONTROLLER
 	select PHY_SUN6I_MIPI_DPHY
 	help
 	  Choose this option if you want have an Allwinner SoC with
-- 
2.30.2

