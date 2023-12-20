Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF8F20B19
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Dec 2023 09:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cbsq7Ahw"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a2330a92ae6so480048166b.0
        for <linux-sunxi@lists.linux.dev>; Wed, 20 Dec 2023 01:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703065942; x=1703670742; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGX77AFM52taWZ32rxqG8Bwre+qwZG4HAT6q9bfPoTE=;
        b=Cbsq7AhwH5KQfCOFbH8NzjgfKJfI5wiCJKdbiRaYis6VZSzNxoX7mmu9KqSS4es2Ja
         F4CBPeFRHY7IW/hyjz17SAz2lUSI/qZssI979bnPcbegC9pjIGG2Q0nWpzmL9OOigbHB
         wFntqLBC2943YGPiZTrlxhBvPbtiRgiKWCNYqamNHHjZjKCllGJgnQmOnaz0YCxjwWg3
         LwsIJCECRrb1WjXNdS/Dz+y0szT0yqwXPnF00ESQlua6Ot8F+t/E94sswyw8xeWaJvhf
         FLRypm/vtcvrk/LNV/Qa6rTYWqZxI2gZdcf0E3wEccS2jDBfii6fPCc383tDHpbOSLRA
         Pk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703065942; x=1703670742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CGX77AFM52taWZ32rxqG8Bwre+qwZG4HAT6q9bfPoTE=;
        b=hMBj7j/7msSjFswWxDwbgITYOplqs8o3GRQtt8B3+r+ZUZ11FheQxcsOF57K3/g2+v
         Q85s6LR2LaY94Hr+ez/SIztOCxAhxGs++V+ejgYb5MgEqZrr6BJQFWB0EhEnq95rrbGB
         GLq+3n4uBSzkJNpmIx5l354g2k4JGhIGv0RWoCADzPhGEDIwqcG55Th2EA5hI5W/ZDU+
         FvshlABLp0LwMprRQbCUThDUckVRIw9vfdFSCbyTlL3ta9ANcC0shoaWrdgj2LzJehlQ
         Cwby7zuhv0J1XMXhnEVHAwdBT/oJu9BkpV/WAjNdFWN+MaupwPPn7GQjh6BDUtJRQAGs
         mUtQ==
X-Gm-Message-State: AOJu0YwS3FtO1qhCSZG8em5PtSGZCqorapK/6qvQVSy5h0FiUuokZ8HT
	n7C6isajub9VP7nt/2Oe5dQ=
X-Google-Smtp-Source: AGHT+IFVwEX6DGx95xrmNxtWF3DNvy+WJuinCzQ56EUrqHU17sekrONr1kDAVmlp0UrKjEcsHl00/A==
X-Received: by 2002:a17:906:1de:b0:a23:743a:ac6e with SMTP id 30-20020a17090601de00b00a23743aac6emr1420552ejj.104.1703065941785;
        Wed, 20 Dec 2023 01:52:21 -0800 (PST)
Received: from localhost.localdomain ([154.72.162.158])
        by smtp.gmail.com with ESMTPSA id st3-20020a170907c08300b00a1c4fde4e88sm16596791ejc.18.2023.12.20.01.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 01:52:21 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [RFC PATCH 2/2] riscv: dts: allwinner: Fill in OPPs
Date: Wed, 20 Dec 2023 10:51:41 +0100
Message-Id: <20231220095141.27883-3-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231220095141.27883-1-fusibrandon13@gmail.com>
References: <20231220095141.27883-1-fusibrandon13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Specifies two voltage ranges, in order of increasing stability,
for each OPP. This is heavily inspired by

https://github.com/Tina-Linux/linux-5.4/blob/master/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi#L118-L133

and

https://github.com/mangopi-sbc/tina-linux-5.4/blob/0d4903ebd9d2194ad914686d5b0fc1ddacf11a9d/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi#L118-L182

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 2f1771c19..8e7bc8bd0 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -48,13 +48,17 @@ opp_table_cpu: opp-table-cpu {
 		opp-408000000 {
 			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-hz = /bits/ 64 <408000000>;
-			opp-microvolt-speed0 = <900000 900000 1100000>;
+
+			opp-microvolt-speed0 = <950000 900000 1100000>;
+			opp-microvolt-speed1 = <900000 900000 1100000>;
 		};
 
 		opp-1080000000 {
 			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-hz = /bits/ 64 <1008000000>;
-			opp-microvolt-speed0 = <900000 900000 1100000>;
+
+			opp-microvolt-speed0 = <1100000 900000 1100000>;
+			opp-microvolt-speed1 = <950000 900000 1100000>;
 		};
 	};
 
-- 
2.30.2

