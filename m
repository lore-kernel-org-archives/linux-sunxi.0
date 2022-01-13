Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF78F2C80
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Jan 2022 05:37:47 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id br17so15740042lfb.6
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Jan 2022 21:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fer7mUkd7brJ1mxdjvl5SPv5rmLRsQ3o5FR92yeQeCo=;
        b=mfzcu7ZvALRtO+M4LyO9ux3ZJNvxIXq+EuN5zKHltFJOVdTiSdvQgXAZ5QVJ64QMgP
         5tKalUAC6iMi+Z8Sa9xO7RsvQwsBCJJIslkvfHyt86oaJ3ONSs2S6EZm1zJkXE4Po71e
         DmzbsLSPXl8VZcLp8hhOS5Jm8vVFktXkyscYenD/BL6fkSYAhqs8ybqakU07Ctghx5xP
         bzD6IMq+dFWIwN4pdtHPEqRDAPvUECzKjGMND/XIbfmQYEhdzcem7K/4XyurjNWrK21g
         pmoYGR+cKJlISCVoyuxAc3RfOG7DS+tKUT+vwrUv9iBLZuq1p1kzaCGHhe4bATpMb7Ve
         hOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fer7mUkd7brJ1mxdjvl5SPv5rmLRsQ3o5FR92yeQeCo=;
        b=e+i7aymRLvWIbRWKECBaWZOub53f1sJdIcxnUP8YczMfMz84xFrn8TV5BL/v/rk3G7
         qFJzBqQfvCyAfdphhr8mOYWTe+9enirMIIdHbODjtbCLOOynwK7Sj501WUv0ZnKeDyUX
         PdJL7OWg4lpB6s/M0oZvGfSjcX8NBQHT2Xh2LtdHMDVtossj7T6ioXDYmcUScQ4DF5oB
         z/epxgNfF3KSIUDZ/uvo0ZOjict9w6QmplEHzWu6/vljlJJkYQhhlXdj5uhjb7Om266h
         FPkKRtkUucBqRAt39MBqRJwaRG7vsLAc2vIK0Y1OBL73G4mXIiRwNYx6POw/7BT4/qH3
         hxQQ==
X-Gm-Message-State: AOAM532gw0NX0nCSWQ9IcIxJMVK+Aq/Jhw49ucZ2e9Xjl2KI6qHW9YZ2
	n6JgFiZSldRR7DccApwaufJpgQ==
X-Google-Smtp-Source: ABdhPJwIZMKX//1tHJPBIbf2ecJ2fhAtfSrS1g129oAi1cqR243lLBMeSgWiQ2++JG2MVQXJ0gg8qg==
X-Received: by 2002:a05:651c:a0e:: with SMTP id k14mr1952570ljq.514.1642052265598;
        Wed, 12 Jan 2022 21:37:45 -0800 (PST)
Received: from boger-laptop.lan (81.5.110.253.dhcp.mipt-telecom.ru. [81.5.110.253])
        by smtp.gmail.com with ESMTPSA id x21sm180212lfa.296.2022.01.12.21.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 21:37:45 -0800 (PST)
From: Evgeny Boger <boger@wirenboard.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Evgeny Boger <boger@wirenboard.com>,
	devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v5 0/3] sun8i: r40: second ethernet support
Date: Thu, 13 Jan 2022 08:37:31 +0300
Message-Id: <20220113053734.105813-1-boger@wirenboard.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Maxime, Corentin, thank you for the review of v4!

This patch series adds support for two Ethernet ports on Allwinner R40.

R40 (aka V40,A40i,T3) has two different Ethernet IPs called EMAC and GMAC.
EMAC only support 10/100 Mbit in MII mode, while GMAC support both 10/100
(MII) and 10/100/1000 (RGMII).

In contrast to A10/A20 where GMAC and EMAC share the same pins making EMAC
somewhat pointless, on R40 EMAC can be routed to port H.
Both EMAC (on port H) and GMAC (on port A) can be then enabled at the same 
time, allowing for two ethernet ports.

Tested on custom A40i board with two IP101GRI PHYs in MII mode.

Changes in v5:
 - Rebase on fresh linux-next
 - Remove reset line from example bindings

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

 .../net/allwinner,sun4i-a10-emac.yaml         | 17 ++++-
 arch/arm/boot/dts/sun8i-r40.dtsi              | 49 ++++++++++++++
 drivers/net/ethernet/allwinner/sun4i-emac.c   | 64 +++++++++++++++++--
 3 files changed, 124 insertions(+), 6 deletions(-)

-- 
2.25.1
