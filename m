Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D393FC1
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Aug 2021 08:17:16 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6863040793
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Aug 2021 08:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1629447434;
	bh=d03dy1rcCZjZBdaEw0qJ/QqtbIi4Drzv7TBwZtFL+yY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=oMjk+RK//WtFVMwmzwK4MnVfohBPmndN2w0zSfysvcVGkZhC0KhMtTmL6vaju6iHN
	 rPznhGR2nqB7SPjmR0vySKuD9eHkPbk/g2NYNhaji1FaojmuYBules0+Kd5kFAx8rr
	 gk8ujcdvyugGCCdK/UVSOtTpiXDT7TI0R89x4A8397GRzOqZHjmt5r0wwU7m3ctTKW
	 PrWq8/FygS5ynkXWRqcYhqVfzEhbY1dAjGZftlJGHZ/S92igsnaU7yX0s2eoIstlmX
	 OT+F57zxyYmU8glwnu0DmRULeWGfdQO+DyOyrs5CUNkIevH86mtKyujo1suEm3RXIc
	 KkYLHrGO4tCeA==
Received: by mail-ed1-f70.google.com with SMTP id k13-20020aa7c04d000000b003bf04c03fc4so4172299edo.22
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Aug 2021 01:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d03dy1rcCZjZBdaEw0qJ/QqtbIi4Drzv7TBwZtFL+yY=;
        b=CB3ZRKSaYGEJQW8chWFCz9pssROn+tzk4esi6jav3YoU6Ng596KR4dYTfTXxDOWYA+
         soFKiBC32+ESHFmFTHip4EZDIJoSPwiNu+gA5ymXKxkmipTCGA9rpX30KiB2+0ENq6WU
         I7WzKJAguZA+yU/a2UecdXa2FBEr0F1GkKmJhP1uBa/LyMiVE9eNf+iqNbEKov4Ef9pV
         Tm8hmbuLSAeI7WLSKWXhYA1KVbD8/QBBpdB59JHsAt42g79O0fbHCCn2l1DvweNenR5R
         P+bOVee7f3LCGU/7EpyXnjNQyi7Ik5i70weVjTz2LAzBIpaIYzaeVK+gclsPb7DUyr1u
         QN+w==
X-Gm-Message-State: AOAM531bCubtG+C+d5s92LS48p+jtOXv0GvZV6EuxYcBoGJ3hXtSAVKv
	JBkiiyDgqn1khpM/qU9B30j6FJeZNdPg63awOdYDH5170F9XtUD3qoL4xXTwtj2USNrwiHxK7uA
	uYQ9QuQ9fCN6kaZu0PC2D9RdK2/RysNJJy0ejQnEa
X-Received: by 2002:a05:6402:4d1:: with SMTP id n17mr20751530edw.337.1629447433648;
        Fri, 20 Aug 2021 01:17:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFnpC44j4euQKERdJuEdfV4P/mgu5OPbnNEnWrmEm3YnkCOTLfb4hyb1Ab4h2xdol0XI1y1A==
X-Received: by 2002:a05:6402:4d1:: with SMTP id n17mr20751515edw.337.1629447433530;
        Fri, 20 Aug 2021 01:17:13 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id l9sm3158943edt.55.2021.08.20.01.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 01:17:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 2/2] arm64: dts: allwinner: align thermal zone node names with dtschema
Date: Fri, 20 Aug 2021 10:17:10 +0200
Message-Id: <20210820081710.83908-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210820081645.83796-1-krzysztof.kozlowski@canonical.com>
References: <20210820081645.83796-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align the name of thermal zone node to dtschema to fix warnings like:

  arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dt.yaml:
    thermal-zones: 'cpu-thermal-zone', 'ddr-thermal-zone', 'gpu-thermal-zone' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 6 +++---
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index cc321c04f121..f6d7d7f7fdab 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -343,19 +343,19 @@ r_i2c1: i2c@7081800 {
 	};
 
 	thermal-zones {
-		cpu-thermal-zone {
+		cpu-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&ths 0>;
 		};
 
-		ddr-thermal-zone {
+		ddr-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&ths 2>;
 		};
 
-		gpu-thermal-zone {
+		gpu-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&ths 1>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
index 578a63dedf46..9988e87ea7b3 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
@@ -217,7 +217,7 @@ cpu-hot-limit {
 			};
 		};
 
-		gpu_thermal {
+		gpu-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&ths 1>;
-- 
2.30.2

