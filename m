Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285919;
	b=sRtEeVBWHuZ5OZjk9ArgmitJJ1fkdjzF4mytcrhlv+TajQghvZJWbVNXW5MN5r+bsTPP
	 LfblykXJUi2d1/kiq/1EEh6KJ+BDaNy9eNkdpfAZlXppF9wdEfbEk0SuNiBYFc/9aqYSP
	 FPZDhT7EeMage6UQM5JIjq1teUKX0xaNzXmyW09BI4lj8rH6T5WUfDVXW8IATJSxQHWtD
	 y1WbJHdjyWYegfUiYT/JKWpmh7LWUkSGBUhUK3/fpELApxq1uo1z9gFOwMG6hhUMKlZo4
	 LAc9YFaqxxy3KDcU/fNRB7JNJRpQ7qngvoTMgxslCIhVajwC/saRlcA9YeHgwthxVnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4tUkPqh7M9OUjiwIhkhOdeSBfACxoiXile/BDFh7nFQ=;
	b=sz7zb3x9HgayG39SvsKHpjO5ZuDTNBTNvZFbzPE5nMhs4ZOA1PCVQzVG+ty8oShOKiJx
	 eRtpPDlLD67dw0CDPwT9Df70+bLls2p6Z5bx9NTgqhbDFlFnb6SD47GGvOdvz2kHfto1O
	 vcBs2O3oqUJ7YaLbTmbBDkAa1275P3lRLEm0WAiCTZcvVuSgSpjs5m83ykyWgFe72RmxV
	 ADgxqQvQtOi/GdVLabI5NrFo4UNYky3Ug7gmxnw0RzLQjhmmKH2Uzw5EfVm9J6zKrghD2
	 pP72548TtmykVcbeo4EFw8r+e9Gg0pNXwTK58CC282Euki5bKKi5J5dwP9gCgTSI6iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dl4mK7Jn;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558D8606A31C
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 04:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 558D8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dl4mK7Jn
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-704597ef1d8so565187eaf.3
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 20:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285918; x=1794890718; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4tUkPqh7M9OUjiwIhkhOdeSBfACxoiXile/BDFh7nFQ=;
        b=dl4mK7JnKgvFMJyH1LEtV+7oA1L1Zmg2CTxBnqLJY1qL8EBjxrgwOBuXrT068e3gtl
         JyFo8s4DSL3em5DpwXWutYGEL2je2vZYhrKhXyq+TpY5WMGdS1Fd3SMRVYsboxAtz0sw
         NMAL5oVd2Djv1Q+iXMNJO6Nu7JuejahCEMl4fz4JrZDn/g/lL0o13pLHWQoKjM7P5BAj
         9usxhUL9MU3Qbv8AgC5AKmbS/RLenhTHfftxDjwcCh8u3LN7rMAo4G0T5wAU5BcIafZi
         55sFJ50XHd410teMfpHOUkWWmhp2voYrgUDwP2t6EujQM8RiIyneWnGYHifMmzLSYpzY
         L4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285918; x=1794890718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4tUkPqh7M9OUjiwIhkhOdeSBfACxoiXile/BDFh7nFQ=;
        b=L7orkUfRmCli+GUhgAK4w8wmCLWKRvMCZqMo817hMaDRDoOIpGzjXyri1DiNxcCdLU
         wk9vFIsKPscfkTFU911zpDmOzLRrgjMOTMGKIfQKiMJoVEPnlVPZMoEV5og+oGgf1GAA
         cRQLPi28BWlT4jFoKqHJ10t5I3TfD4M9CkwF6Sb8dSsCsxbwsPUpOQR7zG/qtdQbFj6z
         mE5i+d3OdKDXF8zZQoo5AcR+kA9b+ru8HdK8JYjBunog075/vuT8xD+JSAriGKbk3gsv
         Kdqw435p99LhmleCNrIxIjqGbHytf4B9/Aa3p8PbFxf+m55BgJaxpwme+MWPF+zQA5gy
         x5Sw==
X-Forwarded-Encrypted: i=1; AL+hErEQU7Am/W52iSlLPzwZ7YXQI4XH5csWsuk9b1642MyWgYSAfligIqGxRlUrUxfQ6qmBcy3BK96/S4QKIg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+nkpvPMdbOd3frlJzNsrNYPE2kHGZGbimnHFylNzBVrvpEd1h1
	RlckGibWjCnF4nIKGEYK3zoQEAYIuta8TTUsgBSNPn7OH3D3qsscIlPj
X-Gm-Gg: AYBFou0T8byFv0dQn3D41puhU2A5bR76SflraR4+o8CGSEVZX/ha4t2IRQ/VeQJpsHt
	Z3+0grKD0pBOMEdxnwq/Rx+QVWPpmOuNF/X8sDdwMsHZSQqNvI2grjpJNRxsgSBwoBXdBFVY46X
	pIjMJjKeJPycO/lNYUqF5shRTxhOFaybGnPwoD6rmafBJtnAR3crLXSPsdAcktQ9anpH2vMJeMn
	XP4GvDn/HvTPA5bhp7s0CLn9reg/vCOq5wHkTmCKi8vrMW6zmhSGuWe/bhuajtTzHDEmponXwl2
	W+kP+B3dzIjzLIGBb4UBkHnFBZEeeUZeZ4Zoo/oVMmBxHwA/jLztKEAisc9COiH25e2X9LluNRf
	PEfi2b3pbSQJ5qiqn7mVOUWCrAkYbZJ9GtZKke1gT6YA0/UYaA8/1y48895QEpf2n8SRgCin31w
	VV6QRC9KUNZvJ0xOqjmtDKe4l+Fn7JyI5UDCDYePGuRq3usQhuQPf1cpjgFWFwdJX2ej9GaSs3Y
	tAvklSzmwin2RgGhZ6/lw+oXC3hC7FOlLLJ8ddpOirYJklonGqGuWfPsjjcRO4rIf6v/nzSdyWe
	iWy4O4am1xitht4AfnEY1IbglA6HyToz6reDy5Yni/Y7dku5hb7bB/YRrMP7IX++AMQ9RSUNx1j
	ZtKJHdA==
X-Received: by 2002:a05:6820:c453:10b0:6ca:8e07:15 with SMTP id 006d021491bc7-718a197a67cmr482559eaf.7.1794285918159;
        Mon, 09 Nov 2026 20:45:18 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae23095c5csm876306fac.16.2026.11.09.20.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:45:17 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: [PATCH v3 0/3] arm64: dts: allwinner: add A733/Cubie A7S support
Date: Mon,  9 Nov 2026 23:45:15 -0500
Message-ID: <cover.1794227241.git.enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This series adds the initial Allwinner A733 and Radxa Cubie A7S device
trees, enabling UART0, the AXP318W PMIC and the 3.3 V microSD path.

Base: v7.4-rc1 (6628e7d4c6b25c8d18f1345e3a20d21829aae7e4).
Previous posting (v2):
https://lore.kernel.org/r/20261031020640-263f7b05-a7s-dt-v2-0@gmail.com

Changes in v3:
- Defer SMHC3/mmc3 until it has a tested user; omit binding, node and pins.
- Rebase on v7.4-rc1 and list public schema prerequisites.

Dependencies, in application order:
[1] A733 CCU v6:
https://lore.kernel.org/r/20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech
[2] AXP318W PMIC v8:
https://lore.kernel.org/r/20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com
[3] Pinctrl IRQ-bank v3:
https://lore.kernel.org/r/20261025142412.112216-1-pmazzini@gmail.com
[4] A733 8250_dw v2, patches 2-4:
https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com
[5] Firmware clocks (separate from CCU v6):
https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com
[6] Pinctrl voltage-mode fix v3:
https://lore.kernel.org/r/20261109-a733-pinctrl-v3@gmail.com

DTB/schema checks need only [1] 1/8, [2] 3/5, [3] 2/3 and [4] 3/4,
applied in that order before this series. Runtime needs the full CCU,
PMIC and IRQ-bank series, [4] patches 2-4, and [5]-[6]. The clock helpers
listed in v2 are already in v7.4-rc1.

Validation: arm/sunxi.yaml schema check, W=2 CHECK_DTBS=y DTB build
and clean git-am reader test passed. The November 4 DT v2 RAM boot
exercised UART0, PMIC and MMC0 reads on Cubie A7S with vendor firmware
and pinctrl v2; v3 removes a disabled controller and unused pin group.

Untested: boot with pinctrl v3, card writes, hotplug, 1.8 V switching,
other UART/I2C and storage instances, RTC alarms, EL2/ITS/MSI, and
physical BLDO2 voltage.

Enzo Adriano (3):
  dt-bindings: arm: sunxi: document Radxa Cubie A7S
  arm64: dts: allwinner: add A733 SoC description
  arm64: dts: allwinner: add Radxa Cubie A7S board

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7s.dts   | 284 +++++++++
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 601 ++++++++++++++++++
 4 files changed, 891 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
