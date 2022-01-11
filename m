Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5E92C9C
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Jan 2022 16:06:11 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id d3so31708270lfv.13
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Jan 2022 08:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ghCDsraBhx6Ux8rsiyXEwiYUcJ8M/xjPGCENEP2UbME=;
        b=e0kJjUgUxHp/VPD89/E1WMXF0/g+/axHS12C152VR7HHMXYXnmg9mdWzS3JjjlnGno
         oNzQOeqUATKXCSy1TzedjcJ0fJPPV2EyUTIF/OT37Y4w4cDHWhIfB5xAuHHn1Q4xe/4i
         Vnfs5fhVEVQN83KNpVhZnWijNbGnK1TmrhSZxN4nzpbsMkKUyCq9ObgEy59iWS48kP5L
         mDuo24jgz/i+1mUazwGg94H2cdZlV2vk+fnuTJL296V4Yys0ZTb8t1Zc8Fh2Mkufepm4
         p/qCcRX/lwP0VOF0YnBPmrfSdpucXZPT739Bwjc+76G2sPG8wfqUlWnIUePZY7mszdVc
         k+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ghCDsraBhx6Ux8rsiyXEwiYUcJ8M/xjPGCENEP2UbME=;
        b=eFX2HnputZ3jXetnQl/JGLY6pVwsNZELS+ZJy2CvMXR8N3YkX2qdLVgj5qvEb/IlaW
         OCixNyd4bJ4M+8X0/NoX2Yuiud31usOjX6Yfb+s5wiZx1raw1zC5bg7ftGS9Hjn7GqxH
         QiV7qXeQqlUL038K/VL80EfWACMnmF8JeXXr+HOPpeihNxJKVRiKg891w8XD7TzBF31e
         fYyOFbxir6ltePt7uOivb24YBZ1fDMz8IXalQ6XalMlAHERRZcexVRY2Dxlu7F/j7Rhw
         TUO2UvibOL16dtHe3EM4lbl5Nv/1GIiSq1cmhqeTYgA0UQiAnKpIJuox9CbKKe+jpYID
         /5Iw==
X-Gm-Message-State: AOAM531cmhXuNoh0zT4SjMgd8apGXQwL5g+EmhZUbm8aO0pV1Y0PJ9JV
	Ig/ddsicbaXRmy1MoOJP5uVz1w==
X-Google-Smtp-Source: ABdhPJyUJJFMl6VSkQTIjNLaY78aGkxmsDaJn7BrSOtOKpX4kY3z83dn8nHRT59jVfk6K6f9LH3vWw==
X-Received: by 2002:ac2:5624:: with SMTP id b4mr2932527lff.308.1641917169464;
        Tue, 11 Jan 2022 08:06:09 -0800 (PST)
Received: from boger-laptop.lan (81.5.110.253.dhcp.mipt-telecom.ru. [81.5.110.253])
        by smtp.gmail.com with ESMTPSA id k39sm564803lfv.150.2022.01.11.08.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 08:06:08 -0800 (PST)
From: Evgeny Boger <boger@wirenboard.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Evgeny Boger <boger@wirenboard.com>,
	devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 0/3] sun8i: r40: second ethernet support
Date: Tue, 11 Jan 2022 19:05:57 +0300
Message-Id: <20220111160600.58384-1-boger@wirenboard.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for two Ethernet ports on Allwinner R40.

R40 (aka V40,A40i,T3) has two different Ethernet IPs called EMAC and GMAC.
EMAC only support 10/100 Mbit in MII mode, while GMAC support both 10/100
(MII) and 10/100/1000 (RGMII).

In contrast to A10/A20 where GMAC and EMAC share the same pins making EMAC
somewhat pointless, on R40 EMAC can be routed to port H.
Both EMAC (on port H) and GMAC (on port A) can be then enabled at the same 
time, allowing for two ethernet ports.

Tested on custom A40i board with two IP101GRI PHYs in MII mode.

Changes in v4:
 - Rename sun4i-r40-emac to sun8i-r40-emac to match R40 family.
 - remove redundant status = "okay" in dts
 - less obscure commit messages

Changes in v3:
Minor fixes in bindings. Rebased on top of linux-next/master.
dt_bindings_check and dtbs_check passed.

 - bindings: separate commit for DT bindings
 - bindings: simplify handling of compatible strings
 - bindings: make resets property required on R40
 - dts: get rid of duplicate node

Changes in v2:
 - EMAC reset is no longer optional on R40
 - Add a new DT compatible string for R40 EMAC
 - Deassert reset line before enabling the clock
 - minor fixes: formatting, DT node order, leftover pinctrl props

Evgeny Boger (3):
  net: allwinner: reset control support
  dt-bindings: net: support for Allwinner R40 EMAC controller
  ARM: dts: sun8i: r40: add second ethernet support

 .../net/allwinner,sun4i-a10-emac.yaml         | 20 +++++-
 arch/arm/boot/dts/sun8i-r40.dtsi              | 49 ++++++++++++++
 drivers/net/ethernet/allwinner/sun4i-emac.c   | 64 +++++++++++++++++--
 3 files changed, 127 insertions(+), 6 deletions(-)

-- 
2.25.1
