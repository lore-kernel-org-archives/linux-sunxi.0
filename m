Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573022C80
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Nov 2021 19:53:59 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id l22so70344584lfg.7
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Nov 2021 11:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jDQ8casRaZS+l1rxrJCeAbTXhjCUovQT3i2rAe9QnHQ=;
        b=MspbIXHJZk6p7mD0w87WeBtdD2oQQ6mFcbm/J1qs30y1odPZzznO6xCH/B/wkCBNSN
         X/nWbP+N04MmihCNEK2Gt99s8ezqN6FH1yYQuArKeosps1EGRR32bAf6FDdq0PAKVlDd
         pwbafdunsgefopVeK/1o7iWYESVYpeqJvgIbIpvAVzEIenJ2tLTkoWEtl+Umw3YtfqYD
         Wu0bmamuT4LFy36T/ElYlv/ZaSqjzSt6W624cw/jeD2/ZdosRqmRTJqUW4ThYc1YaFGD
         s/vew8Y8wbdTkQzlhLCl1NyHddBSZFfik14o2stDjB7gNcFZEJN5RVe4X3OPKrvgJmoV
         N1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jDQ8casRaZS+l1rxrJCeAbTXhjCUovQT3i2rAe9QnHQ=;
        b=6xoHXJrqV+wZ4qJ6BTdUBumaymp/PATswFYnVrz4pXbIwiz4Psm27R3AxfwGM0Sx3o
         kbDMEoROcw9Pp2VS7T2UrKqGrTsA7a3rW2CMNNA9kDKSatwIsCNP6zAeAlfADVAP0fcA
         tv14bRFs8ZNtkRXpbEh+0UY2Ut2DPLK2PVLsaJ7KBER2myLThw9cF2wibFX0ah4Ecfcq
         8cuGMAduI5lBAwHyEFea0Uzd0cMUnbScAFxs35FFCWtu+BScjNvMEKqxJL+rNYRK5BOT
         ldE5Mnn1k038ckhsq16fWraC/HlGsWsyCzi4+M26BqnC1+Y6Vjry+qrtZXpIa9SnCE4y
         iFPQ==
X-Gm-Message-State: AOAM532pAEzrs39Yg5IIjcU/oWfqx3QX5QwL2juF3BUMIt17hUL1avku
	d+5YBR81W3k7Ks3r2IiDqmP73w==
X-Google-Smtp-Source: ABdhPJwYpfyTLMo2Ivu2ZTj1fJkpboEZubzV2cCg94mVmf+fnyIlfXPkRv+Ng7Qi7mRHrLClMA9mJw==
X-Received: by 2002:a2e:b177:: with SMTP id a23mr45983013ljm.168.1637524437115;
        Sun, 21 Nov 2021 11:53:57 -0800 (PST)
Received: from boger-laptop.lan (81.5.99.121.dhcp.mipt-telecom.ru. [81.5.99.121])
        by smtp.gmail.com with ESMTPSA id a24sm768987ljq.18.2021.11.21.11.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 11:53:56 -0800 (PST)
From: Evgeny Boger <boger@wirenboard.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Evgeny Boger <boger@wirenboard.com>,
	devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 0/3] sun8i: r40: second ethernet support
Date: Sun, 21 Nov 2021 22:53:34 +0300
Message-Id: <20211121195337.230475-1-boger@wirenboard.com>
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
  dts: r40: add second ethernet support

 .../net/allwinner,sun4i-a10-emac.yaml         | 20 +++++-
 arch/arm/boot/dts/sun8i-r40.dtsi              | 50 +++++++++++++++
 drivers/net/ethernet/allwinner/sun4i-emac.c   | 64 +++++++++++++++++--
 3 files changed, 128 insertions(+), 6 deletions(-)

-- 
2.25.1
